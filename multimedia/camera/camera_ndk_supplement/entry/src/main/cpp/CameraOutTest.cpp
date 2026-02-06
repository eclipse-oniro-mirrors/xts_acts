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

#include <hilog/log.h>
#include <ohcamera/camera.h>
#include <ohcamera/camera_manager.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/camera_device.h>
#include <ohcamera/camera_input.h>
#include <ohcamera/photo_output.h>
#include <ohcamera/photo_native.h>
#include <string>
#include <napi/native_api.h>
#include <ohcamera/video_output.h>
#include <unistd.h>
#include "CameraComTest.h"
#include "CameraErrCodeTest.h"

#include <hilog/log.h>
#define CAMERA_LOG_TAG "LOG_CAMERA_TEST_TAG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LogD(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
#define LogE(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)

void PhotoOutputOnFrameStart(Camera_PhotoOutput* photoOutput)
{
}

void PhotoOutputOnFrameShutter(Camera_PhotoOutput* photoOutput, Camera_FrameShutterInfo* info)
{
}

void PhotoOutputOnFrameEnd(Camera_PhotoOutput* photoOutput, int32_t frameCount)
{
}

void PhotoOutputOnError(Camera_PhotoOutput* photoOutput, Camera_ErrorCode errorCode)
{
}

static napi_value RegisterCallbackInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_ErrorCode rest = OH_VideoOutput_RegisterCallback(nullptr, nullptr);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value UnregisterCallbackInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_ErrorCode rest = OH_VideoOutput_UnregisterCallback(nullptr, nullptr);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputStart(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_VideoOutput* videoOutput = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_CaptureSession* captureSession = nullptr;
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        uint32_t size;
        rest = OH_CameraManager_GetSupportedCameras(cameraNdkCommon.cameraManager,
                                                    &cameraNdkCommon.cameraDevice,
                                                    &size);
        Camera_Input *cIp = nullptr;
        rest = OH_CameraManager_CreateCameraInput(cameraNdkCommon.cameraManager, cameraNdkCommon.cameraDevice, &cIp);
        rest = OH_CameraInput_Open(cIp);
        rest = OH_CaptureSession_BeginConfig(captureSession);
        rest = OH_CaptureSession_AddInput(captureSession, cIp);
        videoOutput = cameraNdkCommon.CreateVideoOutput(outstr.c_str());
        rest = OH_CaptureSession_AddVideoOutput(captureSession, videoOutput);
        rest = OH_VideoOutput_Start(videoOutput);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_VideoOutput_Start(videoOutput);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputStopInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_ErrorCode rest = OH_VideoOutput_Stop(nullptr);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SESSION_NOT_CONFIG) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputReleaseInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_ErrorCode rest = OH_VideoOutput_Release(nullptr);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SESSION_NOT_CONFIG) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputGetActiveProfile(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    
    Camera_VideoProfile* vconf = nullptr;
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_VideoOutput* videoOutput = cameraNdkCommon.CreateVideoOutput(outstr.c_str());
    Camera_ErrorCode rest = OH_VideoOutput_GetActiveProfile(videoOutput, &vconf);
    ret = rest;
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputIsMirrorSupportedInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_VideoOutput* videoOutput = nullptr;
    bool isSupported;
    Camera_ErrorCode rest = OH_VideoOutput_IsMirrorSupported(videoOutput, &isSupported);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputEnableMirrorInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_VideoOutput* videoOutput = nullptr;
    bool mirrorMode = true;
    Camera_ErrorCode rest = OH_VideoOutput_EnableMirror(videoOutput, mirrorMode);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputGetVideoRotationInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_VideoOutput* videoOutput = nullptr;
    int deviceDegree = 0;
    Camera_ImageRotation* imageRotation = nullptr;
    Camera_ErrorCode rest = OH_VideoOutput_GetVideoRotation(videoOutput, deviceDegree, imageRotation);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    } else if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputGetSupportedFrameRates(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_VideoOutput* videoOutput = cameraNdkCommon.CreateVideoOutput(outstr.c_str());
    Camera_FrameRateRange* frameRateRange = nullptr;
    uint32_t size;
    Camera_ErrorCode rest = OH_VideoOutput_GetSupportedFrameRates(videoOutput, &frameRateRange, &size);
    ret = rest;
    if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value VideoOutputGetActiveFrameRate(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_VideoOutput* videoOutput = cameraNdkCommon.CreateVideoOutput(outstr.c_str());
    Camera_FrameRateRange frameRateRange;
    Camera_ErrorCode rest = OH_VideoOutput_GetActiveFrameRate(videoOutput, &frameRateRange);
    ret = rest;
    if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputRegisterCallbackInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PreviewOutput* previewOutput = nullptr;
    PreviewOutput_Callbacks* callback = nullptr;
    Camera_ErrorCode rest = OH_PreviewOutput_RegisterCallback(previewOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

void PreviewOutptOnFrameStartCb(Camera_PreviewOutput* previewOutput)
{
}

void PreviewOutptOnFrameEndCb(Camera_PreviewOutput* previewOutput, int32_t frameCount)
{
}

void PreviewOutptOnErrorCb(Camera_PreviewOutput* previewOutput, Camera_ErrorCode errorCode)
{
}

static napi_value PreviewOutputUnregisterCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_PreviewOutput* previewOutput = cameraNdkCommon.CreatePreviewOutput(outstr.c_str());
        PreviewOutput_Callbacks setPreviewOutputCallbacks = {
            .onFrameStart = &PreviewOutptOnFrameStartCb,
            .onFrameEnd = &PreviewOutptOnFrameEndCb,
            .onError = &PreviewOutptOnErrorCb
        };
        Camera_ErrorCode rest = OH_PreviewOutput_UnregisterCallback(previewOutput, &setPreviewOutputCallbacks);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_PreviewOutput_UnregisterCallback(nullptr, nullptr);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputStart(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_CaptureSession* captureSession = nullptr;
        OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        Camera_Input *cameraInput = nullptr;
        OH_CameraManager_CreateCameraInput(cameraNdkCommon.cameraManager, cameraNdkCommon.cameraDevice, &cameraInput);
        OH_CameraInput_Open(cameraInput);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_AddInput(captureSession, cameraInput);
        Camera_PreviewOutput* previewOutput = cameraNdkCommon.CreatePreviewOutput(outstr.c_str());
        OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
        OH_CaptureSession_CommitConfig(captureSession);
        Camera_ErrorCode rest = OH_PreviewOutput_Start(previewOutput);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        } else if (rest == CAMERA_SERVICE_FATAL_ERROR) {
            ret = CAMERA_OK;
        } else if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_PreviewOutput_Start(nullptr);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputStopInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PreviewOutput* previewOutput = nullptr;
    Camera_ErrorCode rest = OH_PreviewOutput_Stop(previewOutput);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputReleaseInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PreviewOutput* previewOutput = nullptr;
    Camera_ErrorCode rest = OH_PreviewOutput_Release(previewOutput);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputGetActiveProfile(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PreviewOutput* previewOutput = nullptr;
    Camera_Profile* profile = nullptr;
    Camera_ErrorCode rest = OH_PreviewOutput_GetActiveProfile(previewOutput, &profile);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    } else if (ret == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputDeleteProfile(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_Profile* profile = nullptr;
    Camera_ErrorCode rest = OH_PreviewOutput_DeleteProfile(profile);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputGetPreviewRotationInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PreviewOutput* previewOutput = nullptr;
    int displayRotation = 0;
    Camera_ImageRotation* imageRotation = nullptr;
    Camera_ErrorCode rest = OH_PreviewOutput_GetPreviewRotation(previewOutput, displayRotation, imageRotation);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputSetPreviewRotationInvalidParm(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PreviewOutput* previewOutput = nullptr;
    Camera_ImageRotation previewRotation;
    bool isDisplayLocked = false;
    Camera_ErrorCode rest = OH_PreviewOutput_SetPreviewRotation(previewOutput, previewRotation, isDisplayLocked);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}
    
static napi_value PhotoOutputIsSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(outstr.c_str());
        PhotoOutput_Callbacks photoOutputListener = {
            .onFrameStart = PhotoOutputOnFrameStart,
            .onFrameShutter = PhotoOutputOnFrameShutter,
            .onFrameEnd = PhotoOutputOnFrameEnd,
            .onError = PhotoOutputOnError
        };
        Camera_PhotoQualityPrioritization qualitypz;
        bool isSp;
        Camera_ErrorCode rest = OH_PhotoOutput_IsPhotoQualityPrioritizationSupported(photoOutput, qualitypz, &isSp);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_PhotoOutput* photoOutput = nullptr;
        Camera_PhotoQualityPrioritization qualitypz;
        bool isSp;
        Camera_ErrorCode rest = OH_PhotoOutput_IsPhotoQualityPrioritizationSupported(photoOutput, qualitypz, &isSp);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputQuality(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_PhotoOutput* photoOutput = nullptr;
    Camera_PhotoQualityPrioritization qualityPrioritization = CAMERA_PHOTO_QUALITY_PRIORITIZATION_SPEED;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        photoOutput = cameraNdkCommon.CreatePhotoOutput(outstr.c_str());
        Camera_ErrorCode rest = OH_PhotoOutput_SetPhotoQualityPrioritization(photoOutput, qualityPrioritization);
        ret = rest;
        if (rest == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_PhotoOutput_SetPhotoQualityPrioritization(photoOutput, qualityPrioritization);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        photoOutput = cameraNdkCommon.CreatePhotoOutput(outstr.c_str());
        Camera_ErrorCode rest = OH_PhotoOutput_SetPhotoQualityPrioritization(photoOutput, qualityPrioritization);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

void CameraMetadataOutputOnErrorCb(Camera_MetadataOutput* metadataOutput, Camera_ErrorCode errorCode)
{
}
void CameraMetadataOutputOnMetadataObjectAvailableCb(Camera_MetadataOutput* metadataOutput,
    Camera_MetadataObject* metadataObject, uint32_t size)
{
}

static napi_value MetadataOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_MetadataObjectType type = Camera_MetadataObjectType::FACE_DETECTION;
        Camera_MetadataOutput* metadataOutput = cameraNdkCommon.CreateMetadataOutput(type);
        MetadataOutput_Callbacks metadataOutputCb = {
            .onMetadataObjectAvailable = &CameraMetadataOutputOnMetadataObjectAvailableCb,
            .onError = &CameraMetadataOutputOnErrorCb
        };
        Camera_ErrorCode rest = OH_MetadataOutput_RegisterCallback(metadataOutput, &metadataOutputCb);
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_MetadataOutput_RegisterCallback(nullptr, nullptr);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value MetadataOutputUnregisterCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_MetadataObjectType type = Camera_MetadataObjectType::FACE_DETECTION;
        Camera_MetadataOutput* metadataOutput = cameraNdkCommon.CreateMetadataOutput(type);
        MetadataOutput_Callbacks metadataOutputCb = {
            .onMetadataObjectAvailable = &CameraMetadataOutputOnMetadataObjectAvailableCb,
            .onError = &CameraMetadataOutputOnErrorCb
        };
        Camera_ErrorCode rest = OH_MetadataOutput_RegisterCallback(metadataOutput, &metadataOutputCb);
        rest = OH_MetadataOutput_UnregisterCallback(metadataOutput, &metadataOutputCb);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_MetadataOutput_UnregisterCallback(nullptr, nullptr);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value MetadataOutputStart(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    Camera_MetadataOutput* metadataOutput = nullptr;
    Camera_MetadataObjectType type = Camera_MetadataObjectType::FACE_DETECTION;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        Camera_Input *cameraInput = nullptr;
        rest = OH_CameraManager_CreateCameraInput(cameraNdkCommon.cameraManager,
            cameraNdkCommon.cameraDevice, &cameraInput);
        rest = OH_CameraInput_Open(cameraInput);
        rest = OH_CaptureSession_BeginConfig(captureSession);
        rest = OH_CaptureSession_AddInput(captureSession, cameraInput);
        Camera_MetadataOutput* metadataOutput = cameraNdkCommon.CreateMetadataOutput(type);
        rest = OH_CaptureSession_AddMetadataOutput(captureSession, metadataOutput);
        rest = OH_MetadataOutput_Start(metadataOutput);
        ret = rest;
        OH_MetadataOutput_Stop(metadataOutput);
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_MetadataOutput_Start(metadataOutput);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_MetadataOutput* metadataOutput = cameraNdkCommon.CreateMetadataOutput(type);
        Camera_ErrorCode rest = OH_MetadataOutput_Start(metadataOutput);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value MetadataOutputStop(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_MetadataObjectType type = Camera_MetadataObjectType::FACE_DETECTION;
    Camera_CaptureSession* captureSession = nullptr;
    Camera_MetadataOutput* metadataOutput = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        Camera_Input *cameraInput = nullptr;
        rest = OH_CameraManager_CreateCameraInput(cameraNdkCommon.cameraManager,
            cameraNdkCommon.cameraDevice, &cameraInput);
        rest = OH_CameraInput_Open(cameraInput);
        rest = OH_CaptureSession_BeginConfig(captureSession);
        rest = OH_CaptureSession_AddInput(captureSession, cameraInput);
        metadataOutput = cameraNdkCommon.CreateMetadataOutput(type);
        rest = OH_CaptureSession_AddMetadataOutput(captureSession, metadataOutput);
        OH_MetadataOutput_Start(metadataOutput);
        rest = OH_MetadataOutput_Stop(metadataOutput);
        ret = rest;
        if (rest == CAMERA_SERVICE_FATAL_ERROR) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_MetadataOutput_Stop(metadataOutput);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value MetadataOutputRelease(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        Camera_MetadataObjectType type = Camera_MetadataObjectType::FACE_DETECTION;
        Camera_CaptureSession* captureSession = nullptr;
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        ret = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        Camera_Input *cameraInput = nullptr;
        ret = OH_CameraManager_CreateCameraInput(cameraNdkCommon.cameraManager,
            cameraNdkCommon.cameraDevice, &cameraInput);
        ret = OH_CameraInput_Open(cameraInput);
        ret = OH_CaptureSession_BeginConfig(captureSession);
        ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
        Camera_MetadataOutput* metadataOutput = cameraNdkCommon.CreateMetadataOutput(type);
        ret = OH_CaptureSession_AddMetadataOutput(captureSession, metadataOutput);
        OH_MetadataOutput_Start(metadataOutput);
        OH_MetadataOutput_Stop(metadataOutput);
        Camera_ErrorCode rest = OH_MetadataOutput_Release(metadataOutput);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_MetadataOutput_Release(nullptr);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoNativeGetMainImage(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    OH_PhotoNative* photoNative = nullptr;
    OH_ImageNative* mainImage = nullptr;
    if (index == ARG_INDEX_0) {
        Camera_ErrorCode rest = OH_PhotoNative_GetMainImage(photoNative, &mainImage);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_PhotoNative_GetMainImage(photoNative, &mainImage);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoNativeRelease(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    OH_PhotoNative* photo = nullptr;
    Camera_ErrorCode rest = OH_PhotoNative_Release(photo);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(outstr.c_str());
        PhotoOutput_Callbacks photoOutputListener = {
            .onFrameStart = PhotoOutputOnFrameStart,
            .onFrameShutter = PhotoOutputOnFrameShutter,
            .onFrameEnd = PhotoOutputOnFrameEnd,
            .onError = PhotoOutputOnError
        };
        Camera_ErrorCode rest = OH_PhotoOutput_RegisterCallback(photoOutput, &photoOutputListener);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_PhotoOutput_RegisterCallback(nullptr, nullptr);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputUnregisterCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(outstr.c_str());
        PhotoOutput_Callbacks photoOutputListener = {
            .onFrameStart = PhotoOutputOnFrameStart,
            .onFrameShutter = PhotoOutputOnFrameShutter,
            .onFrameEnd = PhotoOutputOnFrameEnd,
            .onError = PhotoOutputOnError
        };
        Camera_ErrorCode rest = OH_PhotoOutput_RegisterCallback(photoOutput, &photoOutputListener);
        rest = OH_PhotoOutput_UnregisterCallback(photoOutput, &photoOutputListener);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_PhotoOutput_UnregisterCallback(nullptr, nullptr);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}
void CaptureStartWithInfo(Camera_PhotoOutput* photoOutput, Camera_CaptureStartInfo* Info)
{
    return ;
}
static napi_value PhotoOutputRegisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string outstr;
    if (GetString(env, info, 1, outstr) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(outstr.c_str());
        PhotoOutput_Callbacks photoOutputListener = {
            .onFrameStart = PhotoOutputOnFrameStart,
            .onFrameShutter = PhotoOutputOnFrameShutter,
            .onFrameEnd = PhotoOutputOnFrameEnd,
            .onError = PhotoOutputOnError
        };
        Camera_ErrorCode rest = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(photoOutput, CaptureStartWithInfo);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(nullptr, nullptr);
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputGetPhotoRotation(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    int deviceDegree = 0;
    Camera_ImageRotation* imageRotation = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_GetPhotoRotation(photoOutput, deviceDegree, imageRotation);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputUnregisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_CaptureStartWithInfo callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputRegisterCaptureEndCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_CaptureEnd callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_RegisterCaptureEndCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}


static napi_value PhotoOutputUnregisterCaptureEndCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_CaptureEnd callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_UnregisterCaptureEndCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputRegisterFrameShutterEndCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_OnFrameShutterEnd callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_RegisterFrameShutterEndCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputRegisterEstimatedCaptureDurationCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_EstimatedCaptureDuration callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputUnregisterEstimatedCaptureDurationCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_EstimatedCaptureDuration callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputRegisterPhotoAvailableCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_PhotoAvailable callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_RegisterPhotoAvailableCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputUnregisterPhotoAvailableCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_PhotoAvailable callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_UnregisterPhotoAvailableCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputRegisterPhotoAssetAvailableCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_PhotoAssetAvailable callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputUnregisterPhotoAssetAvailableCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    OH_PhotoOutput_PhotoAssetAvailable callback = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback(photoOutput, callback);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputRelease(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    Camera_ErrorCode rest = OH_PhotoOutput_Release(photoOutput);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputIsMirrorSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    bool isSupported;
    Camera_ErrorCode rest = OH_PhotoOutput_IsMirrorSupported(photoOutput, &isSupported);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputEnableMirror(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    Camera_PhotoOutput* photoOutput = nullptr;
    bool enabled = true;
    Camera_ErrorCode rest = OH_PhotoOutput_EnableMirror(photoOutput, ret);
    if (rest == CAMERA_INVALID_ARGUMENT) {
        ret = CAMERA_OK;
    }
    napi_value result;
    return ReturnInt(env, ret, &result);
}

void CaptureSessionOnMacroStatusChange(Camera_CaptureSession* session, bool isMacroDetected)
{
}

static napi_value CaptureSessionRegisterMacroStatusChangeCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_CaptureSession* captureSession = nullptr;
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_RegisterMacroStatusChangeCallback(captureSession, CaptureSessionOnMacroStatusChange);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_RegisterMacroStatusChangeCallback(nullptr, nullptr);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionUnregisterMacroStatusChangeCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_RegisterMacroStatusChangeCallback(captureSession, CaptureSessionOnMacroStatusChange);
        rest = OH_CaptureSession_UnregisterMacroStatusChangeCallback(captureSession, CaptureSessionOnMacroStatusChange);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_UnregisterMacroStatusChangeCallback(captureSession, nullptr);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputCapture(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string surfaceId;
    if (GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(surfaceId.c_str());
        Camera_ErrorCode rest = OH_PhotoOutput_Capture(photoOutput);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_RUNNING) {
            ret = CAMERA_OK;
        }
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputCaptureWithCaptureSetting(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string surfaceId;
    if (GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_PhotoOutput* photoOutput = nullptr;
    Camera_Location cameraLocation = {
        .latitude = 0.0f,
        .longitude = 0.0f,
        .altitude = 0.0f
    };
    Camera_PhotoCaptureSetting capSettings = {
        .mirror = false,
        .quality = QUALITY_LEVEL_HIGH,
        .rotation = IAMGE_ROTATION_0,
        .location = &cameraLocation
    };
    Camera_ErrorCode rest;
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    photoOutput = cameraNdkCommon.CreatePhotoOutput(surfaceId.c_str());
    rest = OH_PhotoOutput_Capture_WithCaptureSetting(photoOutput, capSettings);
    ret = rest;
    if (rest == CAMERA_SESSION_NOT_RUNNING) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputGetActiveProfile(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string surfaceId;
    if (GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_Profile* profile = nullptr;
    Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(surfaceId.c_str());
    Camera_ErrorCode rest = OH_PhotoOutput_GetActiveProfile(photoOutput, &profile);
    ret = rest;
    if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputIsMovingPhotoSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string surfaceId;
    if (GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(surfaceId.c_str());
    bool isSupported;
    Camera_ErrorCode rest = OH_PhotoOutput_IsMovingPhotoSupported(photoOutput, &isSupported);
    ret = rest;
    if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PhotoOutputEnableMovingPhoto(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string surfaceId;
    if (GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_PhotoOutput* photoOutput = cameraNdkCommon.CreatePhotoOutput(surfaceId.c_str());
    bool isSupported;
    Camera_ErrorCode rest = OH_PhotoOutput_EnableMovingPhoto(photoOutput, &isSupported);
    ret = rest;
    if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputGetSupportedFrameRates(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string surfaceId;
    if (GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_PreviewOutput* preview = cameraNdkCommon.CreatePreviewOutput(surfaceId.c_str());
    Camera_FrameRateRange* frameRateRange = nullptr;
    uint32_t size;
    Camera_ErrorCode rest = OH_PreviewOutput_GetSupportedFrameRates(preview, &frameRateRange, &size);
    ret = rest;
    if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

static napi_value PreviewOutputGetActiveFrameRate(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    std::string surfaceId;
    if (GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_PreviewOutput* preview = cameraNdkCommon.CreatePreviewOutput(surfaceId.c_str());
    Camera_FrameRateRange frameRateRange;
    Camera_ErrorCode rest = OH_PreviewOutput_GetActiveFrameRate(preview, &frameRateRange);
    ret = rest;
    if (rest == CAMERA_SERVICE_FATAL_ERROR) {
        ret = CAMERA_OK;
    }
    return ReturnInt(env, ret, &result);
}

void DeviceSwitchStatusChange(Camera_CaptureSession* session, Camera_AutoDeviceSwitchStatusInfo* status)
{
    return;
}

static napi_value CaptureSessionRegisterAutoDeviceSwitchStatusCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    napi_value result;
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_CaptureSession* captureSession = nullptr;
    Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
    rest = OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(captureSession, DeviceSwitchStatusChange);
    ret = rest;
    if (rest == CAMERA_OK) {
        ret = rest;
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionUnregisterAutoDeviceSwitchStatusCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(captureSession, DeviceSwitchStatusChange);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = rest;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(captureSession, nullptr);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionIsAutoDeviceSwitchSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    bool isSupported = false;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = rest;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_3) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        rest = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionEnableAutoDeviceSwitch(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    bool isSupported = false;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        if (rest != CAMERA_OK) {
            LogE("OH_CaptureSession_IsAutoDeviceSwitchSupported failed, ret = %{public}d", ret);
            return ReturnInt(env, ret, &result);
        }
        if (isSupported) {
            rest = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession, isSupported);
            ret = rest;
            if (rest == CAMERA_OPERATION_NOT_ALLOWED) {
                ret = CAMERA_OK;
            }
            LogD("CaptureSessionEnableAutoDeviceSwitch isSupported, ret = %{public}d", ret);
        } else {
            rest = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession, isSupported);
            ret = rest;
            if (rest == CAMERA_OPERATION_NOT_ALLOWED) {
                ret = CAMERA_OK;
            }
            LogD("CaptureSessionEnableAutoDeviceSwitch is not Supported, ret = %{public}d", ret);
        }
    } else if (index == ARG_INDEX_1) {
        ret = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        Camera_ErrorCode rest = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession, isSupported);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionEnableAutoDeviceSwch(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    bool isSupported = false;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        if (rest != CAMERA_OK) {
            LogE("OH_CaptureSession_IsAutoDeviceSwitchSupported failed, ret = %{public}d", ret);
            return ReturnInt(env, ret, &result);
        }
        if (isSupported) {
            rest = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession, isSupported);
            ret = rest;
            if (ret == CAMERA_SESSION_NOT_CONFIG) {
                ret = CAMERA_OK;
            }
            LogD("CaptureSessionEnableAutoDeviceSwch isSupported, ret = %{public}d", ret);
        } else {
            rest = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession, isSupported);
            ret = rest;
            if (rest == CAMERA_SESSION_NOT_CONFIG) {
                ret = CAMERA_OK;
            }
            LogD("CaptureSessionEnableAutoDeviceSwch is not Supported, ret = %{public}d", ret);
        }
    } else if (index == ARG_INDEX_1) {
        ret = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession, &isSupported);
        Camera_ErrorCode rest = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession, isSupported);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionSetQualityPrioritization(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    Camera_QualityPrioritization qpz = POWER_BALANCE;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetQualityPrioritization(captureSession, qpz);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_SetQualityPrioritization(captureSession, qpz);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionIsMacroSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    bool isSupported = false;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_Input* cameraInput = nullptr;
        OH_CameraManager_CreateCameraInput(cameraNdkCommon.cameraManager, cameraNdkCommon.cameraDevice, &cameraInput);
        OH_CameraInput_Open(cameraInput);
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, Camera_SceneMode::NORMAL_PHOTO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_AddInput(captureSession, cameraInput);
        rest = OH_CaptureSession_IsMacroSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = rest;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_IsMacroSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetSessionMode(captureSession, Camera_SceneMode::NORMAL_PHOTO);
        rest = OH_CaptureSession_IsMacroSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionEnableMacro(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    bool enabled = true;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        if (rest != CAMERA_OK) {
            return ReturnInt(env, ret, &result);
        }
        bool isSupportedMacro = false;
        rest = OH_CaptureSession_IsMacroSupported(captureSession, &isSupportedMacro);
        rest = OH_CaptureSession_EnableMacro(captureSession, isSupportedMacro);
        ret = rest;
        if (rest == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_EnableMacro(captureSession, enabled);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionIsWhiteBalanceModeSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    std::string surfaceId;
    if (GetInt(env, info, 0, index) == false || GetString(env, info, 1, surfaceId) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* capSession = nullptr;
    Camera_WhiteBalanceMode whiteBalanceMode;
    bool isSpd = false;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &capSession);
        rest = OH_CaptureSession_SetSessionMode(capSession, NORMAL_VIDEO);
        Camera_Input *cInput = nullptr;
        rest = OH_CameraManager_CreateCameraInput(cameraNdkCommon.cameraManager, cameraNdkCommon.cameraDevice, &cInput);
        rest = OH_CameraInput_Open(cInput);
        rest = OH_CaptureSession_BeginConfig(capSession);
        rest = OH_CaptureSession_AddInput(capSession, cInput);
        Camera_VideoOutput* videoOutput = cameraNdkCommon.CreateVideoOutput(surfaceId.c_str());
        rest = OH_CaptureSession_AddVideoOutput(capSession, videoOutput);
        rest = OH_CaptureSession_CommitConfig(capSession);
        rest = OH_CaptureSession_IsWhiteBalanceModeSupported(capSession, CAMERA_WHITE_BALANCE_MODE_AUTO, &isSpd);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_IsWhiteBalanceModeSupported(capSession, whiteBalanceMode, &isSpd);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &capSession);
        rest = OH_CaptureSession_IsWhiteBalanceModeSupported(capSession, CAMERA_WHITE_BALANCE_MODE_AUTO, &isSpd);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(capSession);
    return ReturnInt(env, ret, &result);
}

static napi_value CaptureSessionGetWhiteBalanceMode(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    Camera_WhiteBalanceMode whiteBalanceMode;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        if (rest != CAMERA_OK) {
            return ReturnInt(env, ret, &result);
        }
        rest = OH_CaptureSession_GetWhiteBalanceMode(captureSession, &whiteBalanceMode);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalanceMode(captureSession, &whiteBalanceMode);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        if (rest != CAMERA_OK) {
            LogD("CaptureSessionGetWhiteBalanceMode::OH_CameraManager_CreateCaptureSession failed: %{public}d", rest);
            return ReturnInt(env, ret, &result);
        }
        OH_CaptureSession_SetWhiteBalanceMode(captureSession, CAMERA_WHITE_BALANCE_MODE_AUTO);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_GetWhiteBalanceMode(captureSession, &whiteBalanceMode);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

static napi_value Register01(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"RegisterCallbackInvalidParm", nullptr, RegisterCallbackInvalidParm, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"UnregisterCallbackInvalidParm", nullptr, UnregisterCallbackInvalidParm, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoOutputStart", nullptr, VideoOutputStart, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoOutputStopInvalidParm", nullptr, VideoOutputStopInvalidParm, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoOutputReleaseInvalidParm", nullptr, VideoOutputReleaseInvalidParm, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoOutputGetActiveProfile", nullptr, VideoOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoOutputIsMirrorSupportedInvalidParm", nullptr, VideoOutputIsMirrorSupportedInvalidParm, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"VideoOutputEnableMirrorInvalidParm", nullptr, VideoOutputEnableMirrorInvalidParm, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoOutputGetVideoRotationInvalidParm", nullptr, VideoOutputGetVideoRotationInvalidParm, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"PreviewOutputRegisterCallbackInvalidParm", nullptr, PreviewOutputRegisterCallbackInvalidParm, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"PreviewOutputUnregisterCallback", nullptr, PreviewOutputUnregisterCallback, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"PreviewOutputStart", nullptr, PreviewOutputStart, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PreviewOutputStopInvalidParm", nullptr, PreviewOutputStopInvalidParm, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PreviewOutputReleaseInvalidParm", nullptr, PreviewOutputReleaseInvalidParm, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PreviewOutputGetPreviewRotationInvalidParm", nullptr, PreviewOutputGetPreviewRotationInvalidParm,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PreviewOutputSetPreviewRotationInvalidParm", nullptr, PreviewOutputSetPreviewRotationInvalidParm, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputIsSupported", nullptr, PhotoOutputIsSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputQuality", nullptr, PhotoOutputQuality, nullptr, nullptr, nullptr,
            napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

static napi_value Register02(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"MetadataOutputRegisterCallback", nullptr, MetadataOutputRegisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"MetadataOutputUnregisterCallback", nullptr, MetadataOutputUnregisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"MetadataOutputStart", nullptr, MetadataOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"MetadataOutputStop", nullptr, MetadataOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"MetadataOutputRelease", nullptr, MetadataOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoNativeGetMainImage", nullptr, PhotoNativeGetMainImage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoNativeRelease", nullptr, PhotoNativeRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputRegisterCallback", nullptr, PhotoOutputRegisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputUnregisterCallback", nullptr, PhotoOutputUnregisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputRegisterCaptureStartWithInfoCallback", nullptr, PhotoOutputRegisterCaptureStartWithInfoCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputUnregisterCaptureStartWithInfoCallback", nullptr,
            PhotoOutputUnregisterCaptureStartWithInfoCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputRegisterCaptureEndCallback", nullptr, PhotoOutputRegisterCaptureEndCallback, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"PhotoOutputUnregisterCaptureEndCallback", nullptr, PhotoOutputUnregisterCaptureEndCallback, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"PhotoOutputGetPhotoRotation", nullptr, PhotoOutputGetPhotoRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputRegisterFrameShutterEndCallback", nullptr, PhotoOutputRegisterFrameShutterEndCallback, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputRegisterEstimatedCaptureDurationCallback", nullptr,
            PhotoOutputRegisterEstimatedCaptureDurationCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputUnregisterEstimatedCaptureDurationCallback", nullptr,
            PhotoOutputUnregisterEstimatedCaptureDurationCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputRelease", nullptr, PhotoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputIsMirrorSupported", nullptr, PhotoOutputIsMirrorSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputEnableMirror", nullptr, PhotoOutputEnableMirror, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

static napi_value Register03(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"CaptureSessionRegisterMacroStatusChangeCallback", nullptr, CaptureSessionRegisterMacroStatusChangeCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionUnregisterMacroStatusChangeCallback", nullptr,
            CaptureSessionUnregisterMacroStatusChangeCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputRegisterPhotoAvailableCallback", nullptr, PhotoOutputRegisterPhotoAvailableCallback, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputUnregisterPhotoAvailableCallback", nullptr, PhotoOutputUnregisterPhotoAvailableCallback, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputRegisterPhotoAssetAvailableCallback", nullptr, PhotoOutputRegisterPhotoAssetAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PhotoOutputUnregisterPhotoAssetAvailableCallback", nullptr, PhotoOutputUnregisterPhotoAssetAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PreviewOutputGetActiveProfile", nullptr, PreviewOutputGetActiveProfile,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PreviewOutputDeleteProfile", nullptr, PreviewOutputDeleteProfile,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"VideoOutputGetSupportedFrameRates", nullptr, VideoOutputGetSupportedFrameRates, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"VideoOutputGetActiveFrameRate", nullptr, VideoOutputGetActiveFrameRate, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputCapture", nullptr, PhotoOutputCapture, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputCaptureWithCaptureSetting", nullptr, PhotoOutputCaptureWithCaptureSetting, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"PhotoOutputGetActiveProfile", nullptr, PhotoOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputIsMovingPhotoSupported", nullptr, PhotoOutputIsMovingPhotoSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PhotoOutputEnableMovingPhoto", nullptr, PhotoOutputEnableMovingPhoto, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PreviewOutputGetSupportedFrameRates", nullptr, PreviewOutputGetSupportedFrameRates, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"PreviewOutputGetActiveFrameRate", nullptr, PreviewOutputGetActiveFrameRate, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"CaptureSessionEnableAutoDeviceSwch", nullptr, CaptureSessionEnableAutoDeviceSwch, nullptr, nullptr,
            nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}


static napi_value Register04(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"CaptureSessionRegisterAutoDeviceSwitchStatusCallback", nullptr,
            CaptureSessionRegisterAutoDeviceSwitchStatusCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionUnregisterAutoDeviceSwitchStatusCallback", nullptr,
            CaptureSessionUnregisterAutoDeviceSwitchStatusCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionIsAutoDeviceSwitchSupported", nullptr,
            CaptureSessionIsAutoDeviceSwitchSupported, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionEnableAutoDeviceSwitch", nullptr,
            CaptureSessionEnableAutoDeviceSwitch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionSetQualityPrioritization", nullptr,
            CaptureSessionSetQualityPrioritization, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionIsMacroSupported", nullptr,
            CaptureSessionIsMacroSupported, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionEnableMacro", nullptr,
            CaptureSessionEnableMacro, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionIsWhiteBalanceModeSupported", nullptr,
            CaptureSessionIsWhiteBalanceModeSupported, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionGetWhiteBalanceMode", nullptr,
            CaptureSessionGetWhiteBalanceMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionGetWhiteBalanceRange", nullptr,
            CaptureSessionGetWhiteBalanceRange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionGetWhiteBalance", nullptr,
            CaptureSessionGetWhiteBalance, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionSetWhiteBalance", nullptr,
            CaptureSessionSetWhiteBalance, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionSetWhiteBalanceMode", nullptr,
            CaptureSessionSetWhiteBalanceMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionRegisterSystem", nullptr,
            CaptureSessionRegisterSystem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionUnregisterSystem", nullptr,
            CaptureSessionUnregisterSystem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionIsControlCenterSupported", nullptr,
            CaptureSessionIsControlCenterSupported, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionGetSupportedEffectTypes", nullptr,
            CaptureSessionGetSupportedEffectTypes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionDeleteSupportedEffectTypes", nullptr,
            CaptureSessionDeleteSupportedEffectTypes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionEnableControlCenter", nullptr,
            CaptureSessionEnableControlCenter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CaptureSessionRegisterControl", nullptr, CaptureSessionRegisterControl, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"CaptureSessionUnregisterControl", nullptr, CaptureSessionUnregisterControl, nullptr, nullptr, nullptr,
            napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    exports = Register01(env, exports);
    exports = Register02(env, exports);
    exports = Register03(env, exports);
    exports = Register04(env, exports);
    return exports;
}
EXTERN_C_END

/*
 * module define
 */
static napi_module g_module = {.nm_version = 1,
                               .nm_flags = 0,
                               .nm_filename = nullptr,
                               .nm_register_func = Init,
                               .nm_modname = "cameraout",
                               .nm_priv = ((void *)0),
                               .reserved = {0}};

/*
 * module register
 */
extern "C" __attribute__((constructor)) void MyPixelMapRegisterModule(void) { napi_module_register(&g_module); }