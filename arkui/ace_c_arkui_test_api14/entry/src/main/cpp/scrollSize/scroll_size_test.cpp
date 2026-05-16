/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "scroll_size_test.h"
#include <arkui/native_node.h>
#include <string>
#include <cmath>
#define PARAM_HEIGHT_SIZE 300.000000

namespace ArkUICapiTest {

static ArkUI_NativeNodeAPI_1 *nodeAPI;
static ArkUI_NodeHandle list;
static OH_NativeXComponent *component;

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    list = nodeAPI->createNode(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = {{.f32 = 200.f}};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(list, NODE_HEIGHT, &item);
    value[0] = {.f32=200.f};
    nodeAPI->setAttribute(list, NODE_WIDTH, &item);
    
    for (int i = 0; i < 6; i++) {
        auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        value[0] = {.f32 = 100.f};
        nodeAPI->setAttribute(text, NODE_WIDTH, &item);
        value[0] = {.f32 = 50.f};
        nodeAPI->setAttribute(text, NODE_HEIGHT, &item);
        value[0] = {.u32 = 0x33123456};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &item);
        item.string = std::to_string(i).c_str();
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item);
        auto listitem = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
        nodeAPI->addChild(list, listitem);
        nodeAPI->addChild(listitem, text);
    }
    return list;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollSizeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollSizeTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
    
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_LIST_ON_DID_SCROLL) {
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            auto *temp = nodeAPI->getAttribute(list, NODE_SCROLL_SIZE);
            auto width = nodeAPI->getAttribute(list, NODE_SCROLL_SIZE)->value[0].f32;
            auto height = nodeAPI->getAttribute(list, NODE_SCROLL_SIZE)->value[1].f32;

            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollSizeTest",
                                    "hzx1115 width:%{public}s height:%{public}s currentOffset:%{public}f", std::to_string(width).c_str(),
                                    std::to_string(height).c_str(), 66.6);
            
            if ( round(height) == PARAM_HEIGHT_SIZE ) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollSizeTest", "OnEventReceive callBack111");
                auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
                ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
                ArkUI_AttributeItem background_color_item = {background_color_value,
                                                                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        
    }
}

napi_value ScrollSizeTest::testGetScrollSizeTest001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ScrollSizeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollSizeTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    CreateChildNode(nodeAPI);
    nodeAPI->addChild(column1, list);

	ArkUI_AttributeItem id_item = {};
    id_item.string = "scrollSizeCalled";
    nodeAPI->setAttribute(list, NODE_ID, &id_item);
    
    nodeAPI->registerNodeEvent(list, NODE_LIST_ON_DID_SCROLL, NODE_LIST_ON_DID_SCROLL, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column1) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollSizeTest",
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