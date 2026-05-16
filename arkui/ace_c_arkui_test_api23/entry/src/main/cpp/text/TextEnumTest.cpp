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

#define PARAM_1046 1046
#define PARAM_1049 1049
#define PARAM_1050 1050
#define PARAM_1051 1051
#define PARAM_1052 1052
#define PARAM_1053 1053
#define PARAM_7041 7041
#define PARAM_7044 7044
#define PARAM_7045 7045
#define PARAM_7046 7046
#define PARAM_7048 7048
#define PARAM_8033 8033
#define PARAM_8037 8037
#define PARAM_8040 8040
#define PARAM_8041 8041
#define PARAM_8042 8042
#define PARAM_8045 8045
#define PARAM_7047 7047
#define PARAM_8044 8044

namespace ArkUICapiTest {

static napi_value TextEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_001 result=%{public}d", NODE_TEXT_TEXT_SELECTION);
    ASSERT_EQ(NODE_TEXT_TEXT_SELECTION, PARAM_1046);
    NAPI_END;
}

static napi_value TextEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_002 result=%{public}d", NODE_TEXT_INCLUDE_FONT_PADDING);
    ASSERT_EQ(NODE_TEXT_INCLUDE_FONT_PADDING, PARAM_1049);
    NAPI_END;
}

static napi_value TextEnumTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_003 result=%{public}d", NODE_TEXT_FALLBACK_LINE_SPACING);
    ASSERT_EQ(NODE_TEXT_FALLBACK_LINE_SPACING, PARAM_1050);
    NAPI_END;
}

static napi_value TextEnumTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_004 result=%{public}d", NODE_TEXT_MARQUEE_OPTIONS);
    ASSERT_EQ(NODE_TEXT_MARQUEE_OPTIONS, PARAM_1051);
    NAPI_END;
}

static napi_value TextEnumTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_005 result=%{public}d", NODE_TEXT_DIRECTION);
    ASSERT_EQ(NODE_TEXT_DIRECTION, PARAM_1052);
    NAPI_END;
}

static napi_value TextEnumTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_006 result=%{public}d", NODE_TEXT_SELECTED_DRAG_PREVIEW_STYLE);
    ASSERT_EQ(NODE_TEXT_SELECTED_DRAG_PREVIEW_STYLE, PARAM_1053);
    NAPI_END;
}

static napi_value TextEnumTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_007 result=%{public}d", NODE_TEXT_INPUT_TEXT_CONTENT_CONTROLLER_BASE);
    ASSERT_EQ(NODE_TEXT_INPUT_TEXT_CONTENT_CONTROLLER_BASE, PARAM_7041);
    NAPI_END;
}

static napi_value TextEnumTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_008 result=%{public}d", NODE_TEXT_INPUT_COMPRESS_LEADING_PUNCTUATION);
    ASSERT_EQ(NODE_TEXT_INPUT_COMPRESS_LEADING_PUNCTUATION, PARAM_7044);
    NAPI_END;
}

static napi_value TextEnumTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_009 result=%{public}d", NODE_TEXT_INPUT_INCLUDE_FONT_PADDING);
    ASSERT_EQ(NODE_TEXT_INPUT_INCLUDE_FONT_PADDING, PARAM_7045);
    NAPI_END;
}

static napi_value TextEnumTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_010 result=%{public}d", NODE_TEXT_INPUT_FALLBACK_LINE_SPACING);
    ASSERT_EQ(NODE_TEXT_INPUT_FALLBACK_LINE_SPACING, PARAM_7046);
    NAPI_END;
}

static napi_value TextEnumTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_011 result=%{public}d", NODE_TEXT_INPUT_SELECTED_DRAG_PREVIEW_STYLE);
    ASSERT_EQ(NODE_TEXT_INPUT_SELECTED_DRAG_PREVIEW_STYLE, PARAM_7048);
    NAPI_END;
}

static napi_value TextEnumTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_012 result=%{public}d", NODE_TEXT_AREA_ENABLE_SELECTED_DATA_DETECTOR);
    ASSERT_EQ(NODE_TEXT_AREA_ENABLE_SELECTED_DATA_DETECTOR, PARAM_8033);
    NAPI_END;
}

static napi_value TextEnumTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_013 result=%{public}d", NODE_TEXT_AREA_TEXT_CONTENT_CONTROLLER_BASE);
    ASSERT_EQ(NODE_TEXT_AREA_TEXT_CONTENT_CONTROLLER_BASE, PARAM_8037);
    NAPI_END;
}

static napi_value TextEnumTest_014(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_014 result=%{public}d", NODE_TEXT_AREA_COMPRESS_LEADING_PUNCTUATION);
    ASSERT_EQ(NODE_TEXT_AREA_COMPRESS_LEADING_PUNCTUATION, PARAM_8040);
    NAPI_END;
}

static napi_value TextEnumTest_015(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_015 result=%{public}d", NODE_TEXT_AREA_INCLUDE_FONT_PADDING);
    ASSERT_EQ(NODE_TEXT_AREA_INCLUDE_FONT_PADDING, PARAM_8041);
    NAPI_END;
}

static napi_value TextEnumTest_016(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_016 result=%{public}d", NODE_TEXT_AREA_FALLBACK_LINE_SPACING);
    ASSERT_EQ(NODE_TEXT_AREA_FALLBACK_LINE_SPACING, PARAM_8042);
    NAPI_END;
}

static napi_value TextEnumTest_017(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_017 result=%{public}d", NODE_TEXT_AREA_SELECTED_DRAG_PREVIEW_STYLE);
    ASSERT_EQ(NODE_TEXT_AREA_SELECTED_DRAG_PREVIEW_STYLE, PARAM_8045);
    NAPI_END;
}

static napi_value TextEnumTest_018(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_018 result=%{public}d", ARKUI_MARQUEESTARTPOLICY_DEFAULT);
    ASSERT_EQ(ARKUI_MARQUEESTARTPOLICY_DEFAULT, PARAM_0);
    NAPI_END;
}

static napi_value TextEnumTest_019(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_019 result=%{public}d", ARKUI_MARQUEESTARTPOLICY_ONFOCUS);
    ASSERT_EQ(ARKUI_MARQUEESTARTPOLICY_ONFOCUS, PARAM_1);
    NAPI_END;
}

static napi_value TextEnumTest_020(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_020 result=%{public}d", ARKUI_MARQUEEUPDATEPOLICY_DEFAULT);
    ASSERT_EQ(ARKUI_MARQUEEUPDATEPOLICY_DEFAULT, PARAM_0);
    NAPI_END;
}
static napi_value TextEnumTest_021(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_018 result=%{public}d", ARKUI_MARQUEEUPDATEPOLICY_PRESERVEPOSITION);
    ASSERT_EQ(ARKUI_MARQUEEUPDATEPOLICY_PRESERVEPOSITION, PARAM_1);
    NAPI_END;
}

static napi_value TextEnumTest_022(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_022 result=%{public}d", NODE_TEXT_INPUT_DIRECTION);
    ASSERT_EQ(NODE_TEXT_INPUT_DIRECTION, PARAM_7047);
    NAPI_END;
}
static napi_value TextEnumTest_023(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextEnumTest_023 result=%{public}d", NODE_TEXT_AREA_DIRECTION);
    ASSERT_EQ(NODE_TEXT_AREA_DIRECTION, PARAM_8044);
    NAPI_END;
}
}