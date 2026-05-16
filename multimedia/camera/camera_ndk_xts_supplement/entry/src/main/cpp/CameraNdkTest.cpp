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

#include "CameraNdkTest.h"
#include <cstddef>
#include <cstdint>
#include <ohcamera/camera_manager.h>
#include <ohcamera/metadata_output.h>

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
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8

static Camera_Manager *cameraManager = nullptr;
static Camera_Input *cameraInput = nullptr;
static Camera_Device *cameras = nullptr;
static Camera_Profile *previewProfile = nullptr;
static Camera_Profile *photoProfile = nullptr;
static Camera_PreviewOutput *previewOutput = nullptr;
static Camera_PhotoOutput *photoOutput = nullptr;
static Camera_CaptureSession *captureSession = nullptr;
static char  g_faceId[256];

static void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    OH_LOG_INFO(LOG_APP, "CameraManagerStatusCallback is called");
}

static CameraManager_Callbacks *GetCameraManagerListener()
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}

static void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode: %{public}d", errorCode);
}

static CameraInput_Callbacks *GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}

static bool IsSupportedSceneMode(Camera_Device camera, Camera_SceneMode sceneMode)
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

static void CreateAndOpenCamera()
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
    LOGI("OH_CameraManager_GetSupportedCameras %{public}s %{public}d", cameras[0].cameraId, size);
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

static void createPhotoOutput(char *surFaceId)
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
        OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, surFaceId, &previewOutput);
    if (cameraOutputCapability == nullptr || preCode != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed. %{public}d  %{public}s", preCode,
                     surFaceId);
    }
    Camera_ErrorCode photoSurface =
        OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, photoProfile, &photoOutput);
    if (cameraOutputCapability == nullptr || photoSurface != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePhotoOutputWithoutSurface failed.");
    }
}

static void CreateCaptureSession()
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
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed. %{public}d", ret);
    }
    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed.");
    }
    LOGI("camera session start end");
}


napi_value initWithSurfaces(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0],  g_faceId, sizeof( g_faceId), &uuidLen);
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

void CreatePhotoSession()
{
    CreateAndOpenCamera();
    createPhotoOutput( g_faceId);
    CreateCaptureSession();
}

void ReleasePhotoSession()
{
    if (cameraInput != nullptr) {
        OH_CameraInput_Release(cameraInput);
    }
    if (previewOutput != nullptr) {
        OH_PreviewOutput_Release(previewOutput);
    }
    if (photoOutput != nullptr) {
        OH_PhotoOutput_Release(photoOutput);
    }
    if (captureSession != nullptr) {
        OH_CaptureSession_Release(captureSession);
    }
}

napi_value captureDeleteCameraDevices(napi_env env, napi_callback_info info)
{
    CreatePhotoSession();
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Type type = CAMERA_TYPE_DEFAULT;
    Camera_Device *cameras = nullptr;
    Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                        .cameraTypeSize = cameraSize,
                                        .cameraPosition = CAMERA_POSITION_FRONT,
                                        .connectionType = CAMERA_CONNECTION_BUILT_IN};
    result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &cameraSize, &cameras);
    OH_LOG_INFO(LOG_APP, "OH_CameraManager_GetCameraDevices, cameraManager=%{public}p, cameras=%{public}p",
                cameraManager, cameras);
    switch (index) {
    case CASE_INDEX_1:
        OH_LOG_INFO(LOG_APP, "Normal case, cameraManager=%{public}p, cameras=%{public}p", cameraManager, cameras);
        if (cameraManager == nullptr || cameras == nullptr) {
            OH_LOG_ERROR(LOG_APP, "cameraManager or cameras is null!");
            break;
        }
        result = OH_CameraManager_DeleteCameraDevices(cameraManager, cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_DeleteCameraDevices(nullptr, cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_DeleteCameraDevices(cameraManager, nullptr);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_DeleteCameraDevices(NULL, cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_DeleteCameraDevices(cameraManager, NULL);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureIsBandwidthCompressionSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    bool isSupported;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, &isSupported);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(nullptr, &isSupported);
        break;
    case CASE_INDEX_3:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, nullptr);
        break;
    case CASE_INDEX_4:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(NULL, &isSupported);
        break;
    case CASE_INDEX_5:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, NULL);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureEnableBandwidthCompression(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    CreatePhotoSession();
    Camera_ErrorCode result;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, true);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, false);
        break;
    case CASE_INDEX_3:
        result = OH_PreviewOutput_EnableBandwidthCompression(nullptr, true);
        break;
    case CASE_INDEX_4:
        result = OH_PreviewOutput_EnableBandwidthCompression(nullptr, false);
        break;
    case CASE_INDEX_5:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, NULL);
        break;
    case CASE_INDEX_6:
        result = OH_PreviewOutput_EnableBandwidthCompression(NULL, true);
        break;
    case CASE_INDEX_7:
        result = OH_PreviewOutput_EnableBandwidthCompression(NULL, false);
        break;
    case CASE_INDEX_8:
        result = OH_PreviewOutput_EnableBandwidthCompression(NULL, true);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureEnableBandwidthCompressionError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreateAndOpenCamera();
    createPhotoOutput(g_faceId);
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
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, true);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, false);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret1;
    napi_create_int32(env, result, &ret1);
    return ret1;
}

