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

#include "customcomponent_secondarylayout_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"


#define ON_CUSTOM_EVENT_1_ID 1011
#define MAX_WIDTH 120
#define MAX_HEIGHT 150
namespace ArkUIAniTest {

std::vector<int32_t> CustomComponentSecondaryLayoutTest::secondaryLayoutVector = {};
static ani_object SetArrayAniDataWithSecondaryLayoutNode(const std::vector<int32_t> &values, ani_env* env)
{
   ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = values.size();
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[ANI] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class intCls {};
    ani_method intCtor {};
    if (ANI_OK != env->FindClass("std.core.Int", &intCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Int error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(intCls, "<ctor>", "i:", &intCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find Int Ctor error");
        return nullptr;
    }
    for (ani_size i = 0; i < size; ++i) {
        ani_object intObj {};
        if (ANI_OK != env->Object_New(intCls, intCtor, &intObj, values[i])) {
            OH_LOG_INFO(LOG_APP, "[ANI] Object_New error");
            return nullptr;
        }
        if (ANI_OK != env->Array_Set(aniArray, i, intObj)) {
            OH_LOG_INFO(LOG_APP, "[ANI] Array_Set int error");
            return nullptr;
        }
    }
    return aniArray;
};

static void PushBackIntToData(std::vector<int32_t>& data, int32_t value)
{
    data.push_back(value);
}
static auto CreateCustomNode(ArkUI_NativeNodeAPI_1* nodeAPI, uint32_t color)
{
    auto customNode = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue customNodeColor[] = { { .u32 = color } };
    ArkUI_AttributeItem customNodeColorItem = { customNodeColor, sizeof(customNodeColor) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode, NODE_BACKGROUND_COLOR, &customNodeColorItem);
    return customNode;
}
static auto CreateRowNode(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NumberValue rowPercentWith[] = { { .f32 = 0.8 } };
    ArkUI_AttributeItem rowPercentWithItem = { rowPercentWith, sizeof(rowPercentWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_WIDTH_PERCENT, &rowPercentWithItem);
    ArkUI_NumberValue rowPercentHeight[] = { { .f32 = 0.5 } };
    ArkUI_AttributeItem rowPercentHeightItem = { rowPercentHeight,
        sizeof(rowPercentHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_HEIGHT_PERCENT, &rowPercentHeightItem);
    ArkUI_NumberValue rowColor[] = { { .u32 = COLOR_GREEN } };
    ArkUI_AttributeItem rowColorItem = { rowColor, sizeof(rowColor) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_BACKGROUND_COLOR, &rowColorItem);
    ArkUI_NumberValue rowMargin[] = { { .f32 = 10 } };
    ArkUI_AttributeItem rowMarginItem = { rowMargin, sizeof(rowMargin) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(row, NODE_MARGIN, &rowMarginItem);
    return row;
}

static void OnMeasureReceive(ArkUI_NodeCustomEvent* event)
{
    if (event == nullptr) {
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "JTA OnMeasureReceive eventId :%{public}d", eventId);
    if (eventId == ON_CUSTOM_EVENT_1_ID) {
        nodeAPI->setMeasuredSize(nodeHandler, MAX_WIDTH, MAX_HEIGHT);
        return;
    }
}
static void OnLayoutReceive(ArkUI_NodeCustomEvent* event)
{
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
            "JTA OnLayoutReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
        "JTA OnLayoutReceive eventId: %{public}d", eventId);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    if (eventId == ON_LAYOUT_EVENT_ID) {
        // 获取测算大小，将测算大小设置为布局大小
        auto size = nodeAPI->getMeasuredSize(nodeHandler);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentLayoutConstraintTest",
            "JTA OnLayoutReceive width: %{public}d height: %{public}d", size.width, size.height);
        ArkUI_NumberValue with[] = { { .f32 = (float)size.width } };
        ArkUI_AttributeItem withItem = { with, PARAM_1 };
        ArkUI_NumberValue height[] = { { .f32 = (float)size.height } };
        ArkUI_AttributeItem heightItem = { height, PARAM_1 };
        nodeAPI->setAttribute(nodeHandler, NODE_WIDTH, &withItem);
        nodeAPI->setAttribute(nodeHandler, NODE_HEIGHT, &heightItem);
        PushBackIntToData(CustomComponentSecondaryLayoutTest::secondaryLayoutVector, size.width);
        PushBackIntToData(CustomComponentSecondaryLayoutTest::secondaryLayoutVector, size.height);
        return;
    }
}
static auto addTestNodes(ArkUI_NativeNodeAPI_1* nodeAPI)
{
    // 创建1个Row组件
    auto row = CreateRowNode(nodeAPI);

    auto customNode1 = CreateCustomNode(nodeAPI, COLOR_RED);
    nodeAPI->addChild(row, customNode1);
    ArkUI_NumberValue customNodeWith[] = { { .f32 = SIZE_200 } };
    ArkUI_AttributeItem customNodeWithItem = { customNodeWith, sizeof(customNodeWith) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode1, NODE_WIDTH, &customNodeWithItem);
    ArkUI_NumberValue customNodeHeight[] = { { .f32 = SIZE_200 } };
    ArkUI_AttributeItem customNodeHeightItem = { customNodeHeight,
        sizeof(customNodeHeight) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(customNode1, NODE_HEIGHT, &customNodeHeightItem);

    nodeAPI->addNodeCustomEventReceiver(customNode1, &OnMeasureReceive);
    nodeAPI->registerNodeCustomEvent(customNode1, ARKUI_NODE_CUSTOM_EVENT_ON_MEASURE, ON_CUSTOM_EVENT_1_ID, nullptr);
    nodeAPI->addNodeCustomEventReceiver(customNode1, &OnLayoutReceive);
    nodeAPI->registerNodeCustomEvent(customNode1, ARKUI_NODE_CUSTOM_EVENT_ON_LAYOUT, ON_LAYOUT_EVENT_ID, nullptr);
    return row;
}
void CustomComponentSecondaryLayoutTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto row = addTestNodes(nodeAPI);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, row);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
ani_object CustomComponentSecondaryLayoutTest::GetSecondaryLayoutData(ani_env* env, ani_object info)
{
    ani_object String_array = SetArrayAniDataWithSecondaryLayoutNode(CustomComponentSecondaryLayoutTest::secondaryLayoutVector, env);
    CustomComponentSecondaryLayoutTest::secondaryLayoutVector.clear();

    ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = 1;
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[ANI] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class arrayCls {};
    ani_method arrayCtor {};
    if (ANI_OK != env->FindClass("std.core.Array", &arrayCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Array error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(arrayCls, "<ctor>", "C{std.core.Array}:", &arrayCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find Array Ctor error");
        return nullptr;
    }

    ani_object arrayObj {};
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New1 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_0, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set1 array error");
        return nullptr;
    }
    return aniArray;
}
} // namespace ArkUIAniTest
