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

#include "CameraSessionNdkTest.h"
#include <cstddef>
#include <cstdint>
#include <cmath>
#include <chrono>
#include <thread>

#define LOG_DOMAIN 0x0000
#define LOG_TAG "CameraSessionNDKLOGTAG"
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

void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    OH_LOG_INFO(LOG_APP, "CameraManagerStatusCallback is called");
}

CameraManager_Callbacks *GetCameraManagerListener()
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}

void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode: %{public}d", errorCode);
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
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedSceneModes failed.");
        return false;
    }
    for (uint32_t index = 0; index < sceneModeSize; index++) {
        OH_LOG_INFO(LOG_APP, "scene mode = %{public}u ", sceneModes[index]);
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
        OH_LOG_ERROR(LOG_APP, "OH_Camera_GetCameraManager failed.");
        return;
    }
    ret = OH_CameraManager_RegisterCallback(cameraManager, GetCameraManagerListener());
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_RegisterCallback failed.");
    }
    ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    if (cameras == nullptr || size == 0 || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameras failed.");
        return;
    }
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[cameraDeviceIndex], &cameraInput);
    if (cameraInput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCameraInput failed. %{public}d", ret);
        return;
    }
    ret = OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_RegisterCallback failed.");
    }
    ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_open failed.");
        return;
    }
    LOGI("camer input 创建成功");
}

void createPhotoOutput(char *surfaceID)
{
    const Camera_Device camera = cameras[0];
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    bool isSupported = IsSupportedSceneMode(camera, Camera_SceneMode::NORMAL_PHOTO);
    if (!isSupported) {
        OH_LOG_ERROR(LOG_APP, "NORMAL_PHOTO is not supported.");
    }
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &camera, Camera_SceneMode::NORMAL_PHOTO, &cameraOutputCapability);
    if (cameraOutputCapability == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameraOutputCapability failed.");
    }
    if (cameraOutputCapability->previewProfiles == nullptr) {
        OH_LOG_ERROR(LOG_APP, "previewProfiles == null");
    } else {
        previewProfile = cameraOutputCapability->previewProfiles[0];
    }
    if (cameraOutputCapability->photoProfiles == nullptr) {
        OH_LOG_ERROR(LOG_APP, "photoProfiles == null");
    } else {
        photoProfile = cameraOutputCapability->photoProfiles[0];
    }
    Camera_ErrorCode preCode =
        OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, surfaceID, &previewOutput);
    if (cameraOutputCapability == nullptr || preCode != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed. %{public}d  %{public}s", preCode,
                     surfaceID);
    }
    Camera_ErrorCode photoSurface =
        OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, photoProfile, &photoOutput);
    if (cameraOutputCapability == nullptr || photoSurface != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePhotoOutputWithoutSurface failed.");
    }
}

void CreateCaptureSession()
{
    if (cameraManager == nullptr) {
        OH_LOG_ERROR(LOG_APP, "cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
    }
    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_BeginConfig failed.");
    }
    ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddInput failed.");
    }
    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPreviewOutput failed.");
    }
    ret = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput failed.");
    }
    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed.");
    }
    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed.");
    }
    LOGI("camera session start end");
}


