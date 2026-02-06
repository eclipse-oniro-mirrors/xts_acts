/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance rotate the License.
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

#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {

static int g_totalNodeCnt = 1000;
static uint32_t g_from = 1;
static uint32_t g_to = 2;
static uint32_t g_startPosition = 0;
static uint32_t g_itemCount = 10;

static ani_double TestListNodeAdapter001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);

    // 创建适配器
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();

    // 设置适配器中的元素总数
    OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, g_totalNodeCnt);

    uint32_t res_cnt = OH_ArkUI_NodeAdapter_GetTotalNodeCount(adapter);
    ASSERT_EQ(res_cnt, g_totalNodeCnt);

    // 销毁组件适配器对象
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    ASSERT_EQ(res_cnt, g_totalNodeCnt);

    NAPI_END;
}

static ani_double TestListNodeAdapter002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);

    // 创建适配器
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();

    // 注册事件回调函数
    int ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nullptr, [](ArkUI_NodeAdapterEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestListNodeAdapter", "nodeadapter event callback func");
    });
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);

    // 注销适配器相关回调事件
    OH_ArkUI_NodeAdapter_UnregisterEventReceiver(adapter);

    // 销毁组件适配器对象
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    NAPI_END;
}

struct UserCallback {
    std::function<void(void *event)> callback;
};

ani_double static TestListNodeAdapter003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    struct UserCallback *adapterCallback = new UserCallback();
    adapterCallback->callback = [&](void *event) {
        auto *adapterEvent = reinterpret_cast<ArkUI_NodeAdapterEvent *>(event);
        auto type = OH_ArkUI_NodeAdapterEvent_GetType(adapterEvent);
        switch (type) {
            case NODE_ADAPTER_EVENT_WILL_ATTACH_TO_NODE:
                {
                    // 通知Adapter进行局部元素插入，插入10个
                    int32_t ret_inner = OH_ArkUI_NodeAdapter_InsertItem(adapter, g_startPosition, g_itemCount);
                    // 通知Adapter进行局部元素移位
                    ret_inner = OH_ArkUI_NodeAdapter_MoveItem(adapter, g_from, g_to);
                    // 通知Adapter进行全量元素变化
                    ret_inner = OH_ArkUI_NodeAdapter_ReloadAllItems(adapter);
                    // 通知Adapter进行局部元素变化
                    ret_inner = OH_ArkUI_NodeAdapter_ReloadItem(adapter, g_startPosition, g_itemCount);
                    // 通知Adapter进行局部元素删除
                    ret_inner = OH_ArkUI_NodeAdapter_RemoveItem(adapter, g_startPosition, g_itemCount);
                    // 获取存储在Adapter中的所有元素
                    ArkUI_NodeHandle **items = nullptr;
                    uint32_t ret_size;
                    ret_inner = OH_ArkUI_NodeAdapter_GetAllItems(adapter, items, &ret_size);
                }
                break;
            default:
                break;
        }
    };
    // 注册事件回调函数
    int32_t ret =
        OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, adapterCallback, [](ArkUI_NodeAdapterEvent *event) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestListNodeAdapter", "nodeadapter event callback func");
            auto *userData = reinterpret_cast<UserCallback *>(OH_ArkUI_NodeAdapterEvent_GetUserData(event));
            userData->callback(event);
        });
    // 断言是否注册成功
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    // 把adapter挂载到list上
    ArkUI_AttributeItem item{nullptr, 0, nullptr, adapter};
    ret = nodeAPI->setAttribute(list, NODE_LIST_NODE_ADAPTER, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

}  // namespace ArkUIAniTest
