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

#ifndef RELATIONALSTORETESTAPI20_RELATIONSTOREBUCKETSTEST_H
#define RELATIONALSTORETESTAPI20_RELATIONSTOREBUCKETSTEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

extern int g_bucketsInvalidParamCode;

void AddRelationStoreBucketsTest(std::vector<napi_property_descriptor>& descData);

napi_value TestDestroyInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestPutRowInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutRowsInvalidParam(napi_env env, napi_callback_info info);
napi_value TestRowCountInvalidParam(napi_env env, napi_callback_info info);

#endif //RELATIONALSTORETESTAPI20_RELATIONSTOREBUCKETSTEST_H
