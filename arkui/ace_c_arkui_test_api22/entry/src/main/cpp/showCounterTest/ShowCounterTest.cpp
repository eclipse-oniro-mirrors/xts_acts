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

#include "manager/PluginManagerTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_gesture.h>
#include <hilog/log.h>
#include "ShowCounterTest.h"

static ArkUI_NodeHandle TextArea = nullptr;
static ArkUI_NodeHandle TextInput = nullptr;

static ArkUI_NumberValue showCounterArray[] = {{.i32 = true},
                                               {.f32 = 50.0f},
                                               {.i32 = true}};
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
namespace ArkUICapiTest {
napi_value ShowCounterTest::showCounterTest(
    napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ShowCounterTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ShowCounterTest",
            "GetContext env or info is null");
        return nullptr;
        }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    TextArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem buttonItem = {.string = "textArea_01"};
    ArkUI_NumberValue maxLengthValue[] = {{.i32 = 5}};
    ArkUI_AttributeItem maxLengthItem = {maxLengthValue, 1};
    TextInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    ArkUI_AttributeItem buttonItem1 = {.string = "textInput"};
    ArkUI_NumberValue maxLengthValue1[] = {{.i32 = 5}};
    ArkUI_AttributeItem maxLengthItem1 = {maxLengthValue1, 1};

    auto options = OH_ArkUI_ShowCounterConfig_Create();
    ASSERT_EQ(options == nullptr, false);
    OH_ArkUI_ShowCounterConfig_SetCounterTextColor(options, 0xFF0000FF);
    OH_ArkUI_ShowCounterConfig_SetCounterTextOverflowColor(options, 0xFFFFFF00);
    ArkUI_AttributeItem LABEL_Item1 = {.value = showCounterArray, .size = 3, .object =options};
    nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_SHOW_COUNTER, &LABEL_Item1);
    nodeAPI->setAttribute(TextArea, NODE_ID, &buttonItem);
    nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_MAX_LENGTH, &maxLengthItem);
    nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_SHOW_COUNTER, &LABEL_Item1);
    nodeAPI->setAttribute(TextInput, NODE_ID, &buttonItem1);
    nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_MAX_LENGTH, &maxLengthItem1);
    nodeAPI->addChild(Column, TextArea);
    nodeAPI->addChild(Column, TextInput);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        static ArkUI_ShowCounterConfig *options = OH_ArkUI_ShowCounterConfig_Create();
        switch (eventType) {
            case NODE_ON_TOUCH_INTERCEPT: {
                auto ret1 = OH_ArkUI_ShowCounterConfig_GetCounterTextColor(options);
                auto ret2 = OH_ArkUI_ShowCounterConfig_GetCounterTextOverflowColor(options);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                    "aaa 当前color为 %{public}u 当前overFlowColor为 %{public}u", ret1, ret2);
                break;
            }
            default: {
                break;
            }
        }
    });
    OH_ArkUI_ShowCounterConfig_Dispose(options);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        Column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ShowCounterTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
    }
