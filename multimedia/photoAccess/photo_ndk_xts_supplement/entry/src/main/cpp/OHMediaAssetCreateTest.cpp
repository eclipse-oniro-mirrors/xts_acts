/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "OHMediaAssetCreateTest.h"
#include <cstdlib>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image_mdk.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/media_library/media_asset_change_request_capi.h>
#include <multimedia/media_library/media_asset_manager_capi.h>
#include <ohcamera/camera_manager.h>
#include <ohcamera/photo_output.h>
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
#include <cstddef>
#include <cstdint>
#define NO_PRECONFIG_MODE 1
#define TYPE_PRECONFIG_MODE 2
#define TYPE_RATIO_PRECONFIG_MODE 3
#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)
#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"
#define IMAGE_NULL_STRING ""
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11
#define IMAGE_EFFECT_2 2
#define IMAGE_EFFECT_100 100
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_50F 50.f
#define IMAGE_EFFECT_100D 100.0
#define IMAGE_EFFECT_1000 1000
#define IMAGE_EFFECT_1024 1024
#define IMAGE_EFFECT_1048576 1048576
#define IMAGE_EFFECT_1073741824 1073741824
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_1920 1920
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000

#define LOG_DOMAIN 0x0000
#define LOG_TAG "OHMediaAssetCreateTestNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

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
OH_MediaAsset *photoAsset;
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
void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode = %{public}d", errorCode);
}
PreviewOutput_Callbacks *GetPreviewOutputListener(void)
{
    static PreviewOutput_Callbacks previewOutputListener = {.onFrameStart = PreviewOutputOnFrameStart,
                                                            .onFrameEnd = PreviewOutputOnFrameEnd,
                                                            .onError = PreviewOutputOnError};
    return &previewOutputListener;
}
CameraInput_Callbacks *GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}
void PhotoAssetAvailable(Camera_PhotoOutput *photoOutput, OH_MediaAsset *backPhotoAsset)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "PhotoAssetAvailable ===========");
    LOGI("get photoAssetAvailable %{public}p", backPhotoAsset);
    photoAsset = backPhotoAsset;
    LOGI("get photoAssetAvailable %{public}p", photoAsset);
}
napi_value TestOhMediaAsset(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    char surfaceId[256];
    size_t uuidLen = 0;
    napi_get_value_string_utf8(env, argValue[1], surfaceId, sizeof(surfaceId), &uuidLen);
    LOGI("surface ID %{public}s", surfaceId);
    Camera_Manager *cameraManager = nullptr;
    Camera_ErrorCode code;
    code = OH_Camera_GetCameraManager(&cameraManager);
    LOGI("Get 1  %{public}d", code);
    Camera_CaptureSession *captureSession = nullptr;
    code = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    LOGI("Get 2  %{public}d", code);
    Camera_SceneMode sceneMode = NORMAL_PHOTO;
    code = OH_CaptureSession_SetSessionMode(captureSession, sceneMode);
    LOGI("Get 3  %{public}d", code);
    Camera_Device *cameras = nullptr;
    uint32_t size = 0;
    code = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    LOGI("Get 4  %{public}d", code);
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    code = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager, cameras, sceneMode,
                                                                            &cameraOutputCapability);
    LOGI("Get 5  %{public}d", code);
    Camera_Profile *profile = cameraOutputCapability->previewProfiles[0];
    Camera_PreviewOutput *previewOutput = nullptr;
    code = OH_CameraManager_CreatePreviewOutput(cameraManager, profile, surfaceId, &previewOutput);
    LOGI("Get 6  %{public}d", code);
    code = OH_PreviewOutput_RegisterCallback(previewOutput, GetPreviewOutputListener());
    LOGI("Get 7  %{public}d", code);
    Camera_Input *cameraInput = nullptr;
    code = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[0], &cameraInput);
    LOGI("Get 8  %{public}d", code);
    code = OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    LOGI("Get 9  %{public}d", code);
    code = OH_CameraInput_Open(cameraInput);
    LOGI("Get 10  %{public}d", code);
    code = OH_CaptureSession_BeginConfig(captureSession);
    LOGI("Get 11  %{public}d", code);
    bool isSuccess = false;
    code = OH_CaptureSession_CanAddInput(captureSession, cameraInput, &isSuccess);
    LOGI("Get 12  %{public}d", code);
    code = OH_CaptureSession_AddInput(captureSession, cameraInput);
    LOGI("Get 13  %{public}d", code);
    isSuccess = false;
    code = OH_CaptureSession_CanAddPreviewOutput(captureSession, previewOutput, &isSuccess);
    LOGI("Get 14  %{public}d", code);
    code = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    LOGI("Get 15  %{public}d", code);
    profile = cameraOutputCapability->photoProfiles[0];
    Camera_PhotoOutput *photoOutput = nullptr;
    code = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, profile, &photoOutput);
    LOGI("Get 16  %{public}d", code);
    isSuccess = false;
    code = OH_CaptureSession_CanAddPhotoOutput(captureSession, photoOutput, &isSuccess);
    LOGI("Get 17  %{public}d", code);
    code = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    LOGI("Get 18  %{public}d", code);
    code = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput, PhotoAssetAvailable);
    LOGI("Get 19  %{public}d", code);
    code = OH_CaptureSession_CommitConfig(captureSession);
    LOGI("Get 20  %{public}d", code);
    code = OH_CaptureSession_SetFocusMode(captureSession, Camera_FocusMode::FOCUS_MODE_AUTO);
    LOGI("Get 21  %{public}d", code);
    code = OH_CaptureSession_Start(captureSession);
    LOGI("Get 22  %{public}d", code);
    code = OH_PhotoOutput_Capture(photoOutput);
    LOGI("Get 23  %{public}d", code);
    return nullptr;
}
napi_value OHMediaAssetChangeRequestCreateTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    OH_MediaAssetChangeRequest *code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_MediaAssetChangeRequest_Create(nullptr);
        LOGI("get index %{public}p", code);
        break;
    default:
        break;
    }
    int status = IMAGE_EFFECT_CODE_401;
    if (code != nullptr) {
        status = 0;
    }
    napi_value result;
    napi_create_int32(env, status, &result);
    return result;
}
napi_value OHMediaAssetChangeRequestAddResourceWithUriTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get UriTest index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    OH_MediaAssetChangeRequest *changeRequest;
    MediaLibrary_ErrorCode code;
    LOGI("get photoAsset %{public}p", photoAsset);
    changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    LOGI("get changeRequest %{public}p", changeRequest);
    MediaLibrary_ResourceType resourceType = MEDIA_LIBRARY_IMAGE_RESOURCE;
    char fileUri[200] =
        "file://com.example.myapplication.MainAbility/data/storage/el2/base/haps/entry/files/non_exist_uri.mp4";
    switch (index) {
    case CASE_INDEX_1:
        code = OH_MediaAssetChangeRequest_AddResourceWithUri(changeRequest, resourceType, fileUri);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value OHMediaAccessHelperApplyChangesTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get UriTest index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    OH_MediaAssetChangeRequest *changeRequest;
    MediaLibrary_ErrorCode code;
    LOGI("get photoAsset %{public}p", photoAsset);
    changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    LOGI("get changeRequest %{public}p", changeRequest);
    switch (index) {
    case CASE_INDEX_1:
        changeRequest = nullptr;
        code = OH_MediaAccessHelper_ApplyChanges(changeRequest);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value OHMediaAssetChangeRequestReleaseTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get UriTest index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    OH_MediaAssetChangeRequest *changeRequest;
    MediaLibrary_ErrorCode code;
    LOGI("get photoAsset %{public}p", photoAsset);
    changeRequest = OH_MediaAssetChangeRequest_Create(photoAsset);
    LOGI("get changeRequest %{public}p", changeRequest);
    switch (index) {
    case CASE_INDEX_1:
        changeRequest = nullptr;
        code = OH_MediaAssetChangeRequest_Release(changeRequest);
        break;
    case CASE_INDEX_2:
        code = OH_MediaAssetChangeRequest_Release(changeRequest);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}
void OnQuickImageDataPrepared(MediaLibrary_ErrorCode result, MediaLibrary_RequestId requestId,
                              MediaLibrary_MediaQuality mediaQuality, MediaLibrary_MediaContentType type,
                              OH_ImageSourceNative *imageSourceNative, OH_PictureNative *pictureNative)
{
    LOGI(" prepare success");
};
napi_value OHMediaAssetManagerQuickRequestImageTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    OH_MediaAssetManager *manager = OH_MediaAssetManager_Create();
    MediaLibrary_RequestOptions requestOptions;
    MediaLibrary_RequestId requestId;
    MediaLibrary_ErrorCode errCode;
    switch (index) {
    case CASE_INDEX_1:
        requestOptions.deliveryMode = MEDIA_LIBRARY_BALANCED_MODE;
        errCode = OH_MediaAssetManager_QuickRequestImage(manager, photoAsset, requestOptions, &requestId,
                                                         OnQuickImageDataPrepared);
        break;
    case CASE_INDEX_2:
        requestOptions.deliveryMode = MEDIA_LIBRARY_BALANCED_MODE;
        photoAsset =nullptr;
        errCode = OH_MediaAssetManager_QuickRequestImage(manager, photoAsset, requestOptions, &requestId,
                                                         OnQuickImageDataPrepared);
        break;   
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}