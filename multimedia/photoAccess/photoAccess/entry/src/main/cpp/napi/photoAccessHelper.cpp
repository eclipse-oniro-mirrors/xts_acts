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

#include "photoAccessHelper.h"
#include <cstdio>
#include <cstring>
#include <iostream>
#include <securec.h>
#include <string>
#include <cerrno>

NDKMediaLibrary::NDKMediaLibrary() : ret_(MEDIA_LIBRARY_OK)
{
    mediaAsset_ = nullptr;
    movingPhoto_ = nullptr;
    manager_ = OH_MediaAssetManager_Create();
    if (manager_ == nullptr) {
        DEBUG_LOG("create mediaAssetManager instance failed");
    }
    
    changeRequest_ = OH_MediaAssetChangeRequest_Create(mediaAsset_);
    if (changeRequest_== nullptr) {
        DEBUG_LOG("create OH_MediaAssetChangeRequest instance failed");
    }
}

/*-----media asset start-----*/
MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetUri(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetUri(mediaAsset_, &uri_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetUri(nullptr, &uri_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetUri(mediaAsset_, nullptr);
    }

    return ret_;
}


MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetDisplayName(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetDisplayName(mediaAsset_, &displayName_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDisplayName(nullptr, &displayName_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDisplayName(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetSize(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetSize(mediaAsset_, &size_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetSize(nullptr, &size_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetSize(mediaAsset_, nullptr);
    }

    return ret_;
}


MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetDateModifiedMs(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetDateModifiedMs(mediaAsset_, &dateModifiedMs_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateModifiedMs(nullptr, &dateModifiedMs_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateModifiedMs(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetWidth(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetWidth(mediaAsset_, &width_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetWidth(nullptr, &width_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetWidth(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetHeight(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetHeight(mediaAsset_, &height_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetHeight(nullptr, &height_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetHeight(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetOrientation(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetOrientation(mediaAsset_, &orientation_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetOrientation(nullptr, &orientation_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetOrientation(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetMediaType(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetMediaType(mediaAsset_, &mediaType_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetMediaType(nullptr, &mediaType_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetMediaType(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetMediaSubType(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetMediaSubType(mediaAsset_, &mediaSubType_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetMediaSubType(nullptr, &mediaSubType_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetMediaSubType(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetDateAdded(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetDateAdded(mediaAsset_, &dateAdded_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateAdded(nullptr, &dateAdded_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateAdded(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetDateModified(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetDateModified(mediaAsset_, &dateModified_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateModified(nullptr, &dateModified_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateModified(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetDateTaken(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetDateTaken(mediaAsset_, &dateTaken_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateTaken(nullptr, &dateTaken_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateTaken(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetDateAddedMs(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetDateAddedMs(mediaAsset_, &dateAddedMs_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateAddedMs(nullptr, &dateAddedMs_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDateAddedMs(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetDuration(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetDuration(mediaAsset_, &duration_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDuration(nullptr, &duration_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetDuration(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetIsFavorite(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_IsFavorite(mediaAsset_, &favorite_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_IsFavorite(nullptr, &favorite_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_IsFavorite(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetGetTitle(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_GetTitle(mediaAsset_, &title_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetTitle(nullptr, &title_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_GetTitle(mediaAsset_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetRelease(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_Release(mediaAsset_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_Release(nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ChangeRequestAddResourceWithUri(int useCaseCode)
{
    std::string fileUri =
        "file://com.example.myapplication.MainAbility/data/storage/el2/base/haps/entry/files/non_exist_uri.mp4";
    requestUri_ = new char[fileUri.length() + 1];
    
    errno_t result = strncpy_s(requestUri_, fileUri.length() + 1, fileUri.c_str(), fileUri.length());
    requestUri_[fileUri.length()] = '\0';
    if (result != 0) {
        DEBUG_LOG("strncpy_s failed");
        return MEDIA_LIBRARY_INTERNAL_SYSTEM_ERROR;
    }

    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, requestUri_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithUri(nullptr,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, requestUri_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest_,
            static_cast<MediaLibrary_ResourceType>(-1), requestUri_);
    } else if (useCaseCode == TEST_THIRD_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, nullptr);
    } else if (useCaseCode == TEST_FIRST_ENUM_PARAMETER) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, requestUri_);
    } else if (useCaseCode == TEST_SECOND_ENUM_PARAMETER) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_VIDEO_RESOURCE, requestUri_);
    }

    if (ret_== MEDIA_LIBRARY_OK) {
        DEBUG_LOG("ChangeRequestAddResourceWithUri success");
        ret_ = OH_MediaAccessHelper_ApplyChanges(changeRequest_);
    }
    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ChangeRequestGetWriteCacheHandler(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetChangeRequest_GetWriteCacheHandler(changeRequest_, &fd_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_GetWriteCacheHandler(nullptr, &fd_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_GetWriteCacheHandler(changeRequest_, nullptr);
    }

    if (ret_== MEDIA_LIBRARY_OK) {
        DEBUG_LOG("ChangeRequestGetWriteCacheHandler success");
        ret_ = OH_MediaAccessHelper_ApplyChanges(changeRequest_);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ChangeRequestAddResourceWithBuffer(int useCaseCode)
{
    uint32_t length = 1024;
    uint8_t* buffer = new uint8_t[length];
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, buffer, length);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithBuffer(nullptr,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, buffer, length);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest_,
            static_cast<MediaLibrary_ResourceType>(-1), buffer, length);
    } else if (useCaseCode == TEST_THIRD_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, nullptr, length);
    } else if (useCaseCode == TEST_FOURTH_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, buffer, 0);
    } else if (useCaseCode == TEST_FIRST_ENUM_PARAMETER) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, buffer, length);
    } else if (useCaseCode == TEST_SECOND_ENUM_PARAMETER) {
        ret_ = OH_MediaAssetChangeRequest_AddResourceWithBuffer(changeRequest_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_VIDEO_RESOURCE, buffer, length);
    }

    if (ret_== MEDIA_LIBRARY_OK) {
        DEBUG_LOG("ChangeRequestAddResourceWithBuffer success");
        ret_ = OH_MediaAccessHelper_ApplyChanges(changeRequest_);
    }

    return ret_;
}


MediaLibrary_ErrorCode NDKMediaLibrary::ChangeRequestSaveCameraPhoto(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetChangeRequest_SaveCameraPhoto(changeRequest_,
            MediaLibrary_ImageFileType::MEDIA_LIBRARY_IMAGE_JPEG);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_SaveCameraPhoto(nullptr,
            MediaLibrary_ImageFileType::MEDIA_LIBRARY_IMAGE_JPEG);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_SaveCameraPhoto(changeRequest_,
            static_cast<MediaLibrary_ImageFileType>(-1));
    }

    if (ret_== MEDIA_LIBRARY_OK) {
        DEBUG_LOG("ChangeRequestSaveCameraPhoto success");
        ret_ = OH_MediaAccessHelper_ApplyChanges(changeRequest_);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ChangeRequestDiscardCameraPhoto(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetChangeRequest_DiscardCameraPhoto(changeRequest_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_DiscardCameraPhoto(nullptr);
    }

    if (ret_== MEDIA_LIBRARY_OK) {
        DEBUG_LOG("ChangeRequestSaveCameraPhoto success");
        ret_ = OH_MediaAccessHelper_ApplyChanges(changeRequest_);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ChangeRequestRelease(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetChangeRequest_Release(changeRequest_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetChangeRequest_Release(nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ManagerRequestImage(int useCaseCode)
{
    requestOptions_.deliveryMode = MediaLibrary_DeliveryMode::MEDIA_LIBRARY_FAST_MODE;
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetManager_RequestImage(manager_, mediaAsset_,
            requestOptions_, &requestId_, callback_);
    } else if (TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestImage(nullptr, mediaAsset_,
            requestOptions_, &requestId_, callback_);
    } else if (TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestImage(manager_, nullptr,
            requestOptions_, &requestId_, callback_);
    } else if (TEST_THIRD_PARAMETER_ERROR) {
        requestOptions_.deliveryMode = static_cast<MediaLibrary_DeliveryMode>(-1);
        ret_ = OH_MediaAssetManager_RequestImage(manager_, mediaAsset_,
            requestOptions_, &requestId_, callback_);
    } else if (TEST_FOURTH_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestImage(manager_, mediaAsset_,
            requestOptions_, nullptr, callback_);
    } else if (TEST_FIFTH_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestImage(manager_, mediaAsset_,
            requestOptions_, &requestId_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ManagerRequestMovingPhoto(int useCaseCode)
{
    requestOptions_.deliveryMode = MediaLibrary_DeliveryMode::MEDIA_LIBRARY_FAST_MODE;
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetManager_RequestMovingPhoto(manager_, mediaAsset_,
            requestOptions_, &requestId_, onMovingPhotoCallback_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestMovingPhoto(nullptr, mediaAsset_,
            requestOptions_, &requestId_, onMovingPhotoCallback_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestMovingPhoto(manager_, nullptr,
            requestOptions_, &requestId_, onMovingPhotoCallback_);
    } else if (useCaseCode == TEST_THIRD_PARAMETER_ERROR) {
        requestOptions_.deliveryMode = static_cast<MediaLibrary_DeliveryMode>(-1);
        ret_ = OH_MediaAssetManager_RequestMovingPhoto(manager_, mediaAsset_,
            requestOptions_, &requestId_, onMovingPhotoCallback_);
    } else if (useCaseCode == TEST_FOURTH_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestMovingPhoto(manager_, mediaAsset_,
            requestOptions_, nullptr, onMovingPhotoCallback_);
    } else if (useCaseCode == TEST_FIFTH_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_RequestMovingPhoto(manager_, mediaAsset_,
            requestOptions_, &requestId_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::ManagerRelease(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAssetManager_Release(manager_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAssetManager_Release(nullptr);
    }

    return ret_;
}

/*-----media access helper start-----*/
MediaLibrary_ErrorCode NDKMediaLibrary::MediaAccessHelperApplyChanges(int useCaseCode)
{
    if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAccessHelper_ApplyChanges(nullptr);
    }

    return ret_;
}
/*-----media access helper end-----*/

MediaLibrary_ErrorCode NDKMediaLibrary::MovingPhotoGetUri(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MovingPhoto_GetUri(movingPhoto_, &movingPhotoUri_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_GetUri(nullptr, &movingPhotoUri_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_GetUri(movingPhoto_, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MovingPhotoRequestContentWithUris(int useCaseCode)
{
    std::string imageFileName = "ImageFile.jpg";
    std::string videoFileName = "VideoFile.mp4";
    std::string imageFileUri =
        "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/phone/photos/" + imageFileName;
    std::string videoFileUri =
        "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/phone/photos/" + videoFileName;
    char* imageUri = new char[imageFileUri.length() + 1];
    errno_t result = strncpy_s(imageUri, imageFileUri.length() + 1, imageFileUri.c_str(), imageFileUri.length());
    if (result != 0) {
        DEBUG_LOG("strncpy_s failed");
        return MEDIA_LIBRARY_INTERNAL_SYSTEM_ERROR;
    }
    imageUri[imageFileUri.length()] = '\0';
    char* videoUri = new char[videoFileUri.length() + 1];
    result = strncpy_s(videoUri, videoFileUri.length() + 1, videoFileUri.c_str(), videoFileUri.length());
    if (result != 0) {
        DEBUG_LOG("strncpy_s failed");
        return MEDIA_LIBRARY_INTERNAL_SYSTEM_ERROR;
    }
    videoUri[videoFileUri.length()] = '\0';
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MovingPhoto_RequestContentWithUris(movingPhoto_, imageUri, videoUri);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithUris(nullptr, imageUri, videoUri);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithUris(movingPhoto_, nullptr, videoUri);
    } else if (useCaseCode == TEST_THIRD_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithUris(movingPhoto_, imageUri, nullptr);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MovingPhotoRequestContentWithUri(int useCaseCode)
{
    std::string imageFileUri =
        "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/phone/photos/test_picture.jpg";
    char* imageUri = new char[imageFileUri.length() + 1];
    errno_t result = strncpy_s(imageUri, imageFileUri.length() + 1, imageFileUri.c_str(), imageFileUri.length());
    if (result != 0) {
        DEBUG_LOG("strncpy_s failed");
        return MEDIA_LIBRARY_INTERNAL_SYSTEM_ERROR;
    }
    imageUri[imageFileUri.length()] = '\0';
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MovingPhoto_RequestContentWithUri(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, imageUri);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithUri(nullptr,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, imageUri);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithUri(movingPhoto_,
            static_cast<MediaLibrary_ResourceType>(-1), imageUri);
    } else if (useCaseCode == TEST_THIRD_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithUri(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, nullptr);
    } else if (useCaseCode == TEST_FIRST_ENUM_PARAMETER) {
        ret_ = OH_MovingPhoto_RequestContentWithUri(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, imageUri);
    } else if (useCaseCode == TEST_SECOND_ENUM_PARAMETER) {
        ret_ = OH_MovingPhoto_RequestContentWithUri(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_VIDEO_RESOURCE, imageUri);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MovingPhotoRequestContentWithBuffer(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MovingPhoto_RequestContentWithBuffer(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, &movingPhotoBuffer_, &movingPhotoSize_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithBuffer(nullptr,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, &movingPhotoBuffer_, &movingPhotoSize_);
    } else if (useCaseCode == TEST_SECOND_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithBuffer(movingPhoto_,
            static_cast<MediaLibrary_ResourceType>(-1), &movingPhotoBuffer_, &movingPhotoSize_);
    } else if (useCaseCode == TEST_THIRD_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithBuffer(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, nullptr, &movingPhotoSize_);
    } else if (useCaseCode == TEST_FOURTH_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_RequestContentWithBuffer(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, &movingPhotoBuffer_, nullptr);
    } else if (useCaseCode == TEST_FIRST_ENUM_PARAMETER) {
        ret_ = OH_MovingPhoto_RequestContentWithBuffer(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_IMAGE_RESOURCE, &movingPhotoBuffer_, &movingPhotoSize_);
    } else if (useCaseCode == TEST_SECOND_ENUM_PARAMETER) {
        ret_ = OH_MovingPhoto_RequestContentWithBuffer(movingPhoto_,
            MediaLibrary_ResourceType::MEDIA_LIBRARY_VIDEO_RESOURCE, &movingPhotoBuffer_, &movingPhotoSize_);
    }

    return ret_;
}

MediaLibrary_ErrorCode NDKMediaLibrary::MovingPhotoRelease(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MovingPhoto_Release(movingPhoto_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MovingPhoto_Release(nullptr);
    }

    return ret_;
}