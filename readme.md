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
- Make a new project on Google Cloud Run
- Go to <https://console.cloud.google.com/run>
- Click "+ Create Service"
- Choose the server you wanna use and name the service whatever and click Next.
- Choose "continuously deploy from source repository
- Click "Setup with cloud build", select github, allow access to your forked repository and choose that repository. Click Next
- Under Build type choose Dockerfile and source location is /mimc-fast/Dockerfile and click Next.
- Back on create service, Advanced Settings, change container port to 8000 and change the memory/cpus according to what you want (2gb memory, 4cpu has been reported as ~4k hashes)
- Setup authentication (if none, don't share your url because anyone else could access it) and then start it
