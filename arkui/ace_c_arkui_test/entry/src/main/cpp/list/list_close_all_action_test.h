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

#ifndef ARKUI_CAPI_DEMO_LIST_CLOSE_ALL_ACTION_TEST_H
#define ARKUI_CAPI_DEMO_LIST_CLOSE_ALL_ACTION_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

#include "column_component.h"
#include "common/common.h"
#include "list_component.h"
#include "text_component.h"

namespace ArkUICapiTest {
#define SIZE_1000 1000

class ListCloseAllTest {
public:
    ~ListCloseAllTest();
    static napi_value CreateNativeNodeCloseAll(napi_env env, napi_callback_info info);
    static napi_value GetRetData(napi_env env, napi_callback_info info);

    static std::vector<int32_t> retData;

private:
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_DEMO_LIST_CLOSE_ALL_ACTION_TEST_H
