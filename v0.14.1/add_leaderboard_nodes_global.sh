#!/bin/bash
#
# add leaderboard nodes to bitcoind, ip list is from bitnodes.earn.com
#
# @copyright xhash.com
# @author Xianxiong wang
# @since 2018-01
#

curl "https://bitnodes.earn.com/nodes/leaderboard/" | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort -n | uniq | xargs -I{} bitcoin-cli addnode "{}" "onetry"
curl "https://bitnodes.earn.com/nodes/leaderboard/?page=2" | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort -n | uniq | xargs -I{} bitcoin-cli addnode "{}" "onetry"
