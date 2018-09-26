# Neuron Browser Public Instance Deployment
This repository is a specific deployment configuration for the pubic-facing portion of the MouseLight Neuron Browser
services.  This only includes the optimized search data and related services (search-api, search-client, export-api).
There are no data management or manipulation services included.

The configuration of this Compose file must be synchronized with the `mnb-public-proxy` image.

### Installation
The current implementation uses Docker with Docker Compose to manage the multiple independent services.

If not already present, copy `.env-template` as `.env` and set the variables.

### Docker
A standard installation of Docker is sufficient.

The database instance uses Docker Data Volumes. Starting, stopping, and removing/updating the service containers will not remove database 
contents.

### Operation
Most Docker Compose operations are wrapped in batch scripts to ensure the required flags are correct, e.g. test vs. 
production.

#### Starting or restarting the services
```
./up.sh
```

#### Stopping services
```
./stop.sh
```

#### Tearing down services (retains data)
```
./down.sh
```
destroys existing service containers *but does not remove any data volumes.*  Newer container images can then be pulled 
and the services restarted with the *up* script.

To remove all data and start with a clean database remove the docker volume `search_data` (it will likely have a project
prefix such as `mnb_`).

#### Logs

```
./logs
```
will bring up the Compose logs for this container set.