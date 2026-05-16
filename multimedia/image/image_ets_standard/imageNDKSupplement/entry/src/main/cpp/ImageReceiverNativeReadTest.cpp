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

#include "ImageReceiverNativeReadTest.h"
#include "ImageReceiverNativeTest.h"
#include <cstddef>
#include <cstdint>
#include <multimedia/image_framework/image/image_receiver_native.h>
#include <string>
#include <thread>

#define LOG_TAG "ImageReceiverNativeReadCpp"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
Camera_Manager *cameraManager = nullptr;
Camera_Input *cameraInput = nullptr;
Camera_Device *cameras = nullptr;
Camera_Profile *previewProfile = nullptr;
Camera_Profile *photoProfile = nullptr;
Camera_PreviewOutput *previewOutput = nullptr;
Camera_PhotoOutput *photoOutput = nullptr;
Camera_CaptureSession *captureSession = nullptr;
#define NEED_SLEEP_SECONDS 3

void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    LOGI("CameraManagerStatusCallback is called");
}

CameraManager_Callbacks *GetCameraManagerListener()
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}

void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    LOGI("OnCameraInput errorCode: %{public}d", errorCode);
}

CameraInput_Callbacks *GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}

bool IsSupportedSceneMode(Camera_Device camera, Camera_SceneMode sceneMode)
{
    Camera_SceneMode *sceneModes = nullptr;
    uint32_t sceneModeSize = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedSceneModes(&camera, &sceneModes, &sceneModeSize);
    if (sceneModes == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_GetSupportedSceneModes failed.");
        return false;
    }
    for (uint32_t index = 0; index < sceneModeSize; index++) {
        LOGI("scene mode = %{public}u ", sceneModes[index]);
        if (sceneModes[index] == sceneMode) {
            return true;
        }
    }
    return false;
}

void CreateAndOpenCamera()
{
    uint32_t size = 0;
    uint32_t cameraDeviceIndex = 0;
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager);
    if (cameraManager == nullptr || ret != CAMERA_OK) {
        LOGI("OH_Camera_GetCameraManager failed.");
        return;
    }
    ret = OH_CameraManager_RegisterCallback(cameraManager, GetCameraManagerListener());
    if (ret != CAMERA_OK) {
        LOGI("OH_CameraManager_RegisterCallback failed.");
    }
    ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    if (cameras == nullptr || size == 0 || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_GetSupportedCameras failed.");
        return;
    }
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[cameraDeviceIndex], &cameraInput);
    if (cameraInput == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_CreateCameraInput failed. %{public}d", ret);
        return;
    }
    ret = OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    if (ret != CAMERA_OK) {
        LOGI("OH_CameraInput_RegisterCallback failed.");
    }
    ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CameraInput_open failed.");
        return;
    }
    LOGI("camer input 创建成功");
}

void CreatePhotoOutput(const char *surfaceID)
{
    const Camera_Device camera = cameras[0];
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    bool isSupported = IsSupportedSceneMode(camera, Camera_SceneMode::NORMAL_PHOTO);
    if (!isSupported) {
        LOGI("NORMAL_PHOTO is not supported.");
    }
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &camera, Camera_SceneMode::NORMAL_PHOTO, &cameraOutputCapability);
    if (cameraOutputCapability == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_GetSupportedCameraOutputCapability failed.");
    }
    if (cameraOutputCapability->previewProfiles == nullptr) {
        LOGI("previewProfiles == null");
    } else {
        previewProfile = cameraOutputCapability->previewProfiles[0];
    }
    if (cameraOutputCapability->photoProfiles == nullptr) {
        LOGI("photoProfiles == null");
    } else {
        photoProfile = cameraOutputCapability->photoProfiles[0];
    }
    Camera_ErrorCode preCode =
        OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, surfaceID, &previewOutput);
    if (cameraOutputCapability == nullptr || preCode != CAMERA_OK) {
        LOGI("OH_CameraManager_CreatePreviewOutput failed. %{public}d  %{public}s", preCode,
                     surfaceID);
    }
    Camera_ErrorCode photoSurface =
        OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, photoProfile, &photoOutput);
    if (cameraOutputCapability == nullptr || photoSurface != CAMERA_OK) {
        LOGI("OH_CameraManager_CreatePhotoOutputWithoutSurface failed.");
    }
}

void CreateCaptureSession()
{
    if (cameraManager == nullptr) {
        LOGI("cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        LOGI("OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_SetSessionMode failed.");
    }
    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_BeginConfig failed.");
    }
    ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_AddInput failed.");
    }
    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_AddPreviewOutput failed.");
    }
    ret = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_AddPhotoOutput failed.");
    }
    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_CommitConfig failed.");
    }
    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        LOGI("OH_CaptureSession_Start failed.");
    }
    LOGI("camera session start end");
}
static OH_ImageReceiverNative* receiver = nullptr;
static OH_ImageReceiverOptions* options = nullptr;

napi_value ImageReceiverNativeReadLatestImageSuccessTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageReceiverNative_On start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageReceiverNative_On error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    napi_ref jsCallbackHandler;
    napi_create_reference(env, argValue[1], 1, &(jsCallbackHandler));
    OH_ImageReceiverOptions* options = nullptr;
    OH_ImageReceiverOptions_Create(&options);
    LOGI("OptionsCreate SUCCEED");
    OH_ImageReceiverNative* receiver = nullptr;
    OH_ImageReceiverNative_Create(options, &receiver);
    LOGI("ReceiverCreate SUCCEED");
    uint64_t surfaceId = 0;
    OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &surfaceId);
    LOGI("surfaceId is:%{public}d", surfaceId);
    auto myImageReceiverCallback = [](OH_ImageReceiverNative *receiver) {
        LOGI("ImageReceiverNativeCTest buffer available.");
    };
    Image_ErrorCode errCode = OH_ImageReceiverNative_On(receiver, myImageReceiverCallback);
    LOGI("OH_ImageReceiverNative_On SUCCEED");
    std::string surfaceIDStr = std::to_string(surfaceId);
    const char *constCharPtr = surfaceIDStr.c_str();
    CreateAndOpenCamera();
    CreatePhotoOutput(constCharPtr);
    CreateCaptureSession();
    std::this_thread::sleep_for(std::chrono::seconds(NEED_SLEEP_SECONDS));
    OH_ImageNative *image = nullptr;
    errCode = OH_ImageReceiverNative_ReadNextImage(receiver, &image);
    if (errCode != IMAGE_SUCCESS) {
        LOGI("ImageReceiverNativeCTest get image receiver next image failed, errCode: %{public}d.", errCode);
    }
    errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
    if (errCode != IMAGE_SUCCESS) {
        LOGI("ImageReceiverNativeCTest get image receiver next image failed, errCode: %{public}d.", errCode);
    }
    errCode = OH_ImageNative_Release(image);
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    LOGI("OH_ImageReceiverNative_On end");
    return result;
}