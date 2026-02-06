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
#include "../common/common.h"
#include "../manager/PluginManagerTest.h"

#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>
#include <hilog/log.h>


namespace ArkUICapiTest {

static napi_value TextDirection_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextDirection_001 result=%{public}d", ARKUI_TEXT_DIRECTION_LTR);
    ASSERT_EQ(ARKUI_TEXT_DIRECTION_LTR, PARAM_0);
    NAPI_END;
}

static napi_value TextDirection_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextDirection_002 result=%{public}d", ARKUI_TEXT_DIRECTION_RTL);
    ASSERT_EQ(ARKUI_TEXT_DIRECTION_RTL, PARAM_1);
    NAPI_END;
}

static napi_value TextDirection_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextDirection_003 result=%{public}d", ARKUI_TEXT_DIRECTION_DEFAULT);
    ASSERT_EQ(ARKUI_TEXT_DIRECTION_DEFAULT, PARAM_2);
    NAPI_END;
}

static napi_value TextDirection_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextDirection_004 result=%{public}d", ARKUI_TEXT_DIRECTION_AUTO);
    ASSERT_EQ(ARKUI_TEXT_DIRECTION_AUTO, PARAM_3);
    NAPI_END;
}

static napi_value TextDirection_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextDirection_005 result=%{public}d", ARKUI_TEXT_ALIGNMENT_LEFT_TO_RIGHT);
    ASSERT_EQ(ARKUI_TEXT_ALIGNMENT_LEFT_TO_RIGHT, PARAM_4);
    NAPI_END;
}

static napi_value TextDirection_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextDirection_006 result=%{public}d", ARKUI_TEXT_ALIGNMENT_RIGHT_TO_LEFT);
    ASSERT_EQ(ARKUI_TEXT_ALIGNMENT_RIGHT_TO_LEFT, PARAM_5);
    NAPI_END;
}
}