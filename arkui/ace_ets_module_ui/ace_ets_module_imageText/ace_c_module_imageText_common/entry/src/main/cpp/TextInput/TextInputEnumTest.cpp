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

static napi_value TextInputEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_INPUT_ON_COPY TextInputEnumTest_001 result=%{public}d",
        NODE_TEXT_INPUT_ON_COPY);
    ASSERT_EQ(PARAM_7015, NODE_TEXT_INPUT_ON_COPY);
    NAPI_END(Custom);
}

static napi_value TextInputEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_INPUT_ON_WILL_COPY TextInputEnumTest_002 result=%{public}d",
        NODE_TEXT_INPUT_ON_WILL_COPY);
    ASSERT_EQ(PARAM_7016, NODE_TEXT_INPUT_ON_WILL_COPY);
    NAPI_END(Custom);
}

static napi_value TextInputEnumTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_INPUT_ON_WILL_CUT TextInputEnumTest_003 result=%{public}d",
        NODE_TEXT_INPUT_ON_WILL_CUT);
    ASSERT_EQ(PARAM_7017, NODE_TEXT_INPUT_ON_WILL_CUT);
    NAPI_END(Custom);
}

static napi_value TextInputEnumTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION TextInputEnumTest_004 result=%{public}d",
        NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION);
    ASSERT_EQ(PARAM_7043, NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION);
    NAPI_END(Custom);
}

static napi_value TextInputEnumTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_INPUT_DECORATION TextInputEnumTest_005 result=%{public}d",
        NODE_TEXT_INPUT_DECORATION);
    ASSERT_EQ(PARAM_7050, NODE_TEXT_INPUT_DECORATION);
    NAPI_END(Custom);
}
}