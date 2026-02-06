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
#ifndef ARKUI_CAPI_XTS_GESTURERECOGNIZER_TEST_H
#define ARKUI_CAPI_XTS_GESTURERECOGNIZER_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>

#include "../common/common.h"

namespace ArkUIAniTest {

class GestureRecognizerTest {
public:
    ~GestureRecognizerTest();
    static void TestGestureRecognizerFinger001(ani_env* env, ani_object info, ani_object NodeContent);
    static ani_object GetResult(ani_env* env, ani_object info);
    static std::vector<int32_t> result;
};
} // namespace ArkUIAniTest
#endif // ARKUI_CAPI_XTS_DRAG_TEST_H