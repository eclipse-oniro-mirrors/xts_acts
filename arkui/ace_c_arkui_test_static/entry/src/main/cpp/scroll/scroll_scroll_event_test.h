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

#ifndef ARKUI_CAPI_XTS_SCROLL_SCROLL_EVENT_TEST_H
#define ARKUI_CAPI_XTS_SCROLL_SCROLL_EVENT_TEST_H

#include "../common/common.h"

#include <ace/xcomponent/native_interface_xcomponent.h>
#include "ani/ani.h"

namespace ArkUIAniTest {

class ScrollScrollEventTest {
public:
    ~ScrollScrollEventTest();
    static void CreateNativeNodeOnWillScroll(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeOnDidScroll(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeOnWillDidScroll(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeOnReachStart(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeOnReachEnd(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeScrollBy001(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeScrollBy002(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeScrollBy003(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeScrollBy004(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeScrollBy005(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeScrollBy006(ani_env* env, ani_object info, ani_object NodeContent);
    static std::vector<int32_t> g_OnScrollStart;
    static std::vector<int32_t> g_OnScrollEnd;
    static ani_object GetOnWillDidData(ani_env* env, ani_object info);
};
} // namespace ArkUIAniTest
#endif // ARKUI_CAPI_XTS_SCROLL_SCROLL_EVENT_TEST_H
