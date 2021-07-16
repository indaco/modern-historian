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

All the setup and configuration are part of the provisioing process. A Grafana dashboard has been provisioned and ready to be used.

## OPC-UA Server

This demo uses [node-opcua](https://node-opcua.github.io/), an implementation of an OPC UA stack fully written in Typescript for NodeJS.

OPC UA defines 8 Node Class types in the address space Object, Variable, Method, ObjectType, VariableType, ReferenceType, DataType, View.

The server address space is used to customize the objet model that our server will expose to the external world. Server default address space has been extened with some variables we want to expose.

One Objects, a Pump, with relative variables have been added to the server namespace for the scope of the demo scenario.

### Pump Object Information Model

The **Pump** Object has static and dynamic variables used to model our asset, like Manufacturer, Motor RPM etc.
A node of Variable Node class in the OPC UA server is represented in the Data Access COM UA Proxy as an Item.
Below is a mapping table between the pump variables and their NodeIDs

| Variable (BrowserName) | NodeID      |
| ---------------------- | ----------- |
| ManufacturerName       | ns=1;i=1001 |
| ModelName              | ns=1;i=1002 |
| SerialNumber           | ns=1;i=1003 |
| StatusCode             | ns=1;i=1004 |
| FaultCode              | ns=1;i=1005 |
| Status                 | ns=1;i=1006 |
| MotorRPM               | ns=1;i=1007 |
| Temperature            | ns=1;i=1008 |
| InputPressure          | ns=1;i=1009 |
| OutputPressure         | ns=1;i=1010 |

A graphical representation of that is available [here](./docs/images/pump_model.png). The [Graphviz](https://graphviz.org/) source file is available [here](./docs/graphviz/pump_model.dot) too.

## Provisioning the demo

The project is available to be provisioned for both Unix-based and Windows users.

Follow the relative guides below to get started.

### Linux and OSX users

- [Local provisioning with Vagrant](./docs/provisioning/unix/local_provisioning.md)
- [Cloud provisioning with Terraform](./docs/provisioning/unix/cloud_provisioning.md)

### Windows users

- [Local provisioning with Vagrant](./docs/provisioning/windows/local_provisioning.md)
- [Cloud provisioning with Terraform](./docs/provisioning/windows/cloud_provisioning.md)
