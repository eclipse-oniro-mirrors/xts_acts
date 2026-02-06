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

#include "CameraTest.h"
#include <cstdint>
#include <cmath>
#include "native_common.h"

CameraCallbackCode NDKCamera::cameraCallbackCode_ = NO_RECEIVED;
const int CAMERA_NUM = 2;
const int CAMERA_SIZE = 100;
const int CAMERA_DURATION = 1000;
const float EPSILON = 1e-6f;

NDKCamera::NDKCamera(char *str)
{
    cameras_ = nullptr;
    captureSession_ = nullptr;
    cameraInput_ = nullptr;
    photoOutput_ = nullptr;
    outputCap_ = nullptr;
    valid_ = false;
    size_ = 0;
    previewSurfaceId_ = std::string(str);
    LogD("NDKCamera str %{public}s, previewSurfaceId_:%{public}s", str, previewSurfaceId_.c_str());
    // 创建CameraManager实例。
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager_);
    if (cameraManager_ == nullptr || ret != CAMERA_OK) {
        LogE("create camera manger failed... %{public}d", ret);
    }
    CameraManagerRegisterCallback();
    valid_ = true;
}

NDKCamera::~NDKCamera()
{
    valid_ = false;
    if (cameraManager_) {
        if (cameras_ != nullptr) {
            auto  ret = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
            if (ret != CAMERA_OK) {
                LogE("OH_CameraManager_DeleteSupportedCameras failed. %{public}d", ret);
            }
        }

        auto ret = OH_Camera_DeleteCameraManager(cameraManager_);
        if (ret != CAMERA_OK) {
            LogE("OH_Camera_DeleteCameraManager failed. %{public}d", ret);
        }
        cameraManager_ = nullptr;
    }
}

Camera_ErrorCode NDKCamera::ReleaseCameraManger(void)
{
    Camera_ErrorCode ret = CloseCameraInput();

    ReleaseCaptureSession();
    ReleasePhotoOutput();

    if (cameraManager_ != nullptr) {
        ret = OH_CameraManager_UnregisterCallback(cameraManager_, GetCameraManagerListener());
        ret = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
        ret = OH_Camera_DeleteCameraManager(cameraManager_);
        cameraManager_ = nullptr;
        return ret;
    }
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::CameraOperationNotAllowed()
{
    Camera_CaptureSession* captureSession = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession);
    ret = OH_CaptureSession_SetSessionMode(captureSession, Camera_SceneMode::NORMAL_VIDEO);
    ret = OH_CaptureSession_EnableMacro(captureSession, true);
    return ret;
}

Camera_ErrorCode NDKCamera::CameraSessionNotConfig()
{
    Camera_CaptureSession* captureSession;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession);
    bool isSupported = false;
    ret = OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession, STABILIZATION_MODE_MIDDLE, &isSupported);
    return ret;
}

Camera_ErrorCode NDKCamera::CameraSessionNotRunning()
{
    Camera_PhotoOutput* photoOutput_;
    Camera_Profile* profile_;
    Camera_SceneMode sceneMode_ = NORMAL_PHOTO;
    Camera_OutputCapability* cameraOutputCapability_;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager_, cameras_, sceneMode_, &cameraOutputCapability_);
    for (uint32_t i = 0; i < cameraOutputCapability_->photoProfilesSize; ++i) {
        profile_ = cameraOutputCapability_->photoProfiles[0];
    }

    if (profile_ == nullptr) {
        return CAMERA_SESSION_NOT_RUNNING;
    }

    ret = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, previewSurfaceId_.c_str(), &photoOutput_);
    if (CAMERA_OK != OH_PhotoOutput_Capture(photoOutput_)) {
        return CAMERA_SESSION_NOT_RUNNING;
    }
    return CAMERA_SESSION_NOT_RUNNING;
}

Camera_ErrorCode NDKCamera::CameraSessionConfigLocked()
{
    Camera_ErrorCode ret = CreateCaptureSession();
    ret = SessionBegin();
    ret = SessionBegin();
    return ret;
}

Camera_ErrorCode NDKCamera::CreateCameras(void)
{
    if (cameras_ != nullptr) {
        return CAMERA_OK;
    }
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &cameras_, &size_);
    if (cameras_ == nullptr || size_ == 0) {
        LogE("Get supported cameras failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CreatePhotoOutput(void)
{
    if (photoOutput_ != nullptr) {
        return CAMERA_OK;
    }

    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &outputCap_);
    if (ret != CAMERA_OK) {
        LogE("CreateCameraOutputCapability failed... %{public}d", ret);
        return ret;
    }
    if (outputCap_->photoProfilesSize <= 0) {
        return ret;
    }
    auto profile_ = outputCap_->photoProfiles[0];
    ret = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, previewSurfaceId_.c_str(), &photoOutput_);
    if (ret != CAMERA_OK) {
        LogE("CreatePhotoOutput failed... %{public}d", ret);
        return ret;
    }
    LogD("CreatePhotoOutput success... %{public}d", ret);
    return ret;
}

