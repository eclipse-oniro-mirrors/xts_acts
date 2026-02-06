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
 *//*
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

#ifndef RELATIONALSTORETESTAPI20_RELATIONALSTORETEST_H
#define RELATIONALSTORETESTAPI20_RELATIONALSTORETEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void AddRelationalStoreTest(std::vector<napi_property_descriptor>& descData);

napi_value GetURISuccess(napi_env env, napi_callback_info info);
napi_value GetPathSuccess(napi_env env, napi_callback_info info);
napi_value GetCreateTimeSuccess(napi_env env, napi_callback_info info);
napi_value GetModifyTimeSuccess(napi_env env, napi_callback_info info);
napi_value GetSizeSuccess(napi_env env, napi_callback_info info);
napi_value GetStatusSuccess(napi_env env, napi_callback_info info);
napi_value GetDestroyOneSuccess(napi_env env, napi_callback_info info);

#endif //RELATIONALSTORETESTAPI20_RELATIONALSTORETEST_H
