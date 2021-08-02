# indaco.modern-historian

It takes care of the entire setup for the modern historian stack.

- Setup InfluxDB2
- Generate influxDB2's tokens (read and wirte) for Telegraf and Grafana
- Provision `pump_pressure_diff` task on InfluxDB2
- Creare config file for Telegraf
- Provision Gradana datasource
- Provision Grafana dashboard
- Run the docker compose stack

## Example Playbook

    - hosts: all
      roles:
         - role: indaco.modern-historian

## License

MIT
