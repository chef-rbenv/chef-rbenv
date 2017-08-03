# frozen_string_literal: true
global_ruby = '2.4.1'

control 'Gem Install' do
  title 'Should install Mail Gem globally'

  desc "Can set global Ruby version to #{global_ruby}"
  describe bash('source /etc/profile.d/rbenv.sh && rbenv versions --bare') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/#{Regexp.quote(global_ruby)}/) }
  end

  desc '2.3.1 Gem should have mail installed'
  describe bash('/usr/local/rbenv/versions/2.3.1/bin/gem list --local mail') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/2.6.5/) }
    its('stdout') { should_not match(/2.6.6/) }
  end

  desc '2.4.1 Gem should not have any mail version installed'
  describe bash('/usr/local/rbenv/versions/2.4.1/bin/gem list --local') do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not match(/2.6.5/) }
    its('stdout') { should_not match(/2.6.6/) }
  end

  desc 'gem home should be rbenv in an rbenv directory'
  describe bash('source /etc/profile.d/rbenv.sh && gem env home') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(%r{/usr/local/rbenv/versions/#{Regexp.quote(global_ruby)}/lib/ruby/gems/2.4.0}) }
  end
end
