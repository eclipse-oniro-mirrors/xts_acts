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
#ifndef ARKUI_CAPI_XTS_LAZYFOREACH_EXPANDMODE_TEST_H
#define ARKUI_CAPI_XTS_LAZYFOREACH_EXPANDMODE_TEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "ani/ani.h"

namespace ArkUIAniTest {

class LazyForEachExpandModeTest {
public:
    ~LazyForEachExpandModeTest();
    static void testLazyForEachExpandMode001(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode002(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode003(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode004(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode005(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode006(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode007(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode008(ani_env* env, ani_object info, ani_object NodeContent);
    static void testLazyForEachExpandMode009(ani_env* env, ani_object info, ani_object NodeContent);
};
} // namespace ArkUIAniTest
#endif // ARKUI_CAPI_XTS_LAZYFOREACH_EXPANDMODE_TEST_H