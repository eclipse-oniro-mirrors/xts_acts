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
