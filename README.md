# Cloudflared SCP
A barebones github action that lets you scp into a server behind a cloudflare tunnel and run a command

## Usage

Here is an example deploy.yaml file for the action:  
```yaml
name: Pull down and compose up
on: [push]
jobs:

  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - name: connect to remote server
      uses: zgunz42/cloudflared-scp-action
      with:
        host: ${{ vars.HOST }}
        username: ${{ secrets.USERNAME }}
        private_key: ${{ secrets.PRIVKEY }}
        port: ${{ secrets.PORT }}
        from: repo_dir
        to: repo_dir
```
