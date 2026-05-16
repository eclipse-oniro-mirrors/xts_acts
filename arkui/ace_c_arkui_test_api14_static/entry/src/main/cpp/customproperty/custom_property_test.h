/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKUI_CAPI_XTS_CUSTOM_PROPERTY_TEST_H
#define ARKUI_CAPI_XTS_CUSTOM_PROPERTY_TEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "ani/ani.h"

namespace ArkUICapiTest {

class CustomPropertyTest {
public:
    ~CustomPropertyTest();
    static void testGetCustomProperty001(ani_env* env, ani_object info, ani_object NodeContent);
    static void testGetParentInPageTree002(ani_env* env, ani_object info, ani_object NodeContent);
    static void testGetActiveChildrenInfo003(ani_env* env, ani_object info, ani_object NodeContent);
    static void testGetCurrentPageRootNode004(ani_env* env, ani_object info, ani_object NodeContent);
    static void testIsCreatedByNDK005(ani_env* env, ani_object info, ani_object NodeContent);
    static void testGetNodeType006(ani_env* env, ani_object info, ani_object NodeContent);
    static void testCustomPropertyDestroy007(ani_env* env, ani_object info, ani_object NodeContent);
    static void testCustomPropertyGetStringValue008(ani_env* env, ani_object info, ani_object NodeContent);
    static void testActiveChildrenInfoDestroy009(ani_env* env, ani_object info, ani_object NodeContent);
    static void testActiveChildrenInfoGetNodeByIndex010(ani_env* env, ani_object info, ani_object NodeContent);
    static void testActiveChildrenInfoGetCount011(ani_env* env, ani_object info, ani_object NodeContent);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_CUSTOM_PROPERTY_TEST_H
