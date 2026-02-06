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
#include "AnimateOptionFinishCallbackTest.h"
#include "component/Component.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_animate.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <string>

namespace AnimateOptionFinishCallbackTest {

void OnContextCallback(void* userData)
{
    ArkUI_NodeHandle nodeHandle = static_cast<ArkUI_NodeHandle>(userData);
    if (nodeHandle) {
        auto node = std::make_shared<ArkUICapiTest::Component>(nodeHandle);
        node->SetWidth(SIZE_150);
        node->SetHeight(SIZE_150);
    }
}

void OnCompleteCallback(void* userData)
{
    ArkUI_NodeHandle nodeHandle = static_cast<ArkUI_NodeHandle>(userData);
    if (nodeHandle) {
        auto node = std::make_shared<ArkUICapiTest::Component>(nodeHandle);
        node->SetBackgroundColor(COLOR_GREEN);
    }
}

void SetAnimateTo(ArkUI_NodeHandle column)
{
    auto animateOption = OH_ArkUI_AnimateOption_Create();
    OH_ArkUI_AnimateOption_SetDuration(animateOption, PARAM_800);
    OH_ArkUI_AnimateOption_SetCurve(animateOption, ARKUI_CURVE_EASE_OUT);
    auto context = OH_ArkUI_GetContextByNode(column);
    auto contextCallback = ArkUI_ContextCallback{column, OnContextCallback};
    auto completeCallback = ArkUI_AnimateCompleteCallback{ARKUI_FINISH_CALLBACK_REMOVED, OnCompleteCallback, column};
    ArkUI_NativeAnimateAPI_1 *animateAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_ANIMATE, ArkUI_NativeAnimateAPI_1, animateAPI);
    animateAPI->animateTo(context, animateOption, &contextCallback, &completeCallback);
}

napi_value TestAnimateOption(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);

    auto column = new ArkUICapiTest::Component(ARKUI_NODE_COLUMN);
    auto button = std::make_shared<ArkUICapiTest::Component>(ARKUI_NODE_BUTTON);
    button->SetWidth(PARAM_50);
    button->SetHeight(PARAM_50);
    button->SetMargin(PARAM_10);
    button->SetId("Button1");
    column->AddChild(button);
    auto column1 = std::make_shared<ArkUICapiTest::Component>(ARKUI_NODE_COLUMN);
    column1->SetWidth(PARAM_50);
    column1->SetHeight(PARAM_50);
    column1->SetBorderWidth(PARAM_1);
    column1->SetId("Animation1");
    column->AddChild(column1);
    button->RegisterOnClick([column1]() { SetAnimateTo(column1->GetComponent()); });
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column->GetComponent());
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
};