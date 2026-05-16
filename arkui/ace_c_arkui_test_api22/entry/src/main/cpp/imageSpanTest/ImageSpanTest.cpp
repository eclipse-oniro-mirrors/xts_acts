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

#include "ImageSpanTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <string>
#include <sound/hdsp.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <arkui/native_gesture.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <hilog/log.h>
#include <native_drawing/drawing_color_filter.h>

namespace ArkUICapiTest {
static ArkUI_NodeHandle g_scroll   = nullptr;
static ArkUI_NodeHandle g_column   = nullptr;
static ArkUI_NodeHandle g_text     = nullptr;
static ArkUI_NodeHandle g_imageSpan = nullptr;
static ArkUI_NodeHandle g_textTest = nullptr;
static ArkUI_NativeNodeAPI_1* GetNodeAPI()
{
    static ArkUI_NativeNodeAPI_1* api = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    return api;
}

static ArkUI_NodeHandle CreateScroll()
{
    auto* nodeAPI = GetNodeAPI();
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);

    ArkUI_NumberValue widthVal[]  = {{.f32 = 500}};
    ArkUI_AttributeItem widthAttr = {widthVal, 1 };
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &widthAttr);

    ArkUI_NumberValue heightVal[] = {{.f32 = 700}};
    ArkUI_AttributeItem heightAttr = { heightVal, 1 };
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &heightAttr);

    ArkUI_NumberValue borderVal[] = {{.f32 = 2}};
    ArkUI_AttributeItem borderAttr = { borderVal, 1};
    nodeAPI->setAttribute(scroll, NODE_BORDER_WIDTH, &borderAttr);

    ArkUI_NumberValue barMode[] = {{.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF}};
    ArkUI_AttributeItem barModeAttr = { barMode, 1 };
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE, &barModeAttr);

    return scroll;
}

static ArkUI_NodeHandle CreateText()
{
    auto* nodeAPI = GetNodeAPI();
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);

    ArkUI_NumberValue w[] = {{.f32 = 300}};
    ArkUI_AttributeItem widthAttr = { w, 1 };
    nodeAPI->setAttribute(text, NODE_WIDTH, &widthAttr);

    ArkUI_NumberValue h[] = {{.f32 = 300}};
    ArkUI_AttributeItem heightAttr = { h, 1 };
    nodeAPI->setAttribute(text, NODE_HEIGHT, &heightAttr);

    ArkUI_AttributeItem contentItem{.string = "I am Text"};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &contentItem);

    return text;
}

static ArkUI_NodeHandle CreateImageSpan()
{
    auto* nodeAPI = GetNodeAPI();
    auto img = nodeAPI->createNode(ARKUI_NODE_IMAGE_SPAN);

    ArkUI_AttributeItem srcItem{.string = "/resources/base/media/strokeFile.svg"};
    nodeAPI->setAttribute(img, NODE_IMAGE_SPAN_SRC, &srcItem);

    ArkUI_NumberValue svg2[] = {{.i32 = 1}};
    ArkUI_AttributeItem svg2Attr = { svg2, 1 };
    nodeAPI->setAttribute(img, NODE_IMAGE_SUPPORT_SVG2, &svg2Attr);

    ArkUI_NumberValue w[] = {{.f32 =300}};
    ArkUI_AttributeItem widthAttr = { w, 1 };
    nodeAPI->setAttribute(img, NODE_WIDTH, &widthAttr);

    ArkUI_NumberValue h[] = {{.f32 = 500}};
    ArkUI_AttributeItem heightAttr = { h, 1 };
    nodeAPI->setAttribute(img, NODE_HEIGHT, &heightAttr);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "imageSpan";
    nodeAPI->setAttribute(img, NODE_ID, &id_item);

    return img;
}

static ArkUI_NodeHandle CreateColumn()
{
    return GetNodeAPI()->createNode(ARKUI_NODE_COLUMN);
}

napi_value ImageSpanTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    char xComponentID[64] = {0};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], xComponentID, sizeof(xComponentID), nullptr);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    g_scroll    = CreateScroll();
    g_column    = CreateColumn();
    g_text      = CreateText();
    g_imageSpan = CreateImageSpan();
    g_textTest = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem idItem = {.string = "textID1"};
    nodeAPI->setAttribute(g_textTest, NODE_ID, &idItem);
    ArkUI_NumberValue value[] = {{.f32 = 0.223}, {.f32 = -2}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(g_imageSpan, NODE_IMAGE_SPAN_COLOR_FILTER, &valueItem);
    auto getRes = nodeAPI->getAttribute(g_imageSpan, NODE_IMAGE_SPAN_COLOR_FILTER);
    std::string valueGetRes1 = std::to_string(getRes->value[0].f32);
    std::string valueGetRes2 = std::to_string(getRes->value[1].f32);
    std::string valueGetRes3 = valueGetRes1 + valueGetRes2;
    
    ArkUI_AttributeItem contentItem = {.string = valueGetRes3.c_str()};
    nodeAPI->setAttribute(g_textTest, NODE_TEXT_CONTENT, &contentItem);

    auto* api = GetNodeAPI();
    api->addChild(g_text,      g_imageSpan);
    api->addChild(g_column,    g_text);
    api->addChild(g_scroll,    g_column);
    api->addChild(g_scroll,    g_textTest);

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), g_scroll);

    napi_value exports;
    napi_create_object(env, &exports);
    return exports;
}

}  // namespace ArkUICapiTest