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
#include "ListItemSwipeActionStateTest.h"

namespace ListItemSwipeActionStateTest {
int32_t g_collapsedResult = 0;
int32_t g_expandedResult = 0;
int32_t g_actioningResult = 0;

void Callback1(ArkUI_ListItemSwipeActionState swipeActionState)
{
    g_collapsedResult = swipeActionState;
}

void Callback2(ArkUI_ListItemSwipeActionState swipeActionState)
{
    g_expandedResult = swipeActionState;
}

void Callback3(ArkUI_ListItemSwipeActionState swipeActionState)
{
    g_actioningResult = swipeActionState;
}

napi_value testListSwipeActionItem001(napi_env env, napi_callback_info info)
{
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionItem_SetOnStateChange(listSwipeActionItem, Callback1);
    ArkUI_ListItemSwipeActionState state = ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_COLLAPSED;
    if (g_collapsedResult != state) {
        g_collapsedResult = PARAM_1;
    }
    napi_value result;
    napi_create_int32(env, g_collapsedResult, &result);
    return result;
}

napi_value testListSwipeActionItem002(napi_env env, napi_callback_info info)
{
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionItem_SetOnStateChange(listSwipeActionItem, Callback2);
    ArkUI_ListItemSwipeActionState state = ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_EXPANDED;
    if (g_expandedResult != state) {
        g_expandedResult = PARAM_1;
    }
    napi_value result;
    napi_create_int32(env, g_expandedResult, &result);
    return result;
}

napi_value testListSwipeActionItem003(napi_env env, napi_callback_info info)
{
    auto listSwipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionItem_SetOnStateChange(listSwipeActionItem, Callback3);
    ArkUI_ListItemSwipeActionState state = ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_ACTIONING;
    if (g_actioningResult != state) {
        g_actioningResult = PARAM_2;
    }
    napi_value result;
    napi_create_int32(env, g_actioningResult, &result);
    return result;
}
};