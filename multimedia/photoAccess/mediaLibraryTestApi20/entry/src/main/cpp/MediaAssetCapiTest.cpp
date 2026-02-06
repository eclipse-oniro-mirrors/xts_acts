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

#include "MediaAssetCapiTest.h"
#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <multimedia/media_library/media_access_helper_capi.h>
#include <multimedia/media_library/media_asset_capi.h>
#include <multimedia/media_library/media_asset_change_request_capi.h>
#include <multimedia/media_library/media_asset_manager_capi.h>
#include <multimedia/media_library/moving_photo_capi.h>
#include <napi/native_api.h>
#include <ohcamera/camera_manager.h>
#include <ohcamera/photo_output.h>
#include <string>
#include <thread>

#define NO_PRECONFIG_MODE 1
#define TYPE_PRECONFIG_MODE 2
#define TYPE_RATIO_PRECONFIG_MODE 3

int g_uriRet = -1;
int g_mediaTypeRet = -1;
int g_mediaSubTypeRet = -1;
int g_displayNameRet = -1;
int g_sizeRet = -1;
int g_dateAddedRet = -1;
int g_dateModifiedRet = -1;
int g_dateTakenRet = -1;
int g_dateAddedMsRet = -1;
int g_dateModifiedMsRet = -1;
int g_durationRet = -1;
int g_widthRet = -1;
int g_heightRet = -1;
int g_orientationRet = -1;
int g_isFavoriteRet = -1;
int g_titleRet = -1;
int g_releaseRet = -1;
int g_mediaType = -1;
int g_mediaSubType = -1;
int g_noSuchFile = -1;
int g_noAuthority = -1;
int g_releaseOk = -1;
int g_requestMovingPhotoOk = -1;
int g_requestImageOk = -1;
int g_requestImageOneOk = -1;
int g_requestImageTwoOk = -1;
int g_movingPhotoUriOk = -1;
int g_requestContentWithUrisOk = -1;
int g_requestContentWithUriOk = -1;
int g_requestContentWithBufferOk = -1;
int g_movingPhotoReleaseOk = -1;
int g_addResourceWithBufferNotSupported = -1;
int g_addResourceWithUriNotSupported = -1;
int g_imageCheck = -1;
int g_mediaSubTypeCheck = -1;
int g_applyChanges = -1;
const char *GLOBAL_MEDIA_ASSET_URI = nullptr;

void AddMediaAssetCapiTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back(
        {"testOhMediaAsset", nullptr, TestOhMediaAsset, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetUriOk", nullptr, TestOhMediaAssetGetUriOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetMediaTypeOk", nullptr, TestOhMediaAssetGetMediaTypeOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetMediaSubTypeOk", nullptr, TestOhMediaAssetGetMediaSubTypeOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetDisplayNameOk", nullptr, TestOhMediaAssetGetDisplayNameOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetSizeOk", nullptr, TestOhMediaAssetGetSizeOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetDateAddedOk", nullptr, TestOhMediaAssetGetDateAddedOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetDateModifiedOk", nullptr, TestOhMediaAssetGetDateModifiedOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetDateTakenOk", nullptr, TestOhMediaAssetGetDateTakenOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetDateAddedMsOk", nullptr, TestOhMediaAssetGetDateAddedMsOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetDateModifiedMsOk", nullptr, TestOhMediaAssetGetDateModifiedMsOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetDurationOk", nullptr, TestOhMediaAssetGetDurationOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetWidthOk", nullptr, TestOhMediaAssetGetWidthOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetHeightOk", nullptr, TestOhMediaAssetGetHeightOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetOrientationOk", nullptr, TestOhMediaAssetGetOrientationOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetIsFavoriteOk", nullptr, TestOhMediaAssetIsFavoriteOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetGetTitleOk", nullptr, TestOhMediaAssetGetTitleOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetReleaseOk", nullptr, TestOhMediaAssetReleaseOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

void AddMediaAssetCapiTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhMediaLibraryImageOk", nullptr, TestOhMediaLibraryImageOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaLibraryDefaultOk", nullptr, TestOhMediaLibraryDefaultOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestAddResourceWithUriNotSuchFile", nullptr,
                        TestOhMediaAssetChangeRequestAddResourceWithUriNotSuchFile, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestGetWriteCacheHandlerNoAuthority", nullptr,
                        TestOhMediaAssetChangeRequestGetWriteCacheHandlerNoAuthority, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestReleaseOk", nullptr, TestOhMediaAssetChangeRequestReleaseOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetManagerRequestMovingPhotoOk", nullptr,
                        TestOhMediaAssetManagerRequestMovingPhotoOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAssetManagerRequestImageOk", nullptr, TestOhMediaAssetManagerRequestImageOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMovingPhotoGetUriOk", nullptr, TestOhMovingPhotoGetUriOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMovingPhotoRequestContentWithUrisOk", nullptr, TestOhMovingPhotoRequestContentWithUrisOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMovingPhotoRequestContentWithUriOk", nullptr, TestOhMovingPhotoRequestContentWithUriOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMovingPhotoRequestContentWithBufferOk", nullptr,
                        TestOhMovingPhotoRequestContentWithBufferOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMovingPhotoReleaseOk", nullptr, TestOhMovingPhotoReleaseOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

void AddMediaAssetCapiTest3(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhMediaAssetChangeRequestAddResourceWithBufferNotSupported", nullptr,
                        TestOhMediaAssetChangeRequestAddResourceWithBufferNotSupported, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOhMediaAssetChangeRequestAddResourceWithUriNotSupported", nullptr,
                        TestOhMediaAssetChangeRequestAddResourceWithUriNotSupported, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testMediaLibraryQualityFast", nullptr, TestMediaLibraryQualityFast, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testMediaLibraryQualityFull", nullptr, TestMediaLibraryQualityFull, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testMediaLibraryCompressed", nullptr, TestMediaLibraryCompressed, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testMediaLibraryPictureObject", nullptr, TestMediaLibraryPictureObject, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testMediaLibraryMovingPhoto", nullptr, TestMediaLibraryMovingPhoto, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testMediaLibraryRust", nullptr, TestMediaLibraryRust, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMediaAccessHelperApplyChangesOk", nullptr, TestOhMediaAccessHelperApplyChangesOk,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testMediaLibraryHighQualityMode", nullptr, TestMediaLibraryHighQualityMode, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testMediaLibraryBalancedMode", nullptr, TestMediaLibraryBalancedMode, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

void AddMediaAssetCapiTest(std::vector<napi_property_descriptor> &descData)
{
    AddMediaAssetCapiTest1(descData);
    AddMediaAssetCapiTest2(descData);
    AddMediaAssetCapiTest3(descData);
}

static void HandleMovingPhotoUri(OH_MovingPhoto *movingPhoto)
{
    const char *uri = nullptr;
    g_movingPhotoUriOk = OH_MovingPhoto_GetUri(movingPhoto, &uri);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MovingPhoto_GetUri uri :%{public}s", uri);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MovingPhoto_GetUri g_movingPhotoUriOk :%{public}d",
                 g_movingPhotoUriOk);
}

static void HandleRequestContentWithUris(OH_MovingPhoto *movingPhoto)
{
    char imageUri[1024] = {0};
    char videoUri[1024] = {0};
    g_requestContentWithUrisOk = OH_MovingPhoto_RequestContentWithUris(movingPhoto, imageUri, videoUri);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia",
                 "OH_MovingPhoto_RequestContentWithUris g_requestContentWithUrisOk :%{public}d",
                 g_requestContentWithUrisOk);
}

static void HandleRequestContentWithUri(OH_MovingPhoto *movingPhoto)
{
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    char uri[1024] = {0};
    g_requestContentWithUriOk = OH_MovingPhoto_RequestContentWithUri(movingPhoto, resourceType, uri);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia",
                 "OH_MovingPhoto_RequestContentWithUri g_requestContentWithUriOk :%{public}d",
                 g_requestContentWithUriOk);
}

static void HandleRequestContentWithBuffer(OH_MovingPhoto *movingPhoto)
{
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    uint32_t size = 10;
    uint8_t *contentBuffer = nullptr;
    contentBuffer = new uint8_t[size];
    const uint8_t **buffer = const_cast<const uint8_t **>(&contentBuffer);
    g_requestContentWithBufferOk = OH_MovingPhoto_RequestContentWithBuffer(movingPhoto, resourceType, buffer, &size);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia",
                 "OH_MovingPhoto_RequestContentWithBuffer g_requestContentWithBufferOk :%{public}d",
                 g_requestContentWithBufferOk);
}

static void HandleMovingRelease(OH_MovingPhoto *movingPhoto)
{
    g_movingPhotoReleaseOk = OH_MovingPhoto_Release(movingPhoto);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MovingPhoto_Release g_movingPhotoReleaseOk :%{public}d",
                 g_movingPhotoReleaseOk);
}

void OnMovingPhotoDataPreparedCallBack(MediaLibrary_ErrorCode result, MediaLibrary_RequestId requestId,
                                       MediaLibrary_MediaQuality mediaQuality, MediaLibrary_MediaContentType type,
                                       OH_MovingPhoto *movingPhoto)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OnMovingPhotoDataPreparedCallBack ===========");
    HandleMovingPhotoUri(movingPhoto);
    HandleRequestContentWithUris(movingPhoto);
    HandleRequestContentWithUri(movingPhoto);
    HandleRequestContentWithBuffer(movingPhoto);
    HandleMovingRelease(movingPhoto);
}

void OnImageDataPreparedCallBack(MediaLibrary_ErrorCode result, MediaLibrary_RequestId requestId,
                                 MediaLibrary_MediaQuality mediaQuality, MediaLibrary_MediaContentType type,
                                 OH_ImageSourceNative *imageSourceNative)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OnImageDataPreparedCallBack ===========");
    MediaLibrary_MediaQuality checkQuality = MEDIA_LIBRARY_QUALITY_FULL;
    if (mediaQuality == checkQuality) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, "multimedia",
                     "OnImageDataPreparedCallBack mediaQuality MEDIA_LIBRARY_QUALITY_FULL");
    }
    checkQuality = MEDIA_LIBRARY_QUALITY_FAST;
    if (mediaQuality == checkQuality) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, "multimedia",
                     "OnImageDataPreparedCallBack mediaQuality MEDIA_LIBRARY_QUALITY_FAST");
    }

    MediaLibrary_MediaContentType checkContentType = MEDIA_LIBRARY_COMPRESSED;

    if (type == checkContentType) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, "multimedia",
                     "OnImageDataPreparedCallBack type MEDIA_LIBRARY_COMPRESSED");
    }
    checkContentType = MEDIA_LIBRARY_PICTURE_OBJECT;
    if (type == checkContentType) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, "multimedia",
                     "OnImageDataPreparedCallBack type MEDIA_LIBRARY_PICTURE_OBJECT");
    }

    g_imageCheck = 0;
}

static void HandleUri(OH_MediaAsset *photoAsset)
{
    const char *uri = nullptr;
    g_uriRet = OH_MediaAsset_GetUri(photoAsset, &uri);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetUri uri :%{public}s", uri);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetUri g_uriRet :%{public}d", g_uriRet);
    GLOBAL_MEDIA_ASSET_URI = uri;
}

static void HandleNoSuchFile(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetChangeRequest *changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    char fileUri[200] =
        "file://com.example.myapplication.MainAbility/data/storage/el2/base/haps/entry/files/non_exist_uri.mp4";
    g_noSuchFile = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest, resourceType, fileUri);
    OH_MediaAssetChangeRequest_Release(changeRequest);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAssetChangeRequest_AddResourceWithUri  :%{public}d",
                 g_noSuchFile);
}

static void HandleNoAuthority(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetChangeRequest *changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    int32_t fd = 0;
    g_noAuthority = OH_MediaAssetChangeRequest_GetWriteCacheHandler(changeRequest, &fd);
    OH_MediaAssetChangeRequest_Release(changeRequest);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia",
                 "OH_MediaAssetChangeRequest_GetWriteCacheHandler  :%{public}d", g_noAuthority);
}

static void HandleApplyChanges(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetChangeRequest *changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    char *fileUri = const_cast<char *>(GLOBAL_MEDIA_ASSET_URI);
    OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest, resourceType, fileUri);
    g_applyChanges = OH_MediaAccessHelper_ApplyChanges(changeRequest);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAccessHelper_ApplyChanges:%{public}d",
                 g_applyChanges);
    OH_MediaAssetChangeRequest_Release(changeRequest);
}

static void HandleReleaseOk(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetChangeRequest *changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    g_releaseOk = OH_MediaAssetChangeRequest_Release(changeRequest);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAssetChangeRequest_Release  :%{public}d",
                 g_releaseOk);
}

static void HandleRequestMovingPhoto(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetManager *manager = OH_MediaAssetManager_Create();
    MediaLibrary_RequestOptions requestOptions;
    requestOptions.deliveryMode = MediaLibrary_DeliveryMode::MEDIA_LIBRARY_BALANCED_MODE;
    MediaLibrary_RequestId requestId;
    g_requestMovingPhotoOk = OH_MediaAssetManager_RequestMovingPhoto(manager, photoAsset, requestOptions, &requestId,
                                                                     OnMovingPhotoDataPreparedCallBack);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAssetManager_RequestMovingPhoto  :%{public}d",
                 g_requestMovingPhotoOk);
}

static void HandleRequestImage(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetManager *manager = OH_MediaAssetManager_Create();
    MediaLibrary_RequestOptions requestOptions;
    requestOptions.deliveryMode = MediaLibrary_DeliveryMode::MEDIA_LIBRARY_BALANCED_MODE;
    MediaLibrary_RequestId requestId;
    g_requestImageOk =
        OH_MediaAssetManager_RequestImage(manager, photoAsset, requestOptions, &requestId, OnImageDataPreparedCallBack);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAssetManager_RequestImage  :%{public}d",
                 g_requestImageOk);
}

static void HandleRequestImageOne(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetManager *manager = OH_MediaAssetManager_Create();
    MediaLibrary_RequestOptions requestOptions;
    requestOptions.deliveryMode = MediaLibrary_DeliveryMode::MEDIA_LIBRARY_HIGH_QUALITY_MODE;
    MediaLibrary_RequestId requestId;
    g_requestImageOneOk =
        OH_MediaAssetManager_RequestImage(manager, photoAsset, requestOptions, &requestId, OnImageDataPreparedCallBack);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAssetManager_RequestImage One :%{public}d",
                 g_requestImageOneOk);
}

static void HandleRequestImageTwo(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetManager *manager = OH_MediaAssetManager_Create();
    MediaLibrary_RequestOptions requestOptions;
    requestOptions.deliveryMode = MediaLibrary_DeliveryMode::MEDIA_LIBRARY_BALANCED_MODE;
    MediaLibrary_RequestId requestId;
    g_requestImageTwoOk =
        OH_MediaAssetManager_RequestImage(manager, photoAsset, requestOptions, &requestId, OnImageDataPreparedCallBack);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAssetManager_RequestImage Two :%{public}d",
                 g_requestImageTwoOk);
}

static void HandleAddResourceWithBuffer(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetChangeRequest *changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    uint32_t length = 1024;
    uint8_t *buffer = new uint8_t[length];
    int ret = OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest, resourceType, buffer, length);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia",
                 "OH_MediaAssetChangeRequest_AddResourceWithBuffer  :%{public}d", ret);
    MediaLibrary_ResourceType resourceType1 = MEDIA_LIBRARY_IMAGE_RESOURCE;
    uint32_t length1 = 1024;
    uint8_t *buffer1 = new uint8_t[length1];
    g_addResourceWithBufferNotSupported =
        OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest, resourceType1, buffer1, length1);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia",
                 "OH_MediaAssetChangeRequest_AddResourceWithBuffer111  :%{public}d",
                 g_addResourceWithBufferNotSupported);
}

