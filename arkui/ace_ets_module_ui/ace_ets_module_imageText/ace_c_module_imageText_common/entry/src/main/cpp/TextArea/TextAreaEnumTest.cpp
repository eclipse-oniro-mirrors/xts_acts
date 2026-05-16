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

static napi_value TextAreaEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_ON_COPY TextAreaEnumTest_001 result=%{public}d",
        NODE_TEXT_AREA_ON_COPY);
    ASSERT_EQ(PARAM_8014, NODE_TEXT_AREA_ON_COPY);
    NAPI_END(Custom);
}

static napi_value TextAreaEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_ON_WILL_COPY TextAreaEnumTest_002 result=%{public}d",
        NODE_TEXT_AREA_ON_WILL_COPY);
    ASSERT_EQ(PARAM_8015, NODE_TEXT_AREA_ON_WILL_COPY);
    NAPI_END(Custom);
}

static napi_value TextAreaEnumTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_ON_CUT TextAreaEnumTest_003 result=%{public}d",
        NODE_TEXT_AREA_ON_CUT);
    ASSERT_EQ(PARAM_8016, NODE_TEXT_AREA_ON_CUT);
    NAPI_END(Custom);
}

static napi_value TextAreaEnumTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_ON_WILL_CUT TextAreaEnumTest_004 result=%{public}d",
        NODE_TEXT_AREA_ON_WILL_CUT);
    ASSERT_EQ(PARAM_8017, NODE_TEXT_AREA_ON_WILL_CUT);
    NAPI_END(Custom);
}

static napi_value TextAreaEnumTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION TextAreaEnumTest_005 result=%{public}d",
        NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION);
    ASSERT_EQ(PARAM_8039, NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION);
    NAPI_END(Custom);
}

static napi_value TextAreaEnumTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_AREA_DECORATION TextAreaEnumTest_006 result=%{public}d",
        NODE_TEXT_AREA_DECORATION);
    ASSERT_EQ(PARAM_8047, NODE_TEXT_AREA_DECORATION);
    NAPI_END(Custom);
}
}