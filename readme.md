# Dark forest mimc miner

[Dark Forest](https://zkga.me/), the world's first decentralized real-time
strategy game. Built on Ethereum with zkSNARKsis a <https://zkga.me/>

See [mimc-fast](mimc-fast) for directions on installing the server locally.

## google cloud run

Be warned this costs money. Google apparently offer a bunch of free credits to
start though so this can be cheap for a while. I offer no support for this so
don't post questions about this cloud service, or any others. PRs are welcome to
make the docker files more accomodating though.

- Fork the plugin to your own repo on Github
- Go to <https://console.cloud.google.com/run> and follow any prompts to enable your account.
- Click "+ Create Service"
- Name the service whatever and it'll choose a server region for you. Click Next.
- Choose "continuously deploy new revisions from a source repository" and click "Setup with cloud build."
- Select github, allow access to your forked repository and choose that repository, and select the v6-warp-split branch.
- Select "Build Type" Dockerfile and click Save.
- Click "Advanced Settings", Under "General" change "Container Port" to 8000
- Under "Capacity" change the memory/cpus according to what you want (2gb memory, 4cpu has been reported as ~4k hashes) and click Next.
- Under "authentication" choose an option. If allow unauthenticated remember not to share your url because anyone else could access it) and click Create.
