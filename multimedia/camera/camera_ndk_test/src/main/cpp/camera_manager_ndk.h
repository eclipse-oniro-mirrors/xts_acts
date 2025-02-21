/*
 * Copyright (c) 2023-2023 Huawei Device Co., Ltd.
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

#ifndef CAMERA_NATIVE_CAMERA_H
#define CAMERA_NATIVE_CAMERA_H

#include <native_buffer.h>
#include <unistd.h>
#include <string>
#include <thread>
#include <cstdio>
#include <fcntl.h>
#include "napi/native_api.h"
#include "iostream"
#include "mutex"
#include "hilog/log.h"
#include "camera.h"
#include "camera_manager.h"
#include "camera_input.h"
#include "capture_session.h"
#include "preview_output.h"
#include "photo_output.h"
#include "video_output.h"
#include <map>
#include <string>
#include <vector>

typedef enum CameraCallbackCode {
    CameraInput_Status = 1,
    Preview_OnFrameStart = 2,
    Preview_OnFrameEnd = 3,
    Preview_OnError = 4,
    Photo_OnFrameStart = 5,
    Photo_OnFrameShutter = 6,
    Photo_OnFrameEnd = 7,
    Photo_OnError = 8,
    Video_OnFrameStart = 9,
    Video_OnFrameEnd = 10,
    Video_OnError = 11,
    Metadata_Object_Available = 12,
    Metadata_Output_Error = 13,
    Session_OnFocusState_Change = 14,
    Session_OnError = 15,
    CameraManager_Status = 16,
    NoReceived = 10086,
} CameraCallbackCode;

class NDKCamera {
public:
    ~NDKCamera(void);
    NDKCamera(char *str);

    bool IsMirror_;
    bool HasFlash_;
    bool IsFlashMode_;
    bool IsExposureMode_;
    float minExposureBias_;
    float maxExposureBias_;
    float exposureBias_;
    bool isFocusSupported_;
    float minZoom_;
    float maxZoom_;
    float zoom_;
    bool isVideoSupported_;
    Camera_FlashMode flashMode_;
    Camera_ExposureMode exposureMode_;
    Camera_Point point_;
    Camera_FocusMode focusMode_;
    Camera_Point focusPoint_;
    Camera_VideoStabilizationMode videoMode_;
    Camera_Device* cameras_;
    Camera_OutputCapability* cameraOutputCapability_;

    //callback
    static CameraCallbackCode cameraCallbackCode_;

    Camera_ErrorCode CreateCameraInput(void);
    Camera_ErrorCode CreateCameraInputWithPositionAndType(Camera_Position position, Camera_Type type);
    Camera_ErrorCode CreateSession(void);
    Camera_ErrorCode CameraInputOpen(void);
    Camera_ErrorCode CameraInputClose(void);
    Camera_ErrorCode CameraInputRelease(void);
    Camera_ErrorCode GetSupportedCameras(void);
    Camera_ErrorCode GetSupportedOutputCapability(void);
    Camera_ErrorCode CreatePreviewOutput(void);
    Camera_ErrorCode CreatePhotoOutput(char* photoSurfaceId);
    Camera_ErrorCode CreateVideoOutput(char* videoId);
    Camera_ErrorCode CreateMetadataOutput(void);
    Camera_ErrorCode IsCameraMuted(void);
    Camera_ErrorCode PreviewOutputStop(void);
    Camera_ErrorCode PreviewOutputRelease(void);
    Camera_ErrorCode PhotoOutputRelease(void);
    Camera_ErrorCode HasFlashFn(uint32_t mode);
    Camera_ErrorCode setZoomRatioFn(uint32_t zoomRatio);

    Camera_ErrorCode SessionBegin(void);
    Camera_ErrorCode SessionCommitConfig(void);
    Camera_ErrorCode SessionStart(void);
    Camera_ErrorCode SessionStop(void);
    Camera_ErrorCode StartVideo(char* videoId);
    Camera_ErrorCode AddVideoOutput(void);
    Camera_ErrorCode VideoOutputStart(void);

    Camera_ErrorCode PreviewOutputStart(void);
    Camera_ErrorCode PhotoOutputCapture(void);
    Camera_ErrorCode TakePictureWithPhotoSettings(Camera_PhotoCaptureSetting photoSetting);
    Camera_ErrorCode IsMirrorSupported(void);
    Camera_ErrorCode VideoOutputStop(void);
    Camera_ErrorCode VideoOutputRelease(void);
    Camera_ErrorCode MetadataOutputStart(void);
    Camera_ErrorCode MetadataOutputStop(void);
    Camera_ErrorCode MetadataOutputRelease(void);

    Camera_ErrorCode SessionAddInput(void);
    Camera_ErrorCode SessionRemoveInput(void);
    Camera_ErrorCode SessionAddPreviewOutput(void);
    Camera_ErrorCode SessionAddPhotoOutput(void);
    Camera_ErrorCode SessionAddVideoOutput(void);
    Camera_ErrorCode SessionAddMetadataOutput(void);
    Camera_ErrorCode SessionRemovePreviewOutput(void);
    Camera_ErrorCode SessionRemovePhotoOutput(void);
    Camera_ErrorCode SessionRemoveVideoOutput(void);
    Camera_ErrorCode SessionRemoveMetadataOutput(void);
    Camera_ErrorCode SessionRelease(void);

    Camera_ErrorCode SessionHasFlash(void);
    Camera_ErrorCode SessionIsFlashModeSupported(uint32_t mode);
    Camera_ErrorCode SessionGetFlashMode(void);
    Camera_ErrorCode SessionSetFlashMode(uint32_t mode);

    Camera_ErrorCode SessionIsExposureModeSupported(uint32_t mode);
    Camera_ErrorCode SessionGetExposureMode(void);
    Camera_ErrorCode SessionSetExposureMode(uint32_t mode);
    Camera_ErrorCode SessionGetMeteringPoint(void);
    Camera_ErrorCode SessionSetMeteringPoint(double point_x, double point_y);
    Camera_ErrorCode SessionGetExposureBiasRange(void);
    Camera_ErrorCode SessionSetExposureBias(float exposureBias);
    Camera_ErrorCode SessionGetExposureBias(void);

    Camera_ErrorCode SessionIsFocusModeSupported(uint32_t mode);
    Camera_ErrorCode SessionGetFocusMode(void);
    Camera_ErrorCode SessionSetFocusMode(uint32_t mode);
    Camera_ErrorCode SessionSetFocusPoint(double point_x, double point_y);
    Camera_ErrorCode SessionGetFocusPoint(void);

    Camera_ErrorCode SessionGetZoomRatioRange(void);
    Camera_ErrorCode SessionGetZoomRatio(void);
    Camera_ErrorCode SessionSetZoomRatio(float zoom);

    Camera_ErrorCode SessionIsVideoStabilizationModeSupported(uint32_t mode);
    Camera_ErrorCode SessionGetVideoStabilizationMode(void);
    Camera_ErrorCode SessionSetVideoStabilizationMode(uint32_t mode);

    // RegisterCallback
    Camera_ErrorCode CameraManagerRegisterCallback(void);
    Camera_ErrorCode CameraInputRegisterCallback(void);
    Camera_ErrorCode PreviewOutputRegisterCallback(void);
    Camera_ErrorCode PhotoOutputRegisterCallback(void);
    Camera_ErrorCode VideoOutputRegisterCallback(void);
    Camera_ErrorCode MetadataOutputRegisterCallback(void);
    Camera_ErrorCode CaptureSessionRegisterCallback(void);

    // UnRegisterCallback
    Camera_ErrorCode CameraManagerUnRegisterCallback(void);
    Camera_ErrorCode CameraInputUnRegisterCallback(void);
    Camera_ErrorCode PreviewOutputUnRegisterCallback(void);
    Camera_ErrorCode PhotoOutputUnRegisterCallback(void);
    Camera_ErrorCode VideoOutputUnRegisterCallback(void);
    Camera_ErrorCode MetadataOutputUnRegisterCallback(void);
    Camera_ErrorCode CaptureSessionUnRegisterCallback(void);

    // Get callback
    CameraManager_Callbacks* GetCameraManagerListener(void);
    CameraInput_Callbacks* GetCameraInputListener(void);
    PreviewOutput_Callbacks* GetPreviewOutputListener(void);
    PhotoOutput_Callbacks* GetPhotoOutputListener(void);
    VideoOutput_Callbacks* GetVideoOutputListener(void);
    MetadataOutput_Callbacks* GetMetadataOutputListener(void);
    CaptureSession_Callbacks* GetCaptureSessionRegister(void);

private:
    NDKCamera(const NDKCamera&) = delete;
    NDKCamera& operator = (const NDKCamera&) = delete;

    Camera_Manager* cameraManager_;
    Camera_CaptureSession* captureSession_;
    uint32_t size_;
    const Camera_Profile* profile_;
    const Camera_VideoProfile* videoProfile_;
    Camera_PreviewOutput* previewOutput_;
    Camera_PhotoOutput* photoOutput_;
    Camera_VideoOutput* videoOutput_;
    const Camera_MetadataObjectType* metaDataObjectType_;
    Camera_MetadataOutput* metadataOutput_;
    Camera_Input* cameraInput_;
    bool* isCameraMuted_;
    char* previewSurfaceId_;
    Camera_ErrorCode ret_;
    float step_;

    static NDKCamera* ndkCamera_;
    static std::mutex mtx_;
    volatile bool valid_;
};
#endif  // CAMERA_NATIVE_CAMERA_H