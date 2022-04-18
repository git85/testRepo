#!/bin/bash
echo "Starting the git pull request"
git pull
echo "Git pull request complete"
rsync -avzh test* ec2-user@10.0.132.2:/tmp

