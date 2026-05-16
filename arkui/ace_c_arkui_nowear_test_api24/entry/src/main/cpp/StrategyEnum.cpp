/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value StrategyEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ARKUI_COMPETITION_STRATEGY_DEFAULT StrategyEnumTest_001 result=%{public}d",
        ARKUI_COMPETITION_STRATEGY_DEFAULT);
    ASSERT_EQ(PARAM_0, ARKUI_COMPETITION_STRATEGY_DEFAULT);
    NAPI_END;
}

static napi_value StrategyEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ARKUI_COMPETITION_STRATEGY_COMPETITION StrategyEnumTest_002 result=%{public}d",
        ARKUI_COMPETITION_STRATEGY_COMPETITION);
    ASSERT_EQ(PARAM_1, ARKUI_COMPETITION_STRATEGY_COMPETITION);
    NAPI_END;
}
}