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

#include "list_scroll_by_test.h"

#include <arkui/native_interface.h>
#include <cstdint>
#include <thread>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#include "arkui/native_node.h"
#include "common/common.h"
#include "../component/row_component.h"

namespace ArkUIAniTest {
using OnScrollByCallBack = std::function<void(std::shared_ptr<ListComponent>)>;
std::vector<int32_t> ListScrollByTest::retData = {};
std::vector<int32_t> ListScrollByTest::firstScrollIndexData = {};
std::vector<int32_t> ListScrollByTest::lastScrollIndexData = {};
std::vector<int32_t> ListScrollByTest::subcomponentScrollIndexData = {};

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

static std::shared_ptr<ButtonComponent> CreateButton(const char* id, std::shared_ptr<ColumnComponent> col)
{
    auto btn = std::make_shared<ButtonComponent>();
    btn->SetWidth(SIZE_100);
    btn->SetHeight(SIZE_50);
    btn->SetId(id);
    col->AddChild(btn);
    return btn;
}

static std::shared_ptr<ColumnComponent> CreateListButton(std::shared_ptr<ColumnComponent> col)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto colBtn = std::make_shared<ColumnComponent>();
    auto btn1 = CreateButton("btn1", colBtn);
    auto btn2 = CreateButton("btn2", colBtn);
    auto btn3 = CreateButton("btn3", colBtn);
    auto btn4 = CreateButton("btn4", colBtn);
    btn1->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = PARAM_0 }, { .f32 = PARAM_0 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    btn2->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = SIZE_100 }, { .f32 = SIZE_100 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    btn3->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = SIZE_100000 }, { .f32 = SIZE_100000 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    btn4->RegisterOnClick([col, nodeAPI]() {
        auto list = dynamic_cast<ListComponent*>(col->GetChildren().front().get());
        ArkUI_NumberValue value[] = { { .f32 = PARAM_NEGATIVE_100 }, { .f32 = PARAM_NEGATIVE_100 } };
        ArkUI_AttributeItem item = { value, PARAM_2 };
        auto ret = nodeAPI->setAttribute(list->GetComponent(), NODE_SCROLL_BY, &item);
        ListScrollByTest::retData.push_back(ret);
    });
    return colBtn;
}

static OnScrollByCallBack scrollBy = [](std::shared_ptr<ListComponent> list) {
    list->SetOnScrollIndex([list](int32_t first, int32_t last, int32_t subcomponent) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ListScrollByTest",
            "OnScrollIndex first: %{public}d, last: %{public}d, subcomponent: %{public}d", first, last, subcomponent);
        ListScrollByTest::firstScrollIndexData.push_back(first);
        ListScrollByTest::lastScrollIndexData.push_back(last);
        ListScrollByTest::subcomponentScrollIndexData.push_back(subcomponent);
    });
};

ani_object ListScrollByTest::GetScrollByData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListScrollByTest", "GetOnScrollIndexData");
    ani_object String_array1 = SetArrayAniData(ListScrollByTest::retData, env);
    ani_object String_array2 = SetArrayAniData(ListScrollByTest::firstScrollIndexData, env);
    ani_object String_array3 = SetArrayAniData(ListScrollByTest::lastScrollIndexData, env);
    ani_object String_array4 = SetArrayAniData(ListScrollByTest::subcomponentScrollIndexData, env);
    ListScrollByTest::firstScrollIndexData.clear();
    ListScrollByTest::lastScrollIndexData.clear();
    ListScrollByTest::subcomponentScrollIndexData.clear();
    ListScrollByTest::retData.clear();
    
    ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[ANI] GetUndefined error");
        return nullptr;
    }
    ani_size size = 4;
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
    return aniArray;
}

void ListScrollByTest::TestListScrollBy001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(scrollBy);
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

void ListScrollByTest::TestListScrollBy002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(scrollBy);
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

void ListScrollByTest::TestListScrollBy003(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(scrollBy);
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

void ListScrollByTest::TestListScrollBy004(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto col1 = CreateList<SIZE_40>(scrollBy);
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
} // namespace ArkUIAniTest