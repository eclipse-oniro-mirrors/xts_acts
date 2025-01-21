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

#include "hilog/log.h"
#include "media_asset_base_capi.h"
#include "media_asset_capi.h"
#include "napi/native_api.h"
#include "image_source_native.h"
#include "media_access_helper_capi.h"
#include "media_asset_change_request_capi.h"
#include "media_asset_manager_capi.h"

#define MEDIA_LOG_TAG "MEDIA_TAGLOG"
#define MEDIA_LOG_DOMAIN 0x00000
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MEDIA_LOG_DOMAIN, MEDIA_LOG_TAG, fmt, ##__VA_ARGS__)

const unsigned int LOG_ID = 0xD002B70;
constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, LOG_ID, "MediaLibraryNDKTest"};
#define MY_HILOG(op, fmt, args...)                                                 \
    do                                                                             \
    {                                                                              \
        op(LABEL, "{%{public}s:%{public}d} " fmt, __FUNCTION__, __LINE__, ##args); \
    } while (0)
#define DEBUG_LOG(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)

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
    MediaLibrary_ErrorCode MediaAssetRelease(int useCaseCode);

    //changeRequest
    MediaLibrary_ErrorCode ChangeRequestAddResourceWithBuffer(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestSaveCameraPhoto(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestDiscardCameraPhoto(int useCaseCode);
    MediaLibrary_ErrorCode ChangeRequestRelease(int useCaseCode);

    //mediaAssetManager
    MediaLibrary_ErrorCode ManagerRequestImage(int useCaseCode);

    MediaLibrary_ErrorCode MediaAccessHelperApplyChanges(int useCaseCode);

private:
    OH_MediaAsset* mediaAsset_;
    OH_MediaAssetChangeRequest* changeRequest_;
    OH_ImageSourceNative* imageSourceNaive_;
    OH_MediaAssetManager* manager_;

    const char* uri_;
    const char* displayName_;
    uint32_t size_;
    uint32_t dateModifiedMs_;
    uint32_t width_;
    uint32_t height_;
    uint32_t orientation_;

    MediaLibrary_RequestOptions requestOptions_;
    OH_MediaLibrary_OnImageDataPrepared callback_;
    MediaLibrary_RequestId requestId_;
    MediaLibrary_ErrorCode ret_;
};

#endif