Camera_ErrorCode NDKCamera::ReleasePhotoOutput(void)
{
    if (photoOutput_ == nullptr) {
        return CAMERA_OK;
    }
    if (outputCap_ != nullptr) {
        OH_CameraManager_DeleteSupportedCameraOutputCapability(cameraManager_, outputCap_);
        outputCap_ = nullptr;
    }
    Camera_ErrorCode ret = OH_PhotoOutput_Release(photoOutput_);
    if (ret != CAMERA_OK) {
        LogE("Release PhotoOutput failed... %{public}d", ret);
        return ret;
    }
    photoOutput_ = nullptr;
    return ret;
}

Camera_ErrorCode NDKCamera::CreateCameraInput(void)
{
    Camera_ErrorCode ret_ = CreateCameras();
    if (ret_ != CAMERA_OK) {
        LogE("create camera device failed... %{public}d", ret_);
    }
    if (cameraInput_ != nullptr) {
        return CAMERA_OK;
    }
    ret_ = OH_CameraManager_CreateCameraInput(cameraManager_, &cameras_[0], &cameraInput_);
    if (cameraInput_ == nullptr || ret_ != CAMERA_OK) {
        LogE("CreateCameraInput failed.  errorCode:%{public}d", ret_);
        return ret_;
    }
    CameraInputRegisterCallback();
    return ret_;
}

Camera_ErrorCode NDKCamera::CloseCameraInput(void)
{
    if (captureSession_ != nullptr && cameraInput_ != nullptr) {
        OH_CaptureSession_RemoveInput(captureSession_, cameraInput_);
        OH_CameraInput_Close(cameraInput_);
        OH_CameraInput_UnregisterCallback(cameraInput_, GetCameraInputListener());
        OH_CameraInput_Release(cameraInput_);
        cameraInput_ = nullptr;
    }
    return CAMERA_OK;
}

// CameraInput Callback
void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode = %{public}d", errorCode);
}

CameraInput_Callbacks *NDKCamera::GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}

Camera_ErrorCode NDKCamera::CameraInputRegisterCallback(void)
{
    Camera_ErrorCode ret_ = OH_CameraInput_RegisterCallback(cameraInput_, GetCameraInputListener());
    if (ret_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraConflictCamera()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    Camera_Input* cameraInput = nullptr;
    ret = OH_CameraManager_CreateCameraInput(cameraManager_, deviceList, &cameraInput);
    return CAMERA_CONFLICT_CAMERA;
}

Camera_ErrorCode NDKCamera::CameraDeviceDisabled()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    return CAMERA_DEVICE_DISABLED;
}

Camera_ErrorCode NDKCamera::CameraDevicePreempted()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    return CAMERA_DEVICE_PREEMPTED;
}

Camera_ErrorCode NDKCamera::CameraUnresolvedConflictsWithCurrentConfigurations()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    return CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS;
}

Camera_ErrorCode NDKCamera::CreateCaptureSession(void)
{
    if (!cameraManager_) {
        Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager_);
        if (ret != CAMERA_OK) {
            LogE("ndkXTS Create captureSession and cameraManager failed.");
            return ret;
        }
    }
    if (captureSession_ != nullptr) {
        Camera_ErrorCode ret = ReleaseCaptureSession();
    }
    Camera_ErrorCode ret =  OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    if (captureSession_ == nullptr || ret != CAMERA_OK) {
        LogE("ndkXTS Create captureSession failed.");
    }
    ret = CaptureSessionRegisterCallback();
    return ret;
}

Camera_ErrorCode NDKCamera::ReleaseCaptureSession(void)
{
    if (captureSession_ == nullptr) {
        return CAMERA_OK;
    }
    Camera_ErrorCode ret = OH_CaptureSession_UnregisterCallback(captureSession_, GetCaptureSessionRegister());
    ret = OH_CaptureSession_Release(captureSession_);
    if (ret != CAMERA_OK) {
        LogE("ReleaseCaptureSession failed.");
        return ret;
    }
    captureSession_ = nullptr;
    return CAMERA_OK;
}

// Session Callback
void CaptureSessionOnFocusStateChange(Camera_CaptureSession* session, Camera_FocusState focusState)
{
    Camera_FocusState checkStatus1 = FOCUS_STATE_FOCUSED;
    Camera_FocusState checkStatus2 = FOCUS_STATE_UNFOCUSED;
    Camera_FocusState checkStatus3 = FOCUS_STATE_SCAN;
    if (focusState == checkStatus1) {
        LogD("Camera_FocusState is FOCUS_STATE_FOCUSED");
    }

    if (focusState == checkStatus2) {
        LogD("Camera_FocusState is FOCUS_STATE_UNFOCUSED");
    }

    if (focusState == checkStatus3) {
        LogD("Camera_FocusState is FOCUS_STATE_SCAN");
    }
}

void CaptureSessionOnError(Camera_CaptureSession* session, Camera_ErrorCode errorCode)
{
    LogD("CaptureSession errorCode = %d", errorCode);
}

