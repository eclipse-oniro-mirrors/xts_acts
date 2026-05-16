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

#include "TextLayoutManager.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
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
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <arkui/styled_string.h>

static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NodeHandle textArea = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isID)
{
    std::string idValue = isID;
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
}

napi_value TextLayoutManagerTest::TextLayoutManagerTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int outLineCount = 0;
    int ret = OH_ArkUI_TextLayoutManager_GetLineCount(nullptr, &outLineCount);
    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest001", " expected value is 401, ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
#define TEXT_WIDTH_SIZE 200
#define TEXT_HEIGHT_SIZE 100
#define BUTTON_SIZE 50
#define TEXT_DECORATION_SIZE 5.0
int g_GetLineCount_ret = -1;
int g_GetRectsForRange_ret = -1;
int g_GetGlyphPositionAtCoordinate_ret = -1;
int g_GetLineMetrics_ret = -1;

napi_value TextLayoutManagerTest::check_TextLayoutManagerTest002(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", " check g_GetLineCount_ret is 0, ret is %{public}d------", g_GetLineCount_ret);
    ASSERT_EQ(g_GetLineCount_ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TextLayoutManagerTest::check_g_GetRectsForRange_ret(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", " check g_GetRectsForRange_ret value is 0, ret is %{public}d------", g_GetRectsForRange_ret);
    ASSERT_EQ(g_GetRectsForRange_ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TextLayoutManagerTest::check_g_GetGlyphPositionAtCoordinate_ret(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", " check g_GetGlyphPositionAtCoordinate_ret is 0, ret is %{public}d------", g_GetGlyphPositionAtCoordinate_ret);
    ASSERT_EQ(g_GetGlyphPositionAtCoordinate_ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value TextLayoutManagerTest::check_g_GetLineMetrics_ret(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", " check g_GetLineCount_ret is 0, ret is %{public}d------", g_GetLineCount_ret);
    ASSERT_EQ(g_GetLineCount_ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}


napi_value TextLayoutManagerTest::TextLayoutManagerTest002(napi_env env, napi_callback_info info)
{
    
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", "TextLayoutManagerTest002----");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest",
                    "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 定义文本内容
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_NumberValue textWidthValue[] = {{.f32 = TEXT_WIDTH_SIZE}};
    ArkUI_AttributeItem textWidthItem = {.value = textWidthValue, .size = PARAM_1};
    nodeAPI->setAttribute(text, NODE_WIDTH, &textWidthItem);

    ArkUI_NumberValue textHeightValue[] = {{.f32 = TEXT_HEIGHT_SIZE}};
    ArkUI_AttributeItem textHeightItem = {.value = textHeightValue, .size = PARAM_1};
    nodeAPI->setAttribute(text, NODE_HEIGHT, &textHeightItem);

    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration\n"};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText1ID" };
    nodeAPI->setAttribute(text, NODE_ID, &textID);

    ArkUI_NumberValue textDecorationValue[] = {
        {.i32 = ARKUI_TEXT_DECORATION_TYPE_LINE_THROUGH},
                                               {.u32 = COLOR_RED},
                                               {.i32 = ARKUI_TEXT_DECORATION_STYLE_SOLID},
                                               TEXT_DECORATION_SIZE};
    ArkUI_AttributeItem textDecoration = {textDecorationValue, PARAM_4};
    nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &textDecoration);
    ArkUI_NumberValue textFontSize[] = {{.f32 = PARAM_16}};
    ArkUI_AttributeItem textFontSizeItem = {.value = textFontSize, .size = PARAM_1};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &textFontSizeItem);
    nodeAPI->addChild(column, text);
    // 设置按钮
    ArkUI_NumberValue buttonWidthValue[] = {{.f32 = BUTTON_SIZE}};
    ArkUI_AttributeItem buttonWidthItem = {.value = buttonWidthValue, .size = PARAM_1};

    ArkUI_NumberValue buttonHeightValue[] = {{.f32 = BUTTON_SIZE}};
    ArkUI_AttributeItem buttonHeightItem = {.value = buttonHeightValue, .size = PARAM_1};

    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonContent = { .string = "01" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton01" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
            // OH_ArkUI_TextLayoutManager_GetLineCount success
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto result = nodeAPI->getAttribute(text, NODE_TEXT_LAYOUT_MANAGER);
            ArkUI_TextLayoutManager* layoutManager = (ArkUI_TextLayoutManager*)(result->object);
            int count = PARAM_2;
            auto res = OH_ArkUI_TextLayoutManager_GetLineCount(layoutManager, &count);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", "expected GetLineCount value is 0, ret is %{public}d---", res);
            g_GetLineCount_ret = res;

            
            OH_Drawing_TextBox* textBoxes;
            res = OH_ArkUI_TextLayoutManager_GetRectsForRange(layoutManager, PARAM_0, PARAM_100, RECT_WIDTH_STYLE_TIGHT,
                RECT_HEIGHT_STYLE_TIGHT, &textBoxes);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", "expected GetRectsForRange value is 0, ret is %{public}d---", res);
            g_GetRectsForRange_ret = res;

            
            OH_Drawing_PositionAndAffinity* pa;
            res = OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate(layoutManager, SIZE_30, PARAM_20, &pa);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", "expected GetGlyphPositionAtCoordinate value is 0, ret is %{public}d---", res);
            g_GetGlyphPositionAtCoordinate_ret = res;
            
            OH_Drawing_LineMetrics* lineMetrics = new OH_Drawing_LineMetrics();
            res = OH_ArkUI_TextLayoutManager_GetLineMetrics(layoutManager, PARAM_1, lineMetrics);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextLayoutManagerTest", "expected GetLineMetrics value is 0, ret is %{public}d---", res);
            g_GetLineMetrics_ret = res;
        }
    });

    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed----");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value TextLayoutManagerTest::TextLayoutManagerTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int outLineCount = 0;
    int ret = OH_ArkUI_TextLayoutManager_GetRectsForRange(nullptr, 0, 0, RECT_WIDTH_STYLE_TIGHT, RECT_HEIGHT_STYLE_TIGHT, nullptr);
    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest003", " expected value is 401, ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TextLayoutManagerTest::TextLayoutManagerTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int outLineCount = 0;
    int ret = OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate(nullptr, 0, 0, nullptr);
    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest004", " expected value is 401, ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value TextLayoutManagerTest::TextLayoutManagerTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int outLineCount = 0;
    int ret = OH_ArkUI_TextLayoutManager_GetLineMetrics(nullptr, 0, nullptr);
    OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextLayoutManagerTest005", " expected value is 401, ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace TextLayoutManagerTest