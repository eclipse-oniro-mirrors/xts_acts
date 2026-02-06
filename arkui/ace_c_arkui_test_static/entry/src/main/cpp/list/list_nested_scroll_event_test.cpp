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

#include "list_nested_scroll_event_test.h"


#include "component/button_component.h"
#include "component/list_component.h"
#include "component/row_component.h"
#include "component/text_component.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

static auto mode1 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_SELF_ONLY;
static auto mode2 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_SELF_FIRST;
static auto mode3 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST;
static auto mode4 = ArkUI_ScrollNestedMode::ARKUI_SCROLL_NESTED_MODE_PARALLEL;

namespace ArkUIAniTest {
std::vector<int32_t> ListNestedScrollTest::firstNestedScrollData = {};
std::vector<int32_t> ListNestedScrollTest::lastNestedScrollData = {};

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

static auto CreateNestedScrollNode(std::vector<std::shared_ptr<ScrollComponent>> scrolls1,
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2, std::vector<std::shared_ptr<ScrollComponent>> scrolls3)
{
    auto column = new ColumnComponent();
    auto row1 = std::make_shared<RowComponent>();
    auto row2 = std::make_shared<RowComponent>();
    auto row3 = std::make_shared<RowComponent>();
    for (auto scroll : scrolls1) {
        row1->AddChild(scroll);
    }
    for (auto scroll : scrolls2) {
        row2->AddChild(scroll);
    }
    for (auto scroll : scrolls3) {
        row3->AddChild(scroll);
    }
    column->AddChild(row1);
    column->AddChild(row2);
    column->AddChild(row3);

    return column;
}

void ListNestedScrollTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll1 = CreateListByNestedScroll("scroll1", mode2, PARAM_NEGATIVE_1);
    auto scroll2 = CreateListByNestedScroll("scroll2", mode2, mode1);
    auto scroll3 = CreateListByNestedScroll("scroll3", mode2, mode2);
    auto scroll4 = CreateListByNestedScroll("scroll4", mode2, mode3);
    auto scroll5 = CreateListByNestedScroll("scroll5", mode2, mode4);
    auto scroll6 = CreateListByNestedScroll("scroll6", mode2, PARAM_4);
    auto scroll7 = CreateListByNestedScroll("scroll7", PARAM_NEGATIVE_1, mode2, false);
    auto scroll8 = CreateListByNestedScroll("scroll8", mode1, mode2, false);
    auto scroll9 = CreateListByNestedScroll("scroll9", mode2, mode2, false);
    auto scroll10 = CreateListByNestedScroll("scroll10", mode3, mode2, false);
    auto scroll11 = CreateListByNestedScroll("scroll11", mode4, mode2, false);
    auto scroll12 = CreateListByNestedScroll("scroll12", PARAM_4, mode2, false);
    std::vector<std::shared_ptr<ScrollComponent>> scrolls1 = { scroll1, scroll2, scroll3, scroll4 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2 = { scroll5, scroll6, scroll7, scroll8 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls3 = { scroll9, scroll10, scroll11, scroll12 };
    auto column = CreateNestedScrollNode(scrolls1, scrolls2, scrolls3);

    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListNestedScrollTest::CreateNativeNodeSmall(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll1 = CreateListByNestedScroll<PARAM_8>("scroll1", mode2, PARAM_NEGATIVE_1);
    auto scroll2 = CreateListByNestedScroll<PARAM_8>("scroll2", mode2, mode1);
    auto scroll3 = CreateListByNestedScroll<PARAM_8>("scroll3", mode2, mode2);
    auto scroll4 = CreateListByNestedScroll<PARAM_8>("scroll4", mode2, mode3);
    auto scroll5 = CreateListByNestedScroll<PARAM_8>("scroll5", mode2, mode4);
    auto scroll6 = CreateListByNestedScroll<PARAM_8>("scroll6", mode2, PARAM_4);
    auto scroll7 = CreateListByNestedScroll<PARAM_8>("scroll7", PARAM_NEGATIVE_1, mode2, false);
    auto scroll8 = CreateListByNestedScroll<PARAM_8>("scroll8", mode1, mode2, false);
    auto scroll9 = CreateListByNestedScroll<PARAM_8>("scroll9", mode2, mode2, false);
    auto scroll10 = CreateListByNestedScroll<PARAM_8>("scroll10", mode3, mode2, false);
    auto scroll11 = CreateListByNestedScroll<PARAM_8>("scroll11", mode4, mode2, false);
    auto scroll12 = CreateListByNestedScroll<PARAM_8>("scroll12", PARAM_4, mode2, false);
    std::vector<std::shared_ptr<ScrollComponent>> scrolls1 = { scroll1, scroll2, scroll3, scroll4 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2 = { scroll5, scroll6, scroll7, scroll8 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls3 = { scroll9, scroll10, scroll11, scroll12 };
    auto column = CreateNestedScrollNode(scrolls1, scrolls2, scrolls3);

    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void ListNestedScrollTest::CreateNativeNodeReset(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto scroll1 = CreateListByNestedScrollReset("scroll1", mode2, PARAM_NEGATIVE_1);
    auto scroll2 = CreateListByNestedScrollReset("scroll1", mode2, mode1);
    auto scroll3 = CreateListByNestedScrollReset("scroll1", mode2, mode2);
    auto scroll4 = CreateListByNestedScrollReset("scroll1", mode2, mode3);
    auto scroll5 = CreateListByNestedScrollReset("scroll1", mode2, mode4);
    auto scroll6 = CreateListByNestedScrollReset("scroll1", mode2, PARAM_4);
    auto scroll7 = CreateListByNestedScrollReset("scroll1", PARAM_NEGATIVE_1, mode2, false);
    auto scroll8 = CreateListByNestedScrollReset("scroll1", mode1, mode2, false);
    auto scroll9 = CreateListByNestedScrollReset("scroll1", mode2, mode2, false);
    auto scroll10 = CreateListByNestedScrollReset("scroll1", mode3, mode2, false);
    auto scroll11 = CreateListByNestedScrollReset("scroll1", mode4, mode2, false);
    auto scroll12 = CreateListByNestedScrollReset("scroll1", PARAM_4, mode2, false);
    std::vector<std::shared_ptr<ScrollComponent>> scrolls1 = { scroll1, scroll2, scroll3, scroll4 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls2 = { scroll5, scroll6, scroll7, scroll8 };
    std::vector<std::shared_ptr<ScrollComponent>> scrolls3 = { scroll9, scroll10, scroll11, scroll12 };
    auto column = CreateNestedScrollNode(scrolls1, scrolls2, scrolls3);
    
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column->GetComponent());
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
ani_object ListNestedScrollTest::ListGetNestedScrollData(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListNestedScrollTest", "ListGetNestedScrollData");
    ani_object String_array1 = SetArrayAniData(ListNestedScrollTest::firstNestedScrollData, env);
    ani_object String_array2 = SetArrayAniData(ListNestedScrollTest::lastNestedScrollData, env);
    ListNestedScrollTest::firstNestedScrollData.clear();
    ListNestedScrollTest::lastNestedScrollData.clear();
    
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
    return aniArray;
}
} // namespace ArkUIAniTest