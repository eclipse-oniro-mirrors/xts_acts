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

#include "list_event_test.h"

#include <thread>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#include "../component/button_component.h"
#include "../component/row_component.h"

namespace ArkUIAniTest {
using OnScrollCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using OnScrollFrameBeginCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using OnScrollStartCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnScrollStopCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnWillDidScrollCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using OnReachStartCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnReachEndCallBack = std::function<void(std::shared_ptr<ListComponent>, bool)>;
using OnScrollIndexCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
using ScrollToIndexCallBack = std::function<void(std::shared_ptr<ListComponent>, int32_t, int32_t)>;

std::vector<double> ListEventTest::scrollHorizontalData = {};
std::vector<double> ListEventTest::scrollVerticalData = {};
std::vector<double> ListEventTest::willOffsetData = {};
std::vector<int32_t> ListEventTest::willStateData = {};
std::vector<int32_t> ListEventTest::willSourceData = {};
std::vector<double> ListEventTest::didOffsetData = {};
std::vector<int32_t> ListEventTest::didStateData = {};
std::vector<int32_t> ListEventTest::firstScrollIndexData = {};
std::vector<int32_t> ListEventTest::lastScrollIndexData = {};
std::vector<int32_t> ListEventTest::subcomponentScrollIndexData = {};

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

static void PushBackFloatData(std::vector<double>& data, double value)
{
    if (data.empty()) {
        if (value != PARAM_0) {
            data.push_back(value);
        }
        return;
    }
    if ((data.back() > PARAM_0 && value < PARAM_0) || (data.back() < PARAM_0 && value > PARAM_0)) {
        data.push_back(value);
    }
}

static OnScrollStartCallBack scrollStart = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetOnScrollStart([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnScrollStart");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnScrollStopCallBack scrollStop = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetOnScrollStop([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnScrollStop");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnReachStartCallBack reachStart = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetListScrollToIndex(PARAM_6, PARAM_0, PARAM_0);
    list->SetOnReachStart([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnReachStart");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnReachEndCallBack reachEnd = [](std::shared_ptr<ListComponent> list, bool isRow) {
    if (isRow) {
        list->SetListDirection(ArkUI_FlexDirection::ARKUI_FLEX_DIRECTION_ROW);
    }
    list->SetListScrollToIndex(PARAM_6, PARAM_0, PARAM_0);
    list->SetOnReachEnd([list]() {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest", "OnReachEnd");
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnScrollCallBack scroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_300);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_70);
    list->SetOnScroll([list](float horizontal, float vertical) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "SetOnScroll horizontal: %{public}f, vertical: %{public}f", horizontal, vertical);
        PushBackFloatData(ListEventTest::scrollHorizontalData, horizontal);
        PushBackFloatData(ListEventTest::scrollVerticalData, vertical);
        list->SetBackgroundColor(COLOR_RED);
    });
};

static OnWillDidScrollCallBack willDidScroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_300);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_70);
    list->SetOnWillScroll([list](float offset, int32_t state, int32_t source) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnWillScroll offset: %{public}f, state: %{public}d, source: %{public}d", offset, state, source);
        list->SetBackgroundColor(COLOR_GREEN);
        PushBackFloatData(ListEventTest::willOffsetData, offset);
        PushBackIntData(ListEventTest::willStateData, state);
        PushBackIntData(ListEventTest::willSourceData, source);
    });
    list->SetOnDidScroll([list](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnDidScroll offset: %{public}f, state: %{public}d", offset, state);
        list->SetBackgroundColor(COLOR_RED);
        PushBackFloatData(ListEventTest::didOffsetData, offset);
        PushBackIntData(ListEventTest::didStateData, state);
    });
};

static OnWillDidScrollCallBack willScroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_300);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_70);
    list->SetOnWillScroll([list](float offset, int32_t state, int32_t source) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnWillScroll offset: %{public}f, state: %{public}d, source: %{public}d", offset, state, source);
        list->SetBackgroundColor(COLOR_GREEN);
        PushBackFloatData(ListEventTest::willOffsetData, offset);
        PushBackIntData(ListEventTest::willStateData, state);
        PushBackIntData(ListEventTest::willSourceData, source);
    });
};

static OnWillDidScrollCallBack didScroll = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_300);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_70);
    list->SetOnDidScroll([list](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnDidScroll offset: %{public}f, state: %{public}d", offset, state);
        list->SetBackgroundColor(COLOR_RED);
        PushBackFloatData(ListEventTest::didOffsetData, offset);
        PushBackIntData(ListEventTest::didStateData, state);
    });
};

