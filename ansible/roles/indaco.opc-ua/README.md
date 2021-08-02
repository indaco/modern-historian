# indaco.opc-ua

It takes care of the entire setup for the modern historian stack.

- Create needed folders
- Pull docker image for node-alpine from docker hub
- Build the docker image for the OPC UA server

## Example Playbook

    - hosts: all
      roles:
         - role: indaco.opc-ua

## License

MIT
