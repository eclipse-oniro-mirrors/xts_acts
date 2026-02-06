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

#ifndef OHCAMERATEST_CAMERA_TEST_H
#define OHCAMERATEST_CAMERA_TEST_H

#include <ohcamera/camera.h>
#include <ohcamera/camera_manager.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/camera_device.h>
#include <ohcamera/camera_input.h>
#include <ohcamera/photo_output.h>
#include <string>


typedef enum CameraCallbackCode {
    CAMERA_INPUT_STATUS = 1,
    PREVIEW_ON_FRAME_START = 2,
    PREVIEW_ON_FRAME_END = 3,
    PREVIEW_ON_ERROR = 4,
    PHOTO_ON_FRAME_START = 5,
    PHOTO_ON_FRAME_SHUTTER = 6,
    PHOTO_ON_FRAME_END = 7,
    PHOTO_ON_ERROR = 8,
    VIDEO_ON_FRAME_START = 9,
    VIDEO_ON_FRAME_END = 10,
    VIDEO_ON_ERROR = 11,
    METADATA_OBJECT_AVAILABLE = 12,
    METADATA_OUTPUT_ERROR = 13,
    SESSION_ON_FOCUS_STATE_CHANGE = 14,
    SESSION_ON_ERROR = 15,
    CAMERA_MANAGER_STATUS = 16,
    NO_RECEIVED = 10086,
} CameraCallbackCode;

class NDKCamera {
public:
    explicit NDKCamera(char *str);
    ~NDKCamera(void);

    Camera_ErrorCode CreateCameraInput(void);
    Camera_ErrorCode CloseCameraInput(void);
    Camera_ErrorCode CreateCameras(void);
    Camera_ErrorCode CreatePhotoOutput(void);
    Camera_ErrorCode ReleasePhotoOutput(void);
    Camera_ErrorCode CreateCaptureSession(void);
    Camera_ErrorCode ReleaseCaptureSession(void);
    Camera_ErrorCode ReleaseCameraManger(void);
    Camera_ErrorCode CameraManagerRegisterCallback();
    CameraManager_Callbacks *GetCameraManagerListener(void);

    Camera_ErrorCode CameraOperationNotAllowed();
    Camera_ErrorCode CameraSessionNotConfig();
    Camera_ErrorCode CameraSessionNotRunning();
    Camera_ErrorCode CameraSessionConfigLocked();
    Camera_ErrorCode CameraConflictCamera();
    Camera_ErrorCode CameraDeviceDisabled();
    Camera_ErrorCode CameraDevicePreempted();
    Camera_ErrorCode CameraUnresolvedConflictsWithCurrentConfigurations();
    Camera_ErrorCode CaptureSessionRegisterCallback(void);
    CaptureSession_Callbacks* GetCaptureSessionRegister(void);
    Camera_ErrorCode SessionBegin(void);
    Camera_ErrorCode FrameworkToNdkCameraError(int err);
    Camera_ErrorCode SetCameraStatus(std::string info);
    CameraInput_Callbacks* GetCameraInputListener(void);
    Camera_ErrorCode CameraInputRegisterCallback(void);
    Camera_ErrorCode GetCameraFormat(int32_t index);
    Camera_ErrorCode HasFlashMode(int32_t index);
    Camera_ErrorCode GetExposureMode(int32_t index);
    Camera_ErrorCode GetCameraFocusMode(int32_t index);
    Camera_ErrorCode SessionIsVideoStabilizationModeSupported(int32_t index);
    Camera_ErrorCode TakePictureWithPhotoSettings(int32_t indexRotation, int32_t indexQualityLevel);
    Camera_ErrorCode GetCameraConcurrentInfo(int32_t index);
    Camera_ErrorCode SessionCanPreconfig(int32_t mode);
    Camera_ErrorCode SessionCanPreconfigWithRatio(int32_t ratio);
    PhotoOutput_Callbacks* GetPhotoOutputListener(void);
    Camera_ErrorCode PhotoOutputRegisterCallback(void);
    MetadataOutput_Callbacks* GetMetadataOutputListener(void);
    Camera_ErrorCode MetadataOutputRegisterCallback(void);
    Camera_ErrorCode CameraManagerRegisterTorchStatusCallback();
    Camera_ErrorCode CaptureSessionRegisterSmoothZoomInfoCallback();
    Camera_ErrorCode PhotoOutputRegisterCaptureStartWithInfoCallback();
    Camera_ErrorCode CameraManagerRegisterFoldStatusCallback();
    Camera_ErrorCode RegisterAutoDeviceSwitchStatusCallback();
    Camera_ErrorCode SessionSetQualityPrioritization(int32_t quality);
    Camera_ErrorCode CameraOpenConcurrentCameras(int32_t type);
    Camera_ErrorCode IsWhiteBalanceSupported(int32_t type);
    Camera_ErrorCode RegisterSystemPressureLevel();
    Camera_ErrorCode SessionGetSupportedEffectTypes(int32_t type);
    Camera_ErrorCode RegisterControlCenterEffectStatusChange();

    static CameraCallbackCode cameraCallbackCode_;
    volatile bool valid_;
protected:
    Camera_Manager* cameraManager_;
    Camera_CaptureSession* captureSession_;
    Camera_Device* cameras_;
    Camera_Input* cameraInput_;
    Camera_PhotoOutput* photoOutput_;
    Camera_OutputCapability* outputCap_;
    std::string previewSurfaceId_;
    uint32_t size_;
};

#endif // OHCAMERATEST_CAMERA_TEST_H