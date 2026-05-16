/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "EnableClickSoundEffectTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isID)
{
    std::string idValue = isID;
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
}


static void OnEventReceive(ArkUI_NodeEvent* event)
{
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
}

napi_value EnableClickSoundEffectTest::CreateNativeNode(napi_env env, napi_callback_info info)
 {
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info( env , info , &argc , args , nullptr , nullptr );
    size_t length = 64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8( env , args[PARAM_0] , xComponentID , length , &strLength );

    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto ColumnParent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row3 = nodeAPI->createNode(ARKUI_NODE_ROW);

    //创建button组件，NODE_ENABLE_CLICK_SOUND_EFFECT设置为1
    auto button10 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    IDTest(button10, "buttonEnableClickSoundEffect1");
    std::string labelStr = "Click Event 1";
    ArkUI_AttributeItem LABEL_Item = {.string = labelStr.c_str()};
    nodeAPI->setAttribute(button10, NODE_BUTTON_LABEL, &LABEL_Item);
    nodeAPI->registerNodeEvent(button10, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    ArkUI_NumberValue clickSound[] = {{.i32 = PARAM_1}};
    ArkUI_AttributeItem enableClickSound = {clickSound, PARAM_1};
    nodeAPI->setAttribute(button10, NODE_ENABLE_CLICK_SOUND_EFFECT, &enableClickSound);
    nodeAPI->addChild(row1, button10);
    
    //创建button组件，NODE_ENABLE_CLICK_SOUND_EFFECT设置为0
    auto button20 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    IDTest(button20, "buttonEnableClickSoundEffect0");
    std::string labelStr20 = "Click Event 0";
    ArkUI_AttributeItem LABEL_Item20 = {.string = labelStr20.c_str()};
    nodeAPI->setAttribute(button20, NODE_BUTTON_LABEL, &LABEL_Item20);
    nodeAPI->registerNodeEvent(button20, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    ArkUI_NumberValue clickSound20[] = {{.i32 = PARAM_0}};
    ArkUI_AttributeItem enableClickSound20 = {clickSound20, PARAM_1};
    nodeAPI->setAttribute(button20, NODE_ENABLE_CLICK_SOUND_EFFECT, &enableClickSound20);
    nodeAPI->addChild(row2, button20);

    //创建button组件，NODE_ENABLE_CLICK_SOUND_EFFECT设置为异常值-1
    auto button30 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    IDTest(button30, "buttonEnableClickSoundEffect-1");
    std::string labelStr30 = "Click Event -1";
    ArkUI_AttributeItem LABEL_Item30 = {.string = labelStr30.c_str()};
    nodeAPI->setAttribute(button30, NODE_BUTTON_LABEL, &LABEL_Item30);
    nodeAPI->registerNodeEvent(button30, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    ArkUI_NumberValue clickSound30[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem enableClickSound30 = {clickSound30, PARAM_1};
    nodeAPI->setAttribute(button30, NODE_ENABLE_CLICK_SOUND_EFFECT, &enableClickSound30);
    nodeAPI->addChild(row3, button30);

    nodeAPI->addChild(ColumnParent, row1);
    nodeAPI->addChild(ColumnParent, row2);
    nodeAPI->addChild(ColumnParent, row3);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (eventType) {
            case NODE_ON_CLICK_EVENT: {
                switch (targetId) {
                    case PARAM_0: {
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gky", "CLICK");
                        } break;
                    case PARAM_1: {
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "gky", "BREAK");
                        } break;
                }
                } break;
                default:
                    break;
            }
        });

    std::string id(xComponentID);

    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), ColumnParent) ==
        INVALID_PARAM) {
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICApiDemo