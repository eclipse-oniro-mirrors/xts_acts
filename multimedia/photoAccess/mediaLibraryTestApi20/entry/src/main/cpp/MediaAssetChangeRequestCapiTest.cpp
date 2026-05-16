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

#include "MediaAssetChangeRequestCapiTest.h"
#include "napi/native_api.h"
#include <cstdint>
#include <js_native_api_types.h>
#include <multimedia/media_library/media_access_helper_capi.h>
#include <multimedia/media_library/media_asset_change_request_capi.h>
#include <multimedia/media_library/media_asset_manager_capi.h>
#include <napi/native_api.h>

void AddMediaAssetChangeRequestCapiTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhMediaAssetChangeRequestAddResourceWithUriParameterError", nullptr,
                        TestOhMediaAssetChangeRequestAddResourceWithUriParameterError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestAddResourceWithBufferParameterError", nullptr,
                        TestOhMediaAssetChangeRequestAddResourceWithBufferParameterError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestGetWriteCacheHandlerParameterError", nullptr,
                        TestOhMediaAssetChangeRequestGetWriteCacheHandlerParameterError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestSaveCameraPhotoParameterError", nullptr,
                        TestOhMediaAssetChangeRequestSaveCameraPhotoParameterError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestDiscardCameraPhotoParameterError", nullptr,
                        TestOhMediaAssetChangeRequestDiscardCameraPhotoParameterError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

napi_value TestOhMediaAssetChangeRequestAddResourceWithUriParameterError(napi_env env, napi_callback_info info)
{
    char fileUri[200] =
        "file://com.example.myapplication.MainAbility/data/storage/el2/base/haps/entry/files/non_exist_uri.mp4";
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    int ret = OH_MediaAssetChangeRequest_AddResourceWithUri(nullptr, resourceType, fileUri);
    napi_value result;
    napi_create_int32(env, ret == MediaLibrary_ErrorCode::MEDIA_LIBRARY_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value TestOhMediaAssetChangeRequestAddResourceWithBufferParameterError(napi_env env, napi_callback_info info)
{
    uint32_t length = 1024;
    uint8_t *buffer = new uint8_t[length];
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    int ret = OH_MediaAssetChangeRequest_AddResourceWithBuffer(nullptr, resourceType, buffer, length);
    napi_value result;
    napi_create_int32(env, ret == MediaLibrary_ErrorCode::MEDIA_LIBRARY_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value TestOhMediaAssetChangeRequestGetWriteCacheHandlerParameterError(napi_env env, napi_callback_info info)
{
    int32_t fd = 0;
    int ret = OH_MediaAssetChangeRequest_GetWriteCacheHandler(nullptr, &fd);
    napi_value result;
    napi_create_int32(env, ret == MediaLibrary_ErrorCode::MEDIA_LIBRARY_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value TestOhMediaAssetChangeRequestSaveCameraPhotoParameterError(napi_env env, napi_callback_info info)
{
    MediaLibrary_ImageFileType imageFileType = MEDIA_LIBRARY_IMAGE_JPEG ;
    int ret = OH_MediaAssetChangeRequest_SaveCameraPhoto(nullptr, imageFileType);
    napi_value result;
    napi_create_int32(env, ret == MediaLibrary_ErrorCode::MEDIA_LIBRARY_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

napi_value TestOhMediaAssetChangeRequestDiscardCameraPhotoParameterError(napi_env env, napi_callback_info info)
{
    int ret = OH_MediaAssetChangeRequest_DiscardCameraPhoto(nullptr);
    napi_value result;
    napi_create_int32(env, ret == MediaLibrary_ErrorCode::MEDIA_LIBRARY_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}