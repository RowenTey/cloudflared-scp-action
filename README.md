# Cloudflared SCP
A barebones Github Action that lets you `scp` into a server behind Cloudflare Tunnels and transfer a file

## Usage

Here is an example `transfer.yaml` file for the action:  
```yaml
name: Transfer file to remote server via SCP
on: [push]

jobs:
  transfer:
    name: Transfer
    runs-on: ubuntu-latest
    steps:
    - name: Transfer file
      uses: zgunz42/cloudflared-scp-action
      with:
        host: ${{ vars.HOST }}
        username: ${{ secrets.USERNAME }}
        private_key: ${{ secrets.PRIVATE_KEY }}
        port: ${{ secrets.PORT }}
        from: repo_dir
        to: repo_dir
        service_token_id: ${{ secrets.SERVICE_TOKEN_ID }}
        service_token_secret: ${{ secrets.SERVICE_TOKEN_SECRET }}
```
