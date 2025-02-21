#!/bin/bash

# Copyright (C) 2021 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

parse_target_subsystem()
{
    XTS_HOME=$(dirname $(cd $(dirname $0); pwd))
    BASE_HOME=${XTS_HOME}/../..
    target_subsystem_config=${XTS_HOME}/tools/config/precise_compilation.json
    xts_enter_config=${BASE_HOME}/.repo/manifests/matrix_product.csv
    xts_targets=""
    repositorys=$1
    match_status=true
    repo_lst=($(echo $repositorys | tr "," "\n"))
    row=dayu200_xts
    row_number=$(awk -F',' -v target="$row" 'NR==1{for(i=1;i<=NF;i++){if($i==target){print i;exit}}}' "$xts_enter_config")
    for repo in "${repo_lst[@]}"
    do
        echo $repo
        # 是否配置xts门禁,若无,跳过
        line_number=$(awk -F',' -v target="$repo" '$1 == target {print NR}' "$xts_enter_config")
        content=$(awk -F',' -v c=$row_number  -v r=$line_number 'NR==r {print $c}' "$xts_enter_config")
        echo $content
        if [ ! "$content" = "Y" ]||[ -z "$content" ]; then
            continue
        fi
        # 仓名映射target名
        jq_cmd="cat $target_subsystem_config | jq -r '.[] | select( .name == \"${repo}\") | .buildTarget'"
        xts_target=$(eval $jq_cmd)
        if [[ -z "${xts_target}" ]];then
            match_status=false
        fi
        # precise_compilation.json匹配到的才添加，数组中不存在才添加（去重）
        if [[ -n "${xts_target}" && !("$xts_targets" =~ "$xts_target") ]];then
            xts_targets+="$xts_target,"
        fi
    done
        # 去掉末尾,
        xts_targets=$(echo "$xts_targets" | sed 's/,$//')
        echo "xts_targets: $xts_targets"
}

define_cache_type() {
    echo $CACHE_TYPE
}
define_cache_type

parse_args()
{   
    while [ -n "$1" ]
    do
        var="$1"
        OPTIONS=${var%%=*}
        PARAM=${var#*=}
        if [[ "$OPTIONS" == "cache_type" && "$PARAM" != "$OPTIONS" ]]; then
            CACHE_TYPE="$PARAM"
        fi
        shift
    done
}

pr_list=$1
shift
remaining_params=$@

do_make()
{
    cd $BASE_HOME
    if [[ "${match_status}" == false || "$xts_targets" =~ "xts_acts" ]];then
        if [ -z "$CACHE_TYPE" ]; then
	        ./test/xts/acts/build.sh product_name=rk3568 system_size=standard $remaining_params
        else
            ./test/xts/acts/build.sh product_name=rk3568 system_size=standard $remaining_params cache_type=$CACHE_TYPE
        fi
    else
        if [ -z "$CACHE_TYPE" ]; then
            ./test/xts/acts/build.sh product_name=rk3568 system_size=standard suite=${xts_targets} $remaining_params
        else
            ./test/xts/acts/build.sh product_name=rk3568 system_size=standard suite=${xts_targets} $remaining_params cache_type=$CACHE_TYPE
        fi
    fi
}
echo $@
parse_target_subsystem $pr_list
if [ $# -eq 0 ];then
    echo "no args; pass cache deal"
else    
    parse_args $@
fi
do_make
exit 0