static void HandleAddResourceWithUri(OH_MediaAsset *photoAsset)
{
    OH_MediaAssetChangeRequest *changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    char *fileUri = const_cast<char *>(GLOBAL_MEDIA_ASSET_URI);
    int ret = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest, resourceType, fileUri);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAssetChangeRequest_AddResourceWithUri  :%{public}d",
                 ret);
    MediaLibrary_ResourceType resourceType1 = MEDIA_LIBRARY_IMAGE_RESOURCE;
    char *fileUri1 = const_cast<char *>(GLOBAL_MEDIA_ASSET_URI);
    g_addResourceWithUriNotSupported =
        OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest, resourceType1, fileUri1);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia",
                 "OH_MediaAssetChangeRequest_AddResourceWithUri111  :%{public}d", g_addResourceWithUriNotSupported);
}

static void HandleMediaType(OH_MediaAsset *photoAsset)
{
    MediaLibrary_MediaType mediaType;
    g_mediaTypeRet = OH_MediaAsset_GetMediaType(photoAsset, &mediaType);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetMediaType mediaType :%{public}d",
                 mediaType);
}

static void HandleMediaSubType(OH_MediaAsset *photoAsset)
{
    MediaLibrary_MediaSubType mediaSubType;
    g_mediaSubTypeRet = OH_MediaAsset_GetMediaSubType(photoAsset, &mediaSubType);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetMediaSubType mediaSubType :%{public}d",
                 mediaSubType);
}

static void HandleDisplayName(OH_MediaAsset *photoAsset)
{
    const char *displayName = nullptr;
    g_displayNameRet = OH_MediaAsset_GetDisplayName(photoAsset, &displayName);
}

static void HandleSize(OH_MediaAsset *photoAsset)
{
    uint32_t size = 0;
    g_sizeRet = OH_MediaAsset_GetSize(photoAsset, &size);
}

static void HandleDateAdded(OH_MediaAsset *photoAsset)
{
    uint32_t dateAdded = 0;
    g_dateAddedRet = OH_MediaAsset_GetDateAdded(photoAsset, &dateAdded);
}

static void HandleDateModified(OH_MediaAsset *photoAsset)
{
    uint32_t dateModified = 0;
    g_dateModifiedRet = OH_MediaAsset_GetDateModified(photoAsset, &dateModified);
}

static void HandleDateTaken(OH_MediaAsset *photoAsset)
{
    uint32_t dateTaken = 0;
    g_dateTakenRet = OH_MediaAsset_GetDateTaken(photoAsset, &dateTaken);
}

static void HandleDateAddedMs(OH_MediaAsset *photoAsset)
{
    uint32_t dateAddedMs = 0;
    g_dateAddedMsRet = OH_MediaAsset_GetDateAddedMs(photoAsset, &dateAddedMs);
}

static void HandleDateModifiedMs(OH_MediaAsset *photoAsset)
{
    uint32_t dateModifiedMs = 0;
    g_dateModifiedMsRet = OH_MediaAsset_GetDateModifiedMs(photoAsset, &dateModifiedMs);
}

static void HandleDuration(OH_MediaAsset *photoAsset)
{
    uint32_t duration = 0;
    g_durationRet = OH_MediaAsset_GetDuration(photoAsset, &duration);
}

static void HandleWidth(OH_MediaAsset *photoAsset)
{
    uint32_t width = 0;
    g_widthRet = OH_MediaAsset_GetWidth(photoAsset, &width);
}

static void HandleHeight(OH_MediaAsset *photoAsset)
{
    uint32_t height = 0;
    g_heightRet = OH_MediaAsset_GetHeight(photoAsset, &height);
}

static void HandleOrientation(OH_MediaAsset *photoAsset)
{
    uint32_t orientation = 0;
    g_orientationRet = OH_MediaAsset_GetOrientation(photoAsset, &orientation);
}

static void HandleFavorite(OH_MediaAsset *photoAsset)
{
    uint32_t favorite = 0;
    g_isFavoriteRet = OH_MediaAsset_IsFavorite(photoAsset, &favorite);
}

static void HandleTitle(OH_MediaAsset *photoAsset)
{
    const char *title = nullptr;
    g_titleRet = OH_MediaAsset_GetTitle(photoAsset, &title);
}

