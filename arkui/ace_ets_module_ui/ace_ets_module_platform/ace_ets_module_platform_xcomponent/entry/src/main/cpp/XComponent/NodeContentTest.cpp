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
#include "NodeContentTest.h"
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <hilog/log.h>
#include <string>

namespace NativeXComponentSample {

static ArkUI_NativeNodeAPI_1* nodeAPI;
int nodecontenteventType = -1;

ArkUI_NodeHandle CreateNodeContentTestNodeHandle(const std::string &tag)
{
    // 创建XC组件
    ArkUI_NodeHandle xcNode = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT); // surface类型
    ArkUI_AttributeItem itemStringStyle = {.string = "XComponentNodeContentPage_XComponent"};
    ArkUI_NumberValue value[] = {{.f32 = 200}};
    ArkUI_AttributeItem item = {value, 1};
    ArkUI_NumberValue value2[] = {{.i32 = 0}, {.i32 = 0}, {.i32 = 200}, {.i32 = 200}};
    ArkUI_AttributeItem item2 = {value2, 4};

    nodeAPI->setAttribute(xcNode, NODE_WIDTH, &item); // 200
    nodeAPI->setAttribute(xcNode, NODE_HEIGHT, &item); // 200
    nodeAPI->setAttribute(xcNode, NODE_ID, &itemStringStyle); // XComponentNodeContentPage_XComponent
    nodeAPI->setAttribute(xcNode, NODE_XCOMPONENT_SURFACE_RECT, &item2); // 200*200
    value[0].u32 = 0xFF00FF00; // 绿色
    nodeAPI->setAttribute(xcNode, NODE_BACKGROUND_COLOR, &item);
    value[0].i32 = 1; // true
    nodeAPI->setAttribute(xcNode, NODE_FOCUSABLE, &item); // focusable: true
    nodeAPI->setAttribute(xcNode, NODE_DEFAULT_FOCUS, &item); // defaultFocus: true
    nodeAPI->setAttribute(xcNode, NODE_FOCUS_ON_TOUCH, &item); // focusOnTouch: true

    return xcNode;
}

napi_value NodeContentTest::CreateNodeContentTestNativeRoot(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "napi_get_cb_info success");
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "OH_ArkUI_GetNodeContentFromNapiValue");
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );

    if (nodeAPI != nullptr && nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode");
        auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
            ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
            std::string *userDate = reinterpret_cast<std::string*>(OH_ArkUI_NodeContent_GetUserData(handle));

            ArkUI_NodeContentEventType event_type = OH_ArkUI_NodeContentEvent_GetEventType(event);
            nodecontenteventType = event_type;
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
                "OH_ArkUI_NodeContentEvent_GetEventType %{public}d", event_type);
            
            if (event_type == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
                ArkUI_NodeHandle testNode;
                if (userDate) {
                    testNode = CreateNodeContentTestNodeHandle(*userDate);
                    delete userDate;
                    userDate = nullptr;
                } else {
                    testNode = CreateNodeContentTestNodeHandle("noUserData");
                }
                OH_ArkUI_NodeContent_AddNode(handle, testNode);
            }

            if (event_type == NODE_CONTENT_EVENT_ON_DETACH_FROM_WINDOW) {
                ArkUI_NodeHandle testNode = nullptr;
                OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("XComponentNodeContentPage_XComponent", &testNode);
                
                OH_ArkUI_NodeContent_RemoveNode(handle, testNode);
            }
            
        };
        OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    }
    return nullptr;
}

napi_value NodeContentTest::NodeContentEventGetEventType(napi_env env, napi_callback_info info)
{
    napi_value event_type;
    napi_create_int32(env, nodecontenteventType, &event_type);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
        "NodeContentEventGetEventType %{public}d", nodecontenteventType);
    return event_type;
}

} // namespace NativeXComponentSample