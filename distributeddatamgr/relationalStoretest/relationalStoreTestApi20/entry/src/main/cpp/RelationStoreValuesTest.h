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

#ifndef RELATIONALSTORETESTAPI20_RELATIONSTOREVALUESTEST_H
#define RELATIONALSTORETESTAPI20_RELATIONSTOREVALUESTEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

extern int g_valuesInvalidParamCode;
extern int g_valuesTypeNull;
extern int g_valuesTypeMismatch;

void AddRelationStoreValuesTest(std::vector<napi_property_descriptor>& descData);

napi_value TestDestroyInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutNullInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutIntInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutRealInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutTextInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutBlobInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutAssetInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutAssetsInvalidParam(napi_env env, napi_callback_info info);
napi_value TestPutUnlimitedIntInvalidParam(napi_env env, napi_callback_info info);
napi_value TestCountInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetTypeInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetInvalidParam(napi_env env, napi_callback_info info);
napi_value TestIsNullInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetIntInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetIntTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetIntTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetRealInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetRealTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetRealTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetTextInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetTextTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetTextTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetBlobInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetBlobTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetBlobTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetAssetInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetAssetTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetAssetTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetAssetsCountInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetAssetsCountTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetAssetsCountTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetAssetsInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetAssetsTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetAssetsTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorCountInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorCountTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorCountTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetFloatVectorTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntBandInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntBandTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntBandTypeNullA(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntInvalidParamA(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntTypeMismatchA(napi_env env, napi_callback_info info);
napi_value TestGetUnlimitedIntTypeNullA(napi_env env, napi_callback_info info);

#endif //RELATIONALSTORETESTAPI20_RELATIONSTOREVALUESTEST_H