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

#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {

static void OnEventRegisterEvent(ArkUI_NodeAdapterEvent* event)
{
    OH_ArkUI_NodeAdapterEvent_GetUserData(event);
}

static ani_double TestLazyForEachRegisterEventReceiver001(ani_env* env, ani_object info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    auto ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nodeAPI, &OnEventRegisterEvent);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    NAPI_END;
}

static ani_double TestLazyForEachRegisterEventReceiver002(ani_env* env, ani_object info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    auto ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(nullptr, nodeAPI, &OnEventRegisterEvent);
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    NAPI_END;
}

static ani_double TestLazyForEachRegisterEventReceiver003(ani_env* env, ani_object info)
{
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    auto ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nullptr, &OnEventRegisterEvent);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    NAPI_END;
}

static ani_double TestLazyForEachRegisterEventReceiver004(ani_env* env, ani_object info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    auto ret = OH_ArkUI_NodeAdapter_RegisterEventReceiver(adapter, nodeAPI, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    NAPI_END;
}

} // namespace ArkUIAniTest