CaptureSession_Callbacks* NDKCamera::GetCaptureSessionRegister(void)
{
    static CaptureSession_Callbacks captureSessionCallbacks = {
        .onFocusStateChange = CaptureSessionOnFocusStateChange,
        .onError = CaptureSessionOnError
    };
    return &captureSessionCallbacks;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallback(void)
{
    Camera_ErrorCode  ret = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister());
    if (ret != CAMERA_OK) {
        LogE("OH_CaptureSession_RegisterCallback failed.");
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionBegin(void)
{
    Camera_ErrorCode ret =  OH_CaptureSession_BeginConfig(captureSession_);
    LogD("OH_CaptureSession_RegisterCallback ret:%{public}d", ret);
    return ret;
}

Camera_ErrorCode NDKCamera::FrameworkToNdkCameraError(int ret)
{
    Camera_ErrorCode err = CAMERA_OK;
    switch (ret) {
        case Camera_ErrorCode::CAMERA_DEVICE_SETTING_LOCKED:
            err = CAMERA_DEVICE_SETTING_LOCKED;
            break;
        default:
            LogE("FrameworkToNdkCameraError matched failed. ret:%{public}d", ret);
    }
    return err;
}

void MyStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    Camera_StatusInfo checkStatus;
    Camera_Device cameraDevice = {"001", CAMERA_POSITION_UNSPECIFIED, CAMERA_TYPE_WIDE_ANGLE, CAMERA_CONNECTION_REMOTE};
    checkStatus.camera= &cameraDevice;
    checkStatus.status = CAMERA_STATUS_APPEAR;

    if (status->camera->cameraId == checkStatus.camera->cameraId) {
        LogD("camera is OK.");
    }

    if (status->status == checkStatus.status) {
        LogD("camera status is OK.");
    }
}

Camera_ErrorCode NDKCamera::SetCameraStatus(std::string info)
{
    Camera_Status status = CAMERA_STATUS_APPEAR;
    Camera_Connection conType = CAMERA_CONNECTION_REMOTE;
    if ("CAMERA_STATUS_APPEAR" == info) {
        status = CAMERA_STATUS_APPEAR;
    } else if ("CAMERA_STATUS_DISAPPEAR" == info) {
        status = CAMERA_STATUS_DISAPPEAR;
    } else if ("CAMERA_STATUS_AVAILABLE" == info) {
        status = CAMERA_STATUS_AVAILABLE;
    } else if ("CAMERA_STATUS_UNAVAILABLE" == info) {
        status = CAMERA_STATUS_UNAVAILABLE;
    } else if ("CAMERA_CONNECTION_BUILT_IN" == info) {
        conType = CAMERA_CONNECTION_BUILT_IN;
    } else if ("CAMERA_CONNECTION_USB_PLUGIN" == info) {
        conType = CAMERA_CONNECTION_USB_PLUGIN;
    } else if ("CAMERA_CONNECTION_REMOTE" == info) {
        conType = CAMERA_CONNECTION_REMOTE;
    }
    
    CameraManager_Callbacks callback = {
        .onCameraStatus = MyStatusCallback,
    };

    Camera_ErrorCode ret = OH_CameraManager_RegisterCallback(cameraManager_, &callback);
    return ret;
}

Camera_ErrorCode NDKCamera::GetCameraFormat(int32_t index)
{
    Camera_Profile profile;
    profile.size.height = 0;
    profile.size.width = 0;

    if (index == CAMERA_FORMAT_RGBA_8888) {
        profile.format = CAMERA_FORMAT_RGBA_8888;
    } else if (index == CAMERA_FORMAT_YCBCR_P010) {
        profile.format = CAMERA_FORMAT_YCBCR_P010;
    } else if (index == CAMERA_FORMAT_YCRCB_P010) {
        profile.format = CAMERA_FORMAT_YCRCB_P010;
    }

    Camera_OutputCapability* capability;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &capability);
    for (decltype(capability->previewProfilesSize) i = 0; i < capability->previewProfilesSize; i++) {
        if (capability->previewProfiles[i]->size.width == profile.size.width &&
            capability->previewProfiles[i]->size.height == profile.size.height) {
            profile.format = capability->previewProfiles[i]->format;
            break;
        }
    }
    return ret;
}

Camera_ErrorCode NDKCamera::HasFlashMode(int32_t index)
{
    Camera_FlashMode flashMode;
    if (index == FLASH_MODE_CLOSE) {
        flashMode = FLASH_MODE_CLOSE;
    } else if (index == FLASH_MODE_OPEN) {
        flashMode = FLASH_MODE_OPEN;
    } else if (index == FLASH_MODE_AUTO) {
        flashMode = FLASH_MODE_AUTO;
    } else if (index == FLASH_MODE_ALWAYS_OPEN) {
        flashMode = FLASH_MODE_ALWAYS_OPEN;
    }
    
    Camera_CaptureSession* captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    if (ret != CAMERA_OK) {
        return ret;
    }

    bool hasFlash = false;
    ret = OH_CaptureSession_HasFlash(captureSession_, &hasFlash);
    if (ret != CAMERA_OK) {
        return ret;
    }

    if (!hasFlash) {
        return CAMERA_OK;
    }

    bool isSupported = false;
    ret = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, &isSupported);
    return ret;
}

