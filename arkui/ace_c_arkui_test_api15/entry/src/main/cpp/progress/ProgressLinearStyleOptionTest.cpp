/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <asm-generic/stat.h>
#include <bits/alltypes.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <sound/hdsp.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_render.h>
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <linux/nubus.h>
#include <sys/types.h>
#include <thread>
#include <unistd.h>
#include <vector>
#include <hitrace/trace.h>


namespace ArkUICapiTest {

static napi_value ProgressLinearStyleOptionTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Progress, ARKUI_NODE_PROGRESS);
    auto linearStyleOption = OH_ArkUI_ProgressLinearStyleOption_Create();
    ASSERT_OBJ_NE(linearStyleOption, nullptr);

    OH_ArkUI_ProgressLinearStyleOption_SetScanEffectEnabled(linearStyleOption, true);
    bool boolScanEffectEnabled =
        OH_ArkUI_ProgressLinearStyleOption_GetScanEffectEnabled(linearStyleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ProgressLinearStyleOptionTest_001",
        "GetScanEffectEnabled is %{public}d", boolScanEffectEnabled);
    ASSERT_EQ(boolScanEffectEnabled, true);
    NAPI_END;
}

static napi_value ProgressLinearStyleOptionTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Progress, ARKUI_NODE_PROGRESS);
    auto linearStyleOption = OH_ArkUI_ProgressLinearStyleOption_Create();
    ASSERT_OBJ_NE(linearStyleOption, nullptr);

    OH_ArkUI_ProgressLinearStyleOption_SetScanEffectEnabled(linearStyleOption, false);
    bool boolScanEffectEnabled =
        OH_ArkUI_ProgressLinearStyleOption_GetScanEffectEnabled(linearStyleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ProgressLinearStyleOptionTest_002",
        "GetScanEffectEnabled is %{public}d", boolScanEffectEnabled);
    ASSERT_EQ(boolScanEffectEnabled, false);
    NAPI_END;
}

static napi_value ProgressLinearStyleOptionTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Progress, ARKUI_NODE_PROGRESS);
    auto linearStyleOption = OH_ArkUI_ProgressLinearStyleOption_Create();
    ASSERT_OBJ_NE(linearStyleOption, nullptr);
    
    OH_ArkUI_ProgressLinearStyleOption_SetSmoothEffectEnabled(linearStyleOption, true);
    bool boolSmoothEffectEnabled =
        OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled(linearStyleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ProgressLinearStyleOptionTest_003",
        "GetSmoothEffectEnabled is %{public}d", boolSmoothEffectEnabled);
    ASSERT_EQ(boolSmoothEffectEnabled, true);
    NAPI_END;
}

static napi_value ProgressLinearStyleOptionTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Progress, ARKUI_NODE_PROGRESS);
    auto linearStyleOption = OH_ArkUI_ProgressLinearStyleOption_Create();
    ASSERT_OBJ_NE(linearStyleOption, nullptr);
    
    OH_ArkUI_ProgressLinearStyleOption_SetSmoothEffectEnabled(linearStyleOption, false);
    bool boolSmoothEffectEnabled =
        OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled(linearStyleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ProgressLinearStyleOptionTest_004",
        "GetSmoothEffectEnabled is %{public}d", boolSmoothEffectEnabled);
    ASSERT_EQ(boolSmoothEffectEnabled, false);
    NAPI_END;
}

static napi_value ProgressLinearStyleOptionTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Progress, ARKUI_NODE_PROGRESS);
    auto linearStyleOption = OH_ArkUI_ProgressLinearStyleOption_Create();
    ASSERT_OBJ_NE(linearStyleOption, nullptr);
    
    OH_ArkUI_ProgressLinearStyleOption_SetSmoothEffectEnabled(linearStyleOption, false);
    bool boolSmoothEffectEnabled =
        OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled(linearStyleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ProgressLinearStyleOptionTest_004",
        "GetSmoothEffectEnabled is %{public}d", boolSmoothEffectEnabled);
    ASSERT_EQ(boolSmoothEffectEnabled, false);
    NAPI_END;
}
}