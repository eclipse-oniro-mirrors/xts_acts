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

#include "SwipeActionTest.h"

#include <arkui/native_interface.h>
#include <memory>

#include "component/ColumnComponentTest.h"
#include "component/TextComponentTest.h"
#include "component/RowComponentTest.h"
#include "component/ListComponentTest.h"
#include "component/ButtonComponentTest.h"
#include "manager/PluginManagerTest.h"

namespace ArkUICapiTest {

constexpr int32_t LIST_ITEM_COUNT = 10;
constexpr int32_t LIST_ITEM_GROUP_COUNT = 6;

int32_t SwipeActionTest::direction = ARKUI_LIST_ITEM_SWIPE_ACTION_DIRECTION_START;
int32_t SwipeActionTest::listIndex = 0;
int32_t SwipeActionTest::listGroupIndex = -1;
int32_t SwipeActionTest::directionRight = ARKUI_LIST_ITEM_SWIPE_ACTION_DIRECTION_END;
int32_t SwipeActionTest::listIndexOne = 1;

static napi_value SetAction(napi_env env, std::shared_ptr<ListItemComponent> listItem,
                            ArkUI_ListItemSwipeEdgeEffect setEdgeEffect =
                            ArkUI_ListItemSwipeEdgeEffect::ARKUI_LIST_ITEM_SWIPE_EDGE_EFFECT_SPRING)
{
    auto option = new ListItemSwipeActionOption();
    auto col1 = std::make_shared<ColumnComponent>();
    col1->SetPercentWidth(PARAM_0_POINT_1);
    col1->SetPercentHeight(PARAM_0_POINT_1);
    col1->SetId("text");
    col1->SetBackgroundColor(COLOR_GREEN);
    auto col2 = std::make_shared<ColumnComponent>();
    col2->SetPercentWidth(PARAM_0_POINT_1);
    col2->SetPercentHeight(PARAM_0_POINT_1);
    col2->SetBackgroundColor(COLOR_YELLOW);

    auto item1 = OH_ArkUI_ListItemSwipeActionItem_Create();
    ASSERT_NOTNULL(item1);
    auto item2 = OH_ArkUI_ListItemSwipeActionItem_Create();

    OH_ArkUI_ListItemSwipeActionItem_SetContent(item1, col1->GetComponent());
    OH_ArkUI_ListItemSwipeActionItem_SetContent(item2, col2->GetComponent());
    option->SetStart(item1);
    option->SetEnd(item2);
    option->SetEdgeEffect(setEdgeEffect);
    listItem->SetListItemSwiperAction(option);
    NAPI_END;
}

static std::shared_ptr<RowComponent> CreateButton(std::vector<std::shared_ptr<ListComponent>> list)
{
    auto row = std::make_shared<RowComponent>();
    for (int i = 0; i < list.size(); i++) {
        auto eachList = list[i];
        auto button1 = std::make_shared<ButtonComponent>();
        button1->SetPercentWidth(PARAM_0_POINT_1);
        button1->SetPercentHeight(PARAM_0_POINT_1);
        button1->SetId("callbackButton" + std::to_string(i + 1));
        button1->SetBackgroundColor(COLOR_GREEN);
        button1->RegisterOnClick([eachList]() {
            void *userData = reinterpret_cast<void *>(eachList.get());
            OH_ArkUI_List_CloseAllSwipeActions(eachList->GetComponent(), userData, [](void *userData) {
                auto list = reinterpret_cast<ListComponent *>(userData);
                list->SetBackgroundColor(COLOR_WHITE);
            });
        });
        auto button2 = std::make_shared<ButtonComponent>();
        button2->SetPercentWidth(PARAM_0_POINT_1);
        button2->SetPercentHeight(PARAM_0_POINT_1);
        button2->SetId("nullCallbackButton" + std::to_string(i + 1));
        button2->SetBackgroundColor(COLOR_WHITE);
        button2->RegisterOnClick(
            [eachList]() { OH_ArkUI_List_CloseAllSwipeActions(eachList->GetComponent(), nullptr, nullptr); });
        row->AddChild(button1);
        row->AddChild(button2);
    }
    return row;
}

static std::shared_ptr<TextComponent> CreateText(std::string str)
{
    auto text = std::make_shared<TextComponent>();
    text->SetTextContent(str);
    return text;
}

static std::shared_ptr<ListComponent> CreateListWithAction(napi_env env, int32_t listItemCount,
                                                           int32_t listItemGroupCount,
                                                           int32_t listItemCountInGroup, int32_t vertical,
                                                           std::string firstItemId)
{
    auto list = std::make_shared<ListComponent>();
    list->SetMargin(SIZE_10);
    list->SetPercentWidth(PARAM_0_POINT_5);
    list->SetPercentHeight(PARAM_0_POINT_5);
    list->SetListDirection(vertical);
    for (int i = 0; i < listItemCount; i++) {
        auto listItem = std::make_shared<ListItemComponent>();
        if (i == 0) {
            listItem->SetId(firstItemId);
        }
        listItem->SetPercentWidth(PARAM_0_POINT_5);
        
        listItem->SetPercentHeight(PARAM_0_POINT_1);
        listItem->SetBackgroundColor(COLOR_BLUE);
        SetAction(env, listItem);
        listItem->AddChild(CreateText("listItem " + std::to_string(i)));
        list->AddChild(listItem);
    }
    return list;
}

ArkUI_NodeHandle findListItem(std::shared_ptr<ListComponent> list)
{
    ArkUI_NativeNodeAPI_1* nativeNodeApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nativeNodeApi);
    bool hasGroup = SwipeActionTest::listGroupIndex >= 0;
    int32_t targetIndex = SwipeActionTest::listIndex + (hasGroup ? LIST_ITEM_COUNT : 0);
    auto node = nativeNodeApi->getChildAt(list->GetComponent(), targetIndex);
    if (hasGroup) {
        node = nativeNodeApi->getChildAt(node, SwipeActionTest::listGroupIndex);
    }
    return node;
}

