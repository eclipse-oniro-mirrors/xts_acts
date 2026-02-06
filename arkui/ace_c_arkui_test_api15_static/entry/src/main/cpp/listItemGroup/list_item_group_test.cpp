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
#include "ani/ani.h"
#include "common/common.h"
#include "list_item_group_test.h"
namespace ArkUIAniTest {

static int g_totalNodeCnt = 1000;
static uint32_t g_fromNum = 1;
static uint32_t g_two = 2;
static uint32_t g_startPosition = 0;
static uint32_t g_itemCount = 10;

ani_double ListItemGroupTest::TestListItemGroupNodeAdapter001(ani_env* env, ani_object info)
{
    NAPI_START(listItemGroup, ARKUI_NODE_LIST_ITEM_GROUP);
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, g_totalNodeCnt);
    uint32_t rescnt = OH_ArkUI_NodeAdapter_GetTotalNodeCount(adapter);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    ASSERT_EQ(rescnt, g_totalNodeCnt);
    NAPI_END;
}

ani_double ListItemGroupTest::TestListItemGroupNodeAdapter002(ani_env* env, ani_object info)
{
    NAPI_START(listItemGroup, ARKUI_NODE_LIST_ITEM_GROUP);
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    int ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nullptr, [](ArkUI_NodeAdapterEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO,
            LOG_PRINT_DOMAIN, "TestListItemGroupNodeAdapter", "nodeadapter event callback func");
    });
    OH_ArkUI_NodeAdapter_UnregisterEventReceiver(adapter);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

struct UserCallback {
    std::function<void(void *event)> callback;
};

ani_double ListItemGroupTest::TestListItemGroupNodeAdapter003(ani_env* env, ani_object info)
{
    NAPI_START(listItemGroup, ARKUI_NODE_LIST_ITEM_GROUP);
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    struct UserCallback *adapterCallback = new UserCallback();
    adapterCallback->callback = [&](void *event) {
        auto *adapterEvent = reinterpret_cast<ArkUI_NodeAdapterEvent *>(event);
        auto type = OH_ArkUI_NodeAdapterEvent_GetType(adapterEvent);
        switch (type) {
            case NODE_ADAPTER_EVENT_WILL_ATTACH_TO_NODE:
                {
                    int32_t retinner = OH_ArkUI_NodeAdapter_InsertItem(adapter, g_startPosition, g_itemCount);
                    retinner = OH_ArkUI_NodeAdapter_MoveItem(adapter, g_fromNum, g_two);
                    retinner = OH_ArkUI_NodeAdapter_ReloadAllItems(adapter);
                    retinner = OH_ArkUI_NodeAdapter_ReloadItem(adapter, g_startPosition, g_itemCount);
                    retinner = OH_ArkUI_NodeAdapter_RemoveItem(adapter, g_startPosition, g_itemCount);
                    ArkUI_NodeHandle **items = nullptr;
                    uint32_t retsize;
                    retinner = OH_ArkUI_NodeAdapter_GetAllItems(adapter, items, &retsize);
                }
                break;
            default:
                break;
        }
    };
    int ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, adapterCallback, [](ArkUI_NodeAdapterEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO,
            LOG_PRINT_DOMAIN, "TestListItemGroupNodeAdapter", "nodeadapter event callback func");
        auto *userData = reinterpret_cast<UserCallback *>(OH_ArkUI_NodeAdapterEvent_GetUserData(event));
        userData->callback(event);
    });
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_AttributeItem item{nullptr, 0, nullptr, adapter};
    ret = nodeAPI->setAttribute(listItemGroup, NODE_LIST_ITEM_GROUP_NODE_ADAPTER, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
}  // namespace ArkUIAniTest