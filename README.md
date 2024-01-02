# PubSub Emulator

Run Google PubSub in local machine with Docker.

### Built With

- Python + FastAPI 🐍

### Prerequisites

Make sure you have a properly Python & Poetry environment with version ~3.10.

### Setup

1. Clone the repo
   ```sh
   git clone git@github.com:victormartinez/pubsub_emulator.git
   ```

2. Install the dependencies
    ```sh
    cd pubsub_emulator/
    poetry install
    ```

3. Build image
    ```sh
    make build
    ```

4. Start pubsub
    ```sh
    make up
    ```

### Usage
Most useful commands are listed as follows:

    ```sh
    make build
    make create-topic
    make create-subscription
    make produce
    make consume
    ```