static OnScrollFrameBeginCallBack scrollFrameBegin = [](std::shared_ptr<ListComponent> list) {
    list->SetWidth(SIZE_300);
    list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetListScrollBarWidth(SIZE_70);
    list->SetOnScrollFrameBegin([list](float offset, int32_t state) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnScrollFrameBegin offset: %{public}f, state: %{public}d", offset, state);
        PushBackFloatData(ListEventTest::willOffsetData, offset);
        PushBackIntData(ListEventTest::willStateData, state);
        return SIZE_10;
    });
};

static ScrollToIndexCallBack changeParam = [](std::shared_ptr<ListComponent> list, int32_t index, int32_t alignment) {
    list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    list->SetOnScrollIndex([list](int32_t first, int32_t last, int32_t subcomponent) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
            "OnScrollIndex first: %{public}d, last: %{public}d, subcomponent: %{public}d", first, last, subcomponent);
        ListEventTest::firstScrollIndexData.push_back(first);
        ListEventTest::lastScrollIndexData.push_back(last);
        ListEventTest::subcomponentScrollIndexData.push_back(subcomponent);
    });
    std::thread th([list, index, alignment]() {
        std::this_thread::sleep_for(std::chrono::seconds(PARAM_1));
        list->SetListScrollToIndex(index, PARAM_1, alignment);
    });
    th.detach();
};

static std::shared_ptr<ColumnComponent> CreateListButton(std::shared_ptr<ColumnComponent> col)
{
    auto colBtn = std::make_shared<ColumnComponent>();
    auto btn1 = std::make_shared<ButtonComponent>();
    auto btn2 = std::make_shared<ButtonComponent>();
    btn1->SetWidth(SIZE_100);
    btn1->SetHeight(SIZE_50);
    btn1->SetId("btn1");
    btn2->SetWidth(SIZE_100);
    btn2->SetHeight(SIZE_50);
    btn2->SetId("btn2");
    colBtn->AddChild(btn1);
    colBtn->AddChild(btn2);
    btn1->RegisterOnClick([col]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        list->SetScrollTo(PARAM_0, PARAM_NEGATIVE_1000, {});
    });
    btn2->RegisterOnClick([col]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        list->SetScrollPage(false, false);
    });
    return colBtn;
}

// NODE_SCROLL_EVENT_ON_REACH_START
void ListEventTest::CreateNativeNodeOnReachStart(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList(reachStart, false);
    auto col2 = CreateList(reachStart, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(PARAM_NEGATIVE_100000, PARAM_NEGATIVE_100000, {});
        }
    });

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// NODE_SCROLL_EVENT_ON_REACH_END
void ListEventTest::CreateNativeNodeOnReachEnd(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList(reachEnd, false);
    auto col2 = CreateList(reachEnd, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(SIZE_100000, SIZE_100000, {});
        }
    });

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// NODE_SCROLL_EVENT_ON_SCROLL_START
void ListEventTest::CreateNativeNodeOnScrollStart(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList(scrollStart, false);
    auto col2 = CreateList(scrollStart, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(SIZE_100000, SIZE_100000, {});
        }
    });

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// NODE_SCROLL_EVENT_ON_SCROLL_STOP
void ListEventTest::CreateNativeNodeOnScrollStop(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList(scrollStop, false);
    auto col2 = CreateList(scrollStop, true);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    std::vector<std::shared_ptr<ColumnComponent>> columns1 = { col1, col2 };
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(col2);
    column->AddChild(row1);
    column->AddChild(btn);
    btn->RegisterOnClick([columns1]() {
        for (auto node : columns1) {
            auto list = dynamic_cast<ListComponent*>(node->GetChildren().front().get());
            list->SetScrollTo(SIZE_100000, SIZE_100000, {});
        }
    });

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// NODE_WATER_FLOW_ON_WILL_SCROLL
// NODE_WATER_FLOW_ON_DID_SCROLL
void ListEventTest::CreateNativeNodeOnWillDidScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(willDidScroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// NODE_WATER_FLOW_ON_WILL_SCROLL
void ListEventTest::CreateNativeNodeOnWillScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(willScroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// NODE_WATER_FLOW_ON_DID_SCROLL
void ListEventTest::CreateNativeNodeOnDidScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(didScroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ani_object ListEventTest::GetOnWillDidScrollData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnWillDidScrollData");
    
    ani_object String_array1 = SetArrayAniData(ListEventTest::willOffsetData, env);
    ani_object String_array2 = SetArrayAniData(ListEventTest::willStateData, env);
    ani_object String_array3 = SetArrayAniData(ListEventTest::willSourceData, env);
    ani_object String_array4 = SetArrayAniData(ListEventTest::didOffsetData, env);
    ani_object String_array5 = SetArrayAniData(ListEventTest::didStateData, env);
    ListEventTest::willOffsetData.clear();
    ListEventTest::willStateData.clear();
    ListEventTest::willSourceData.clear();
    ListEventTest::didOffsetData.clear();
    ListEventTest::didStateData.clear();

    ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = 5;
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
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array4)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New4 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_3, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set4 array error");
        return nullptr;
    }
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array5)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New5 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_4, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set5 array error");
        return nullptr;
    }
    return aniArray;
}

