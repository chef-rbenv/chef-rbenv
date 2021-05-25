# Plugin

Installs a rbenv plugin.
If user is passed in, the plugin is installed to the users install of rbenv.

## Properties

| Name      | Type   | Default              | Description |
| --------- | ------ | -------------------- | ----------- |
| git_url   | String |                      |             |
| git_ref   | String | `master`             |             |
| user      | String |                      |             |
| root_path | String | See root_path helper |             |

## Example

```ruby
rbenv_plugin 'ruby-build' do
  git_url # Git URL of the plugin
  git_ref # Git reference of the plugin
  user # Optional: if passed installs to the users rbenv. Do not set, to set installs to the system rbenv.
end
```
