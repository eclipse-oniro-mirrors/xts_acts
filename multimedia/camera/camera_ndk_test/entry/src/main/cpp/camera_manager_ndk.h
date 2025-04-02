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

#include <native_buffer/native_buffer.h>
#include <unistd.h>
#include <string>
#include <thread>
#include <cstdio>
#include <fcntl.h>
#include "napi/native_api.h"
#include "iostream"
#include "mutex"
#include "hilog/log.h"
#include "ohcamera/camera.h"
#include "ohcamera/camera_manager.h"
#include "ohcamera/camera_input.h"
#include "ohcamera/capture_session.h"
#include "ohcamera/preview_output.h"
#include "ohcamera/photo_output.h"
#include "ohcamera/video_output.h"
#include <map>
#include <string>
#include <vector>
#include <ohcamera/camera_device.h>
#define COLOR_SPACE_NOT_SUPPORTED_MODE 3
#define TARGET_ZOOM 1.5
#define ALL_CALLBACK_IS_NULL 1
#define ONLY_ON_ERROR 2
#define ONLY_ON_FOCUS_STATE_CHANGE 3
#define INVALID_SURFACE_ID 4
#define SET_OH_COLORSPACE_SRGB_FULL 2
#define INVALID_MIN_FPS (-1)
#define INVALID_MAX_FPS 5
#define COLOR_SPACE_NOT_SUPPORTED 0
#define SET_CAMERA_FRONT_FOR_SECURE_PHOTO 5
#define BACK_CAMERA 0
#define FRONT_CAMERA 1

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
    PHOTO_ON_PHOTO_AVAILABLE = 17,
    PHOTO_ON_PHOTO_ASSET_AVAILABLE = 18,
} CameraCallbackCode;

typedef enum UseCaseCode {
    PARAMETER_OK = 0,
    PARAMETER1_ERROR = 1,
    PARAMETER2_ERROR = 2,
    PARAMETER3_ERROR = 3,
    PARAMETER4_ERROR = 4,
} UseCaseCode;

class NDKCamera {
public:
    ~NDKCamera(void);
    NDKCamera(char *str);

    bool IsMirror_;
    bool IsVideoMirror_;
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
    bool isAddInput_;
    Camera_Device *camera_;
    Camera_SceneMode *sceneModes_;
    Camera_SceneMode sceneMode_;
    uint64_t secureSeqId_;
    bool canPreconfig_;
    uint32_t sceneModesSize_;
    bool isNormalPhoto_;
    bool isNormalVideo_;
    bool isSecurePhoto_;
    bool isMovingPhotoSupported_;
    OH_PhotoNative *photoNative_;
    OH_ImageNative *mainImage_;
    bool isTorchSupported_;
    bool isTorchSupportedByTorchMode_;
    Camera_TorchMode torchMode_;
    uint32_t frameRatesSize_;
    uint32_t videoFrameRatesSize_;
    uint32_t colorSpacesSize_;
    OH_NativeBuffer_ColorSpace* colorSpace_;
    OH_NativeBuffer_ColorSpace activeColorSpace_;
    OH_NativeBuffer_ColorSpace setcolorSpace_;
    Camera_FrameRateRange* frameRateRange_;
    Camera_FrameRateRange activeFrameRateRange_;
    Camera_FrameRateRange* videoFrameRateRange_;
    Camera_FrameRateRange videoActiveFrameRateRange_;
    Camera_ImageRotation imageRotation_;
    Camera_ImageRotation previewRotation_;
    bool isCreatePhotoOutputWithoutSurface_;

    //callback
    static CameraCallbackCode cameraCallbackCode_;

    Camera_ErrorCode CreateCameraInput(void);
    Camera_ErrorCode CreateCameraInputWithPositionAndType(Camera_Position position, Camera_Type type);
    Camera_ErrorCode CreateSession(void);
    Camera_ErrorCode CameraInputOpen(void);
    Camera_ErrorCode CameraInputClose(void);
    Camera_ErrorCode CameraInputRelease(void);
    Camera_ErrorCode GetSupportedCameras(void);
    Camera_ErrorCode GetCameraOrientation(void);
    Camera_ErrorCode GetCameraHostName(void);
    Camera_ErrorCode GetCameraHostType(void);
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
    Camera_ErrorCode IsVideoMirrorSupported(void);
    Camera_ErrorCode EnableVideoMirror(bool isEnable);
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
    Camera_ErrorCode SessionGetPhotoRotation(int rotation);
    Camera_ErrorCode SessionGetVideoRotation(int rotation);
    Camera_ErrorCode SessionGetPreviewRotation(int rotation);
    Camera_ErrorCode SessionSetPreviewRotation(int rotation, bool isDisplayLocked);

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
    Camera_ErrorCode SessionSetQualityPrioritization(uint32_t quality);