ani_object ListEventTest::GetOnWillScrollData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnWillDidScrollData");
    ani_object String_array1 = SetArrayAniData(ListEventTest::willOffsetData, env);
    ani_object String_array2 = SetArrayAniData(ListEventTest::willStateData, env);
    ani_object String_array3 = SetArrayAniData(ListEventTest::willSourceData, env);
    ListEventTest::willOffsetData.clear();
    ListEventTest::willStateData.clear();
    ListEventTest::willSourceData.clear();

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

ani_object ListEventTest::GetOnDidScrollData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnWillDidScrollData");
    ani_object String_array1 = SetArrayAniData(ListEventTest::didOffsetData, env);
    ani_object String_array2 = SetArrayAniData(ListEventTest::didStateData, env);
    ListEventTest::didOffsetData.clear();
    ListEventTest::didStateData.clear();

    ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = 2;
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

    return aniArray;
}

// NODE_LIST_ON_SCROLL_INDEX
void ListEventTest::CreateNativeNodeOnScrollIndex(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    OnScrollIndexCallBack scrollIndex = [](std::shared_ptr<ListComponent> list) {
        list->SetListEdgeEffect(ARKUI_EDGE_EFFECT_SPRING, false);
        list->SetListScrollBar(ArkUI_ScrollBarDisplayMode::ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
        list->SetOnScrollIndex([list](int32_t first, int32_t last, int32_t subcomponent) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListEventTest",
                "OnScrollIndex first: %{public}d, last: %{public}d, subcomponent: %{public}d", first, last,
                subcomponent);
            ListEventTest::firstScrollIndexData.push_back(first);
            ListEventTest::lastScrollIndexData.push_back(last);
            ListEventTest::subcomponentScrollIndexData.push_back(subcomponent);
        });
    };
    auto col1 = CreateList<PARAM_16>(scrollIndex);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    column->AddChild(row1);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ani_object ListEventTest::GetOnScrollIndexData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnScrollIndexData");
    ani_object String_array1 = SetArrayAniData(ListEventTest::firstScrollIndexData, env);
    ani_object String_array2 = SetArrayAniData(ListEventTest::lastScrollIndexData, env);
    ani_object String_array3 = SetArrayAniData(ListEventTest::subcomponentScrollIndexData, env);
    ListEventTest::firstScrollIndexData.clear();
    ListEventTest::lastScrollIndexData.clear();
    ListEventTest::subcomponentScrollIndexData.clear();
    
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

// NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN
void ListEventTest::CreateNativeNodeOnScrollFrameBegin(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(scrollFrameBegin);
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetHeight(SIZE_50);
    btn->SetWidth(SIZE_100);
    btn->SetId("btn");
    auto column = new ColumnComponent();
    column->AddChild(col1);
    column->AddChild(btn);
    btn->RegisterOnClick([col1]() {
        auto list = dynamic_cast<ListComponent*>(col1->GetChildren().front().get());
        list->SetScrollBy(PARAM_0, PARAM_100);
    });


    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

// NODE_SCROLL_EVENT_ON_SCROLL
void ListEventTest::CreateNativeNodeOnScroll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(scroll);
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    row1->AddChild(col1);
    row1->AddChild(CreateListButton(col1));
    column->AddChild(row1);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ani_object ListEventTest::GetOnScrollData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListEventTest", "GetOnScrollData");
    ani_object String_array1 = SetArrayAniData(ListEventTest::scrollHorizontalData, env);
    ani_object String_array2 = SetArrayAniData(ListEventTest::scrollVerticalData, env);
    ListEventTest::scrollHorizontalData.clear();
    ListEventTest::scrollVerticalData.clear();
    ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = 2;
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
    return aniArray;
}

// NODE_LIST_SCROLL_TO_INDEX
void ListEventTest::CreateNativeNodeScrollToIndex(ani_env* env, ani_object info, ani_object NodeContent, ani_int index, ani_int alignment)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto col1 = CreateList<SIZE_60>(changeParam, index, alignment);
    auto column = new ColumnComponent();
    column->AddChild(col1);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest