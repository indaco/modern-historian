# indaco.modern-historian

It takes care of the entire setup for the modern historian stack.

- Create needed folders
- Create needed configuration files
- Pull docker images from docher hub
- Build the docker image for the OPC UA server
- Run the docker compose stack

## Example Playbook

    - hosts: all
      roles:
         - role: indaco.modern-historian

## License

MIT
