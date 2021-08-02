# Modern Historian

## Fully automated provisioning for a modern historian stack

A big part of this setup is about the provisioning of the edge stack with all you need to run a modern historian.

5 Docker containers are used:

- OPC-UA Server
- InfluxDB
- Telegraf
- Grafana
- Portainer.io

![Architecture Diagram](./docs/images/architecture.png)

All the setup and configuration are part of the provisioning process. A Grafana dashboard has been provisioned and ready to be used.

![Grafana Dashboard](./docs/images/grafana_dashboard.png)

## OPC-UA Server

A Pump object, with relative variables have been added to the OPC-UA server namespace for the scope of the demo scenario.

Read more [here](./docs/opc-ua.md) on the setup of the OPC-UA server.

## Provisioning the demo

The project is available to be provisioned for both Unix-based and Windows users.

Follow the relative guides below to get started.

### Linux and OSX users

- [Local provisioning with Vagrant](./docs/provisioning/unix/local_provisioning.md)
- [Cloud provisioning with Terraform](./docs/provisioning/unix/cloud_provisioning.md)

### Windows users

- [Local provisioning with Vagrant](./docs/provisioning/windows/local_provisioning.md)
- [Cloud provisioning with Terraform](./docs/provisioning/windows/cloud_provisioning.md)
