/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "swiper_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>

namespace ArkUICapiTest {

static ArkUI_NativeNodeAPI_1 *nodeAPI;
static ArkUI_NodeHandle swiper;

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    swiper = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_NodeHandle stack = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    const int size = 14;
    const char* arr[size] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"};
    
    for (int j = 0; j < size; j++) {
        ArkUI_NodeHandle textNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content = { .string = arr[j] };
        nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content);
        
        ArkUI_NumberValue value[] = {0};
        ArkUI_AttributeItem item = {value, 1};
        value[0].f32 = 400; // 400: width of textNode
        nodeAPI->setAttribute(textNode, NODE_WIDTH, &item);
        value[0].f32 = 160; // 160: height of textNode
        nodeAPI->setAttribute(textNode, NODE_HEIGHT, &item);
        value[0].u32 = COLOR_BLUE;
        nodeAPI->setAttribute(textNode, NODE_BACKGROUND_COLOR, &item);
        value[0].i32 = 0;
        nodeAPI->setAttribute(textNode, NODE_TEXT_ALIGN, &item);
        value[0].f32 = 30; // 30: fontSize
        nodeAPI->setAttribute(textNode, NODE_FONT_SIZE, &item);
        
        ArkUI_AttributeItem textId = {.string = "SwiperAutoPlayText"};
        nodeAPI->setAttribute(textNode, NODE_ID, &textId);
        nodeAPI->addChild(swiper, textNode);
    }
    ArkUI_NumberValue value[2];
    ArkUI_AttributeItem item = {.value=value, .size=2};
    value[0].i32 = 1;
    value[1].i32 = 1;
    nodeAPI->setAttribute(swiper, NODE_SWIPER_AUTO_PLAY, &item);
    
    ArkUI_NumberValue value2[1];
    ArkUI_AttributeItem item2 = {.value=value, .size=1};
    value[0].f32 = 1000; // 1000: autoplay intervals
    nodeAPI->setAttribute(swiper, NODE_SWIPER_INTERVAL, &item2);
    
    ArkUI_AttributeItem textId = {.string = "SwiperAutoPlay"};
    nodeAPI->setAttribute(swiper, NODE_ID, &textId);
    
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item1 = {.string = "Reset AutoPlay"};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->addChild(stack, button1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK, 0, nullptr);
    ArkUI_AttributeItem textId1 = {.string = "onClick1"};
    nodeAPI->setAttribute(button1, NODE_ID, &textId1);
    
    nodeAPI->addChild(stack, swiper);
    return stack;
}

napi_value SwiperTest::swiperAutoPlayTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperAutoPlayTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "swiperAutoPlayTest",
            "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto testNode = CreateChildNode(nodeAPI);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        if (targetId == 0) {
            nodeAPI->resetAttribute(swiper, NODE_SWIPER_AUTO_PLAY);
        }
    });

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), testNode) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "swiperAutoPlayTest",
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