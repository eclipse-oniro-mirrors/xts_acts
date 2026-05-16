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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "common/common.h"
#include "ColumnMatchParentTest.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static ArkUI_NativeNodeAPI_1* nodeAPI;

namespace ArkUICapiTest {

static std::string value2String(napi_env env, napi_value value)
{
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize+1, &stringSize);
    return valueString;
}

ArkUI_NodeHandle CreateColumnMatchParentNodeHandle(const std::string &tag)
{
    ArkUI_NodeHandle column0 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // column0
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};

    value[0].f32 = 100;
    nodeAPI->setAttribute(column0, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column0, NODE_HEIGHT, &item);

    value[0].u32 = 0xFFffc0cb; // Color.Pink
    nodeAPI->setAttribute(column0, NODE_BACKGROUND_COLOR, &item);

    value[0].i32 = ARKUI_FLEX_ALIGNMENT_CENTER;
    nodeAPI->setAttribute(column0, NODE_COLUMN_JUSTIFY_CONTENT, &item);

    item.string = "ColumnMatchParentParent";
    nodeAPI->setAttribute(column1, NODE_ID, &item);
    
    // column1
    value[0].i32 = ARKUI_LAYOUTPOLICY_MATCHPARENT;
    nodeAPI->setAttribute(column1, NODE_WIDTH_LAYOUTPOLICY, &item);
    nodeAPI->setAttribute(column1, NODE_HEIGHT_LAYOUTPOLICY, &item);

    value[0].u32 = 0xFF00ff00; // green
    nodeAPI->setAttribute(column1, NODE_BACKGROUND_COLOR, &item);

    item.string = "ColumnMatchParentChild";
    nodeAPI->setAttribute(column1, NODE_ID, &item);

     // column2
    value[0].f32 = 150;
    nodeAPI->setAttribute(column2, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column2, NODE_HEIGHT, &item);

    nodeAPI->addChild(column0, column1);
    nodeAPI->addChild(column1, column2);

    return column0;
}

napi_value ColumnMatchParentTest::CreateColumnMatchParentNativeRoot(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 2;
    napi_value args[2] = { nullptr, nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != 2) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EdgesPositionTest", "napi_get_cb_info success");
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "List", "OH_ArkUI_GetNodeHandleFromNapiValue %{public}d");
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );
    std::string tag = value2String(env, args[1]);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "tag=%{public}s", tag.c_str());
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, new std::string(tag));
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    if (nodeAPI != nullptr && nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
                     "CreateNativeNode tag=%{public}s", tag.c_str());
        auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
            ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
            std::string *userDate = reinterpret_cast<std::string*>(OH_ArkUI_NodeContent_GetUserData(handle));
            if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
                ArkUI_NodeHandle testNode;
                if (userDate) {
                    testNode = CreateColumnMatchParentNodeHandle(*userDate);
                    delete userDate;
                    userDate = nullptr;
                } else {
                    testNode = CreateColumnMatchParentNodeHandle("noUserData");
                }
                OH_ArkUI_NodeContent_AddNode(handle, testNode);
            }
        };
        OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    }
    return nullptr;
}

} // namespace ArkUICapiTest