static void CheckAndLogResults()
{
    if (g_uriRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetUri MEDIA_LIBRARY_OK");
    }
    if (g_mediaTypeRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetMediaType MEDIA_LIBRARY_OK");
    }
    if (g_mediaSubTypeRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetMediaSubType MEDIA_LIBRARY_OK");
    }
    if (g_displayNameRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetDisplayName MEDIA_LIBRARY_OK");
    }
    if (g_sizeRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetSize MEDIA_LIBRARY_OK");
    }
    if (g_dateAddedRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetDateAdded MEDIA_LIBRARY_OK");
    }
    if (g_dateModifiedRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetDateModified MEDIA_LIBRARY_OK");
    }
    if (g_dateTakenRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetDateTaken MEDIA_LIBRARY_OK");
    }
    if (g_dateAddedMsRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetDateAddedMs MEDIA_LIBRARY_OK");
    }
    if (g_dateModifiedMsRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetDateModifiedMs MEDIA_LIBRARY_OK");
    }
    if (g_durationRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetDuration MEDIA_LIBRARY_OK");
    }
    if (g_widthRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetWidth MEDIA_LIBRARY_OK");
    }
    if (g_heightRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetHeight MEDIA_LIBRARY_OK");
    }
    if (g_orientationRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetOrientation MEDIA_LIBRARY_OK");
    }
    if (g_isFavoriteRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_IsFavorite MEDIA_LIBRARY_OK");
    }
    if (g_titleRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_GetTitle MEDIA_LIBRARY_OK");
    }
}

static void ReleaseAsset(OH_MediaAsset *photoAsset)
{
    g_releaseRet = OH_MediaAsset_Release(photoAsset);
    if (g_releaseRet == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "OH_MediaAsset_Release MEDIA_LIBRARY_OK");
    }
}

static void CheckMediaTypes(MediaLibrary_MediaType mediaType, MediaLibrary_MediaSubType mediaSubType)
{
    if (mediaType == MediaLibrary_MediaType::MEDIA_LIBRARY_IMAGE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "MediaLibrary_MediaType MEDIA_LIBRARY_IMAGE");
        g_mediaType = 0;
    }
    if (mediaSubType == MediaLibrary_MediaSubType::MEDIA_LIBRARY_DEFAULT) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "MediaLibrary_MediaSubType MEDIA_LIBRARY_DEFAULT");
        g_mediaSubType = 0;
    }

    MediaLibrary_MediaSubType mediaSubType1 = MediaLibrary_MediaSubType::MEDIA_LIBRARY_MOVING_PHOTO;
    if (mediaSubType == mediaSubType1) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, "multimedia", "MediaLibrary_MediaSubType MEDIA_LIBRARY_MOVING_PHOTO");
    }
    mediaSubType1 = MediaLibrary_MediaSubType::MEDIA_LIBRARY_BURST;
    if (mediaSubType == mediaSubType1) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, "multimedia", "MediaLibrary_MediaSubType MEDIA_LIBRARY_BURST");
    }

    g_mediaSubTypeCheck = 0;
}

void PhotoAssetAvailable(Camera_PhotoOutput *photoOutput, OH_MediaAsset *photoAsset)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "PhotoAssetAvailable ===========");

    HandleUri(photoAsset);
    HandleNoSuchFile(photoAsset);
    HandleNoAuthority(photoAsset);
    HandleReleaseOk(photoAsset);
    HandleRequestMovingPhoto(photoAsset);
    HandleRequestImage(photoAsset);
    HandleRequestImageOne(photoAsset);
    HandleRequestImageTwo(photoAsset);
    HandleAddResourceWithBuffer(photoAsset);
    HandleAddResourceWithUri(photoAsset);
    HandleMediaType(photoAsset);
    HandleMediaSubType(photoAsset);
    HandleDisplayName(photoAsset);
    HandleSize(photoAsset);
    HandleDateAdded(photoAsset);
    HandleDateModified(photoAsset);
    HandleDateTaken(photoAsset);
    HandleDateAddedMs(photoAsset);
    HandleDateModifiedMs(photoAsset);
    HandleDuration(photoAsset);
    HandleWidth(photoAsset);
    HandleHeight(photoAsset);
    HandleOrientation(photoAsset);
    HandleFavorite(photoAsset);
    HandleTitle(photoAsset);
    HandleApplyChanges(photoAsset);

    CheckAndLogResults();

    MediaLibrary_MediaType mediaType;
    MediaLibrary_MediaSubType mediaSubType;
    OH_MediaAsset_GetMediaType(photoAsset, &mediaType);
    OH_MediaAsset_GetMediaSubType(photoAsset, &mediaSubType);
    CheckMediaTypes(mediaType, mediaSubType);

    ReleaseAsset(photoAsset);
}