    // RegisterCallback
    Camera_ErrorCode CameraManagerRegisterCallback(void);
    Camera_ErrorCode CameraInputRegisterCallback(void);
    Camera_ErrorCode PreviewOutputRegisterCallback(void);
    Camera_ErrorCode PhotoOutputRegisterCallback(void);
    Camera_ErrorCode VideoOutputRegisterCallback(void);
    Camera_ErrorCode MetadataOutputRegisterCallback(void);
    Camera_ErrorCode CaptureSessionRegisterCallback(void);
    Camera_ErrorCode CaptureSessionRegisterCallback(int useCaseCode);

    // UnRegisterCallback
    Camera_ErrorCode CameraManagerUnRegisterCallback(void);
    Camera_ErrorCode CameraInputUnRegisterCallback(void);
    Camera_ErrorCode PreviewOutputUnRegisterCallback(void);
    Camera_ErrorCode PhotoOutputUnRegisterCallback(void);
    Camera_ErrorCode VideoOutputUnRegisterCallback(void);
    Camera_ErrorCode MetadataOutputUnRegisterCallback(void);
    Camera_ErrorCode CaptureSessionUnRegisterCallback(void);
    Camera_ErrorCode CaptureSessionUnRegisterCallback(int useCaseCode);

    // Get callback
    CameraManager_Callbacks* GetCameraManagerListener(void);
    CameraInput_Callbacks* GetCameraInputListener(void);
    PreviewOutput_Callbacks* GetPreviewOutputListener(void);
    PhotoOutput_Callbacks* GetPhotoOutputListener(void);
    VideoOutput_Callbacks* GetVideoOutputListener(void);
    MetadataOutput_Callbacks* GetMetadataOutputListener(void);
    CaptureSession_Callbacks* GetCaptureSessionRegister(void);

    // RegisterCallback_On
    Camera_ErrorCode CaptureSessionRegisterCallbackOn(int useCaseCode);

    // UnregisterCallback_Off
    Camera_ErrorCode CaptureSessionUnregisterCallbackOff(int useCaseCode);

    // Get callback
    CaptureSession_Callbacks* GetCaptureSessionRegister(int useCaseCode);

    Camera_ErrorCode GetSupportedSceneModes(int useCaseCode);
    Camera_ErrorCode DeleteSceneModes(int useCaseCode);
    Camera_ErrorCode GetSupportedCameraOutputCapabilityWithSceneMode(int useCaseCode);
    Camera_ErrorCode SetSessionMode(int useCaseCode);
    Camera_ErrorCode CanAddInput(int useCaseCode);
    Camera_ErrorCode CanAddPreviewOutput(int useCaseCode);
    Camera_ErrorCode CanAddPhotoOutput(int useCaseCode);
    Camera_ErrorCode CanAddVideoOutput(int useCaseCode);
    Camera_ErrorCode AddSecureOutput(int useCaseCode);
    Camera_ErrorCode OpenSecureCamera(int useCaseCode);

    Camera_ErrorCode CreatePreviewOutputUsedInPreconfig(int useCaseCode);
    Camera_ErrorCode CreatePhotoOutputUsedInPreconfig(char *photoSurfaceId, int useCaseCode);
    Camera_ErrorCode CreateVideoOutputUsedInPreconfig(char *videoId, int useCaseCode);
    Camera_ErrorCode VideoOutputGetActiveProfile(int useCaseCode);
    Camera_ErrorCode VideoOutputDeleteProfile(int useCaseCode);
    Camera_ErrorCode SessionCanPreconfig(uint32_t mode, int useCaseCode);
    Camera_ErrorCode SessionCanPreconfigWithRatio(uint32_t mode, uint32_t mode2, int useCaseCode);
    Camera_ErrorCode SessionPreconfig(uint32_t mode, int useCaseCode);
    Camera_ErrorCode SessionPreconfigWithRatio(uint32_t mode, uint32_t mode2, int useCaseCode);
    Camera_ErrorCode PreviewOutputGetActiveProfile(int useCaseCode);
    Camera_ErrorCode PreviewOutputDeleteProfile(int useCaseCode);
    Camera_ErrorCode PhotoOutputGetActiveProfile(int useCaseCode);
    Camera_ErrorCode PhotoOutputDeleteProfile(int useCaseCode);
    
    Camera_ErrorCode RegisterPhotoAvailableCallback(int useCaseCode);
    Camera_ErrorCode UnregisterPhotoAvailableCallback(int useCaseCode);
    Camera_ErrorCode RegisterPhotoAssetAvailableCallback(int useCaseCode);
    Camera_ErrorCode UnregisterPhotoAssetAvailableCallback(int useCaseCode);
    Camera_ErrorCode IsMovingPhotoSupported(int useCaseCode);
    Camera_ErrorCode EnableMovingPhoto(int useCaseCode, bool enable);
    Camera_ErrorCode GetMainImage(int useCaseCode);
    Camera_ErrorCode PhotoNativeRelease(int useCaseCode);
    Camera_ErrorCode CreatePhotoOutputWithoutSurface(int useCaseCode);
	
    Camera_ErrorCode TorchMode(int useCaseCode);
    Camera_ErrorCode IsTorchSupported(int useCaseCode);
    Camera_ErrorCode IsTorchSupportedByTorchMode(int useCaseCode);
    Camera_ErrorCode SetTorchMode(int useCaseCode);
    Camera_ErrorCode GetExposureValue(int useCaseCode);
    Camera_ErrorCode GetFocalLength(int useCaseCode);
    Camera_ErrorCode SetSmoothZoom(int useCaseCode);
    Camera_ErrorCode GetSupportedColorSpaces(int useCaseCode);
    Camera_ErrorCode DeleteColorSpaces(int useCaseCode);
    Camera_ErrorCode GetActiveColorSpace(int useCaseCode);
    Camera_ErrorCode SetColorSpace(int useCaseCode);
    Camera_ErrorCode GetSupportedFrameRates(int useCaseCode);
    Camera_ErrorCode DeleteFrameRates(int useCaseCode);
    Camera_ErrorCode SetFrameRate(int useCaseCode);
    Camera_ErrorCode GetActiveFrameRate(int useCaseCode);
    Camera_ErrorCode VideoOutputGetSupportedFrameRates(int useCaseCode);
    Camera_ErrorCode VideoOutputSetFrameRate(int useCaseCode);
    Camera_ErrorCode VideoOutputGetActiveFrameRate(int useCaseCode);
    Camera_ErrorCode VideoOutputDeleteFrameRates(int useCaseCode);
    Camera_ErrorCode CameraManagerRegisterTorchStatusCallback(int useCaseCode);
    Camera_ErrorCode CameraManagerUnregisterTorchStatusCallback(int useCaseCode);
    Camera_ErrorCode CaptureSessionRegisterSmoothZoomInfoCallback(int useCaseCode);
    Camera_ErrorCode CaptureSessionUnregisterSmoothZoomInfoCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputRegisterCaptureStartWithInfoCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputUnregisterCaptureStartWithInfoCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputRegisterCaptureEndCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputUnregisterCaptureEndCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputRegisterFrameShutterEndCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputUnregisterFrameShutterEndCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputRegisterCaptureReadyCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputUnregisterCaptureReadyCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputRegisterEstimatedCaptureDurationCallback(int useCaseCode);
    Camera_ErrorCode PhotoOutputUnregisterEstimatedCaptureDurationCallback(int useCaseCode);

    Camera_ErrorCode IsAutoDeviceSwitchSupported(bool* isSupported);
    Camera_ErrorCode EnableAutoDeviceSwitch(bool isEnable);
    Camera_ErrorCode RegisterAutoDeviceSwitchStatusCallback(int useCaseCode);
    Camera_ErrorCode UnegisterAutoDeviceSwitchStatusCallback(int useCaseCode);
    Camera_ErrorCode CameraManagerRegisterFoldStatusCallback(int useCaseCode);
    Camera_ErrorCode CameraManagerUnregisterFoldStatusCallback(int useCaseCode);
    int32_t ColorSpace(void);

    // test aid
    Camera_ErrorCode SetSceneMode(int useCaseCode);
    Camera_ErrorCode GetCameraFromCameras(Camera_Device* cameras, Camera_Device** camera,
        size_t cameraIndex = BACK_CAMERA);
    Camera_ErrorCode ReleaseCamera(void);
    Camera_ErrorCode ReadyCreatePhotoOutputWithoutSurface();
    inline uint32_t GetCameraDeviceSize()
    {
        return size_;
    }

private:
    NDKCamera(const NDKCamera&) = delete;
    NDKCamera& operator = (const NDKCamera&) = delete;

    Camera_Manager* cameraManager_;
    Camera_CaptureSession* captureSession_;
    uint32_t size_; // 记录支持的Camera_Device列表的大小。
    const Camera_Profile* profile_;
    const Camera_Profile* photoProfile_;
    const Camera_VideoProfile* videoProfile_;
    Camera_PreviewOutput* previewOutput_;
    Camera_PhotoOutput* photoOutput_;
    Camera_VideoOutput* videoOutput_;
    const Camera_MetadataObjectType* metaDataObjectType_;
    Camera_MetadataOutput* metadataOutput_;
    Camera_Input* cameraInput_;
    bool* isCameraMuted_;
    char* previewSurfaceId_;
    Camera_Profile *cameraProfile_;
    Camera_VideoProfile *videoActiveProfile_;
    Camera_ErrorCode ret_;
    float step_;

    static NDKCamera* ndkCamera_;
    static std::mutex mtx_;
    volatile bool valid_;
    uint32_t orientation_;
    char* hostName_;
    Camera_HostDeviceType hostType_;
    uint32_t cameraDeviceIndex_;
};
#endif  // CAMERA_NATIVE_CAMERA_H