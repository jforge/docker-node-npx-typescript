# docker-node-npx-typescript
A docker image with node, npx and typescript support

## Usage

`docker run --rm -v $(pwd):/app jforge/docker-node-npx-typescript -c "ts-node app/<local-typescript-file-path>.ts"`

## Example

In a [AWS CDK](https://docs.aws.amazon.com/cdk/index.html) context you may need to use the `cdk` cli command.

This requires some `cdk.json` descriptor and respective tools, in this case [npx](https://www.npmjs.com/package/npx) and [ts-node](https://www.npmjs.com/package/ts-node) for typescript execution:
```
{
  "app": "npx ts-node bin/lambda-edge-multi-stack.ts"
}
```

With a container spawned using this image you may create a npx wrapper `npxd` containing

```
#!/usr/bin/env bash
docker run --rm -v $(pwd):/app jforge/docker-node-npx-typescript -c "ts-node app/$@"
```

and change the above `cdk.json`to:

```
{
  "app": "./npxd bin/lambda-edge-multi-stack.ts"
}
```

A call to `cdk list` shoud list the declared cdk stacks, `cdk synth` should acknowledge a successful cloudformation synthesis. 
