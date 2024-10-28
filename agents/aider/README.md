# Aider as an Agent

## Usage

Basic usage:
```bash
docker run \
    --volume $(pwd):/app/repo \
    my_agents/aider \
    --message 'Add a function to print "Hello, World!"' \
    --file 'main.py'
```

Use the `--read` option to provide a read only directory for external documentation, etc.
```bash
docker run \
    --volume $(pwd):/app/repo \
    --volume /path/to/docs:/app/read \
    my_agents/aider \
    --message 'Based on the docs, add a function to print "Hello, World!"' \
    --file 'main.py' \
    --read '/path/to/docs'
```

## Volumes

`repo` - Your repository directory (required)

`read` - Read only directory for external documentation, etc.

`logs` - Directory that contains the logs from the Aider
