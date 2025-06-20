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
#include "ExpectedFrameRateRange_callback_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>

#include <arkui/native_animate.h>
#include <arkui/native_type.h>
#include <bits/alltypes.h>
#include <cstdint>

#define INT_00 00
#define INT_295 295

ArkUI_NativeNodeAPI_1 *nodeAPI_ec = nullptr;

namespace ArkUICapiTest {

napi_value ExpectedFrameRateRangeCallbackTest::testExpectedFrameRateRangeCallback001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testAddCustomProperty001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
            "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI_ec);

    ArkUI_NodeHandle column = nodeAPI_ec->createNode(ARKUI_NODE_COLUMN);
    auto button001 = nodeAPI_ec->createNode(ARKUI_NODE_BUTTON);
    auto text001 = nodeAPI_ec->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem NODE_TEXT_DECORATION_Item01 = {.string = "测试值"};
    nodeAPI_ec->setAttribute(text001, NODE_TEXT_CONTENT, &NODE_TEXT_DECORATION_Item01);
    ArkUI_AttributeItem text_id = {.string = "text_id"};
    nodeAPI_ec->setAttribute(text001, NODE_ID, &text_id);

    ArkUI_AttributeItem NODE_BUTTON_LABEL_Item00 = {.string = "max:120,expected:90,min:60"};
    nodeAPI_ec->setAttribute(button001, NODE_BUTTON_LABEL, &NODE_BUTTON_LABEL_Item00);
    nodeAPI_ec->registerNodeEvent(button001, NODE_ON_CLICK, INT_00, nullptr);
    ArkUI_AttributeItem textId1 = {.string = "onClick1"};
    nodeAPI_ec->setAttribute(button001, NODE_ID, &textId1);

    auto button002 = nodeAPI_ec->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem NODE_BUTTON_LABEL_Item095 = {.string = "max:120,expected:60,min:90"};
    nodeAPI_ec->setAttribute(button002, NODE_BUTTON_LABEL, &NODE_BUTTON_LABEL_Item095);
    nodeAPI_ec->registerNodeEvent(button002, NODE_ON_CLICK, INT_295, nullptr);
    ArkUI_AttributeItem textId2 = {.string = "onClick2"};
    nodeAPI_ec->setAttribute(button002, NODE_ID, &textId2);

    static ArkUI_NativeNodeAPI_1 *nodeAPISelf = nodeAPI_ec;
    auto button = nodeAPI_ec->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue scalevalue[] = {{.f32 = 1}, {.f32 = 1}};
    ArkUI_AttributeItem scaleItem1 = {scalevalue, 1};
    nodeAPI_ec->setAttribute(button, NODE_SCALE, &scaleItem1);
    ArkUI_NumberValue widthValue0[] = {100};
    ArkUI_AttributeItem widthItem0 = {widthValue0, 1};
    ArkUI_NumberValue heightValue0[] = {100};
    ArkUI_AttributeItem heightItem0 = {heightValue0, 1};
    nodeAPI_ec->setAttribute(button, NODE_WIDTH, &widthItem0);
    nodeAPI_ec->setAttribute(button, NODE_HEIGHT, &heightItem0);

    nodeAPI_ec->registerNodeEvent(button, NODE_ON_CLICK, 1, nullptr);
    ArkUI_AttributeItem textId3 = {.string = "onClick3"};
    nodeAPI_ec->setAttribute(button, NODE_ID, &textId3);


    nodeAPI_ec->addChild(column, text001);
    nodeAPI_ec->addChild(column, button001);
    nodeAPI_ec->addChild(column, button002);
    nodeAPI_ec->addChild(column, button);

    static ArkUI_NodeHandle buttonSelf = button;
    static ArkUI_NodeHandle textSelf = text001;

    static bool isback = true;
    static float max = 120;
    static float expected = 120;
    static float min = 120;

    auto ontouch = [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == 1) {
            ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(buttonSelf);
            auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
            ArkUI_NativeAnimateAPI_1 *animateApi = nullptr;
            OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateApi);
            static ArkUI_KeyframeAnimateOption *option =  OH_ArkUI_KeyframeAnimateOption_Create(2);
            OH_ArkUI_KeyframeAnimateOption_SetDuration(option, 1000, 0);
            OH_ArkUI_KeyframeAnimateOption_SetDuration(option, 2000, 1);
            OH_ArkUI_KeyframeAnimateOption_SetIterations(option, 5);
            OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(option, nullptr, [](void *user) {
                ArkUI_NumberValue widthValue0[] = {150};
                ArkUI_AttributeItem widthItem0 = {widthValue0, 1};
                ArkUI_NumberValue heightValue0[] = {150};
                ArkUI_AttributeItem heightItem0 = {heightValue0, 1};
                nodeAPISelf->setAttribute(buttonSelf, NODE_WIDTH, &widthItem0);
                nodeAPISelf->setAttribute(buttonSelf, NODE_HEIGHT, &heightItem0);
            }, 0);
            OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(option, nullptr, [](void *user) {
                ArkUI_NumberValue widthValue0[] = {80};
                ArkUI_AttributeItem widthItem0 = {widthValue0, 1};
                ArkUI_NumberValue heightValue0[] = {80};
                ArkUI_AttributeItem heightItem0 = {heightValue0, 1};
                nodeAPISelf->setAttribute(buttonSelf, NODE_WIDTH, &widthItem0);
                nodeAPISelf->setAttribute(buttonSelf, NODE_HEIGHT, &heightItem0);
            }, 1);
            OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback(option, nullptr, [](void *user) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "custom animate done");
            });
            ArkUI_ExpectedFrameRateRange *range = new ArkUI_ExpectedFrameRateRange;
            range->max = max;
            range->expected = expected;
            range->min = min;

            
            auto ret = OH_ArkUI_KeyframeAnimateOption_SetExpectedFrameRate(option, range);

            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "ret is ret = %{public}d",
                ret);

            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                "CXX CAPI CreateNativeNode  option GetExpectedFrameRateRange min = %{public}d,max = %{public}d,expected = %{public}d",
                OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->min,
                OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->max,
                OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->expected);

            animateApi->keyframeAnimateTo(context, option);
            
            if (expected == 90 && OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->min == 60
                && OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->max == 120
                && OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->expected == 90) {
                ArkUI_AttributeItem NODE_TEXT_NORMAL = {.string = "正常值"};      
                nodeAPI_ec->setAttribute(textSelf, NODE_TEXT_CONTENT, &NODE_TEXT_NORMAL);
            } else if (expected == 60 && OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->min == 90
                && OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->max == 120
                && OH_ArkUI_KeyframeAnimateOption_GetExpectedFrameRate(option)->expected == 60) {
                ArkUI_AttributeItem NODE_TEXT_NORMAL2 = {.string = "异常值"};      
                nodeAPI_ec->setAttribute(textSelf, NODE_TEXT_CONTENT, &NODE_TEXT_NORMAL2);
            }
            isback = !isback;
        } else if (OH_ArkUI_NodeEvent_GetTargetId(event) == INT_00) {
            max = 120;
            expected = 90;
            min = 60;
        } else if (OH_ArkUI_NodeEvent_GetTargetId(event) == INT_295) {
            max = 120;
            expected = 60;
            min = 90;
        }
    };

    nodeAPI_ec->registerNodeEventReceiver(ontouch);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
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
