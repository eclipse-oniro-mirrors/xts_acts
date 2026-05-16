/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef CAPIDEMO_TIME_PICKER_TEST_H
#define CAPIDEMO_TIME_PICKER_TEST_H
#include "../common/common.h"

namespace ArkUICapiTest {

class TimePickerTest {
public:
    ~TimePickerTest();
    static napi_value TimePickerTestEnableCascade(napi_env env, napi_callback_info info);
};
} // namespace ArkUICApiDemo

#endif //CAPIDEMO_TIME_PICKER_TEST_H

