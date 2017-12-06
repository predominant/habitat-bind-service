# Habitat Bind Service

## Description

This habitat plan represents an approach in binding to external services from the Habitat service ring.

Often during a deployment we may utilize servers or services that are not deployed as part of Habitat's services. This may be a PaaS style service such as a message queue, or a Chef-managed service from legacy infrastructure that is not visible as a service within Habitat.

Using this plan, with your own `default.toml` will allow configuration to made available for binding when this service is launched.

The service itself does nothing but loop infinitely. Periodically (in a configurable sleep interval) it will output `Beep` and `Boop`, beacuse .. its cute. This loop keeps the service running, and the configuration will be available for binding to other services.

## Configuration

The configuration is detailed in `default.toml` as an example. MySQL connection information is one of the service examples contained within:

```
[mysql]
host = "mysql.example.com"
port = 3306
user = "db_user"
pass = "secret"
db = "my_database_name"
```

These represent a MySQL server that was deployed outside of Habitat.

## Example

### Launch the `service-bind` service

```
hab svc load predominant/service-bind
```

### Bind to this service, from another service

The habitat package that will consume this `service-bind` service will be looking for specific configuration name.

In our fake package `my-application`, lets assume the configuration is YAML format, and requires the mysql configuration to connect.

`my-config.yaml` might look like the following:

```
app:
  mysql:
    host: {{bind.services.mysql_host}}:{{bind.services.mysql_port}}
    user: {{bind.services.mysql_user}}
    pass: {{bind.services.mysql_pass}}
    db: {{bind.services.mysql_db}}
```

Launching `my-application` would look like:

```
hab svc load predominant/my-application \
  --bind services:service-bind.default
```
