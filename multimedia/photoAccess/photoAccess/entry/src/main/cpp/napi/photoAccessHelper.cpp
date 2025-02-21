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
#include <string>

NDKMediaLibrary::NDKMediaLibrary() : ret_(MEDIA_LIBRARY_OK)
{
    mediaAsset_ = nullptr;
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

MediaLibrary_ErrorCode NDKMediaLibrary::MediaAssetRelease(int useCaseCode)
{
    if (useCaseCode == TEST_PARAMETER_OK) {
        ret_ = OH_MediaAsset_Release(mediaAsset_);
    } else if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAsset_Release(nullptr);
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

/*-----media access helper start-----*/
MediaLibrary_ErrorCode NDKMediaLibrary::MediaAccessHelperApplyChanges(int useCaseCode)
{
    if (useCaseCode == TEST_FIRST_PARAMETER_ERROR) {
        ret_ = OH_MediaAccessHelper_ApplyChanges(nullptr);
    }

    return ret_;
}
/*-----media access helper end-----*/
