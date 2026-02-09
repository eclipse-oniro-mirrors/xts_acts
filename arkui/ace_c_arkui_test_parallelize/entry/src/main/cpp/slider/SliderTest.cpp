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

#include "SliderTest.h"
#include <arkui/native_interface.h>
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>

#define TEST_SLIDER_COMPONENT_NUMBER 5  //MD01

namespace ArkUICapiTest {
napi_value SliderTest::sliderTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SliderTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderTest",
            "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue columnPercentWith[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentWithItem = { columnPercentWith,
        sizeof(columnPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &columnPercentWithItem);
    ArkUI_NumberValue columnPercentHeight[] = { { .f32 = 1 } };
    ArkUI_AttributeItem columnPercentHeightItem = { columnPercentHeight,
        sizeof(columnPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &columnPercentHeightItem);

    auto slider1 = nodeAPI->createNode(ARKUI_NODE_SLIDER);
    ArkUI_AttributeItem textId1 = {.string = "slider001"};
    nodeAPI->setAttribute(slider1, NODE_ID, &textId1);

    // Slider组件属性--blockColor （设置滑块的颜色）
    ArkUI_NumberValue blockColor_value[] = { { .u32 = 0xFF1122FF } };
    ArkUI_AttributeItem blockColor_item = { blockColor_value, sizeof(blockColor_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_BLOCK_COLOR, &blockColor_item);

    // Slider组件属性--trackColor （设置滑轨的背景颜色）
    ArkUI_NumberValue trackColor_value[] = { { .u32 = 0xFF1122FF } };
    ArkUI_AttributeItem trackColor_item = { trackColor_value, sizeof(trackColor_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_TRACK_COLOR, &trackColor_item);

    // Slider组件属性--selectedColor （设置滑轨的已滑动部分颜色）
    ArkUI_NumberValue selectedColor_value[] = { { .u32 = 0xFF1122FF } };
    ArkUI_AttributeItem selectedColor_item = { selectedColor_value,
                                               sizeof(selectedColor_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_SELECTED_COLOR, &selectedColor_item);

    // Slider组件属性--showSteps （设置当前是否显示步长刻度值）
    ArkUI_NumberValue showSteps_value[] = { { .i32 = 1 } };
    ArkUI_AttributeItem showSteps_item = { showSteps_value, sizeof(showSteps_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_SHOW_STEPS, &showSteps_item);

    // Slider组件属性--blockStyle （设置滑块形状参数）
    ArkUI_NumberValue blockStyle_value[] = { { .i32 = ARKUI_SLIDER_BLOCK_STYLE_DEFAULT } };
    ArkUI_AttributeItem blockStyle_item = { blockStyle_value, sizeof(blockStyle_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_BLOCK_STYLE, &blockStyle_item);

    // Slider组件属性--value （设置当前是否显示步长刻度值）
    ArkUI_NumberValue show_value[] = { { .f32 = 10 } };
    ArkUI_AttributeItem show_item = { show_value, sizeof(show_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_VALUE, &show_item);

    // Slider组件属性--MinValue
    ArkUI_NumberValue min_value[] = { { .f32 = 1 } };
    ArkUI_AttributeItem min_item = { min_value, sizeof(min_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_MIN_VALUE, &min_item);

    // Slider组件属性--MaxValue
    ArkUI_NumberValue max_value[] = { { .f32 = 100 } };
    ArkUI_AttributeItem max_item = { max_value, sizeof(max_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_MAX_VALUE, &max_item);

    // Slider组件属性--step
    ArkUI_NumberValue step_value[] = { { .f32 = 1 } };
    ArkUI_AttributeItem step_item = { step_value, sizeof(step_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_STEP, &step_item);

    // Slider组件属性--Direction
    ArkUI_NumberValue dir_value[] = { { .i32 = ARKUI_SLIDER_DIRECTION_HORIZONTAL } };
    ArkUI_AttributeItem dir_item = { dir_value, sizeof(dir_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_DIRECTION, &dir_item);

    // Slider组件属性--reverse
    ArkUI_NumberValue reverse_value[] = { { .i32 = 0 } };
    ArkUI_AttributeItem reverse_item = { reverse_value, sizeof(reverse_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_REVERSE, &reverse_item);

    // Slider组件属性--style
    ArkUI_NumberValue style_value[] = { { .i32 = ARKUI_SLIDER_STYLE_NONE } };
    ArkUI_AttributeItem style_item = { style_value, sizeof(style_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_STYLE, &style_item);

    // Slider组件属性--TrackThickness
    ArkUI_NumberValue thick_value[] = { { .i32 = 1 } };
    ArkUI_AttributeItem thick_item = { thick_value, sizeof(thick_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(slider1, NODE_SLIDER_TRACK_THICKNESS, &thick_item);

    const int SLIDER_TARGET_ID = 27123;
    nodeAPI->registerNodeEvent(slider1, NODE_SLIDER_EVENT_ON_CHANGE, NODE_SLIDER_EVENT_ON_CHANGE, nullptr);
    nodeAPI->addNodeEventReceiver(slider1, [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == SLIDER_TARGET_ID) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "Node_Event: onSliderChange");
        }
    });

    nodeAPI->addChild(column, slider1);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
}  // namespace ArkUICapiTest