napi_value initWithSurface(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

napi_value captureSessionAddPreviewOutput(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    if (cameraManager == nullptr) {
        OH_LOG_ERROR(LOG_APP, "cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
    }
    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    OH_CaptureSession_Release(captureSession);
    napi_value ret1;
    napi_create_int32(env, ret, &ret1);
    return ret1;
}

napi_value captureSessionRemovePreviewOutput(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    if (cameraManager == nullptr) {
        OH_LOG_ERROR(LOG_APP, "cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
    }
    ret = OH_CaptureSession_RemovePreviewOutput(captureSession, previewOutput);
    OH_CaptureSession_Release(captureSession);
    napi_value ret1;
    napi_create_int32(env, ret, &ret1);
    return ret1;
}

napi_value captureSessionBeginConfig(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    if (cameraManager == nullptr) {
        OH_LOG_ERROR(LOG_APP, "cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
    }
    OH_CaptureSession_BeginConfig(captureSession);
    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_BeginConfig failed.");
    }
    OH_CaptureSession_Release(captureSession);
    napi_value ret1;
    napi_create_int32(env, ret, &ret1);
    return ret1;
}

napi_value captureSessionStart(napi_env env, napi_callback_info info)
{
    CreateAndOpenCamera();
    Camera_ErrorCode result = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (result != CAMERA_OK) {
        napi_value ret;
        napi_create_int32(env, result, &ret);
        return ret;
    }
    Camera_ErrorCode error = OH_CaptureSession_Start(captureSession);

    OH_CaptureSession_Release(captureSession);
    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info)
{
    CreateAndOpenCamera();
    Camera_ErrorCode result = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (result != CAMERA_OK) {
        napi_value ret;
        napi_create_int32(env, result, &ret);
        return ret;
    }
    bool res;
    Camera_ErrorCode error = OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession, STABILIZATION_MODE_OFF, &res);
    OH_CaptureSession_Release(captureSession);
    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionSetVideoStabilizationMode(napi_env env, napi_callback_info info)
{
    CreateAndOpenCamera();
    Camera_ErrorCode result = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (result != CAMERA_OK) {
        napi_value ret;
        napi_create_int32(env, result, &ret);
        return ret;
    }
    Camera_ErrorCode error = OH_CaptureSession_SetVideoStabilizationMode(captureSession, STABILIZATION_MODE_OFF);
    OH_CaptureSession_Release(captureSession);
    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionEnableControlCenter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode error;
    switch (index) {
    case CASE_INDEX_1:
        error = OH_CaptureSession_EnableControlCenter(captureSession, true);
        break;
    case CASE_INDEX_2:
        error = OH_CaptureSession_EnableControlCenter(captureSession, false);
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionRelease(napi_env env, napi_callback_info info)
{
    Camera_ErrorCode error;
    if (captureSession) {
        error = OH_CaptureSession_Release(captureSession);
    }
    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionIsAutoDeviceSwitchSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    bool enable;
    Camera_ErrorCode error = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &enable);

    napi_value result;
    napi_get_boolean(env, enable, &result);
    return result;
}

napi_value captureSessionEnableAutoDeviceSwitch(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode error;
    bool enable = false;
    switch (index) {
    case CASE_INDEX_1:
        enable = true;
        break;
    case CASE_INDEX_2:
        enable = false;
        break;
    default:
        break;
    }

    error = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession, enable);

    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionIsMacroSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    bool enable;
    Camera_ErrorCode error = OH_CaptureSession_IsMacroSupported(captureSession, &enable);

    napi_value result;
    napi_get_boolean(env, enable, &result);
    return result;
}

napi_value captureSessionEnableMacro(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode error;
    bool enable;
    switch (index) {
    case CASE_INDEX_1:
        enable = true;
        error = OH_CaptureSession_EnableMacro(captureSession, enable);
        break;
    case CASE_INDEX_2:
        enable = false;
        error = OH_CaptureSession_EnableMacro(captureSession, enable);
        break;
    case CASE_INDEX_3:
        error = OH_CaptureSession_EnableMacro(nullptr, enable);
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionEnableMacroConfigAllow(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);

    Camera_ErrorCode error;

    if (cameraManager == nullptr) {
        OH_LOG_ERROR(LOG_APP, "cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
    }
    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_BeginConfig failed.");
    }
    bool enable;

    error = OH_CaptureSession_EnableMacro(captureSession, enable);

    napi_value ret1;
    napi_create_int32(env, error, &ret1);
    return ret1;
}

napi_value captureSessionGetWhiteBalanceRange(napi_env env, napi_callback_info info)
{
    int32_t min;
    int32_t max;
    Camera_ErrorCode error = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &min, &max);

    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionSetWhiteBalance(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    int32_t min;
    int32_t max;
    Camera_ErrorCode err = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &min, &max);
    napi_value ret1;
    napi_create_int32(env, err, &ret1);

    int32_t Temperature = 0;
    switch (index) {
    case CASE_INDEX_1:
        Temperature = 2799;
        break;
    case CASE_INDEX_2:
        Temperature = 10001;
        break;
    case CASE_INDEX_3:
        Temperature = 2800;
        break;
    case CASE_INDEX_4:
        Temperature = 10000;
        break;
    default:
        break;
    }

    Camera_ErrorCode error = OH_CaptureSession_SetWhiteBalance(captureSession, Temperature);
    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionEmu(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    int32_t code;
    switch (index) {
    case CASE_INDEX_1:
        code = Camera_PhotoQualityPrioritization::CAMERA_PHOTO_QUALITY_PRIORITIZATION_HIGH_QUALITY;
        break;
    case CASE_INDEX_2:
        code = Camera_FoldStatus::CAMERA_FOLD_STATUS_NON_FOLDABLE;
        break;
    case CASE_INDEX_3:
        code = Camera_FoldStatus::CAMERA_FOLD_STATUS_EXPANDED;
        break;
    case CASE_INDEX_4:
        code = Camera_FoldStatus::CAMERA_FOLD_STATUS_FOLDED;
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHCaptureSessionGetSupportedEffectTypesSupp(napi_env env, napi_callback_info info)
{
    Camera_ErrorCode errorCode;
    Camera_ControlCenterEffectType *effectType = new Camera_ControlCenterEffectType[1];
    uint32_t size;
    errorCode = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &effectType, &size);
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}


napi_value OHCaptureSessionDeleteSupportedEffectTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode code;
    Camera_ErrorCode errorCode;
    Camera_ControlCenterEffectType *effectType = new Camera_ControlCenterEffectType[1];
    uint32_t size;
    uint32_t sizes;
    errorCode = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &effectType, &size);
    switch (index) {
    case CASE_INDEX_1:
        sizes = 2;
        code = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, effectType, sizes);
        break;
    case CASE_INDEX_2:
        sizes = 3;
        code = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, effectType, sizes);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHCameraInputOpenConcurrentCameras(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_CameraInput_OpenConcurrentCameras(cameraInput,
                                                    Camera_ConcurrentType::CAMERA_CONCURRENT_TYPE_LIMITED_CAPABILITY);
        break;
    case CASE_INDEX_2:
        code = OH_CameraInput_OpenConcurrentCameras(cameraInput,
                                                    Camera_ConcurrentType::CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHCameraInputOpenConcurrentCamerasErr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode errorCode = CAMERA_OK;
    uint32_t cameraCount = 0;
    Camera_Device *cameras = nullptr;
    napi_value result = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &cameraCount);
    const int minCameraCount = 2;
    if (cameraCount < minCameraCount) {
        OH_LOG_WARN(LOG_APP, "fewer than two cameras, skip the use case");
        napi_create_int32(env, CAMERA_CONFLICT_CAMERA, &result);
        return result;
    }
    Camera_Input *frontCameraInput = nullptr;
    Camera_Input *backCameraInput = nullptr;
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[0], &backCameraInput);
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[1], &frontCameraInput);
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_CameraInput_OpenConcurrentCameras(frontCameraInput,
            Camera_ConcurrentType::CAMERA_CONCURRENT_TYPE_LIMITED_CAPABILITY);
        if (errorCode != CAMERA_OK) {
            OH_CameraInput_Close(frontCameraInput);
            OH_CameraInput_Close(backCameraInput);
            napi_create_int32(env, errorCode, &result);
            return result;
        }
        errorCode = OH_CameraInput_OpenConcurrentCameras(backCameraInput,
            Camera_ConcurrentType::CAMERA_CONCURRENT_TYPE_LIMITED_CAPABILITY);
        if (errorCode != CAMERA_CONFLICT_CAMERA) {
            OH_CameraInput_Close(frontCameraInput);
            OH_CameraInput_Close(backCameraInput);
            napi_create_int32(env, CAMERA_CONFLICT_CAMERA, &result);
            return result;
        }
        break;
    default:
        break;
    }
    OH_CameraInput_Close(frontCameraInput);
    OH_CameraInput_Close(backCameraInput);
    napi_value retValue;
    napi_create_int32(env, errorCode, &retValue);
    return retValue;
}

