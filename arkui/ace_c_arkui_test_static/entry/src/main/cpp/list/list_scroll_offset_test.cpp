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

#include "list_scroll_offset_test.h"
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <cstdint>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#include "common/common.h"
#include "list/list_event_test.h"

namespace ArkUIAniTest {
#define PARAM_NEGATIVE_20 (-20)
#define PARAM_NEGATIVE_1000 (-1000)
#define SIZE_1000 1000
#define SIZE_2000 2000
#define SIZE_100000 100000
using ScrollOffsetCallBack = std::function<void(std::shared_ptr<ListComponent>)>;

struct ScrollOffset {
    float horizontal;
    float vertical;
    int32_t duration;
    int32_t curve;
    int32_t spring;
    int32_t cross;
};

std::vector<double> ListScrollOffsetTest::listHorizontalData = {};
std::vector<double> ListScrollOffsetTest::listVerticalData = {};
std::vector<int32_t> ListScrollOffsetTest::setRetData = {};

static ani_object SetArrayAniData(const std::vector<double>&values, ani_env* env)
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
    ani_class doubleCls {};
    ani_method doubleCtor {};
    if (ANI_OK != env->FindClass("std.core.Double", &doubleCls)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find std.core.Double error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(doubleCls, "<ctor>", "d:", &doubleCtor)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Find double Ctor error");
        return nullptr;
    }
    for (ani_size i = 0; i < size; ++i) {
        ani_object doubleObj {};
        if (ANI_OK != env->Object_New(doubleCls, doubleCtor, &doubleObj, values[i])) {
            OH_LOG_INFO(LOG_APP, "[ANI] Object_New error");
            return nullptr;
        }
        if (ANI_OK != env->Array_Set(aniArray, i, doubleObj)) {
            OH_LOG_INFO(LOG_APP, "[ANI] Array_Set double error");
            return nullptr;
        }
    }
    return aniArray;
};

static ani_object SetArrayAniData(const std::vector<int32_t>&values, ani_env* env)
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
        OH_LOG_INFO(LOG_APP, "[ANI] Find int Ctor error");
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

static void PushBackIntData(std::vector<int32_t>& data, int32_t value)
{
    if (data.empty()) {
        data.push_back(value);
        return;
    }
    if (data.back() != value) {
        data.push_back(value);
    }
}

static auto SetScrollOffset(ArkUI_NodeHandle list, ScrollOffset& scrollOffset, int32_t flag)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    switch (flag) {
        case PARAM_0: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        case PARAM_1: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical },
                { .i32 = scrollOffset.duration }, { .i32 = scrollOffset.curve } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        case PARAM_2: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical },
                { .i32 = scrollOffset.duration }, { .i32 = scrollOffset.curve }, { .i32 = scrollOffset.spring } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        case PARAM_3: {
            ArkUI_NumberValue value[] = { { .f32 = scrollOffset.horizontal }, { .f32 = scrollOffset.vertical },
                { .i32 = scrollOffset.duration }, { .i32 = scrollOffset.curve }, { .i32 = scrollOffset.spring },
                { .i32 = scrollOffset.cross } };
            ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
            auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_OFFSET, &item);
            return ret;
        }
        default:
            break;
    }
    return PARAM_NEGATIVE_1;
}

static auto CreateListScrollOffset(ScrollOffset scrollOffset, int32_t flag)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto listPtr = ListScrollOffsetTest::CreateList();
    auto list = listPtr->GetComponent();
    auto ret = SetScrollOffset(list, scrollOffset, flag);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateListScrollOffset",
        "ret = %{public}d, horizontal = %{public}f, vertical = %{public}f, ", ret, scrollOffset.horizontal,
        scrollOffset.vertical);
    PushBackIntData(ListScrollOffsetTest::setRetData, ret);
    auto btn = new ButtonComponent();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");

    nodeAPI->addChild(column, list);
    nodeAPI->addChild(column, btn->GetComponent());
    btn->RegisterOnClick([list, nodeAPI]() {
        auto horizon = nodeAPI->getAttribute(list, NODE_SCROLL_OFFSET)->value[PARAM_0].f32;
        auto vert = nodeAPI->getAttribute(list, NODE_SCROLL_OFFSET)->value[PARAM_1].f32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateListScrollOffset",
            "horizon = %{public}f, vertical = %{public}f, ", horizon, vert);
        ListScrollOffsetTest::listHorizontalData.push_back(horizon);
        ListScrollOffsetTest::listVerticalData.push_back(vert);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateListScrollOffset",
            "listHorizontalData = %{public}f, listVerticalData = %{public}f, ",
            ListScrollOffsetTest::listHorizontalData[PARAM_0], ListScrollOffsetTest::listVerticalData[PARAM_0]);
    });
    return column;
}

ani_object ListScrollOffsetTest::GetScrollOffsetData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollOffsetTest", "GetScrollOffsetData");
    ani_object String_array1 = SetArrayAniData(ListScrollOffsetTest::setRetData, env);
    ani_object String_array2 = SetArrayAniData(ListScrollOffsetTest::listHorizontalData, env);
    ani_object String_array3 = SetArrayAniData(ListScrollOffsetTest::listVerticalData, env);
    ListScrollOffsetTest::setRetData.clear();
    ListScrollOffsetTest::listHorizontalData.clear();
    ListScrollOffsetTest::listVerticalData.clear();
    
    ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = 3;
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
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array1)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New1 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_0, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set1 array error");
        return nullptr;
    }
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array2)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New2 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_1, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set2 array error");
        return nullptr;
    }
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array3)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New3 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_2, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set3 array error");
        return nullptr;
    }
    return aniArray;
}

void ListScrollOffsetTest::TestListScrollOffset001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_NEGATIVE_20;
    scrollOffset.vertical = PARAM_NEGATIVE_20;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_0;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_100;
    scrollOffset.vertical = PARAM_100;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = SIZE_100000;
    scrollOffset.vertical = SIZE_100000;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset005(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = PARAM_NEGATIVE_1000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset006(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset007(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset008(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset009(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE_OUT;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset010(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EASE_IN_OUT;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset011(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_FAST_OUT_SLOW_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset012(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR_OUT_SLOW_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset013(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_FAST_OUT_LINEAR_IN;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset014(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_EXTREME_DECELERATION;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset015(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_SHARP;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset016(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_RHYTHM;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset017(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_SMOOTH;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset018(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_FRICTION;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset019(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = PARAM_NEGATIVE_1;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset020(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = PARAM_13;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset021(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    scrollOffset.spring = PARAM_1;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListScrollOffsetTest::TestListScrollOffset022(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    
    ScrollOffset scrollOffset;
    scrollOffset.horizontal = PARAM_0;
    scrollOffset.vertical = PARAM_200;
    scrollOffset.duration = SIZE_2000;
    scrollOffset.curve = ArkUI_AnimationCurve::ARKUI_CURVE_LINEAR;
    scrollOffset.spring = PARAM_1;
    scrollOffset.cross = PARAM_1;
    auto column = CreateListScrollOffset(scrollOffset, PARAM_0);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest