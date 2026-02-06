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

#include "CameraComTest.h"
#include <hilog/log.h>
#include <multimedia/image_framework/image/image_receiver_native.h>
#include <native_window/external_window.h>
#define CAMERA_LOG_TAG "LOG_CAMERA_TEST_TAG"
#define CAMERA_LOG_DOMAIN 0x3200
#define HiDebug(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
#define HiError(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
namespace OHOS {
namespace CameraStandard {
void CameraNdkCommon::InitCamera(void)
{
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager);
    ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameraDevice, &cameraDeviceSize);
}

CameraNdkCommon::~CameraNdkCommon()
{
    ReleaseCamera();
}

void CameraNdkCommon::ReleaseCamera(void)
{
    Camera_ErrorCode ret = CAMERA_OK;
    if (cameraDevice != nullptr) {
        ret = OH_CameraManager_DeleteSupportedCameras(cameraManager, cameraDevice, cameraDeviceSize);
        cameraDevice = nullptr;
    }
    if (cameraManager != nullptr) {
        ret = OH_Camera_DeleteCameraManager(cameraManager);
        cameraManager = nullptr;
    }
}

void CameraNdkCommon::ObtainAvailableFrameRate(Camera_FrameRateRange activeframeRateRange,
                                               Camera_FrameRateRange*& frameRateRange, uint32_t size,
                                               int32_t &minFps, int32_t &maxFps)
{
    minFps = activeframeRateRange.min;
    maxFps = activeframeRateRange.max;
    bool flag = false;
    for (uint32_t i = 0; i < size; i++) {
        if (frameRateRange[i].min != activeframeRateRange.min ||
            frameRateRange[i].max != activeframeRateRange.max) {
            minFps = frameRateRange[i].min;
            maxFps = frameRateRange[i].max;
            flag = true;
            break;
        }
    }
    if (!flag) {
        if (maxFps > minFps + 1) {
            minFps++;
        }
    }
    return;
}

Camera_PhotoOutput* CameraNdkCommon::CreatePhotoOutput(const char *surfaceId, int32_t width, int32_t height)
{
    if (surfaceId == nullptr) {
        return nullptr;
    }
    Camera_OutputCapability* OutputCapability = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager,
                                                                               cameraDevice, &OutputCapability);
    if (ret != CAMERA_OK) {
        return nullptr;
    }
    Camera_PhotoOutput* photoOutput = nullptr;
    ret = OH_CameraManager_CreatePhotoOutput(cameraManager, OutputCapability->photoProfiles[0],
                                             surfaceId, &photoOutput);
    if (ret != CAMERA_OK) {
        return nullptr;
    }
    return photoOutput;
}

Camera_PreviewOutput* CameraNdkCommon::CreatePreviewOutput(const char *surfaceId, int32_t width, int32_t height)
{
    if (surfaceId == nullptr) {
        return nullptr;
    }
    Camera_OutputCapability* OutputCapability = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager,
                                                                               cameraDevice, &OutputCapability);
    if (ret != CAMERA_OK) {
        return nullptr;
    }
    
    Camera_PreviewOutput* previewOutput = nullptr;
    OH_CameraManager_CreatePreviewOutput(cameraManager, OutputCapability->previewProfiles[0],
        surfaceId, &previewOutput);
    return previewOutput;
}

Camera_VideoOutput* CameraNdkCommon::CreateVideoOutput(const char *surfaceId, int32_t width, int32_t height)
{
    if (surfaceId == nullptr) {
        return nullptr;
    }
    Camera_OutputCapability* OutputCapability = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager,
                                                                               cameraDevice, &OutputCapability);
    if (ret != CAMERA_OK) {
        return nullptr;
    }
    Camera_VideoOutput* videoOutput = nullptr;
    ret = OH_CameraManager_CreateVideoOutput(cameraManager, OutputCapability->videoProfiles[0],
                                             surfaceId, &videoOutput);
    return videoOutput;
}

Camera_MetadataOutput* CameraNdkCommon::CreateMetadataOutput(Camera_MetadataObjectType type)
{
    Camera_MetadataOutput* metadataOutput = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateMetadataOutput(cameraManager, &type, &metadataOutput);
    return metadataOutput;
}

void CameraNdkCommon::SessionCommit(Camera_CaptureSession *captureSession)
{
    Camera_ErrorCode ret = OH_CaptureSession_CommitConfig(captureSession);
    ret = OH_CaptureSession_Start(captureSession);
}

void CameraNdkCommon::SessionControlParams(Camera_CaptureSession *captureSession)
{
    float minZoom = 0.0f;
    float maxZoom = 0.0f;
    Camera_ErrorCode ret = OH_CaptureSession_GetZoomRatioRange(captureSession, &minZoom, &maxZoom);

    ret = OH_CaptureSession_SetZoomRatio(captureSession, minZoom);
    float minExposureBias = 0.0f;
    float maxExposureBias = 0.0f;
    float step = 0.0f;
    ret = OH_CaptureSession_GetExposureBiasRange(captureSession, &minExposureBias, &maxExposureBias, &step);

    Camera_ExposureMode exposureMode = Camera_ExposureMode::EXPOSURE_MODE_AUTO;
    bool* isSupportedExposureMode = nullptr;
    ret = OH_CaptureSession_IsExposureModeSupported(captureSession, exposureMode, isSupportedExposureMode);

    ret = OH_CaptureSession_SetExposureBias(captureSession, minExposureBias);
    Camera_FlashMode flash = Camera_FlashMode::FLASH_MODE_ALWAYS_OPEN;
    ret = OH_CaptureSession_SetFlashMode(captureSession, flash);
    Camera_FocusMode focus = Camera_FocusMode::FOCUS_MODE_AUTO;
    ret = OH_CaptureSession_SetFocusMode(captureSession, focus);
    Camera_ExposureMode exposure = Camera_ExposureMode::EXPOSURE_MODE_AUTO;
    ret = OH_CaptureSession_SetExposureMode(captureSession, exposure);

    float zoom = 0.0f;
    ret = OH_CaptureSession_GetZoomRatio(captureSession, &zoom);
    float exposureBias = 0.0f;
    ret = OH_CaptureSession_GetExposureBias(captureSession, &exposureBias);
    ret = OH_CaptureSession_GetFlashMode(captureSession, &flash);
    ret = OH_CaptureSession_GetFocusMode(captureSession, &focus);
    ret = OH_CaptureSession_GetExposureMode(captureSession, &exposure);
}
} // CameraStandard
} // OHOS