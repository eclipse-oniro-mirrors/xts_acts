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
#include "RunTaskInScopeTest.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>


static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static int NUMBER_4 = 4;
static int NUMBER_5 = 5;
static int NUMBER_6 = 6;

namespace ArkUICapiTest {

struct Test {
    ArkUI_NodeHandle pageOneButton1 = nullptr;
    ArkUI_NodeHandle button5 = nullptr;
    ArkUI_NodeHandle column = nullptr;
};
static Test *test1 = new Test();

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK, NUMBER_4, nullptr);
    ArkUI_AttributeItem LABEL_Item3 = {.string = "uiContext 为空"};
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
    ArkUI_AttributeItem id3 = {.string = "btn3_id"};
    nodeAPI->setAttribute(button3, NODE_ID, &id3);
    
    ArkUI_NodeHandle button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->registerNodeEvent(button4, NODE_ON_CLICK, NUMBER_5, nullptr);
    ArkUI_AttributeItem LABEL_Item4 = {.string = "callBack 为空"};
    nodeAPI->setAttribute(button4, NODE_BUTTON_LABEL, &LABEL_Item4);
    ArkUI_AttributeItem id4 = {.string = "btn4_id"};
    nodeAPI->setAttribute(button4, NODE_ID, &id4);

    ArkUI_NodeHandle button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->registerNodeEvent(button5, NODE_ON_CLICK, NUMBER_6, nullptr);
    ArkUI_AttributeItem LABEL_Item5 = {.string = "change uiContext2"};
    nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &LABEL_Item5);
    ArkUI_AttributeItem id0 = {.string = "uiContext2"};
    nodeAPI->setAttribute(button5, NODE_ID, &id0);

    nodeAPI->addChild(column, button3);
    nodeAPI->addChild(column, button4);
    nodeAPI->addChild(column, button5);
    
    ArkUI_NodeHandle pageOneButton1 = nullptr;
    auto ec = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("pageOneButton1", &pageOneButton1);
    ec = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("uiContext2", &button5);
    test1->pageOneButton1 = pageOneButton1;
    test1->button5 = button5;
    test1->column = column;
    return column;
}
napi_value RunTaskInScopeTest::testRunTaskInScope(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRunTaskInScope", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRunTaskInScope",
            "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeHandle column = CreateChildNode(nodeAPI);
    
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto button = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        auto uiContext1 = OH_ArkUI_GetContextByNode(button);
       
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        if (targetId == NUMBER_4) {
            auto ec = OH_ArkUI_RunTaskInScope(nullptr, test1, [](void *userData) {
                auto test = (Test *)userData;
                ArkUI_AttributeItem LABEL_Item = {.string = "success"};
                nodeAPI->setAttribute(test->pageOneButton1, NODE_BUTTON_LABEL, &LABEL_Item);
            });
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "RunTaskInScope code4 = %{public}d", ec);
            if (ec == ARKUI_ERROR_CODE_UI_CONTEXT_INVALID) {
                nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        }
        if (targetId == NUMBER_5) {
            auto uiContext = OH_ArkUI_GetContextByNode(test1->button5);
            auto ec = OH_ArkUI_RunTaskInScope(uiContext, test1, nullptr);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "RunTaskInScope code5 = %{public}d", ec);
            if (ec == ARKUI_ERROR_CODE_CALLBACK_INVALID) {
                nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);
            }
        }
        if (targetId == NUMBER_6) {
            auto uiContext = OH_ArkUI_GetContextByNode(test1->button5);
            auto ec = OH_ArkUI_RunTaskInScope(uiContext, test1, [](void *userData) {
                auto test = (Test *)userData;
                ArkUI_NumberValue background_color_value[] = {{.u32 = 0xFF00FF00}};
                ArkUI_AttributeItem background_color_item = {background_color_value,
                    sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(test->button5, NODE_BACKGROUND_COLOR, &background_color_item);
            });
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "RunTaskInScope code6 = %{public}d", ec);
        }
    });
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRunTaskInScope",
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