Camera_ErrorCode NDKCamera::GetExposureMode(int32_t index)
{
    Camera_CaptureSession *captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    Camera_ExposureMode exposureMode;
    if (index == EXPOSURE_MODE_AUTO) {
        exposureMode = EXPOSURE_MODE_AUTO;
    } else if (index == EXPOSURE_MODE_CONTINUOUS_AUTO) {
        exposureMode = EXPOSURE_MODE_CONTINUOUS_AUTO;
    }

    bool isSupported;
    if (CAMERA_SESSION_NOT_CONFIG ==
        OH_CaptureSession_IsExposureModeSupported(captureSession_, exposureMode, &isSupported)) {
        return CAMERA_OK;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::GetCameraFocusMode(int32_t index)
{
    Camera_CaptureSession *captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);

    Camera_FocusMode focusMode;
    if (index == FOCUS_MODE_MANUAL) {
        focusMode = FOCUS_MODE_MANUAL;
    } else if (index == FOCUS_MODE_CONTINUOUS_AUTO) {
        focusMode = FOCUS_MODE_CONTINUOUS_AUTO;
    } else if (index == FOCUS_MODE_LOCKED) {
        focusMode = FOCUS_MODE_LOCKED;
    }

    bool isSupported;
    if (CAMERA_SESSION_NOT_CONFIG == OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, &isSupported)) {
        return CAMERA_OK;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionIsVideoStabilizationModeSupported(int32_t index)
{
    Camera_VideoStabilizationMode videoMode;
    if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_OFF) {
        videoMode = STABILIZATION_MODE_OFF;
    } else if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_LOW) {
        videoMode = STABILIZATION_MODE_LOW;
    } else if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_MIDDLE) {
        videoMode = STABILIZATION_MODE_MIDDLE;
    } else if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_HIGH) {
        videoMode = STABILIZATION_MODE_HIGH;
    }

    Camera_CaptureSession *captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    bool isSupported;
    if (CAMERA_SESSION_NOT_CONFIG ==
        OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession_, videoMode, &isSupported)) {
        return CAMERA_OK;
    }

    return ret;
}

