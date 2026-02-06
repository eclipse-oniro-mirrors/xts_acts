/* Copyright (c) 2025 Huawei Device Co., Ltd.
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



#include "ani/ani.h"
#include "common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class LayoutCallbackOnNodeHandleTest {
public:
    ~LayoutCallbackOnNodeHandleTest();
    static ani_int LayoutCallbackOnNodeHandleTest_a(ani_env* env, ani_object info);
    static ani_int LayoutCallbackOnNodeHandleTest_a1(ani_env* env, ani_object info);
    static ani_int LayoutCallbackOnNodeHandleTest_b(ani_env* env, ani_object info);
    static ani_int LayoutCallbackOnNodeHandleTest_b1(ani_env* env, ani_object info);
    static ani_int LayoutCallbackOnNodeHandleTest_c(ani_env* env, ani_object info);
    static ani_int LayoutCallbackOnNodeHandleTest_d(ani_env* env, ani_object info);
    static ani_int LayoutCallbackOnNodeHandleTest_c1(ani_env* env, ani_object info);
    static ani_int LayoutCallbackOnNodeHandleTest_d1(ani_env* env, ani_object info);
};
} // namespace ArkUICapiTest