napi_value captureIsGetCameraDevices(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode cameraCode;
    uint32_t cameraSize = 0;
    Camera_Type type = CAMERA_TYPE_DEFAULT;
    Camera_Device *cameras = nullptr;
    Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                        .cameraTypeSize = cameraSize,
                                        .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                        .connectionType = CAMERA_CONNECTION_BUILT_IN};
    cameraCode = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &cameraSize, &cameras);
    int32_t enable = false;
    if (cameraCode == 0 && cameraSize >= 0) {
        enable = true;
    }
    ReleasePhotoSession();
    napi_value result;
    napi_get_boolean(env, enable, &result);
    return result;
};

napi_value captureGetSupportedFullCameraOutputCapabilityWithSceneMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    Camera_OutputCapability **cameraOutputCapability;
    uint32_t cameraSize = 0;
    Camera_Type type = CAMERA_TYPE_DEFAULT;
    Camera_Device *cameras = nullptr;
    Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                        .cameraTypeSize = cameraSize,
                                        .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                        .connectionType = CAMERA_CONNECTION_BUILT_IN};
    result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &cameraSize, &cameras);
    OH_LOG_INFO(
        LOG_APP,
        "OH_CameraManager_GetCameraDevices, cameraManager=%{public}p, cameras=%{public}p,cameras=%{public}d",
        cameraManager, cameras, cameraSize);
    switch (index) {
    case CASE_INDEX_1:
        OH_LOG_INFO(LOG_APP, "Normal case, cameraManager=%{public}p, cameras=%{public}p", cameraManager, cameras);
        if (cameraManager == nullptr || cameras == nullptr) {
            OH_LOG_ERROR(LOG_APP, "cameraManager or cameras is null!");
            break;
        };
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, cameras, NORMAL_PHOTO, cameraOutputCapability);
        break;
    case CASE_INDEX_2:
        if (cameraManager == nullptr || cameras == nullptr) {
            OH_LOG_ERROR(LOG_APP, "cameraManager or cameras is null!");
            break;
        };
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, cameras, NORMAL_VIDEO, cameraOutputCapability);
        break;
    case CASE_INDEX_3:
        if (cameraManager == nullptr || cameras == nullptr) {
            OH_LOG_ERROR(LOG_APP, "cameraManager or cameras is null!");
            break;
        };
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, cameras, SECURE_PHOTO, cameraOutputCapability);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, nullptr, NORMAL_PHOTO, cameraOutputCapability);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, nullptr, NORMAL_VIDEO, cameraOutputCapability);
        break;
    case CASE_INDEX_6:
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, nullptr, SECURE_PHOTO, cameraOutputCapability);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

void OnOcclusionDetectionCallback(const Camera_Input *cameraInput,
                                  Camera_OcclusionDetectionResult occlusionDetectionResult)
{
    
};

napi_value captureRegisterOcclusionDetectionCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    CreatePhotoSession();
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_2:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(nullptr, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_3:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput, nullptr);
        break;
    case CASE_INDEX_4:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(NULL, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_5:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput, NULL);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureUnregisterOcclusionDetectionCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    CreatePhotoSession();
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_2:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(nullptr, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_3:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput, nullptr);
        break;
    case CASE_INDEX_4:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(NULL, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_5:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput, NULL);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraPreconfigType(napi_env env, napi_callback_info info)
{
    Camera_PreconfigType result = PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureGetCameraDevices(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureGetCameraDevicesError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Type type = CAMERA_TYPE_DEFAULT;
    Camera_Device *cameras = nullptr;
    Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                        .cameraTypeSize = cameraSize,
                                        .cameraPosition = CAMERA_POSITION_FRONT,
                                        .connectionType = CAMERA_CONNECTION_BUILT_IN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(nullptr, &queryInfo, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, nullptr, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, nullptr, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &cameraSize, nullptr);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoCameraType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureSessionIsBandwidthCompressionSupportedTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    bool enable;
    Camera_ErrorCode error = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, &enable);
    ReleasePhotoSession();
    napi_value result;
    napi_get_boolean(env, enable, &result);
    return result;
}

napi_value captureCameraDeviceQueryInfoConnectionTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoConnectionType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoCameraPositions(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoCameraTypeSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoCameraTypeSizes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value getPreviewRotationWithoutDisplayRotation(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    CreatePhotoSession();
    Camera_ErrorCode result;
    Camera_ImageRotation *imageRotation;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(previewOutput, nullptr);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(nullptr, imageRotation);
        break;
    case CASE_INDEX_3:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(previewOutput, NULL);
        break;
    case CASE_INDEX_4:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(NULL, imageRotation);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}