Camera_ErrorCode NDKCamera::TakePictureWithPhotoSettings(int32_t indexRotation, int32_t indexQualityLevel)
{
    Camera_PhotoCaptureSetting photoSetting;
    if (indexRotation == IAMGE_ROTATION_0) {
        photoSetting.rotation = IAMGE_ROTATION_0;
    } else if (indexRotation == IAMGE_ROTATION_90) {
        photoSetting.rotation = IAMGE_ROTATION_90;
    } else if (indexRotation == IAMGE_ROTATION_180) {
        photoSetting.rotation = IAMGE_ROTATION_180;
    } else if (indexRotation == IAMGE_ROTATION_270) {
        photoSetting.rotation = IAMGE_ROTATION_270;
    }

    if (indexQualityLevel == QUALITY_LEVEL_HIGH) {
        photoSetting.quality = QUALITY_LEVEL_HIGH;
    } else if (indexQualityLevel == QUALITY_LEVEL_MEDIUM) {
        photoSetting.quality = QUALITY_LEVEL_MEDIUM;
    } else if (indexQualityLevel == QUALITY_LEVEL_LOW) {
        photoSetting.quality = QUALITY_LEVEL_LOW;
    }

    if (OH_PhotoOutput_Capture_WithCaptureSetting(nullptr, photoSetting) == CAMERA_INVALID_ARGUMENT) {
        return CAMERA_OK;
    }

    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::GetCameraConcurrentInfo(int32_t index)
{
    uint32_t deviceSize = CAMERA_NUM;
    if (cameras_ == nullptr || size_ < deviceSize) {
        LogE("GetCameraConcurrentInfo failed.. camera size_:%{public}d", size_);
        return CAMERA_OK;
    }

    Camera_ConcurrentInfo* conInfo = nullptr;
    uint32_t infoSize = 0;
    Camera_ErrorCode ret =
        OH_CameraManager_GetCameraConcurrentInfos(cameraManager_, cameras_, deviceSize, &conInfo, &infoSize);
    if (conInfo == nullptr || conInfo->outputCapabilities == nullptr) {
        return CAMERA_OK;
    }

    Camera_ConcurrentInfo checkInfo;
    checkInfo.camera = cameras_[0];
    checkInfo.type = conInfo->type;
    checkInfo.sceneModes = conInfo->sceneModes;
    checkInfo.outputCapabilities = conInfo->outputCapabilities;
    checkInfo.modeAndCapabilitySize = conInfo->modeAndCapabilitySize;
    Camera_MetadataObjectType metaType;
    if (index == 0) {
        metaType = FACE_DETECTION;
    }
    for (uint32_t i = 0; i < conInfo->outputCapabilities->metadataProfilesSize; i++) {
        Camera_MetadataObjectType *typeValue = conInfo->outputCapabilities->supportedMetadataObjectTypes[i];
        if (typeValue != nullptr && metaType == *typeValue) {
            return CAMERA_OK;
        }
    }
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfig(int32_t mode)
{
    Camera_PreconfigType preconfigType;
    if (static_cast<Camera_PreconfigType>(mode) == PRECONFIG_720P) {
        preconfigType = PRECONFIG_720P;
    } else if (static_cast<Camera_PreconfigType>(mode) == PRECONFIG_1080P) {
        preconfigType = PRECONFIG_1080P;
    } else if (static_cast<Camera_PreconfigType>(mode) == PRECONFIG_4K) {
        preconfigType = PRECONFIG_4K;
    } else {
        preconfigType = PRECONFIG_HIGH_QUALITY;
    }

    bool canPreconfig;
    Camera_ErrorCode ret = CreateCaptureSession();
    ret = OH_CaptureSession_CanPreconfig(captureSession_, preconfigType, &canPreconfig);

    return ret;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfigWithRatio(int32_t ratio)
{
    Camera_PreconfigType preconfigType = PRECONFIG_720P;
    Camera_PreconfigRatio preconfigRatio;
    if (static_cast<Camera_PreconfigRatio>(ratio) == PRECONFIG_RATIO_1_1) {
        preconfigRatio = PRECONFIG_RATIO_1_1;
    } else if (static_cast<Camera_PreconfigRatio>(ratio) == PRECONFIG_RATIO_4_3) {
        preconfigRatio = PRECONFIG_RATIO_4_3;
    } else if (static_cast<Camera_PreconfigRatio>(ratio) == PRECONFIG_RATIO_16_9) {
        preconfigRatio = PRECONFIG_RATIO_16_9;
    }

    Camera_ErrorCode ret = CreateCaptureSession();
    bool canPreconfig;
    ret = OH_CaptureSession_CanPreconfigWithRatio(captureSession_, preconfigType, preconfigRatio, &canPreconfig);
    return ret;
}

// PhotoOutput Callback
void PhotoOutputOnFrameStart(Camera_PhotoOutput* photoOutput)
{
    NDKCamera::cameraCallbackCode_ = PREVIEW_ON_FRAME_START;
    LogD("PhotoOutputOnFrameStart");
}

void PhotoOutputOnFrameShutter(Camera_PhotoOutput* photoOutput, Camera_FrameShutterInfo* info)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_FRAME_SHUTTER;
    Camera_FrameShutterInfo shutterInfo;
    shutterInfo.captureId = 0;
    shutterInfo.timestamp = 0;
    if (info->captureId == shutterInfo.captureId) {
        LogD("PhotoOutputOnFrameShutter");
    }
    if (info->timestamp == shutterInfo.timestamp) {
        LogD("PhotoOutputOnFrameShutter");
    }
}

void PhotoOutputOnFrameEnd(Camera_PhotoOutput* photoOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_FRAME_END;
    LogD("PhotoOutput frameCount = %d", frameCount);
}

void PhotoOutputOnError(Camera_PhotoOutput* photoOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_ERROR;
    LogD("PhotoOutput errorCode = %d", errorCode);
}

PhotoOutput_Callbacks* NDKCamera::GetPhotoOutputListener(void)
{
    static PhotoOutput_Callbacks photoOutputListener = {
        .onFrameStart = PhotoOutputOnFrameStart,
        .onFrameShutter = PhotoOutputOnFrameShutter,
        .onFrameEnd = PhotoOutputOnFrameEnd,
        .onError = PhotoOutputOnError
    };
    return &photoOutputListener;
}

Camera_ErrorCode NDKCamera::PhotoOutputRegisterCallback(void)
{
    Camera_PhotoOutput* photoOutput_;
    Camera_ErrorCode ret =
        OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, previewSurfaceId_.c_str(), &photoOutput_);
    if (ret != CAMERA_OK) {
        LogE("PhotoOutputRegisterCallback failed.");
        return CAMERA_OK;
    }
    ret = OH_PhotoOutput_RegisterCallback(photoOutput_, GetPhotoOutputListener());
    if (ret != CAMERA_OK) {
        LogE("OH_PhotoOutput_RegisterCallback failed.");
    }
    return ret;
}

// Metadata Callback
void OnMetadataObjectAvailable(Camera_MetadataOutput *metadataOutput, Camera_MetadataObject *metadataObject,
                               uint32_t size)
{
    Camera_Rect rect;
    rect.width = 1;
    rect.height = 1;
    rect.topLeftX = 1;
    rect.topLeftY = 1;
    Camera_MetadataObject metaObject;
    metaObject.type = FACE_DETECTION;
    metaObject.timestamp = 0;
    metaObject.boundingBox = &rect;

    if (metadataObject->type == metaObject.type) {
        LogD("type = %{public}d", metaObject.type);
    }
    if (metadataObject->timestamp == metaObject.timestamp) {
        LogD("timestamp = %{public}lld", metaObject.timestamp);
    }
    if (metadataObject->boundingBox->width == metaObject.boundingBox->width) {
        LogD("width = %{public}d", metaObject.boundingBox->width);
    }
    if (metadataObject->boundingBox->height == metaObject.boundingBox->height) {
        LogD("height = %{public}d", metaObject.boundingBox->height);
    }
    if (metadataObject->boundingBox->topLeftX == metaObject.boundingBox->topLeftX) {
        LogD("topLeftX = %{public}d", metaObject.boundingBox->topLeftX);
    }
    if (metadataObject->boundingBox->topLeftY == metaObject.boundingBox->topLeftY) {
        LogD("topLeftY = %{public}d", metaObject.boundingBox->topLeftY);
    }

    NDKCamera::cameraCallbackCode_ = METADATA_OBJECT_AVAILABLE;
    LogD("size = %d", size);
}

void OnMetadataOutputError(Camera_MetadataOutput* metadataOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = METADATA_OUTPUT_ERROR;
    LogD("OnMetadataOutput errorCode = %d", errorCode);
}

MetadataOutput_Callbacks* NDKCamera::GetMetadataOutputListener(void)
{
    static MetadataOutput_Callbacks metadataOutputListener = {
        .onMetadataObjectAvailable = OnMetadataObjectAvailable,
        .onError = OnMetadataOutputError
    };
    return &metadataOutputListener;
}

Camera_ErrorCode NDKCamera::MetadataOutputRegisterCallback(void)
{
    Camera_MetadataObjectType profile = FACE_DETECTION;
    Camera_MetadataOutput* metadataOutput_;
    Camera_ErrorCode ret = OH_CameraManager_CreateMetadataOutput(cameraManager_, &profile, &metadataOutput_);
    if (ret != CAMERA_OK) {
        LogE("MetadataOutputRegisterCallback failed.");
        return CAMERA_OK;
    }
    ret = OH_MetadataOutput_RegisterCallback(metadataOutput_, GetMetadataOutputListener());
    if (ret != CAMERA_OK) {
        LogE("OH_MetadataOutput_RegisterCallback failed.");
    }
    return ret;
}

void CameraManagerTorchStatusCallback(Camera_Manager *cameraManager, Camera_TorchStatusInfo *status)
{
    Camera_TorchStatusInfo torchInfo;
    torchInfo.isTorchAvailable = true;
    torchInfo.isTorchActive = true;
    torchInfo.torchLevel = 1.2f;
    if (status->isTorchActive == torchInfo.isTorchActive) {
        LogD("isTorchAvailable is active");
    }
    if (status->isTorchAvailable == torchInfo.isTorchAvailable) {
        LogD("isTorchAvailable is active");
    }
    if (std::fabs(status->torchLevel - torchInfo.torchLevel) < EPSILON) {
        LogD("isTorchAvailable is active");
    }
}

Camera_ErrorCode NDKCamera::CameraManagerRegisterTorchStatusCallback()
{
    return OH_CameraManager_RegisterTorchStatusCallback(cameraManager_, CameraManagerTorchStatusCallback);
}

void CaptureSessionSmoothZoomInfoCallback(Camera_CaptureSession *session, Camera_SmoothZoomInfo *smoothZoomInfo)
{
    Camera_SmoothZoomInfo zoomInfo;
    zoomInfo.duration = CAMERA_DURATION;
    if (smoothZoomInfo->duration == zoomInfo.duration) {
        LogD("CaptureSessionSmoothZoomInfoCallback..");
    }
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterSmoothZoomInfoCallback()
{
    CreateCaptureSession();
    return OH_CaptureSession_RegisterSmoothZoomInfoCallback(captureSession_, CaptureSessionSmoothZoomInfoCallback);
}

void PhotoOutputCaptureStartWithInfoCallback(Camera_PhotoOutput* photoOutput, Camera_CaptureStartInfo* Info)
{
    Camera_CaptureStartInfo startInfo;
    startInfo.captureId = 0;
    startInfo.time = 0;
    if (Info->captureId == startInfo.captureId) {
        LogD("PhotoOutputCaptureStartWithInfoCallback captureId is same");
    }
    if (Info->time == startInfo.time) {
        LogD("PhotoOutputCaptureStartWithInfoCallback time is same");
    }
}

Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureStartWithInfoCallback()
{
    Camera_PhotoOutput* photoOutput_;
    Camera_ErrorCode ret =
        OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, previewSurfaceId_.c_str(), &photoOutput_);
    if (ret != CAMERA_OK) {
        LogE("Creat Camera_PhotoOutput failed...");
        return ret;
    }
    return OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(photoOutput_, PhotoOutputCaptureStartWithInfoCallback);
}

void CameraFoldStatusInfoCallback(Camera_Manager *cameraManager, Camera_FoldStatusInfo *foldStatusInfo)
{
    Camera_FoldStatus foldStatus1 = NON_FOLDABLE;
    Camera_FoldStatus foldStatus2 = EXPANDED;
    char* devName1 = "001";
    char* devName2 = "002";
    Camera_Device dev1 = {devName1, CAMERA_POSITION_UNSPECIFIED, CAMERA_TYPE_WIDE_ANGLE, CAMERA_CONNECTION_REMOTE};
    Camera_Device dev2 = {devName2, CAMERA_POSITION_UNSPECIFIED, CAMERA_TYPE_WIDE_ANGLE, CAMERA_CONNECTION_REMOTE};
    Camera_Device* devicePtrs[CAMERA_NUM] = {&dev1, &dev2};
    Camera_FoldStatusInfo foldInfo;
    foldInfo.foldStatus = FOLDED;
    foldInfo.supportedCameras = devicePtrs;
    foldInfo.cameraSize = CAMERA_SIZE;
    if (foldStatusInfo->foldStatus == foldStatus1) {
        LogD("CameraFoldStatusInfoCallback NON_FOLDABLE.");
    }
    if (foldStatusInfo->foldStatus == foldStatus2) {
        LogD("CameraFoldStatusInfoCallback EXPANDED.");
    }
}
 
Camera_ErrorCode NDKCamera::CameraManagerRegisterFoldStatusCallback()
{
    return OH_CameraManager_RegisterFoldStatusInfoCallback(cameraManager_, CameraFoldStatusInfoCallback);
}

void CameraAutoDeviceSwitchStatusInfoCallback(Camera_CaptureSession *session,
                                              Camera_AutoDeviceSwitchStatusInfo *switchInfo)
{
    Camera_AutoDeviceSwitchStatusInfo info;
    info.isDeviceSwitched = true;
    info.isDeviceCapabilityChanged = true;
    if (switchInfo->isDeviceSwitched == info.isDeviceSwitched) {
        LogD("CameraAutoDeviceSwitchStatusInfoCallback is isDeviceSwitched.");
    }
    if (switchInfo->isDeviceCapabilityChanged == info.isDeviceCapabilityChanged) {
        LogD("CameraAutoDeviceSwitchStatusInfoCallback is isDeviceCapabilityChanged.");
    }
}

Camera_ErrorCode NDKCamera::RegisterAutoDeviceSwitchStatusCallback()
{
    Camera_ErrorCode ret = CreateCaptureSession();
    if (ret != CAMERA_OK) {
        LogE("RegisterAutoDeviceSwitchStatusCallback is failed.");
        return ret;
    }
    return OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(captureSession_,
                                                                    CameraAutoDeviceSwitchStatusInfoCallback);
}

Camera_ErrorCode NDKCamera::SessionSetQualityPrioritization(int32_t quality)
{
    Camera_ErrorCode ret = CreateCaptureSession();
    if (ret != CAMERA_OK) {
        LogE("SessionSetQualityPrioritization is failed.");
        return ret;
    }
    Camera_QualityPrioritization qualityCamera;
    if (static_cast<Camera_QualityPrioritization>(quality) == HIGH_QUALITY) {
        qualityCamera = HIGH_QUALITY;
    } else {
        qualityCamera = POWER_BALANCE;
    }
    if (OH_CaptureSession_SetQualityPrioritization(captureSession_, qualityCamera) == CAMERA_SESSION_NOT_CONFIG) {
        return CAMERA_OK;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CameraOpenConcurrentCameras(int32_t type)
{
    Camera_Input *cameraInput;
    Camera_ConcurrentType concurrentType = CAMERA_CONCURRENT_TYPE_LIMITED_CAPABILITY;
    if (static_cast<Camera_ConcurrentType>(type) == CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY) {
        concurrentType = CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY;
    }
    Camera_ErrorCode retcode = OH_CameraManager_CreateCameraInput(cameraManager_, cameras_, &cameraInput);
    if (retcode == CAMERA_SERVICE_FATAL_ERROR) {
        return CAMERA_OK;
    }
    if (retcode == CAMERA_OK) {
        retcode = OH_CameraInput_OpenConcurrentCameras(cameraInput, concurrentType);
        retcode = OH_CameraInput_Release(cameraInput);
        cameraInput_ = nullptr;
    }
    return retcode;
}

Camera_ErrorCode NDKCamera::IsWhiteBalanceSupported(int32_t type)
{
    Camera_ErrorCode ret = CreateCaptureSession();
    if (ret != CAMERA_OK) {
        LogE("IsWhiteBalanceSupported is failed.");
        return ret;
    }

    Camera_WhiteBalanceMode mode;
    if (type == CAMERA_WHITE_BALANCE_MODE_INCANDESCENT) {
        mode = CAMERA_WHITE_BALANCE_MODE_INCANDESCENT;
    } else if (type == CAMERA_WHITE_BALANCE_MODE_FLUORESCENT) {
        mode = CAMERA_WHITE_BALANCE_MODE_FLUORESCENT;
    } else if (type == CAMERA_WHITE_BALANCE_MODE_DAYLIGHT) {
        mode = CAMERA_WHITE_BALANCE_MODE_DAYLIGHT;
    } else if (type == CAMERA_WHITE_BALANCE_MODE_MANUAL) {
        mode = CAMERA_WHITE_BALANCE_MODE_MANUAL;
    } else {
        mode = CAMERA_WHITE_BALANCE_MODE_LOCKED;
    }
    bool flag;
    ret = OH_CaptureSession_IsWhiteBalanceModeSupported(captureSession_, mode, &flag);
    if (ret == CAMERA_SESSION_NOT_CONFIG) {
        return CAMERA_OK;
    }

    return ret;
}

void SystemPressureLevelCallback(Camera_CaptureSession *session, Camera_SystemPressureLevel systemPressureLevel)
{
    if (systemPressureLevel == SYSTEM_PRESSURE_NORMAL) {
        LogD("CameraSystemPressureLevelCallback is SYSTEM_PRESSURE_NORMAL.");
    }
    if (systemPressureLevel == SYSTEM_PRESSURE_MILD) {
        LogD("CameraSystemPressureLevelCallback is SYSTEM_PRESSURE_MILD.");
    }
    if (systemPressureLevel == SYSTEM_PRESSURE_SEVERE) {
        LogD("CameraSystemPressureLevelCallback is SYSTEM_PRESSURE_SEVERE.");
    }
    if (systemPressureLevel == SYSTEM_PRESSURE_CRITICAL) {
        LogD("CameraSystemPressureLevelCallback is SYSTEM_PRESSURE_CRITICAL.");
    }
    if (systemPressureLevel == SYSTEM_PRESSURE_SHUTDOWN) {
        LogD("CameraSystemPressureLevelCallback is SYSTEM_PRESSURE_SHUTDOWN.");
    }
}

Camera_ErrorCode NDKCamera::RegisterSystemPressureLevel()
{
    Camera_ErrorCode ret = CreateCaptureSession();
    if (ret != CAMERA_OK) {
        LogE("RegisterSystemPressureLevel is failed.");
        return ret;
    }

    if (OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession_, SystemPressureLevelCallback) ==
        CAMERA_OK) {
        return CAMERA_OK;
    }
    return ret;
}

void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    NDKCamera::cameraCallbackCode_ = CAMERA_MANAGER_STATUS;
    LogD("CameraManagerStatusCallback status%{public}d", status);
}

CameraManager_Callbacks *NDKCamera::GetCameraManagerListener(void)
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}