// PreviewOutput Callback
void PreviewOutputOnFrameStart(Camera_PreviewOutput *previewOutput)
{
    OH_LOG_INFO(LOG_APP, "PreviewOutputOnFrameStart");
}

void PreviewOutputOnFrameEnd(Camera_PreviewOutput *previewOutput, int32_t frameCount)
{
    OH_LOG_INFO(LOG_APP, "PreviewOutput frameCount = %{public}d", frameCount);
}

void PreviewOutputOnError(Camera_PreviewOutput *previewOutput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "PreviewOutput errorCode = %{public}d", errorCode);
}

PreviewOutput_Callbacks *GetPreviewOutputListener(void)
{
    static PreviewOutput_Callbacks previewOutputListener = {.onFrameStart = PreviewOutputOnFrameStart,
                                                            .onFrameEnd = PreviewOutputOnFrameEnd,
                                                            .onError = PreviewOutputOnError};
    return &previewOutputListener;
}

// CameraInput Callback
void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode = %{public}d", errorCode);
}

CameraInput_Callbacks *GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}

static const char *GetPreviewSurfaceIdFromNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "multimedia", "Get callback info failed or lack of args");
        return nullptr;
    }
    napi_valuetype arg_type;
    status = napi_typeof(env, args[0], &arg_type);
    if (status != napi_ok || arg_type != napi_string) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "multimedia", "Arg is not a string");
        return nullptr;
    }
    size_t strLen = 0;
    status = napi_get_value_string_utf8(env, args[0], nullptr, 0, &strLen);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "multimedia", "Get string length failed");
        return nullptr;
    }
    if (strLen == 0 || strLen > SIZE_MAX - 1) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "multimedia", "String length is invalid");
        return nullptr;
    }
    const char *previewSurfaceId = (const char *)malloc(strLen + 1);
    if (previewSurfaceId == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "multimedia", "Malloc for surfaceId failed");
        return nullptr;
    }
    status = napi_get_value_string_utf8(env, args[0], (char *)previewSurfaceId, strLen + 1, nullptr);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "multimedia", "Convert string failed");
        free(static_cast<void *>(const_cast<char *>(previewSurfaceId)));
        return nullptr;
    }
    return previewSurfaceId;
}

napi_value TestOhMediaAsset(napi_env env, napi_callback_info info)
{
    const char *previewSurfaceId = GetPreviewSurfaceIdFromNapi(env, info);
    if (previewSurfaceId == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    Camera_Manager *cameraManager = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    Camera_CaptureSession *captureSession = nullptr;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    Camera_SceneMode sceneMode = NORMAL_PHOTO;
    OH_CaptureSession_SetSessionMode(captureSession, sceneMode);
    Camera_Device *cameras = nullptr;
    uint32_t size = 0;
    OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager, cameras, sceneMode,
                                                                     &cameraOutputCapability);
    Camera_Profile *profile = cameraOutputCapability->previewProfiles[0];
    Camera_PreviewOutput *previewOutput = nullptr;
    OH_CameraManager_CreatePreviewOutput(cameraManager, profile, previewSurfaceId, &previewOutput);
    OH_PreviewOutput_RegisterCallback(previewOutput, GetPreviewOutputListener());
    Camera_Input *cameraInput = nullptr;
    OH_CameraManager_CreateCameraInput(cameraManager, &cameras[0], &cameraInput);
    OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    OH_CameraInput_Open(cameraInput);
    OH_CaptureSession_BeginConfig(captureSession);
    bool isSuccess = false;
    OH_CaptureSession_CanAddInput(captureSession, cameraInput, &isSuccess);
    OH_CaptureSession_AddInput(captureSession, cameraInput);
    isSuccess = false;
    OH_CaptureSession_CanAddPreviewOutput(captureSession, previewOutput, &isSuccess);
    OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    profile = cameraOutputCapability->photoProfiles[0];
    Camera_PhotoOutput *photoOutput = nullptr;
    OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, profile, &photoOutput);
    isSuccess = false;
    OH_CaptureSession_CanAddPhotoOutput(captureSession, photoOutput, &isSuccess);
    OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput, PhotoAssetAvailable);
    OH_CaptureSession_CommitConfig(captureSession);
    OH_CaptureSession_SetFocusMode(captureSession, Camera_FocusMode::FOCUS_MODE_AUTO);
    OH_CaptureSession_Start(captureSession);
    OH_PhotoOutput_Capture(photoOutput);
    return nullptr;
}

napi_value TestOhMediaAssetGetUriOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_uriRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetMediaTypeOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_mediaTypeRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetMediaSubTypeOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_mediaSubTypeRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetDisplayNameOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_displayNameRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetSizeOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_sizeRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetDateAddedOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_dateAddedRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetDateModifiedOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_dateModifiedRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetDateTakenOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_dateTakenRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetDateAddedMsOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_dateAddedMsRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetDateModifiedMsOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_dateModifiedMsRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetDurationOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_durationRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetWidthOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_widthRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetHeightOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_heightRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetOrientationOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_orientationRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetIsFavoriteOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_isFavoriteRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetGetTitleOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_titleRet, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetReleaseOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_releaseRet, &retValue);
    return retValue;
}

napi_value TestOhMediaLibraryImageOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_mediaType, &retValue);
    return retValue;
}

napi_value TestOhMediaLibraryDefaultOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_mediaSubType, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetChangeRequestAddResourceWithUriNotSuchFile(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_noSuchFile == MediaLibrary_ErrorCode::MEDIA_LIBRARY_NO_SUCH_FILE ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetChangeRequestGetWriteCacheHandlerNoAuthority(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_noAuthority == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED ? 0 : -1,
                      &retValue);
    return retValue;
}

napi_value TestOhMediaAssetChangeRequestReleaseOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_releaseOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetManagerRequestMovingPhotoOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_requestMovingPhotoOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetManagerRequestImageOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_requestImageOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMovingPhotoGetUriOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_movingPhotoUriOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMovingPhotoRequestContentWithUrisOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_requestContentWithUrisOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMovingPhotoRequestContentWithUriOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_requestContentWithUriOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMovingPhotoRequestContentWithBufferOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_requestContentWithBufferOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1,
                      &retValue);
    return retValue;
}

napi_value TestOhMovingPhotoReleaseOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_movingPhotoReleaseOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestOhMediaAssetChangeRequestAddResourceWithBufferNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(
        env,
        g_addResourceWithBufferNotSupported == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED ? 0 : -1,
        &retValue);
    return retValue;
}

napi_value TestOhMediaAssetChangeRequestAddResourceWithUriNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(
        env, g_addResourceWithUriNotSupported == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED ? 0 : -1,
        &retValue);
    return retValue;
}

napi_value TestMediaLibraryQualityFast(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_imageCheck, &retValue);
    return retValue;
}

napi_value TestMediaLibraryQualityFull(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_imageCheck, &retValue);
    return retValue;
}

napi_value TestMediaLibraryCompressed(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_imageCheck, &retValue);
    return retValue;
}

napi_value TestMediaLibraryPictureObject(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_imageCheck, &retValue);
    return retValue;
}

napi_value TestMediaLibraryMovingPhoto(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_mediaSubTypeCheck, &retValue);
    return retValue;
}

napi_value TestMediaLibraryRust(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_mediaSubTypeCheck, &retValue);
    return retValue;
}

napi_value TestOhMediaAccessHelperApplyChangesOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_applyChanges == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestMediaLibraryHighQualityMode(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_requestImageOneOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}

napi_value TestMediaLibraryBalancedMode(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_requestImageTwoOk == MediaLibrary_ErrorCode::MEDIA_LIBRARY_OK ? 0 : -1, &retValue);
    return retValue;
}