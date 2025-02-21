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

usage()
{
    echo
    echo "USAGE"
    echo "       ./build.sh [suite=BUILD_TARGET] [target_os=TARGET_OS] [target_arch=TARGET_ARCH] [variant=BUILD_VARIANT] [target_subsystem=TARGET_SUBSYSTEM]"
    echo "                  suite            : BUILD_TARGET     acts, hats, dcts"
    echo "                  target_arch      : TARGET_ARCH      arm64 or arm, default value is arm"
    echo "                  variant          : BUILD_VARIANT    release or debug, default value is debug"
    echo "                  target_subsystem : TARGET_SUBSYSTEM the target subsystem to build"
    echo "                  system_size      : SYSTEM_SIZE      standard"
    echo "                  product_name     : PRODUCT_NAME     the name of product. such as Hi3516DV300, and so on."
    echo
    exit 1
}


parse_cmdline()
{
    BASE_HOME=$(dirname $(cd $(dirname $0); pwd))
    BASE_HOME=${BASE_HOME}/../..
    BUILD_TOOLS_DIR=${BASE_HOME}/prebuilts/build-tools/linux-x86/bin
    OUT_DIR=${BASE_HOME}/out
    BUILD_SHELL=${BASE_HOME}/build.sh
    # build all parts for all products by default
    BUILD_TARGET=""
    GN_ARGS="is_dbt_test=true include_all=false"
    TARGET_ARCH=arm
    BUILD_VARIANT=release
    UPLOAD_API_INFO=False
    SYSTEM_SIZE=standard
    PRODUCT_NAME=""
    USE_MUSL=false
    export PATH=${BASE_HOME}/prebuilts/python/linux-x86/3.8.3/bin:$PATH

    while [ -n "$1" ]
    do
        var="$1"
        OPTIONS=${var%%=*}
        PARAM=${var#*=}
        echo "OPTIONS=$OPTIONS"
        echo "PARAM=$PARAM"
        echo "-------------------"
        case "$OPTIONS" in
        suite)            BUILD_TARGET="$PARAM"
                          ;;
        target_arch)      TARGET_ARCH="$PARAM"
                          ;;
        variant)          BUILD_VARIANT="$PARAM"
                          ;;
        use_musl)         USE_MUSL="$PARAM"
                          ;;
        target_subsystem) export target_subsystem=${PARAM}
                          ;;
        system_size)      SYSTEM_SIZE="$PARAM"
                          ;;
        product_name)     PRODUCT_NAME="$PARAM"
                          ;;
        upload_api_info)  UPLOAD_API_INFO=$(echo $PARAM |tr [a-z] [A-Z])
                         ;;
        *)   usage
             break;;
        esac
        shift
    done
    if [ "$SYSTEM_SIZE" = "standard" ]; then
       BUILD_TARGET=${BUILD_TARGET:-"test/xts/acts:xts_acts"}
       PRODUCT_NAME=${PRODUCT_NAME:-"Hi3516DV300"}
    else
       BUILD_TARGET=${BUILD_TARGET:-"acts acts_ivi acts_intellitv acts_wearable"}
       PRODUCT_NAME=${PRODUCT_NAME:-"arm64"}
    fi
}


do_make()
{
    BUILD_TARGET=$(echo "$BUILD_TARGET" | sed 's/,/ /g')
    echo "BUILD_TARGET: $BUILD_TARGET"
    cd $BASE_HOME
    ACTS_ROOT="$BASE_HOME/test/xts/acts"

    rm -rf "$BASE_HOME/test/xts/autogen_apiobjs"
    export XTS_SUITENAME=acts
    if [ "$SYSTEM_SIZE" = "standard" ]; then
        MUSL_ARGS=""
        if [ "$PRODUCT_NAME" = "m40" ]; then
		    if [ "$USE_MUSL" = "false" ]; then
                        MUSL_ARGS="--gn-args use_musl=false --gn-args use_custom_libcxx=true --gn-args use_custom_clang=true"			
		    fi
        fi
       ./build.sh --product-name $PRODUCT_NAME --gn-args build_xts=true --build-target $BUILD_TARGET --build-target "deploy_testtools" --gn-args is_standard_system=true $MUSL_ARGS --target-cpu $TARGET_ARCH --get-warning-list=false --stat-ccache=true --compute-overlap-rate=false --deps-guard=false  --gn-args skip_generate_module_list_file=true
    else
       if [ "$BUILD_TARGET" = "acts acts_ivi acts_intellitv acts_wearable" ]; then
         ./build.sh --product-name $PRODUCT_NAME --gn-args build_xts=true --build-target "acts" --build-target "acts_ivi" --build-target "acts_intellitv" --build-target "acts_wearable" --build-target "deploy_testtools"
       else
         ./build.sh --product-name $PRODUCT_NAME --gn-args build_xts=true --build-target $BUILD_TARGET --build-target "deploy_testtools"
       fi
    fi
    ret=$?

    rm -rf "$BASE_HOME/test/xts/autogen_apiobjs"
    if [ "$ret" != 0 ]; then
        echo "build error"
        exit 1
    fi
}
parse_cmdline $@
do_make
exit 0