napi_value TestCreateDeferredPreviewOutputSucc(napi_env env, napi_callback_info info)
{
    uint32_t cameraCount = 0;
    Camera_Device *cameras = nullptr;
    napi_value result = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &cameraCount);
    Camera_OutputCapability* outputCapability = nullptr;
    OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &cameras[0], Camera_SceneMode::NORMAL_PHOTO, &outputCapability);
    previewProfile = outputCapability->previewProfiles[0];

    Camera_PreviewOutput* previewOutput = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateDeferredPreviewOutput(cameraManager, previewProfile, &previewOutput);
    if (ret != CAMERA_OK) {
        napi_create_int32(env, ret, &result);
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateDeferredPreviewOutput failed. %{public}d", ret);
        return result;
    }

    if (previewOutput) {
        OH_PreviewOutput_Release(previewOutput);
    }

    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestCreateDeferredPreviewOutputWithNullArgs(napi_env env, napi_callback_info info)
{
    uint32_t cameraCount = 0;
    Camera_Device *cameras = nullptr;
    napi_value result = nullptr;

    OH_Camera_GetCameraManager(&cameraManager);
    OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &cameraCount);
    Camera_OutputCapability* outputCapability = nullptr;
    OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &cameras[0], Camera_SceneMode::NORMAL_PHOTO, &outputCapability);
    previewProfile = outputCapability->previewProfiles[0];
    Camera_PreviewOutput* previewOutput = nullptr;

    Camera_ErrorCode ret = OH_CameraManager_CreateDeferredPreviewOutput(nullptr, previewProfile, &previewOutput);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        return result;
    }
    ret = OH_CameraManager_CreateDeferredPreviewOutput(cameraManager, nullptr, &previewOutput);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateDeferredPreviewOutput failed. %{public}d", ret);
        return result;
    }

    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestCreateDeferredPreviewOutputWithInvalidProfile(napi_env env, napi_callback_info info)
{
    uint32_t cameraCount = 0;
    Camera_Device *cameras = nullptr;
    napi_value result = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &cameraCount);

    Camera_OutputCapability* outputCapability = nullptr;
    OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &cameras[0], Camera_SceneMode::NORMAL_PHOTO, &outputCapability);
    
    Camera_Profile invalidProfile = *(outputCapability->previewProfiles[0]);
    invalidProfile.size.width = 0;
    invalidProfile.size.height = 0;

    Camera_PreviewOutput* previewOutput = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateDeferredPreviewOutput(
        cameraManager, &invalidProfile, &previewOutput);
    if (ret != CAMERA_SERVICE_FATAL_ERROR) {
        napi_create_int32(env, ret, &result);
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateDeferredPreviewOutput failed. %{public}d", ret);
        return result;
    }

    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestIsTorchLevelControlSupportedErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool isSupported = false;
    Camera_ErrorCode ret = OH_CameraManager_IsTorchLevelControlSupported(nullptr, &isSupported);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        return result;
    }
    
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestIsTorchLevelControlSupportedSucc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool isSupported = false;
    
    Camera_Manager* cameraManager = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    OH_LOG_ERROR(LOG_APP, "cameraManager is. %{public}d", cameraManager);
    Camera_ErrorCode ret = OH_CameraManager_IsTorchLevelControlSupported(cameraManager, &isSupported);
    if (ret != CAMERA_OK) {
        napi_create_int32(env, ret, &result);
        return result;
    }
    
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestSetTorchModeOnWithLevelErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const double normalTorchLevel = 1.0;
    const double negativeTorchLevel = -1.0;
    const double overRangeTorchLevel = 1.1;
    Camera_ErrorCode ret = OH_CameraManager_SetTorchModeOnWithLevel(nullptr, normalTorchLevel);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        return result;
    }

    Camera_Manager* cameraManager = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    if (!cameraManager) {
        napi_create_int32(env, CAMERA_INVALID_ARGUMENT, &result);
        return result;
    }
    
    ret = OH_CameraManager_SetTorchModeOnWithLevel(cameraManager, negativeTorchLevel);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        return result;
    }

    ret = OH_CameraManager_SetTorchModeOnWithLevel(cameraManager, overRangeTorchLevel);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        return result;
    }

    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetPhysicalApertureSucc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char faceID[256];
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    OH_Camera_PhysicalAperture* apertures = nullptr;
    uint32_t size;
    OH_CaptureSession_GetSupportedPhysicalApertures(captureSession, &apertures, &size);
    OH_LOG_ERROR(LOG_APP, "apertures is %{public}d", apertures);
    OH_LOG_ERROR(LOG_APP, "size is %{public}d", size);
    if (size == 0) {
        OH_LOG_ERROR(LOG_APP, "No supported apertures found.");
        OH_CaptureSession_Release(captureSession);
        napi_create_int32(env, CAMERA_OK, &result);
        return result;
    }
    double setAperture = apertures[0].apertures[0];
    OH_LOG_ERROR(LOG_APP, "setAperture is %{public}f", setAperture);
    float zoom = apertures->zoomRange.maxZoom;
    OH_LOG_ERROR(LOG_APP, "zoom is %{public}f", zoom);
    OH_CaptureSession_SetZoomRatio(captureSession, zoom);
    const int waitZoomSeconds = 1;
    std::this_thread::sleep_for(std::chrono::seconds(waitZoomSeconds));
    OH_CaptureSession_SetPhysicalAperture(captureSession, setAperture);
    const int waitApertureSeconds = 1;
    std::this_thread::sleep_for(std::chrono::seconds(waitApertureSeconds));
    double getAperture;
    Camera_ErrorCode ret = OH_CaptureSession_GetPhysicalAperture(captureSession, &getAperture);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetPhysicalAperture failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    if (fabs(setAperture - getAperture) > 1e-6) {
        OH_LOG_ERROR(LOG_APP, "Set aperture (%f) and get aperture (%f) mismatch.", setAperture, getAperture);
        OH_CaptureSession_Release(captureSession);
        return nullptr;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetPhysicalApertureWithNullSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    double aperture;
    Camera_ErrorCode ret = OH_CaptureSession_GetPhysicalAperture(nullptr, &aperture);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetPhysicalAperture failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetPhysicalApertureWithUnconfiguredSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    double aperture;
    Camera_Manager *cameraManager = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    Camera_CaptureSession *captureSession = nullptr;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    Camera_ErrorCode ret = OH_CaptureSession_GetPhysicalAperture(captureSession, &aperture);
    if (ret != CAMERA_SESSION_NOT_CONFIG) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetPhysicalAperture failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestSetPhysicalApertureSucc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char faceID[256];
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    OH_Camera_PhysicalAperture* apertures = nullptr;
    uint32_t size;
    OH_CaptureSession_GetSupportedPhysicalApertures(captureSession, &apertures, &size);
    OH_LOG_ERROR(LOG_APP, "apertures is %{public}d", apertures);
    OH_LOG_ERROR(LOG_APP, "size is %{public}d", size);
    if (size == 0) {
        OH_LOG_ERROR(LOG_APP, "No supported apertures found.");
        OH_CaptureSession_Release(captureSession);
        napi_create_int32(env, CAMERA_OK, &result);
        return result;
    }
    double setAperture = apertures[0].apertures[0];
    OH_LOG_ERROR(LOG_APP, "setAperture is %{public}f", setAperture);
    float zoom = apertures->zoomRange.maxZoom;
    OH_LOG_ERROR(LOG_APP, "zoom is %{public}f", zoom);
    OH_CaptureSession_SetZoomRatio(captureSession, zoom);
    const int waitZoomSeconds = 1;
    std::this_thread::sleep_for(std::chrono::seconds(waitZoomSeconds));
    Camera_ErrorCode ret = OH_CaptureSession_SetPhysicalAperture(captureSession, setAperture);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetPhysicalAperture failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestSetPhysicalApertureWithNullSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    double aperture;
    Camera_ErrorCode ret = OH_CaptureSession_SetPhysicalAperture(nullptr, aperture);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetPhysicalAperture fail. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestSetPhysicalApertureWithUnconfiguredStream(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char faceID[256];
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    OH_Camera_PhysicalAperture* apertures = nullptr;
    uint32_t size;
    OH_CaptureSession_GetSupportedPhysicalApertures(captureSession, &apertures, &size);
    OH_LOG_ERROR(LOG_APP, "apertures is %{public}d", apertures);
    OH_LOG_ERROR(LOG_APP, "size is %{public}d", size);
    if (size == 0) {
        OH_LOG_ERROR(LOG_APP, "No supported apertures found.");
        OH_CaptureSession_Release(captureSession);
        napi_create_int32(env, CAMERA_SESSION_NOT_CONFIG, &result);
        return result;
    }
    double setAperture = apertures[0].apertures[0];
    OH_LOG_ERROR(LOG_APP, "setAperture is %{public}f", setAperture);
    float zoom = apertures->zoomRange.maxZoom;
    OH_LOG_ERROR(LOG_APP, "zoom is %{public}f", zoom);
    OH_CaptureSession_SetZoomRatio(captureSession, zoom);
    const int waitZoomSeconds = 1;
    std::this_thread::sleep_for(std::chrono::seconds(waitZoomSeconds));
    OH_CaptureSession_Release(captureSession);
    Camera_CaptureSession *captureSession = nullptr;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    OH_CaptureSession_SetSessionMode(captureSession, Camera_SceneMode::NORMAL_PHOTO);
    Camera_ErrorCode ret = OH_CaptureSession_SetPhysicalAperture(captureSession, setAperture);
    if (ret != CAMERA_SESSION_NOT_CONFIG) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetPhysicalAperture failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    captureSession = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetSupportedExposureDurationRangeSucc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char faceID[256];
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    int32_t minExposureDuration;
    int32_t maxExposureDuration;
    Camera_ErrorCode ret = OH_CaptureSession_GetSupportedExposureDurationRange(
        captureSession, &minExposureDuration, &maxExposureDuration);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetSupportedExposureDurationRange failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetSupportedExposureDurationRangeWithNullSession(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t minExposureDuration;
    int32_t maxExposureDuration;
    Camera_ErrorCode ret = OH_CaptureSession_GetSupportedExposureDurationRange(
        nullptr, &minExposureDuration, &maxExposureDuration);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetSupportedExposureDurationRange fail: %{public}d", ret);
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetSupportedExposureDurationRangeWithUnconfiguredStream(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Camera_Manager *cameraManager = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    Camera_CaptureSession *captureSession = nullptr;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    OH_CaptureSession_SetSessionMode(captureSession, Camera_SceneMode::NORMAL_PHOTO);
    int32_t minExposureDuration;
    int32_t maxExposureDuration;
    Camera_ErrorCode ret = OH_CaptureSession_GetSupportedExposureDurationRange(
        captureSession, &minExposureDuration, &maxExposureDuration);
    if (ret != CAMERA_SESSION_NOT_CONFIG) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetSupportedExposureDurationRange failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestSetExposureDurationSucc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char faceID[256];
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    int32_t minExposureDuration;
    int32_t maxExposureDuration;
    OH_CaptureSession_GetSupportedExposureDurationRange(captureSession, &minExposureDuration, &maxExposureDuration);
    Camera_ErrorCode ret = OH_CaptureSession_SetExposureDuration(captureSession, maxExposureDuration);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetExposureDuration failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    ret = OH_CaptureSession_SetExposureDuration(captureSession, minExposureDuration);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetExposureDuration failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestSetExposureDurationWithInvalidValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t exposureDuration;
    Camera_ErrorCode ret = OH_CaptureSession_SetExposureDuration(nullptr, exposureDuration);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetExposureDuration fail. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestSetExposureDurationWithUnconfiguredStream(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Camera_Manager *cameraManager = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    Camera_CaptureSession *captureSession = nullptr;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    int32_t exposureDuration = 1000;
    Camera_ErrorCode ret = OH_CaptureSession_SetExposureDuration(captureSession, exposureDuration);
    if (ret != CAMERA_SESSION_NOT_CONFIG) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetExposureDuration failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetExposureDurationSucc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char faceID[256];
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    int32_t minExposureDuration;
    int32_t maxExposureDuration;
    int32_t exposureDuration = 0;
    Camera_ErrorCode ret = OH_CaptureSession_GetExposureDuration(captureSession, &exposureDuration);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetExposureDuration failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestGetExposureDurationWithUnconfiguredStream(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Camera_Manager *cameraManager = nullptr;
    OH_Camera_GetCameraManager(&cameraManager);
    Camera_CaptureSession *captureSession = nullptr;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    OH_CaptureSession_SetSessionMode(captureSession, Camera_SceneMode::NORMAL_PHOTO);
    int32_t exposureDuration;
    Camera_ErrorCode ret = OH_CaptureSession_GetExposureDuration(captureSession, &exposureDuration);
    if (ret != CAMERA_SESSION_NOT_CONFIG) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetExposureDuration failed. %{public}d", ret);
        napi_create_int32(env, ret, &result);
        OH_CaptureSession_Release(captureSession);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestAddDeferredSurfaceSucc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    Camera_ErrorCode ret = OH_PreviewOutput_AddDeferredSurface(previewOutput, faceID);
    if (ret != CAMERA_OK) {
        napi_create_int32(env, ret, &result);
        OH_PreviewOutput_Release(previewOutput);
        return result;
    }
    OH_PreviewOutput_Release(previewOutput);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestAddDeferredSurfaceErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    Camera_ErrorCode ret = OH_PreviewOutput_AddDeferredSurface(nullptr, faceID);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        return result;
    }
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    ret = OH_PreviewOutput_AddDeferredSurface(previewOutput, nullptr);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        OH_PreviewOutput_Release(previewOutput);
        return result;
    }
    OH_PreviewOutput_Release(previewOutput);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestAddDeferredSurfaceWithEmptyStr(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    Camera_ErrorCode ret = OH_PreviewOutput_AddDeferredSurface(previewOutput, faceID);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        napi_create_int32(env, ret, &result);
        OH_PreviewOutput_Release(previewOutput);
        return result;
    }
    OH_PreviewOutput_Release(previewOutput);
    napi_create_int32(env, ret, &result);
    return result;
}

void OnIsoValueChanged(Camera_CaptureSession* session, int32_t isoValue) {
}
napi_value captureSessionRegisterIsoChangeCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode error;
    switch (index) {
    case CASE_INDEX_1:
        error = OH_CaptureSession_RegisterIsoChangeCallback(captureSession, OnIsoValueChanged);
        break;
    case CASE_INDEX_2:
        error = OH_CaptureSession_RegisterIsoChangeCallback(nullptr, OnIsoValueChanged);
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}

napi_value captureSessionUnregisterIsoChangeCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode error;
    switch (index) {
    case CASE_INDEX_1:
        error = OH_CaptureSession_UnregisterIsoChangeCallback(captureSession, OnIsoValueChanged);
        break;
    case CASE_INDEX_2:
        error = OH_CaptureSession_UnregisterIsoChangeCallback(nullptr, OnIsoValueChanged);
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, error, &ret);
    return ret;
}