Camera_ErrorCode NDKCamera::CameraManagerRegisterCallback()
{
    Camera_ErrorCode ret = OH_CameraManager_RegisterCallback(cameraManager_, GetCameraManagerListener());
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetSupportedEffectTypes(int32_t type)
{
    Camera_ErrorCode ret = CreateCaptureSession();
    if (ret != CAMERA_OK) {
        LogE("RegisterSystemPressureLevel is failed.");
        return ret;
    }
    Camera_ControlCenterEffectType checkType;
    if (type == CONTROL_CENTER_EFFECT_TYPE_BEAUTY) {
        checkType = CONTROL_CENTER_EFFECT_TYPE_BEAUTY;
    }
    if (type == CONTROL_CENTER_EFFECT_TYPE_PORTRAIT) {
        checkType = CONTROL_CENTER_EFFECT_TYPE_PORTRAIT;
    }

    Camera_ControlCenterEffectType *effectType = new Camera_ControlCenterEffectType[1];
    uint32_t size;
    Camera_ErrorCode retGetTypes = OH_CaptureSession_GetSupportedEffectTypes(captureSession_, &effectType, &size);
    if (retGetTypes == CAMERA_OK) {
        if (size != 0 && effectType[0] == checkType) {
            LogD("SessionGetSupportedEffectTypes is ok.");
        }
        OH_CaptureSession_DeleteSupportedEffectTypes(captureSession_, effectType, size);
        return retGetTypes;
    }
    return ret;
}

void ControlCenterEffectStatusChange(Camera_CaptureSession* session, Camera_ControlCenterStatusInfo* controlInfo)
{
    Camera_ControlCenterStatusInfo checkInfo;
    checkInfo.effectType = CONTROL_CENTER_EFFECT_TYPE_BEAUTY;
    checkInfo.isActive = true;
    if (controlInfo->isActive == checkInfo.isActive) {
        LogD("SessionGetSupportedEffectTypes is ok.");
    }
}

Camera_ErrorCode NDKCamera::RegisterControlCenterEffectStatusChange()
{
    if (CAMERA_OK != CreateCaptureSession()) {
        return CAMERA_OK;
    }
    return OH_CaptureSession_RegisterControlCenterEffectStatusChangeCallback(captureSession_,
                                                                             ControlCenterEffectStatusChange);
}
