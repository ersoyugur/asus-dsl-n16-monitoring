This repo is a sample including the scripts to receive metrics from asus router (asus dsl-n16 is used) and send all these metrics to influxdb running on the local network. I also added cru function which is basic cron function in asus routers.

All scripts are taken from the following tutorial, I just made slight changes, because influxdb doesn't provide gui anymore and also api format changed, and the outputs of commands from my asus router have slight differences.

https://www.instructables.com/id/How-to-graph-home-router-metrics/
