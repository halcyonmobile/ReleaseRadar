#!/usr/bin/env tcsh
set -e
wait_time=5

echo "Are you sure you meant to run this script?"
echo "This script releases a new version of ReleaseRadar!"
echo ""

while [ $wait_time >= 1 ]
do
    printf "\rYou have %2d second(s) remaining to hit Ctrl+C to cancel that operation!" $wait_time
    sleep 1
    temp_cnt=$temp_cnt-1
done

echo ""
echo "🚀  Releasing ..."
echo ""

pod lib lint

git add -A && git commit -m "Release 0.1.0"
git tag '0.1.0'
git push --tags

