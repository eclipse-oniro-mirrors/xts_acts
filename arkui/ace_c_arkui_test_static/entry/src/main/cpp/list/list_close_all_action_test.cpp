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
#include "list_close_all_action_test.h"

#include <arkui/native_interface.h>
#include <thread>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#include "component/button_component.h"
#include "component/column_component.h"
#include "component/list_component.h"
#include "component/row_component.h"

namespace ArkUIAniTest {
using namespace std;
std::vector<int32_t> ListCloseAllTest::retData = {};

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

static void SetAction(std::shared_ptr<ListItemComponent> listItem,
    ArkUI_ListItemSwipeEdgeEffect setEdgeEffect =
        ArkUI_ListItemSwipeEdgeEffect::ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_SPRING)
{
    auto option = new ListItemSwipeActionOption();
    auto col1 = std::make_shared<ColumnComponent>();
    col1->SetWidth(SIZE_50);
    col1->SetHeight(SIZE_50);
    col1->SetBackgroundColor(COLOR_GREEN);
    auto col2 = std::make_shared<ColumnComponent>();
    col2->SetWidth(SIZE_50);
    col2->SetHeight(SIZE_50);
    col2->SetBackgroundColor(COLOR_YELLOW);

    auto item1 = OH_ArkUI_ListItemSwipeActionItem_Create();
    auto item2 = OH_ArkUI_ListItemSwipeActionItem_Create();

    OH_ArkUI_ListItemSwipeActionItem_SetContent(item1, col1->GetComponent());
    OH_ArkUI_ListItemSwipeActionItem_SetContent(item2, col2->GetComponent());
    option->SetStart(item1);
    option->SetEnd(item2);
    option->SetEdgeEffect(setEdgeEffect);
    listItem->SetListItemSwiperAction(option);
}

static std::shared_ptr<RowComponent> CreateButton(std::vector<std::shared_ptr<ListComponent>> list)
{
    auto row = make_shared<RowComponent>();
    for (int i = PARAM_0; i < list.size(); i++) {
        auto eachList = list[i];
        auto button1 = make_shared<ButtonComponent>();
        button1->SetWidth(SIZE_50);
        button1->SetHeight(SIZE_50);
        button1->SetId("callbackButton" + std::to_string(i));
        button1->SetBackgroundColor(COLOR_GREEN);
        button1->RegisterOnClick([eachList]() {
            void* userData = reinterpret_cast<void*>(eachList.get());
            auto ret = OH_ArkUI_List_CloseAllSwipeActions(eachList->GetComponent(), userData, [](void* userData) {
                auto list = reinterpret_cast<ListComponent*>(userData);
                list->SetBackgroundColor(COLOR_RED);
            });
            ListCloseAllTest::retData.push_back(ret);
        });
        auto button2 = make_shared<ButtonComponent>();
        button2->SetWidth(SIZE_50);
        button2->SetHeight(SIZE_50);
        button2->SetId("nullCallbackButton" + std::to_string(i));
        button2->SetBackgroundColor(COLOR_GREEN);
        button2->RegisterOnClick([eachList]() {
            auto ret = OH_ArkUI_List_CloseAllSwipeActions(eachList->GetComponent(), nullptr, nullptr);
            ListCloseAllTest::retData.push_back(ret);
        });
        row->AddChild(button1);
        row->AddChild(button2);
    }
    return row;
}

ani_object ListCloseAllTest::GetRetData(ani_env* env, ani_object info)
{
    ani_object String_array1 = SetArrayAniData(ListCloseAllTest::retData, env);
    ListCloseAllTest::retData.clear();
    
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
    if (ANI_OK != env->Object_New(arrayCls, arrayCtor, &arrayObj, String_array1)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Object_New1 error");
        return nullptr;
    }
    if (ANI_OK != env->Array_Set(aniArray, PARAM_0, arrayObj)) {
        OH_LOG_INFO(LOG_APP, "[ANI] Array_Set1 array error");
        return nullptr;
    }
    return aniArray;
    
}

static std::shared_ptr<ListComponent> CreateListWithAction(int32_t num, int32_t vertical, string firstItemId)
{
    auto list = make_shared<ListComponent>();
    list->SetMargin(PARAM_10);
    list->SetWidth(SIZE_150);
    list->SetHeight(SIZE_150);
    list->SetListDirection(vertical);
    list->SetListDivider(COLOR_BLACK, PARAM_2, PARAM_0, PARAM_0);
    for (int i = PARAM_0; i < num; i++) {
        auto listItem = make_shared<ListItemComponent>();
        if (i == PARAM_0) {
            listItem->SetId(firstItemId);
        }
        listItem->SetWidth(SIZE_80);
        listItem->SetHeight(SIZE_80);
        listItem->SetBackgroundColor(COLOR_BLUE);
        SetAction(listItem);
        list->AddChild(listItem);
    }
    return list;
}

void ListCloseAllTest::CreateNativeNodeCloseAll(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto column = new ColumnComponent();
    auto list1 = CreateListWithAction(SIZE_1000, ArkUI_Axis::ARKUI_AXIS_VERTICAL, "list1");
    auto list2 = CreateListWithAction(SIZE_1000, ArkUI_Axis::ARKUI_AXIS_HORIZONTAL, "list2");
    auto row = CreateButton({ list1, list2 });
    column->AddChild(list1);
    column->AddChild(list2);
    column->AddChild(row);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest
