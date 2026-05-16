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

#ifndef RELATIONALSTORETESTAPI20_RELATIONSTOREVALUETEST_H
#define RELATIONALSTORETESTAPI20_RELATIONSTOREVALUETEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

extern int g_valueInvalidParamCode;
extern int g_valueTypeNull;
extern int g_valueTypeMismatch;

void AddRelationStoreValueTest(std::vector<napi_property_descriptor>& descData);

napi_value Destroy(napi_env env, napi_callback_info info);
napi_value PutNull(napi_env env, napi_callback_info info);
napi_value PutReal(napi_env env, napi_callback_info info);
napi_value PutText(napi_env env, napi_callback_info info);
napi_value PutBlob(napi_env env, napi_callback_info info);
napi_value PutAsset(napi_env env, napi_callback_info info);
napi_value PutAssets(napi_env env, napi_callback_info info);
napi_value PutUnlimitedInt(napi_env env, napi_callback_info info);
napi_value GetType(napi_env env, napi_callback_info info);
napi_value IsNull(napi_env env, napi_callback_info info);
napi_value TestGetIntInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetIntTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetIntDataTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetRealInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetTextInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetTextTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetTextDataTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetBlobInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetBlobTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetBlobDataTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetAssetInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetAssetTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetAssetDataTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetAssetsCountInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetAssetsCountTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetAssetsCountDataTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetAssetsInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetAssetsTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetAssetsDataTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorCountInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorCountTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorCountTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntBandInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntBandTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntBandTypeNull(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntTypeMismatch(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntTypeNull(napi_env env, napi_callback_info info);

#endif //RELATIONALSTORETESTAPI20_RELATIONSTOREVALUETEST_H
