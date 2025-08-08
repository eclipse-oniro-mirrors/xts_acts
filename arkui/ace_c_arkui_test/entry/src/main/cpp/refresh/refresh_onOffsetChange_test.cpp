/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "../manager/plugin_manager.h"
#include "refresh_onOffsetChange_test.h"
#define ON_REFRESH_EVENT_ID 1314

namespace ArkUICapiTest {

static ArkUI_NodeHandle refresh2;
static ArkUI_NodeHandle column2;
static ArkUI_NativeNodeAPI_1 *nodeAPI2;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    int32_t eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (ON_REFRESH_EVENT_ID == eventId && eventType == NODE_REFRESH_ON_OFFSET_CHANGE) {
        auto refresh = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        float offset = result->data[0].f32;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "refreshTest", "offset=%{public}f", offset);
        if (offset > PARAM_100) {
            ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_YELLOW } };
            ArkUI_AttributeItem background_color_item = { background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
            nodeAPI->setAttribute(refresh, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static void BasicSet()
{
    refresh2 = nodeAPI2->createNode(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_300}};
    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI2->setAttribute(refresh2, NODE_WIDTH, &width_item);
    nodeAPI2->setAttribute(refresh2, NODE_HEIGHT, &height_item);
    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_BLUE } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI2->setAttribute(refresh2, NODE_BACKGROUND_COLOR, &background_color_item);
}

napi_value RefreshOnOffsetChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI2);

    BasicSet();

    ArkUI_AttributeItem idItem;
    idItem.string = "RefreshOnOffsetChange";
    nodeAPI2->setAttribute(refresh2, NODE_ID, &idItem);

    nodeAPI2->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI2->registerNodeEvent(refresh2, NODE_REFRESH_ON_OFFSET_CHANGE, ON_REFRESH_EVENT_ID, nullptr);

    std::string idRefresh(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(idRefresh), refresh2);

    napi_value exports;
    napi_create_object(env, &exports);

    return exports;
}
} // namespace ArkUICapiTest
