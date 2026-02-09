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

#include <string>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/styled_string.h>
#include "LayoutManagerTest.h"
#include "../manager/PluginManagerTest.h"
#define TEXT_WIDTH_SIZE 200
#define TEXT_HEIGHT_SIZE 100
#define BUTTON_SIZE 50
#define TEXT_DECORATION_SIZE 5.0
namespace ArkUICapiTest {
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
napi_value LayoutManagerTest::LayoutManagerTest001(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "LayoutManagerTest001");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
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
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_NO_ERROR){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
            OH_ArkUI_TextLayoutManager_Dispose(layoutManager);
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value LayoutManagerTest::LayoutManagerTest002(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManager", "LayoutManagerTest002");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText2ID" };
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
    ArkUI_AttributeItem buttonContent = { .string = "02" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton02" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
            // OH_ArkUI_TextLayoutManager_GetLineCount failed
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            int count = PARAM_2;
            auto res = OH_ArkUI_TextLayoutManager_GetLineCount({}, &count);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_PARAM_INVALID){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}


napi_value LayoutManagerTest::LayoutManagerTest003(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "LayoutManagerTest003");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText3ID" };
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
    ArkUI_AttributeItem buttonContent = { .string = "03" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton03" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
             // OH_ArkUI_TextLayoutManager_GetRectsForRange success
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto result = nodeAPI->getAttribute(text, NODE_TEXT_LAYOUT_MANAGER);
            ArkUI_TextLayoutManager* layoutManager = (ArkUI_TextLayoutManager*)(result->object);
            OH_Drawing_TextBox* textBoxes;
            auto res = OH_ArkUI_TextLayoutManager_GetRectsForRange(layoutManager, PARAM_0, PARAM_100, RECT_WIDTH_STYLE_TIGHT,
                RECT_HEIGHT_STYLE_TIGHT, &textBoxes);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_NO_ERROR){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
            OH_ArkUI_TextLayoutManager_Dispose(layoutManager);
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value LayoutManagerTest::LayoutManagerTest004(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "LayoutManagerTest004");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText4ID" };
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
    ArkUI_AttributeItem buttonContent = { .string = "04" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton04" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
             // OH_ArkUI_TextLayoutManager_GetRectsForRange failed
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            OH_Drawing_TextBox* textBoxes;
            auto res = OH_ArkUI_TextLayoutManager_GetRectsForRange({}, PARAM_0, PARAM_100, RECT_WIDTH_STYLE_TIGHT,
                RECT_HEIGHT_STYLE_TIGHT, &textBoxes);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_PARAM_INVALID){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value LayoutManagerTest::LayoutManagerTest005(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "LayoutManagerTest005");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText5ID" };
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
    ArkUI_AttributeItem buttonContent = { .string = "05" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton05" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
            // OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate success
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto result = nodeAPI->getAttribute(text, NODE_TEXT_LAYOUT_MANAGER);
            ArkUI_TextLayoutManager* layoutManager = (ArkUI_TextLayoutManager*)(result->object);
            OH_Drawing_PositionAndAffinity* pa;
            auto res = OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate(layoutManager, SIZE_30, PARAM_20, &pa);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_NO_ERROR){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
            OH_ArkUI_TextLayoutManager_Dispose(layoutManager);
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value LayoutManagerTest::LayoutManagerTest006(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "LayoutManagerTest006");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText6ID" };
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
    ArkUI_AttributeItem buttonContent = { .string = "06" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton06" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
            // OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate failed
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            OH_Drawing_PositionAndAffinity* pa;
            auto res = OH_ArkUI_TextLayoutManager_GetGlyphPositionAtCoordinate({}, SIZE_30, PARAM_20, &pa);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_PARAM_INVALID){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value LayoutManagerTest::LayoutManagerTest007(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "LayoutManagerTest007");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText7ID" };
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
    ArkUI_AttributeItem buttonContent = { .string = "07" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton07" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
            // OH_ArkUI_TextLayoutManager_GetLineMetrics success
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            auto result = nodeAPI->getAttribute(text, NODE_TEXT_LAYOUT_MANAGER);
            ArkUI_TextLayoutManager* layoutManager = (ArkUI_TextLayoutManager*)(result->object);
            OH_Drawing_LineMetrics* lineMetrics = new OH_Drawing_LineMetrics();
            auto res = OH_ArkUI_TextLayoutManager_GetLineMetrics(layoutManager, PARAM_1, lineMetrics);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_NO_ERROR){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
            OH_ArkUI_TextLayoutManager_Dispose(layoutManager);
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value LayoutManagerTest::LayoutManagerTest008(napi_env env, napi_callback_info info)
{
   OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "LayoutManagerTest008");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
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

    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content = {
        .string = "This is the text content with the decoration set to LineThrough and the color set to Red."};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content);

    ArkUI_AttributeItem textID = { .string = "LayoutManagerText8ID" };
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
    ArkUI_AttributeItem buttonContent = { .string = "08" };
    ArkUI_AttributeItem buttonID = { .string = "LayoutManagerTestButton08" };
    nodeAPI->setAttribute(button, NODE_ID, &buttonID);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonContent);
    nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
        auto eventID = OH_ArkUI_NodeEvent_GetTargetId(event);
        if (eventID == PARAM_1) {
            // OH_ArkUI_TextLayoutManager_GetLineMetrics failed
            auto text = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
            OH_Drawing_LineMetrics* lineMetrics = new OH_Drawing_LineMetrics();
            auto res = OH_ArkUI_TextLayoutManager_GetLineMetrics({}, PARAM_1, lineMetrics);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutManagerTest", "text res: %{public}d", res);
            if(res == ARKUI_ERROR_CODE_PARAM_INVALID){
                ArkUI_NumberValue text_font_color_value[] = {{.u32 = COLOR_RED}};
                ArkUI_AttributeItem text_font_color_item = { text_font_color_value, sizeof(text_font_color_value)/sizeof(ArkUI_NumberValue) };
                nodeAPI->setAttribute(text, NODE_FONT_COLOR, &text_font_color_item);
            }
        }
    });
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_1, text);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LayoutManagerTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest