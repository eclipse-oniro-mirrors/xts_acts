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

#include "SwipeErrorTest.h"

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

int32_t SwipeErrorTest::direction = 0;
int32_t SwipeErrorTest::listIndex = 0;
int32_t SwipeErrorTest::listGroupIndex = -1;
int32_t SwipeErrorTest::directionRight = 1;
int32_t SwipeErrorTest::listIndexOne = 1;

static void SetAction(std::shared_ptr<ListItemComponent> listItem,
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
    auto item2 = OH_ArkUI_ListItemSwipeActionItem_Create();

    OH_ArkUI_ListItemSwipeActionItem_SetContent(item1, col1->GetComponent());
    OH_ArkUI_ListItemSwipeActionItem_SetContent(item2, col2->GetComponent());
    option->SetStart(item1);
    option->SetEnd(item2);
    option->SetEdgeEffect(setEdgeEffect);
    listItem->SetListItemSwiperAction(option);
    listItem->SetId("list");
}

static std::shared_ptr<TextComponent> CreateText(std::string str)
{
    auto text = std::make_shared<TextComponent>();
    text->SetTextContent(str);
    return text;
}

static std::shared_ptr<ListComponent> CreateListWithAction(int32_t listItemCount, int32_t listItemGroupCount,
                                                           int32_t listItemCountInGroup, int32_t vertical,
                                                           std::string firstItemId)
{
    auto list = std::make_shared<ListComponent>();
    constexpr int32_t width = 150;
    list->SetMargin(SIZE_10);
    list->SetPercentWidth(PARAM_0_POINT_5);
    list->SetPercentHeight(PARAM_0_POINT_5);
    list->SetListDirection(vertical);
    list->SetListCachedCount(0);
    std::vector<std::shared_ptr<Component>> input;
    auto adapter = make_shared<ItemAdapter<ListItemComponent>>(input, false);
    adapter->RegisterItemSetCallback([](std::shared_ptr<ListItemComponent> listItem) {
        SetAction(listItem);
    });
    int size = 30;
    for (int i = 0; i < size; i++) {
        auto column = std::make_shared<ColumnComponent>();
        column->SetPercentWidth(PARAM_0_POINT_5);
        column->SetPercentHeight(PARAM_0_POINT_1);
        auto text = std::make_shared<TextComponent>();
        text->SetAlign(ARKUI_ALIGNMENT_CENTER);
        text->SetTextContent("Text" + std::to_string(i));
        column->AddChild(text);
        column->SetBackgroundColor(COLOR_BLUE);
        adapter->InsertItem(i, column);
    }
    list->SetLazyAdapter(adapter);
    return list;
}

ArkUI_NodeHandle findListItem_first(std::shared_ptr<ListComponent> list)
{
    ArkUI_NativeNodeAPI_1* nativeNodeApi = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nativeNodeApi);
    bool hasGroup = SwipeErrorTest::listGroupIndex >= 0;
    int32_t targetIndex = SwipeErrorTest::listIndex + (hasGroup ? LIST_ITEM_COUNT : 0);
    auto node = nativeNodeApi->getChildAt(list->GetComponent(), targetIndex);
    if (hasGroup) {
        node = nativeNodeApi->getChildAt(node, SwipeErrorTest::listGroupIndex);
    }
    return node;
}

void Expand_Error(ArkUI_NodeHandle node, int32_t direction)
{
    int32_t ret = OH_ArkUI_ListItemSwipeAction_Expand(node, static_cast<ArkUI_ListItemSwipeActionDirection>(direction));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Expand",
                 "CXN expand ret = %{public}d, direction = %{public}d", ret, direction);
}

void Collapse_Error(ArkUI_NodeHandle node)
{
    int32_t ret = OH_ArkUI_ListItemSwipeAction_Collapse(node);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Expand",
                 "CXN Collapse ret = %{public}d", ret);
}


