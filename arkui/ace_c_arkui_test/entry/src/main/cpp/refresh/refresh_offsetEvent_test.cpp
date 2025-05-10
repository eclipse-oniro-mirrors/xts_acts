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
#include "../manager/plugin_manager.h"
#include "refresh_offsetEvent_test.h"
#define ON_REFRESHING_EVENT_ID 1315
#define SIZE_140 140
namespace ArkUICapiTest {
static ArkUI_NodeHandle refresh1;
static ArkUI_NodeHandle refresh3;
static ArkUI_NativeNodeAPI_1 *nodeAPI1;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    int32_t eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (eventId == ON_REFRESHING_EVENT_ID) {
        auto refresh = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_YELLOW } };
        ArkUI_AttributeItem background_color_item = { background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
        nodeAPI->setAttribute(refresh, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

static void BasicSet()
{
    refresh1 = nodeAPI1->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue offset_value[] = {{.f32 = SIZE_140}};
    ArkUI_NumberValue pull_value[] = {{.i32 = true}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem pull_item = {pull_value, sizeof(pull_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(refresh1, NODE_WIDTH, &width_item);
    nodeAPI1->setAttribute(refresh1, NODE_HEIGHT, &height_item);
    nodeAPI1->setAttribute(refresh1, NODE_REFRESH_OFFSET, &offset_item);
    nodeAPI1->setAttribute(refresh1, NODE_REFRESH_PULL_TO_REFRESH, &pull_item);
    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_BLUE } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI1->setAttribute(refresh1, NODE_BACKGROUND_COLOR, &background_color_item);
}
static void BasicSet3()
{
    refresh3 = nodeAPI1->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue offset_value[] = {{.f32 = SIZE_140}};
    ArkUI_NumberValue pull_value[] = {{.i32 = true}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem pull_item = {pull_value, sizeof(pull_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI1->setAttribute(refresh3, NODE_WIDTH, &width_item);
    nodeAPI1->setAttribute(refresh3, NODE_HEIGHT, &height_item);
    nodeAPI1->setAttribute(refresh3, NODE_REFRESH_OFFSET, &offset_item);
    nodeAPI1->setAttribute(refresh3, NODE_REFRESH_PULL_TO_REFRESH, &pull_item);

    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_BLUE } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI1->setAttribute(refresh3, NODE_BACKGROUND_COLOR, &background_color_item);
}
napi_value RefreshOffsetTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI1);

    BasicSet();

    ArkUI_AttributeItem idItem;
    idItem.string = "RefreshOffsetChangeBigThanOffset";
    nodeAPI1->setAttribute(refresh1, NODE_ID, &idItem);

    nodeAPI1->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI1->registerNodeEvent(refresh1, NODE_REFRESH_ON_REFRESH, ON_REFRESHING_EVENT_ID, nullptr);

    std::string idRefresh(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(idRefresh), refresh1);

    napi_value exports;
    napi_create_object(env, &exports);

    return exports;
}
napi_value RefreshOffsetTest::CreateNativeNodeLessThanOffset(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI1);

    BasicSet3();

    ArkUI_AttributeItem idItem;
    idItem.string = "RefreshOffsetChangeLessThanOffset";
    nodeAPI1->setAttribute(refresh3, NODE_ID, &idItem);

    nodeAPI1->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI1->registerNodeEvent(refresh3, NODE_REFRESH_ON_REFRESH, ON_REFRESHING_EVENT_ID, nullptr);

    std::string idRefresh(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(idRefresh), refresh3);

    napi_value exports;
    napi_create_object(env, &exports);

    return exports;
}
} // namespace ArkUICapiTest