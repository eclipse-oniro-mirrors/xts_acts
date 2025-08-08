/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#ifndef OHMEDIALIBRARYNDK_PHOTO_ACCESS_HELPER_H
#define OHMEDIALIBRARYNDK_PHOTO_ACCESS_HELPER_H


#include "multimedia/media_library/media_asset_base_capi.h"
#include "multimedia/media_library/media_asset_capi.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include "multimedia/media_library/media_access_helper_capi.h"
#include "multimedia/media_library/media_asset_change_request_capi.h"
#include "multimedia/media_library/media_asset_manager_capi.h"
#include "multimedia/media_library/moving_photo_capi.h"

#define MEDIA_LOG_TAG "MEDIA_TAGLOG"
#define MEDIA_LOG_DOMAIN 0x00000
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MEDIA_LOG_DOMAIN, MEDIA_LOG_TAG, fmt, ##__VA_ARGS__)

const unsigned int LOG_ID = 0xD002B70;

typedef enum UseCaseCode {
    TEST_PARAMETER_OK = 0,
    TEST_FIRST_PARAMETER_ERROR = 1,
    TEST_SECOND_PARAMETER_ERROR = 2,
    TEST_THIRD_PARAMETER_ERROR = 3,
    TEST_FOURTH_PARAMETER_ERROR = 4,
    TEST_FIFTH_PARAMETER_ERROR = 5,
    TEST_FIRST_ENUM_PARAMETER = 6,
    TEST_SECOND_ENUM_PARAMETER = 7,
} UseCaseCode;

class NDKMediaLibrary {
public:
    NDKMediaLibrary();
    ~NDKMediaLibrary(void);

    //mediaAsset
    MediaLibrary_ErrorCode MediaAssetGetUri(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetDisplayName(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetSize(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetDateModifiedMs(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetWidth(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetHeight(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetOrientation(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetMediaType(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetMediaSubType(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetDateAdded(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetDateModified(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetDateTaken(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetDateAddedMs(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetDuration(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetIsFavorite(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetGetTitle(int useCaseCode);
    MediaLibrary_ErrorCode MediaAssetRelease(int useCaseCode);

    //changeRequest
    MediaLibrary_ErrorCode ChangeRequestAddResourceWithUri(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestGetWriteCacheHandler(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestAddResourceWithBuffer(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestSaveCameraPhoto(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestSaveCameraVideo(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestDiscardCameraPhoto(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestRelease(int useCaseCode);

    //mediaAssetManager
    MediaLibrary_ErrorCode ManagerRequestImage(int useCaseCode);
    MediaLibrary_ErrorCode ManagerRequestMovingPhoto(int useCaseCode);
    MediaLibrary_ErrorCode ManagerRelease(int useCaseCode);
    OH_MediaAssetManager* GetMediaAssetManagerInstance();
    MediaLibrary_ErrorCode MediaAccessHelperApplyChanges(int useCaseCode);

    //moving photo
    MediaLibrary_ErrorCode MovingPhotoGetUri(int useCaseCode);
    MediaLibrary_ErrorCode MovingPhotoRequestContentWithUris(int useCaseCode);
    MediaLibrary_ErrorCode MovingPhotoRequestContentWithUri(int useCaseCode);
    MediaLibrary_ErrorCode MovingPhotoRequestContentWithBuffer(int useCaseCode);
    MediaLibrary_ErrorCode MovingPhotoRelease(int useCaseCode);

private:
    OH_MediaAsset* mediaAsset_; // mediaAsset instance
    OH_MediaAssetChangeRequest* changeRequest_; // changeRequest instance
    OH_ImageSourceNative* imageSourceNaive_; // imageSourceNative instance
    OH_MediaAssetManager* manager_; // mediaAssetManager instance
    OH_MovingPhoto* movingPhoto_; // movingPhoto instance

    const char* uri_; // mediaAsset uri
    const char* displayName_; // mediaAsset displayName
    uint32_t size_; // mediaAsset size
    uint32_t dateModifiedMs_; // mediaAsset dateModifiedMs
    uint32_t width_; // mediaAsset width
    uint32_t height_; // mediaAsset height
    uint32_t orientation_; // mediaAsset orientation
    MediaLibrary_MediaType mediaType_; // mediaAsset mediaType
    MediaLibrary_MediaSubType mediaSubType_; // mediaAsset mediaSubType
    uint32_t dateAdded_; // mediaAsset dateAdded
    uint32_t dateModified_; // mediaAsset dateModified
    uint32_t dateTaken_; // mediaAsset dateTaken
    uint32_t dateAddedMs_; // mediaAsset dateAddedMs
    uint32_t duration_; // mediaAsset duration
    uint32_t favorite_; // mediaAsset favorite
    const char* title_; // mediaAsset title

    char* requestUri_; // uri of the add resource
    int32_t fd_; //write cache handler
    const char* movingPhotoUri_; // movingPhoto URI
    const uint8_t* movingPhotoBuffer_; // movingPhoto buffer
    uint32_t movingPhotoSize_; // movingPhoto size

    MediaLibrary_RequestOptions requestOptions_; // request options for image request strategy mode
    OH_MediaLibrary_OnImageDataPrepared callback_; //request the image callback
    OH_MediaLibrary_OnMovingPhotoDataPrepared onMovingPhotoCallback_; // request the movingPhoto callback
    MediaLibrary_RequestId requestId_; //request id
    MediaLibrary_ErrorCode ret_; // error code
};

#endif
