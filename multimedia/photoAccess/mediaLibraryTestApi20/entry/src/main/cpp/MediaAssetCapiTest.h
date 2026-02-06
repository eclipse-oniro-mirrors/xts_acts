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

#ifndef MEDIALIBRARYTESTAPI20_MEDIAASSETCAPITEST_H
#define MEDIALIBRARYTESTAPI20_MEDIAASSETCAPITEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <multimedia/media_library/media_access_helper_capi.h>
#include <multimedia/media_library/media_asset_change_request_capi.h>
#include <napi/native_api.h>
#include <sys/stat.h>
#include <vector>

void AddMediaAssetCapiTest(std::vector<napi_property_descriptor> &descData);

napi_value TestOhMediaAsset(napi_env env, napi_callback_info info);

napi_value TestOhMediaAssetGetUriOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetMediaTypeOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetMediaSubTypeOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetDisplayNameOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetSizeOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetDateAddedOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetDateModifiedOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetDateTakenOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetDateAddedMsOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetDateModifiedMsOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetDurationOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetWidthOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetHeightOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetOrientationOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetIsFavoriteOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetGetTitleOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetReleaseOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaLibraryImageOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaLibraryDefaultOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestAddResourceWithUriNotSuchFile(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestGetWriteCacheHandlerNoAuthority(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestReleaseOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetManagerRequestMovingPhotoOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetManagerRequestImageOk(napi_env env, napi_callback_info info);
napi_value TestOhMovingPhotoGetUriOk(napi_env env, napi_callback_info info);
napi_value TestOhMovingPhotoRequestContentWithUrisOk(napi_env env, napi_callback_info info);
napi_value TestOhMovingPhotoRequestContentWithUriOk(napi_env env, napi_callback_info info);
napi_value TestOhMovingPhotoRequestContentWithBufferOk(napi_env env, napi_callback_info info);
napi_value TestOhMovingPhotoReleaseOk(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestAddResourceWithBufferNotSupported(napi_env env, napi_callback_info info);
napi_value TestOhMediaAssetChangeRequestAddResourceWithUriNotSupported(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryQualityFast(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryQualityFull(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryCompressed(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryPictureObject(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryMovingPhoto(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryRust(napi_env env, napi_callback_info info);
napi_value TestOhMediaAccessHelperApplyChangesOk(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryHighQualityMode(napi_env env, napi_callback_info info);
napi_value TestMediaLibraryBalancedMode(napi_env env, napi_callback_info info);
#endif //MEDIALIBRARYTESTAPI20_MEDIAASSETCAPITEST_H