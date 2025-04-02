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
#include "progress_linear_style_test.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>

namespace ArkUICapiTest {

ArkUI_NativeNodeAPI_1 *nodeAPI1 = nullptr;
static ArkUI_Node *rootNodeProgress;
static int NUMBER_6 = 6;
auto linearStyleOption = OH_ArkUI_ProgressLinearStyleOption_Create();
ArkUI_AttributeItem linearStyleItem = {.size = 0, .object = linearStyleOption};

ProgressLinearStyleTest::~ProgressLinearStyleTest()
{
    OH_ArkUI_ProgressLinearStyleOption_Destroy(linearStyleOption);
    linearStyleOption = nullptr;
}

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI1)
{
    ArkUI_NodeHandle column = nodeAPI1->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value1[] = {480.0f};
    ArkUI_AttributeItem item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(column, NODE_WIDTH, &item1);
    value1->f32 = 720.0f;
    nodeAPI1->setAttribute(column, NODE_HEIGHT, &item1);
    ArkUI_NumberValue borderValue[] = {1};
    ArkUI_AttributeItem borderItem = {borderValue, 1};
    nodeAPI1->setAttribute(column, NODE_BORDER_WIDTH, &borderItem);

    auto rootNodeProgress = nodeAPI1->createNode(ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value2[] = {300.0f};
    ArkUI_AttributeItem item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(rootNodeProgress, NODE_WIDTH, &item2);
    value2[0].f32 = 100.0f;
    nodeAPI1->setAttribute(rootNodeProgress, NODE_HEIGHT, &item2);
    ArkUI_NumberValue value3[] = {{.f32 = 30.0f}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3) / sizeof(ArkUI_NumberValue), nullptr, nullptr};
    nodeAPI1->setAttribute(rootNodeProgress, NODE_PROGRESS_VALUE, &item3);
    nodeAPI1->addChild(column, rootNodeProgress);
    OH_ArkUI_ProgressLinearStyleOption_SetScanEffectEnabled(linearStyleOption, true);
    OH_ArkUI_ProgressLinearStyleOption_SetSmoothEffectEnabled(linearStyleOption, false);
    OH_ArkUI_ProgressLinearStyleOption_SetStrokeWidth(linearStyleOption, 50.0f);
    OH_ArkUI_ProgressLinearStyleOption_SetStrokeRadius(linearStyleOption, 20.0f);
    nodeAPI1->setAttribute(rootNodeProgress, NODE_PROGRESS_LINEAR_STYLE, &linearStyleItem);
    ArkUI_AttributeItem progress = {.string = "progress"};
    nodeAPI1->setAttribute(rootNodeProgress, NODE_ID, &progress);
    nodeAPI1->registerNodeEvent(rootNodeProgress, NODE_ON_CLICK, NUMBER_6, nullptr);

    auto rootNodeProgress1 = nodeAPI1->createNode(ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value4[] = {300.0f};
    ArkUI_AttributeItem item4 = {value4, sizeof(value4) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(rootNodeProgress1, NODE_WIDTH, &item4);
    value4[0].f32 = 100.0f;
    nodeAPI1->setAttribute(rootNodeProgress1, NODE_HEIGHT, &item4);
    ArkUI_NumberValue value5[] = {{.f32 = 80.0f}};
    ArkUI_AttributeItem item5 = {value5, sizeof(value5) / sizeof(ArkUI_NumberValue), nullptr, nullptr};
    nodeAPI1->setAttribute(rootNodeProgress1, NODE_PROGRESS_VALUE, &item5);
    nodeAPI1->addChild(column, rootNodeProgress1);
    OH_ArkUI_ProgressLinearStyleOption_SetStrokeWidth(linearStyleOption, -1.0f);
    OH_ArkUI_ProgressLinearStyleOption_SetStrokeRadius(linearStyleOption, -1.0f);
    nodeAPI1->setAttribute(rootNodeProgress1, NODE_PROGRESS_LINEAR_STYLE, &linearStyleItem);
    ArkUI_AttributeItem progress1 = {.string = "progress1"};
    nodeAPI1->setAttribute(rootNodeProgress1, NODE_ID, &progress1);

    auto rootNodeProgress2 = nodeAPI1->createNode(ARKUI_NODE_PROGRESS);
    ArkUI_NumberValue value6[] = {300.0f};
    ArkUI_AttributeItem item6 = {value6, sizeof(value6) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(rootNodeProgress2, NODE_WIDTH, &item6);
    value6[0].f32 = 100.0f;
    nodeAPI1->setAttribute(rootNodeProgress2, NODE_HEIGHT, &item6);
    ArkUI_NumberValue value7[] = {{.f32 = 50.0f}};
    ArkUI_AttributeItem item7 = {value7, sizeof(value7) / sizeof(ArkUI_NumberValue), nullptr, nullptr};
    nodeAPI1->setAttribute(rootNodeProgress2, NODE_PROGRESS_VALUE, &item7);
    nodeAPI1->addChild(column, rootNodeProgress2);
    bool boolSmoothEffectEnabled =
        OH_ArkUI_ProgressLinearStyleOption_GetSmoothEffectEnabled(linearStyleOption) ? false : true;
    bool boolScanEffectEnabled =
        OH_ArkUI_ProgressLinearStyleOption_GetScanEffectEnabled(linearStyleOption) ? false : true;
    float floatStrokeWidth = OH_ArkUI_ProgressLinearStyleOption_GetStrokeWidth(linearStyleOption) + 10.0f;
    float floatStrokeRadius = OH_ArkUI_ProgressLinearStyleOption_GetStrokeRadius(linearStyleOption) + 10.0f;
    OH_ArkUI_ProgressLinearStyleOption_SetScanEffectEnabled(linearStyleOption, boolScanEffectEnabled);
    OH_ArkUI_ProgressLinearStyleOption_SetSmoothEffectEnabled(linearStyleOption, boolSmoothEffectEnabled);
    OH_ArkUI_ProgressLinearStyleOption_SetStrokeWidth(linearStyleOption, floatStrokeWidth);
    OH_ArkUI_ProgressLinearStyleOption_SetStrokeRadius(linearStyleOption, floatStrokeRadius);
    nodeAPI1->setAttribute(rootNodeProgress2, NODE_PROGRESS_LINEAR_STYLE, &linearStyleItem);
    ArkUI_AttributeItem progress2 = {.string = "progress2"};
    nodeAPI1->setAttribute(rootNodeProgress2, NODE_ID, &progress2);
    return column;
}

napi_value ProgressLinearStyleTest::ProgressLinearStyleTest001(napi_env env, napi_callback_info info)
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

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI1);
    static ArkUI_NodeHandle startDrag = CreateChildNode(nodeAPI1);
    nodeAPI1->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_6) {
            nodeAPI1->resetAttribute(nodeHandler, NODE_PROGRESS_LINEAR_STYLE);
        }
    });
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), startDrag) ==
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