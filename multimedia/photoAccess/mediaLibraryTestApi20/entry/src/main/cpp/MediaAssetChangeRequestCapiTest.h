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

#ifndef MEDIALIBRARYTESTAPI20_MEDIAASSETCHANGEREQUESTCAPITEST_H
#define MEDIALIBRARYTESTAPI20_MEDIAASSETCHANGEREQUESTCAPITEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <multimedia/media_library/media_access_helper_capi.h>
#include <multimedia/media_library/media_asset_change_request_capi.h>
#include <napi/native_api.h>
#include <sys/stat.h>
#include <vector>

void AddMediaAssetChangeRequestCapiTest(std::vector<napi_property_descriptor> &descData);

napi_value TestOhMediaAssetChangeRequestAddResourceWithUriParameterError(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestAddResourceWithBufferParameterError(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestGetWriteCacheHandlerParameterError(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestSaveCameraPhotoParameterError(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestDiscardCameraPhotoParameterError(napi_env env, napi_callback_info info);

#endif // MEDIALIBRARYTESTAPI20_MEDIAASSETCHANGEREQUESTCAPITEST_H