static std::shared_ptr<ColumnComponent> CreateSwipeActionController(std::shared_ptr<ListComponent> list)
{
    auto column = std::make_shared<ColumnComponent>();
    auto directionBtn = std::make_shared<ButtonComponent>();
    auto listIndexBtn = std::make_shared<ButtonComponent>();
    auto listGroupIndexBtn = std::make_shared<ButtonComponent>();
    auto resetGroupIndexBtn = std::make_shared<ButtonComponent>();
    auto expandListBtn = std::make_shared<ButtonComponent>();
    auto collapseListBtn = std::make_shared<ButtonComponent>();
    auto nullptrBtn = std::make_shared<ButtonComponent>();
    auto columnBtn = std::make_shared<ButtonComponent>();
    directionBtn->SetLabel("direction " + std::to_string(SwipeErrorTest::direction));
    listIndexBtn->SetLabel("listIndex " + std::to_string(SwipeErrorTest::listIndex));
    resetGroupIndexBtn->SetLabel("resetGroupIndex");
    listGroupIndexBtn->SetLabel("listGroupIndex " + std::to_string(SwipeErrorTest::listGroupIndex));
    expandListBtn->SetLabel("expandList");
    expandListBtn->SetId("expandList");
    nullptrBtn->SetLabel("nullptr");
    nullptrBtn->SetId("nullptr");
    collapseListBtn->SetLabel("collapseList");
    collapseListBtn->SetId("collapseList");
    columnBtn->SetLabel("column");
    columnBtn->SetId("column");
    column->AddChild(directionBtn);
    column->AddChild(listIndexBtn);
    column->AddChild(resetGroupIndexBtn);
    column->AddChild(listGroupIndexBtn);
    column->AddChild(expandListBtn);
    column->AddChild(collapseListBtn);
    column->AddChild(nullptrBtn);
    column->AddChild(columnBtn);
    directionBtn->RegisterOnClick([directionBtn]() {
        SwipeErrorTest::direction = (SwipeErrorTest::direction + PARAM_1) % PARAM_4;
        directionBtn->SetLabel("direction " + std::to_string(SwipeErrorTest::direction));
    });
    listIndexBtn->RegisterOnClick([listIndexBtn]() {
        SwipeErrorTest::listIndex = (SwipeErrorTest::listIndex + PARAM_1) % LIST_ITEM_COUNT;
        listIndexBtn->SetLabel("listIndex " + std::to_string(SwipeErrorTest::listIndex));
    });
    resetGroupIndexBtn->RegisterOnClick([listGroupIndexBtn]() {
        SwipeErrorTest::listGroupIndex = PARAM_NEGATIVE_1;
        listGroupIndexBtn->SetLabel("listGroupIndex " + std::to_string(SwipeErrorTest::listGroupIndex));
    });
    listGroupIndexBtn->RegisterOnClick([listGroupIndexBtn]() {
        SwipeErrorTest::listGroupIndex++;
        if (SwipeErrorTest::listGroupIndex >= LIST_ITEM_GROUP_COUNT) {
            SwipeErrorTest::listGroupIndex = PARAM_NEGATIVE_1;
        }
        listGroupIndexBtn->SetLabel("listGroupIndex " + std::to_string(SwipeErrorTest::listGroupIndex));
    });
    expandListBtn->RegisterOnClick([list]() { Expand_Error(findListItem_first(list), SwipeErrorTest::direction); });
    collapseListBtn->RegisterOnClick([list]() { Collapse_Error(findListItem_first(list)); });
    nullptrBtn->RegisterOnClick([]() {
        Expand_Error(nullptr, SwipeErrorTest::direction);
        Collapse_Error(nullptr);
    });
    columnBtn->RegisterOnClick([column]() {
        Expand_Error(column->GetComponent(), SwipeErrorTest::direction);
        Collapse_Error(column->GetComponent());
    });
    return column;
}

napi_value SwipeErrorTest::swipeErrorTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwipeErrorTest",
                 "%{public}s", xComponentID);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwipeErrorTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    auto rootRow = new RowComponent();
    auto list =
        CreateListWithAction(LIST_ITEM_COUNT, LIST_ITEM_GROUP_COUNT, 6, ArkUI_Axis::ARKUI_AXIS_VERTICAL, "list1");
    rootRow->AddChild(list);
    rootRow->AddChild(CreateSwipeActionController(list));
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 rootRow->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwipeErrorTest",
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