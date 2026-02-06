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
#include "ScrollBarTest.h"

static ArkUI_NodeHandle TextArea = nullptr;
static ArkUI_NodeHandle TextInput = nullptr;

static ArkUI_NumberValue showCounterArray[] = {{.i32 = true},
                                               {.f32 = 50.0f},
                                               {.i32 = true}};
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
namespace ArkUICapiTest {
napi_value ScrollBarTest::CreateNativeNode(
    napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "aaa", "CreateNativeNode   ");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "scrollbarTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollbarTest",
            "GetContext env or info is null");
        return nullptr;
        }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    TextArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem LABEL_Item = {.string = "Hello World "
                                                        "TextArea/"
                                                        "n#############################################################"
                                                        "#################################################"};
    ArkUI_NumberValue textAreaWidthValue[] = {200};
    ArkUI_AttributeItem textAreaWidthItem = {textAreaWidthValue, 1};
    ArkUI_AttributeItem textAreaId = {.string = "textArea"};
    nodeAPI->setAttribute(TextArea, NODE_ID, &textAreaId);
    ArkUI_NumberValue fontSizeValue[] = {16};
    ArkUI_AttributeItem fontSizeItem = {fontSizeValue, 1};
    nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_PLACEHOLDER, &LABEL_Item);
    nodeAPI->setAttribute(TextArea, NODE_WIDTH, &textAreaWidthItem);
    nodeAPI->setAttribute(TextArea, NODE_FONT_SIZE, &fontSizeItem);
    ArkUI_NumberValue scrollColorItem = {.u32 = 0XFFFFFF00};
    ArkUI_AttributeItem LABEL_Item2 = {&scrollColorItem, 1};
    nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_SCROLL_BAR_COLOR, &LABEL_Item2);
    nodeAPI->addChild(Column, TextArea);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        ArkUI_NumberValue scrollColorItem = {.u32 = 0XFFFFFF00};
        ArkUI_AttributeItem LABEL_Item2 = {&scrollColorItem, 1};
        switch (eventType) {
            case NODE_ON_TOUCH_INTERCEPT: {
                nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_SCROLL_BAR_COLOR, &LABEL_Item2);
                auto ret = nodeAPI->getAttribute(TextArea, NODE_TEXT_AREA_SCROLL_BAR_COLOR);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "scrolBarColor",
                    "aaa scrolBarColor %{public}u", ret->value->u32);
                break;
        }
            default: {
                break;
        }
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        Column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "scrollbarTest",
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