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
 
#ifndef ARKUI_CAPI_XTS_LAYOUT_MANAGER_TEST_H
#define ARKUI_CAPI_XTS_LAYOUT_MANAGER_TEST_H

#include <napi/native_api.h>
#include "common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class LayoutManagerTest {
public:
    ~LayoutManagerTest();
    static napi_value LayoutManagerTest001(napi_env env, napi_callback_info info);
    static napi_value LayoutManagerTest002(napi_env env, napi_callback_info info);
    static napi_value LayoutManagerTest003(napi_env env, napi_callback_info info);
    static napi_value LayoutManagerTest004(napi_env env, napi_callback_info info);
    static napi_value LayoutManagerTest005(napi_env env, napi_callback_info info);
    static napi_value LayoutManagerTest006(napi_env env, napi_callback_info info);
    static napi_value LayoutManagerTest007(napi_env env, napi_callback_info info);
    static napi_value LayoutManagerTest008(napi_env env, napi_callback_info info);
};

} // namespace ArkUICapiTest

#endif // ARKUI_CAPI_XTS_LAYOUT_MANAGER_TEST_H