ArkUI_NodeHandle findListItem_one(std::shared_ptr<ListComponent> list)
{
    ArkUI_NativeNodeAPI_1* nativeNodeApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nativeNodeApi);
    bool hasGroup = SwipeActionTest::listGroupIndex >= 0;
    int32_t targetIndex = SwipeActionTest::listIndexOne + (hasGroup ? LIST_ITEM_COUNT : 0);
    auto node = nativeNodeApi->getChildAt(list->GetComponent(), targetIndex);
    if (hasGroup) {
        node = nativeNodeApi->getChildAt(node, SwipeActionTest::listGroupIndex);
    }
    return node;
}

void Expand(ArkUI_NodeHandle node, int32_t direction)
{
    int32_t ret = OH_ArkUI_ListItemSwipeAction_Expand(node, static_cast<ArkUI_ListItemSwipeActionDirection>(direction));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Expand",
                 "expand ret = %{public}d, direction = %{public}d", ret, direction);
}

void Collapse(ArkUI_NodeHandle node)
{
    int32_t ret = OH_ArkUI_ListItemSwipeAction_Collapse(node);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Expand",
                 "Collapse ret = %{public}d", ret);
}

static napi_value Expand_ErrorCode(napi_env env, ArkUI_NodeHandle node, int32_t direction)
{
    auto ret = OH_ArkUI_ListItemSwipeAction_Expand(node, static_cast<ArkUI_ListItemSwipeActionDirection>(direction));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Expand",
                 "CXN expand ret = %{public}d, direction = %{public}d", ret, direction);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value Collapse_ErrorCode(napi_env env, ArkUI_NodeHandle node)
{
    auto ret = OH_ArkUI_ListItemSwipeAction_Collapse(node);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Expand",
                 "CXN Collapse ret = %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static std::shared_ptr<ColumnComponent> CreateSwipeActionController(napi_env env, std::shared_ptr<ListComponent> list)
{
    auto column = std::make_shared<ColumnComponent>();
    auto expandListBtn = std::make_shared<ButtonComponent>();
    auto collapseListBtn = std::make_shared<ButtonComponent>();
    auto expandListBtn_right = std::make_shared<ButtonComponent>();
    auto collapseListBtn_right = std::make_shared<ButtonComponent>();
    auto invalidBtn = std::make_shared<ButtonComponent>();
    expandListBtn_right->SetLabel("expandListBtn_right");
    expandListBtn_right->SetId("expandListBtn_right");
    collapseListBtn_right->SetLabel("collapseListBtn_right");
    collapseListBtn_right->SetId("collapseListBtn_right");
    invalidBtn->SetLabel("invalidBtn");
    invalidBtn->SetId("invalidBtn");
    expandListBtn->SetLabel("expandList");
    expandListBtn->SetId("expandList");
    collapseListBtn->SetLabel("collapseList");
    collapseListBtn->SetId("collapseList");
    column->AddChild(expandListBtn);
    column->AddChild(collapseListBtn);
    column->AddChild(expandListBtn_right);
    column->AddChild(collapseListBtn_right);
    column->AddChild(invalidBtn);
    expandListBtn->RegisterOnClick([env, list]() {
        Expand_ErrorCode(env, findListItem(list), SwipeActionTest::direction);
    });
    collapseListBtn->RegisterOnClick([env, list]() { Collapse_ErrorCode(env, findListItem(list)); });
    expandListBtn_right->RegisterOnClick([env, list]() {
        Expand_ErrorCode(env, findListItem_one(list), SwipeActionTest::directionRight);
    });
    collapseListBtn_right->RegisterOnClick([env, list]() { Collapse_ErrorCode(env, findListItem_one(list)); });
    invalidBtn->RegisterOnClick([list]() { Expand(nullptr, SwipeActionTest::direction); });
    return column;
}

napi_value SwipeActionTest::swipeActionTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwipeActionTest",
                 "%{public}s", xComponentID);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwipeActionTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    auto rootRow = new RowComponent();
    auto list =
        CreateListWithAction(env, LIST_ITEM_COUNT, LIST_ITEM_GROUP_COUNT, 6, ArkUI_Axis::ARKUI_AXIS_VERTICAL, "list1");
    rootRow->AddChild(list);
    rootRow->AddChild(CreateSwipeActionController(env, list));
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 rootRow->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwipeActionTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
}