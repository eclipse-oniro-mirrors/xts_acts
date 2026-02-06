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

#ifndef ARKUI_CAPI_XTS_DATEPICKER_ENABLED_TEST_H
#define ARKUI_CAPI_XTS_DATEPICKER_ENABLED_TEST_H

#include "ani/ani.h"
#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUIAniTest {

#define FOCUSABLE_TRUE 1
#define SIZE_70 70
#define SIZE_1 1

class DatePickerEnabledTest {
public:
    ~DatePickerEnabledTest();
    static void CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent);
};
} // namespace ArkUIAniTest
#endif // ARKUI_CAPI_XTS_DATEPICKER_ENABLED_TEST_H
