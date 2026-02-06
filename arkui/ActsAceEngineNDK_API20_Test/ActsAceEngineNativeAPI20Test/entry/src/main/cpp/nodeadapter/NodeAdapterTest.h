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
#ifndef NODEADAPTER_TEST_H
#define NODEADAPTER_TEST_H

#include <napi/native_api.h>
#include <arkui/native_node.h>
#include "common/Common.h"

namespace NodeAdapterTest {

    napi_value SetTotalNodeCountTest_001(napi_env env, napi_callback_info info);
    napi_value SetTotalNodeCountTest_002(napi_env env, napi_callback_info info);
    napi_value RegisterEventReceiverTest_001(napi_env env, napi_callback_info info);
    napi_value ReloadAllItemsTest_001(napi_env env, napi_callback_info info);
    napi_value ReloadAllItemsTest_002(napi_env env, napi_callback_info info);
    napi_value ReloadItemTest_001(napi_env env, napi_callback_info info);
    napi_value ReloadItemTest_002(napi_env env, napi_callback_info info);
    napi_value RemoveItemTest_001(napi_env env, napi_callback_info info);
    napi_value RemoveItemTest_002(napi_env env, napi_callback_info info);
    napi_value InsertItemTest_001(napi_env env, napi_callback_info info);
    napi_value InsertItemTest_002(napi_env env, napi_callback_info info);
    napi_value MoveItemTest_001(napi_env env, napi_callback_info info);
    napi_value MoveItemTest_002(napi_env env, napi_callback_info info);
    napi_value GetAllItemsTest_001(napi_env env, napi_callback_info info);
    napi_value GetAllItemsTest_002(napi_env env, napi_callback_info info);
    napi_value SetItemTest_001(napi_env env, napi_callback_info info);
    napi_value SetItemTest_002(napi_env env, napi_callback_info info);
    napi_value SetNodeIdTest_001(napi_env env, napi_callback_info info);
    napi_value SetNodeIdTest_002(napi_env env, napi_callback_info info);
    napi_value CreateAdapterNode(napi_env env, napi_callback_info info);

}

#endif // NODEADAPTER_TEST_H