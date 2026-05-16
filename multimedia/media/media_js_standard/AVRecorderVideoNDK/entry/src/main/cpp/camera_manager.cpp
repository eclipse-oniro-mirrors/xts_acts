/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "camera_manager.h"

#define LOG_DOMIN 0x3200
#define LOG_TAG "MY_NDKDEMO"

static int g_myParam1  = 1920;
static int g_myParam2 = 1080;
static int g_focusMode = 2;
static int g_sceneMode = 2;
static int g_cameraDeviceIndex = 0;
static char *g_photoId = nullptr;
static char *g_videoId = nullptr;

namespace OHOS_CAMERA_SAMPLE {
NDKCamera *NDKCamera::gndkCamera = nullptr;
std::mutex NDKCamera::mtx_;
const std::unordered_map<uint32_t, Camera_SceneMode> g_int32ToCameraSceneMode = {
    {1, Camera_SceneMode::NORMAL_PHOTO}, {2, Camera_SceneMode::NORMAL_VIDEO}, {12, Camera_SceneMode::SECURE_PHOTO}};

NDKCamera::NDKCamera(char *previewId, int param1, int param2)
    : focusMode_(g_focusMode), cameraDeviceIndex_(g_cameraDeviceIndex), previewSurfaceId_(previewId),
      photoSurfaceId_(g_photoId), videoSurfaceId_(g_videoId), cameras_(nullptr), profile_(nullptr),
      cameraOutputCapability_(nullptr), captureSession_(nullptr), cameraInput_(nullptr), previewOutput_(nullptr),
      photoOutput_(nullptr), videoOutput_(nullptr), isCameraMuted_(nullptr), metaDataObjectType_(nullptr),
      metadataOutput_(nullptr), isExposureModeSupported_(false), isFocusModeSupported_(false), isSuccess_(false),
      sceneMode_(NORMAL_VIDEO), exposureMode_(EXPOSURE_MODE_LOCKED), result_(CAMERA_OK), size_(0), minExposureBias_(0),
      maxExposureBias_(0), step_(0)
{
    // release camera
    ReleaseCamera();

    if (param1 != 0) {
        g_myParam1  = param1;
    }

    if (param2 != 0) {
        g_myParam2 = param2;
    }
    // create camera manager
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager_);
    if (cameraManager_ == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "Get CameraManager failed.");
    }
    OH_LOG_ERROR(LOG_APP, "=====testZj2====.");
    // create capture session
    ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    if (captureSession_ == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "Create captureSession failed.");
    }
    OH_LOG_ERROR(LOG_APP, "=====testZj3====.");

    // look up sceneMode
    auto itr1 = g_int32ToCameraSceneMode.find(g_sceneMode);
    if (itr1 != g_int32ToCameraSceneMode.end()) {
        sceneMode_ = itr1->second;
    }
    // set session mode
    ret = OH_CaptureSession_SetSessionMode(captureSession_, NORMAL_VIDEO);
    OH_LOG_ERROR(LOG_APP, "=====testZj4====.");
    GetSupportedCameras();
    GetSupportedOutputCapability();
    // create preview output
    CreatePreviewOutput();
    // create camera input and register camera input callback
    CreateCameraInput();
    CameraInputOpen();
    // config and start session
    SessionFlowFn();
}

NDKCamera::~NDKCamera()
{
    OH_LOG_ERROR(LOG_APP, "~NDKCamera");
    Camera_ErrorCode ret = CAMERA_OK;
    if (cameraManager_) {
        OH_LOG_ERROR(LOG_APP, "Release OH_CameraManager_DeleteSupportedCameraOutputCapability. enter");
        ret = OH_CameraManager_DeleteSupportedCameraOutputCapability(cameraManager_, cameraOutputCapability_);
        if (ret != CAMERA_OK) {
            OH_LOG_ERROR(LOG_APP, "Delete CameraOutputCapability failed.");
        } else {
            OH_LOG_ERROR(LOG_APP, "Release OH_CameraManager_DeleteSupportedCameraOutputCapability. ok");
        }
        OH_LOG_ERROR(LOG_APP, "Release OH_CameraManager_DeleteSupportedCameras. enter");
        ret = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
        if (ret != CAMERA_OK) {
            OH_LOG_ERROR(LOG_APP, "Delete Cameras failed.");
        } else {
            OH_LOG_ERROR(LOG_APP, "Release OH_CameraManager_DeleteSupportedCameras. ok");
        }
        ret = OH_Camera_DeleteCameraManager(cameraManager_);
        if (ret != CAMERA_OK) {
            OH_LOG_ERROR(LOG_APP, "Delete CameraManager failed.");
        } else {
            OH_LOG_ERROR(LOG_APP, "Release OH_Camera_DeleteCameraMananger. ok");
        }
        cameraManager_ = nullptr;
    }
    OH_LOG_ERROR(LOG_APP, "~NDKCamera exit");
}

Camera_ErrorCode NDKCamera::ReleaseCamera(void)
{
    OH_LOG_ERROR(LOG_APP, " enter ReleaseCamera");
    if (previewOutput_ && captureSession_) {
        PreviewOutputStop();
        OH_CaptureSession_RemovePreviewOutput(captureSession_, previewOutput_);
        PreviewOutputRelease();
    }
    if (photoOutput_) {
        PhotoOutputRelease();
    }

    if (videoOutput_) {
        VideoOutputRelease();
    }
    if (captureSession_) {
        SessionRealese();
    }
    if (cameraInput_) {
        CameraInputClose();
    }
    OH_LOG_ERROR(LOG_APP, " exit ReleaseCamera");
    return result_;
}

Camera_ErrorCode NDKCamera::ReleaseSession(void)
{
    OH_LOG_ERROR(LOG_APP, " enter ReleaseSession");
    PreviewOutputStop();
    PhotoOutputRelease();
    VideoOutputRelease();
    SessionRealese();
    OH_LOG_ERROR(LOG_APP, " exit ReleaseSession");
    return result_;
}

Camera_ErrorCode NDKCamera::SessionRealese(void)
{
    OH_LOG_ERROR(LOG_APP, " enter SessionRealese");
    Camera_ErrorCode ret = CAMERA_OK;
    try {
        ret = OH_CaptureSession_Release(captureSession_);
    } catch (std::exception& err) {
        OH_LOG_ERROR(LOG_APP, " exit SessionRealese OH_CaptureSession_Release catch failed");
    }
    captureSession_ = nullptr;
    OH_LOG_ERROR(LOG_APP, " exit SessionRealese");
    return ret;
}

Camera_ErrorCode NDKCamera::HasFlashFn(uint32_t mode)
{
    Camera_FlashMode flashMode = static_cast<Camera_FlashMode>(mode);
    // Check for flashing lights
    bool hasFlash = false;
    Camera_ErrorCode ret = OH_CaptureSession_HasFlash(captureSession_, &hasFlash);
    if (captureSession_ == nullptr || ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_HasFlash success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_HasFlash failed. %{public}d ", ret);
    }
    if (hasFlash) {
        OH_LOG_INFO(LOG_APP, "hasFlash success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "hasFlash hasFlash  failed. %{public}d ", hasFlash);
    }

    // Check if the flash mode is supported
    bool isSupported = false;
    ret = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, &isSupported);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_IsFlashModeSupported success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_IsFlashModeSupported failed. %{public}d ", ret);
    }

    if (isSupported) {
        OH_LOG_INFO(LOG_APP, "isSupported success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "isSupported  failed. %{public}d ", hasFlash);
    }

    // Set flash mode
    ret = OH_CaptureSession_SetFlashMode(captureSession_, flashMode);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_SetFlashMode success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetFlashMode failed. %{public}d ", ret);
    }
    ret = OH_CaptureSession_GetFlashMode(captureSession_, &flashMode);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_GetFlashMode success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetFlashMode failed. %{public}d ", ret);
    }
    return ret;
}


Camera_ErrorCode NDKCamera::IsVideoStabilizationModeSupportedFn(uint32_t mode)
{
    Camera_VideoStabilizationMode videoMode = static_cast<Camera_VideoStabilizationMode>(mode);
    bool isSupported = false;

    Camera_ErrorCode ret =
        OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession_, videoMode, &isSupported);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_IsVideoStabilizationModeSupported success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_IsVideoStabilizationModeSupported failed. %{public}d ", ret);
    }
    if (isSupported) {
        OH_LOG_INFO(LOG_APP, "isSupported success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "isSupported  failed. %{public}d ", isSupported);
    }

    ret = OH_CaptureSession_SetVideoStabilizationMode(captureSession_, videoMode);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_SetVideoStabilizationMode success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetVideoStabilizationMode videoMode failed. %{public}d ", videoMode);
    }
    ret = OH_CaptureSession_GetVideoStabilizationMode(captureSession_, &videoMode);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_GetVideoStabilizationMode success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetVideoStabilizationMode videoMode failed. %{public}d ", videoMode);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::setZoomRatioFn(uint32_t zoomRatio)
{
    float zoom = float(zoomRatio);
    float minZoom;
    float maxZoom;

    Camera_ErrorCode ret = OH_CaptureSession_GetZoomRatioRange(captureSession_, &minZoom, &maxZoom);
    if (captureSession_ == nullptr || ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_GetZoomRatioRange success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetZoomRatioRange failed. %{public}d ", ret);
    }
    // Set Zoom
    ret = OH_CaptureSession_SetZoomRatio(captureSession_, zoom);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_SetZoomRatio success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetZoomRatio failed. %{public}d ", ret);
    }
    ret = OH_CaptureSession_GetZoomRatio(captureSession_, &zoom);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_GetZoomRatio success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetZoomRatio failed. %{public}d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionBegin(void)
{
    Camera_ErrorCode ret = OH_CaptureSession_BeginConfig(captureSession_);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_BeginConfig success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_BeginConfig failed. %{public}d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionCommitConfig(void)
{
    Camera_ErrorCode ret = OH_CaptureSession_CommitConfig(captureSession_);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_CommitConfig success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed. %{public}d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionStart(void)
{
    bool isSupport = false;
    OH_CaptureSession_IsVideoStabilizationModeSupported(
        captureSession_, Camera_VideoStabilizationMode::STABILIZATION_MODE_AUTO, &isSupport);
    if (isSupport) {
        OH_CaptureSession_SetVideoStabilizationMode(captureSession_,
                                                    Camera_VideoStabilizationMode::STABILIZATION_MODE_AUTO);
    }
    // Start focusing
    OH_LOG_INFO(LOG_APP, "IsFocusMode start");
    OH_CaptureSession_SetFocusMode(captureSession_, Camera_FocusMode::FOCUS_MODE_AUTO);
    OH_LOG_INFO(LOG_APP, "IsFocusMode success");

    Camera_ErrorCode ret = OH_CaptureSession_Start(captureSession_);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_Start success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed. %{public}d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionStop(void)
{
    Camera_ErrorCode ret = OH_CaptureSession_Stop(captureSession_);
    if (ret == CAMERA_OK) {
        OH_LOG_INFO(LOG_APP, "OH_CaptureSession_Stop success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Stop failed. %{public}d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionFlowFn(void)
{
    OH_LOG_INFO(LOG_APP, "Start SessionFlowFn IN.");
    // start configuring session
    OH_LOG_INFO(LOG_APP, "session beginConfig.");
    Camera_ErrorCode ret = OH_CaptureSession_BeginConfig(captureSession_);
    // add cameraInput to the session
    OH_LOG_INFO(LOG_APP, "session add Input.");
    ret = OH_CaptureSession_AddInput(captureSession_, cameraInput_);
    // add previewOutput to the session
    OH_LOG_INFO(LOG_APP, "session add Preview Output.");
    ret = OH_CaptureSession_AddPreviewOutput(captureSession_, previewOutput_);
    if (sceneMode_ == Camera_SceneMode::NORMAL_VIDEO) {
        CreateVideoOutput(videoSurfaceId_);

        AddVideoOutput();
    }
    // Submit configuration information
    OH_LOG_INFO(LOG_APP, "session commitConfig");
    ret = OH_CaptureSession_CommitConfig(captureSession_);
    // Start Session Work
    OH_LOG_INFO(LOG_APP, "session start");
    SessionStart();
    OH_LOG_INFO(LOG_APP, "session success");
    OH_VideoOutput_Start(videoOutput_);
    return ret;
}

Camera_ErrorCode NDKCamera::CreateCameraInput(void)
{
    OH_LOG_ERROR(LOG_APP, "enter CreateCameraInput.");
    result_ = OH_CameraManager_CreateCameraInput(cameraManager_, &cameras_[cameraDeviceIndex_], &cameraInput_);
    if (cameraInput_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "CreateCameraInput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_ERROR(LOG_APP, "exit CreateCameraInput.");
    // register camera input callback
    CameraInputRegisterCallback();
    return result_;
}

Camera_ErrorCode NDKCamera::CameraInputOpen(void)
{
    OH_LOG_ERROR(LOG_APP, "enter CameraInputOpen.");
    result_ = OH_CameraInput_Open(cameraInput_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "CameraInput_Open failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_ERROR(LOG_APP, "exit CameraInputOpen.");
    return result_;
}

Camera_ErrorCode NDKCamera::CameraInputClose(void)
{
    OH_LOG_ERROR(LOG_APP, "enter CameraInput_Close.");
    result_ = OH_CameraInput_Close(cameraInput_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "CameraInput_Close failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_ERROR(LOG_APP, "exit CameraInput_Close.");
    return result_;
}

Camera_ErrorCode NDKCamera::CameraInputRelease(void)
{
    result_ = OH_CameraInput_Release(cameraInput_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "CameraInputRelease failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_ERROR(LOG_APP, "exit CameraInputRelease.");
    return result_;
}

Camera_ErrorCode NDKCamera::GetSupportedCameras(void)
{
    result_ = OH_CameraManager_GetSupportedCameras(cameraManager_, &cameras_, &size_);
    if (cameras_ == nullptr || &size_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "GetSupportedCaneras failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_ERROR(LOG_APP, "exit GetSupportedCaneras.");
    return result_;
}
Camera_ErrorCode NDKCamera::GetSupportedOutputCapability(void)
{
    result_ = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, &cameras_[cameraDeviceIndex_],
                                                                  &cameraOutputCapability_);
    if (result_ != CAMERA_OK || cameraOutputCapability_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GetSupportedOutputCapability failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_ERROR(LOG_APP, "exit GetSupportedOutputCapability.");
    return result_;
}

Camera_ErrorCode NDKCamera::CreatePreviewOutput(void)
{
    profile_ = cameraOutputCapability_->previewProfiles[0];
    if (profile_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "CreatePreviewOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_ERROR(LOG_APP, "exit CreatePreviewOutput.");
    profile_->size.width = g_myParam1 ;
    profile_->size.height = g_myParam2;
    result_ = OH_CameraManager_CreatePreviewOutput(cameraManager_, profile_, previewSurfaceId_, &previewOutput_);
    if (previewSurfaceId_ == nullptr || previewOutput_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    // register preview output callback
    PreviewOutputRegisterCallback();
    return result_;
}

Camera_ErrorCode NDKCamera::CreatePhotoOutput(char *photoSurfaceId)
{
    DRAWING_LOGD("NDKCamera::CreatePhotoOutput start!");
    profile_ = cameraOutputCapability_->photoProfiles[0];
    if (profile_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Get photoProfiles failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    profile_->size.width = g_myParam1 ;
    profile_->size.height = g_myParam2;
    result_ = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, photoSurfaceId, &photoOutput_);
    if (photoSurfaceId == nullptr || photoOutput_ == nullptr || result_ != CAMERA_OK) {
        return CAMERA_INVALID_ARGUMENT;
    }
    // register photo output callback
    PhotoOutputRegisterCallback();
    return result_;
}

Camera_ErrorCode NDKCamera::CreateVideoOutput(char *videoId)
{
    cameraVideoProfile_ = cameraOutputCapability_->videoProfiles[0];
    if (cameraVideoProfile_ == nullptr) {
        return CAMERA_INVALID_ARGUMENT;
    }
    profile_->size.width = g_myParam1 ;
    profile_->size.height = g_myParam2;
    result_ = OH_CameraManager_CreateVideoOutput(cameraManager_, cameraVideoProfile_, videoId, &videoOutput_);
    if (videoId == nullptr || videoOutput_ == nullptr || result_ != CAMERA_OK) {
        return CAMERA_INVALID_ARGUMENT;
    }
    // register photo output callback
    VideoOutputRegisterCallback();
    return result_;
}
Camera_ErrorCode NDKCamera::AddVideoOutput(void)
{
    Camera_ErrorCode ret = OH_CaptureSession_AddVideoOutput(captureSession_, videoOutput_);
    if (ret == CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput failed. %{public}d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::AddPhotoOutput()
{
    Camera_ErrorCode ret = OH_CaptureSession_AddPhotoOutput(captureSession_, photoOutput_);
    if (ret == CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput success.");
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput failed. %{public}d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CreateMetadataOutput(void)
{
    DRAWING_LOGD("NDKCamera::CreateMetadataOutput start!");
    metaDataObjectType_ = cameraOutputCapability_->supportedMetadataObjectTypes[0];
    if (metaDataObjectType_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Get CreateMetadataOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CameraManager_CreateMetadataOutput(cameraManager_, metaDataObjectType_, &metadataOutput_);
    if (metadataOutput_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateMetadataOutput failed. %{public}d ", result_);
        return CAMERA_INVALID_ARGUMENT;
    } else {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateMetadataOutput success.");
    }
    // register metadata output callback
    MetadataOutputRegisterCallback();
    return result_;
}

Camera_ErrorCode NDKCamera::IsCameraMuted(void)
{
    OH_LOG_ERROR(LOG_APP, "enter IsCameraMuted.");
    result_ = OH_CameraManager_IsCameraMuted(cameraManager_, isCameraMuted_);
    if (isCameraMuted_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsCameraMuted failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return result_;
}

Camera_ErrorCode NDKCamera::PreviewOutputStop(void)
{
    OH_LOG_ERROR(LOG_APP, "enter PreviewOutputStop.");
    result_ = OH_PreviewOutput_Stop(previewOutput_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "PreviewOutputStop failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return result_;
}

Camera_ErrorCode NDKCamera::PreviewOutputRelease(void)
{
    OH_LOG_ERROR(LOG_APP, "enter PreviewOutputRelease.");
    if (previewOutput_ != nullptr) {
        result_ = OH_PreviewOutput_Release(previewOutput_);
        if (result_ != CAMERA_OK) {
            OH_LOG_ERROR(LOG_APP, "PreviewOutputRelease failed.");
            return CAMERA_INVALID_ARGUMENT;
        }
        previewOutput_ = nullptr;
    }
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::PhotoOutputRelease(void)
{
    OH_LOG_ERROR(LOG_APP, "enter PhotoOutputRelease.");
    result_ = OH_PhotoOutput_Release(photoOutput_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "PhotoOutputRelease failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    photoOutput_ = nullptr;
    return result_;
}

Camera_ErrorCode NDKCamera::VideoOutputStart(void)
{
    OH_LOG_ERROR(LOG_APP, "enter VideoOutputStart.");
    Camera_ErrorCode ret = OH_VideoOutput_Start(videoOutput_);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "VideoOutputStart failed.");
    }
    return ret;
}

Camera_ErrorCode NDKCamera::IsExposureModeSupportedFn(uint32_t mode)
{
    OH_LOG_ERROR(LOG_APP, "enter IsExposureModeSupportedFn.");
    exposureMode_ = static_cast<Camera_ExposureMode>(mode);
    result_ = OH_CaptureSession_IsExposureModeSupported(captureSession_, exposureMode_, &isExposureModeSupported_);
    if (&isExposureModeSupported_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsExposureModeSupportedFn failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_SetExposureMode(captureSession_, exposureMode_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsExposureModeSupportedFn failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_GetExposureMode(captureSession_, &exposureMode_);
    if (&exposureMode_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsExposureModeSupportedFn failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_INFO(LOG_APP, "IsExposureModeSupportedFn end.");
    return result_;
}

Camera_ErrorCode NDKCamera::IsMeteringPoint(int x, int y)
{
    OH_LOG_ERROR(LOG_APP, "enter IsMeteringPoint.");
    result_ = OH_CaptureSession_GetExposureMode(captureSession_, &exposureMode_);
    if (&exposureMode_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsExposureModeSupportedFn failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    Camera_Point exposurePoint;
    exposurePoint.x = x;
    exposurePoint.y = y;
    result_ = OH_CaptureSession_SetMeteringPoint(captureSession_, exposurePoint);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetMeteringPoint failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_GetMeteringPoint(captureSession_, &exposurePoint);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetMeteringPoint failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_INFO(LOG_APP, "IsMeteringPoint end.");
    return result_;
}

Camera_ErrorCode NDKCamera::IsExposureBiasRange(int exposureBias)
{
    OH_LOG_ERROR(LOG_APP, "enter IsExposureBiasRange.");
    float exposureBiasValue = static_cast<float>(exposureBias);
    result_ = OH_CaptureSession_GetExposureBiasRange(captureSession_, &minExposureBias_, &maxExposureBias_, &step_);
    if (&minExposureBias_ == nullptr || &maxExposureBias_ == nullptr || &step_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsExposureModeSupportedFn failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_SetExposureBias(captureSession_, exposureBiasValue);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetExposureBias failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_GetExposureBias(captureSession_, &exposureBiasValue);
    if (&exposureBiasValue == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetExposureBias failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_INFO(LOG_APP, "IsExposureBiasRange end.");
    return result_;
}

Camera_ErrorCode NDKCamera::IsFocusModeSupported(uint32_t mode)
{
    OH_LOG_ERROR(LOG_APP, "enter IsFocusModeSupported.");
    Camera_FocusMode focusMode = static_cast<Camera_FocusMode>(mode);
    result_ = OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, &isFocusModeSupported_);
    if (&isFocusModeSupported_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsFocusModeSupported failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_INFO(LOG_APP, "IsFocusModeSupported end.");
    return result_;
}
Camera_ErrorCode NDKCamera::IsFocusMode(uint32_t mode)
{
    OH_LOG_ERROR(LOG_APP, "enter IsFocusMode.");
    Camera_FocusMode focusMode = static_cast<Camera_FocusMode>(mode);
    result_ = OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, &isFocusModeSupported_);
    if (&isFocusModeSupported_ == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsFocusMode failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_SetFocusMode(captureSession_, focusMode);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsFocusMode failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_GetFocusMode(captureSession_, &focusMode);
    if (&focusMode == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "IsFocusMode failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_INFO(LOG_APP, "IsFocusMode end.");
    return result_;
}

Camera_ErrorCode NDKCamera::IsFocusPoint(float x, float y)
{
    OH_LOG_ERROR(LOG_APP, "enter IsFocusPoint.");
    Camera_Point focusPoint;
    focusPoint.x = x;
    focusPoint.y = y;
    result_ = OH_CaptureSession_SetFocusPoint(captureSession_, focusPoint);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetFocusPoint is not available.");
        return CAMERA_INVALID_ARGUMENT;
    }
    result_ = OH_CaptureSession_GetFocusPoint(captureSession_, &focusPoint);
    if (&focusPoint == nullptr || result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_GetFocusPoint Profile_ is invalid.");
        return CAMERA_INVALID_ARGUMENT;
    }
    OH_LOG_INFO(LOG_APP, "IsFocusPoint end.");
    return result_;
}

Camera_ErrorCode NDKCamera::VideoOutputStop(void)
{
    OH_LOG_ERROR(LOG_APP, " VideoOutputStop into");
    result_ = OH_VideoOutput_Stop(videoOutput_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "startPhoto failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return result_;
}

Camera_ErrorCode NDKCamera::VideoOutputRelease(void)
{
    OH_LOG_ERROR(LOG_APP, " VideoOutputRelease into");
    if (videoOutput_ == nullptr) {
        return CAMERA_OK;
    }
    result_ = OH_VideoOutput_Release(videoOutput_);
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "startPhoto failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    videoOutput_ = nullptr;
    return result_;
}
Camera_ErrorCode NDKCamera::TakePicture(void)
{
    Camera_ErrorCode ret = CAMERA_OK;
    ret = OH_PhotoOutput_Capture(photoOutput_);
    OH_LOG_ERROR(LOG_APP, "takePicture OH_PhotoOutput_Capture ret = %{public}d.", ret);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "startPhoto failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::TakePictureWithPhotoSettings(Camera_PhotoCaptureSetting photosetting)
{
    Camera_ErrorCode ret = CAMERA_OK;
    ret = OH_PhotoOutput_Capture_WithCaptureSetting(photoOutput_, photosetting);
    OH_LOG_ERROR(LOG_APP, "takePicture OH_PhotoOutput_Capture ret = %{public}d.", ret);
    OH_LOG_ERROR(LOG_APP,
                 "TakePictureWithPhotoSettings  get uality  %{public}d,roration %{public}d,mirro %{public}d,"
                 "latitude, %{public}d, longitude %{public}d, altitude %{public}d",
                 photosetting.quality, photosetting.rotation, photosetting.mirror, photosetting.location->latitude,
                 photosetting.location->longitude, photosetting.location->altitude);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "startPhoto failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret;
}

// CameraManager Callback
void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    OH_LOG_INFO(LOG_APP, "CameraManagerStatusCallback");
}

CameraManager_Callbacks *NDKCamera::GetCameraManagerListener(void)
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}

Camera_ErrorCode NDKCamera::CameraManagerRegisterCallback(void)
{
    result_ = OH_CameraManager_RegisterCallback(cameraManager_, GetCameraManagerListener());
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_RegisterCallback failed.");
    }
    return result_;
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
    result_ = OH_CameraInput_RegisterCallback(cameraInput_, GetCameraInputListener());
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_RegisterCallback failed.");
    }
    return result_;
}

// PreviewOutput Callback
void PreviewOutputOnFrameStart(Camera_PreviewOutput *previewOutput)
{
    OH_LOG_INFO(LOG_APP, "PreviewOutputOnFrameStart");
}

void PreviewOutputOnFrameEnd(Camera_PreviewOutput *previewOutput, int32_t frameCount)
{
    OH_LOG_INFO(LOG_APP, "PreviewOutput frameCount = %{public}d", frameCount);
}

void PreviewOutputOnError(Camera_PreviewOutput *previewOutput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "PreviewOutput errorCode = %{public}d", errorCode);
}

PreviewOutput_Callbacks *NDKCamera::GetPreviewOutputListener(void)
{
    static PreviewOutput_Callbacks previewOutputListener = {.onFrameStart = PreviewOutputOnFrameStart,
                                                            .onFrameEnd = PreviewOutputOnFrameEnd,
                                                            .onError = PreviewOutputOnError};
    return &previewOutputListener;
}

Camera_ErrorCode NDKCamera::PreviewOutputRegisterCallback(void)
{
    result_ = OH_PreviewOutput_RegisterCallback(previewOutput_, GetPreviewOutputListener());
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_PreviewOutput_RegisterCallback failed.");
    }
    return result_;
}

// PhotoOutput Callback
void PhotoOutputOnFrameStart(Camera_PhotoOutput *photoOutput)
{
    DRAWING_LOGD("PhotoOutputOnFrameStart start!");
    OH_LOG_INFO(LOG_APP, "PhotoOutputOnFrameStart");
}

void PhotoOutputOnFrameShutter(Camera_PhotoOutput *photoOutput, Camera_FrameShutterInfo *info)
{
    DRAWING_LOGD("PhotoOutputOnFrameShutter start!");
    OH_LOG_INFO(LOG_APP, "PhotoOutputOnFrameShutter");
}

void PhotoOutputOnFrameEnd(Camera_PhotoOutput *photoOutput, int32_t frameCount)
{
    DRAWING_LOGD("PhotoOutputOnFrameEnd start!");
    OH_LOG_INFO(LOG_APP, "PhotoOutput frameCount = %{public}d", frameCount);
}

void PhotoOutputOnError(Camera_PhotoOutput *photoOutput, Camera_ErrorCode errorCode)
{
    DRAWING_LOGD("PhotoOutputOnError start!");
    OH_LOG_INFO(LOG_APP, "PhotoOutput errorCode = %{public}d", errorCode);
}

PhotoOutput_Callbacks *NDKCamera::GetPhotoOutputListener(void)
{
    static PhotoOutput_Callbacks photoOutputListener = {.onFrameStart = PhotoOutputOnFrameStart,
                                                        .onFrameShutter = PhotoOutputOnFrameShutter,
                                                        .onFrameEnd = PhotoOutputOnFrameEnd,
                                                        .onError = PhotoOutputOnError};
    return &photoOutputListener;
}

// PhotoOutput Callback
void VideoOutputOnFrameStart(Camera_VideoOutput *videoOutput)
{
    DRAWING_LOGD("VideoOutputOnFrameStart start!");
    OH_LOG_INFO(LOG_APP, "VideoOutputOnFrameStart");
}
void VideoOutputOnFrameEnd(Camera_VideoOutput *videoOutput, int32_t frameCount)
{
    DRAWING_LOGD("VideoOutputOnFrameEnd start!");
    OH_LOG_INFO(LOG_APP, "VideoOutputOnFrameEnd frameCount = %{public}d", frameCount);
}
void VideoOutputOnError(Camera_VideoOutput *videoOutput, Camera_ErrorCode errorCode)
{
    DRAWING_LOGD("VideoOutputOnError start!");
    OH_LOG_INFO(LOG_APP, "VideoOutputOnError errorCode = %{public}d", errorCode);
}


VideoOutput_Callbacks *NDKCamera::GetVideoOutputListener(void)
{
    static VideoOutput_Callbacks videoOutputListener = {
        .onFrameStart = VideoOutputOnFrameStart, .onFrameEnd = VideoOutputOnFrameEnd, .onError = VideoOutputOnError};
    return &videoOutputListener;
}

Camera_ErrorCode NDKCamera::PhotoOutputRegisterCallback(void)
{
    result_ = OH_PhotoOutput_RegisterCallback(photoOutput_, GetPhotoOutputListener());
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_PhotoOutput_RegisterCallback failed.");
    }
    return result_;
}


void OnMetadataObjectAvailable(Camera_MetadataOutput *metadataOutput, Camera_MetadataObject *metadataObject,
                               uint32_t size)
{
    DRAWING_LOGD("OnMetadataObjectAvailable start!");
    OH_LOG_INFO(LOG_APP, "OnMetadataObjectAvailable size = %{public}d", size);
}

void OnMetadataOutputError(Camera_MetadataOutput *metadataOutput, Camera_ErrorCode errorCode)
{
    DRAWING_LOGD("OnMetadataOutputError start!");
    OH_LOG_INFO(LOG_APP, "OnMetadataOutputError errorCode = %{public}d", errorCode);
}
MetadataOutput_Callbacks *NDKCamera::GetMetadataOutputListener(void)
{
    static MetadataOutput_Callbacks metadataOutputListener = {.onMetadataObjectAvailable = OnMetadataObjectAvailable,
                                                              .onError = OnMetadataOutputError};
    return &metadataOutputListener;
}

Camera_ErrorCode NDKCamera::MetadataOutputRegisterCallback(void)
{
    result_ = OH_MetadataOutput_RegisterCallback(metadataOutput_, GetMetadataOutputListener());
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_PhotoOutput_RegisterCallback failed.");
    }
    return result_;
}

Camera_ErrorCode NDKCamera::VideoOutputRegisterCallback(void)
{
    result_ = OH_VideoOutput_RegisterCallback(videoOutput_, GetVideoOutputListener());
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_PhotoOutput_RegisterCallback failed.");
    }
    return result_;
}

// Session Callback
void CaptureSessionOnFocusStateChange(Camera_CaptureSession *session, Camera_FocusState focusState)
{
    OH_LOG_INFO(LOG_APP, "CaptureSession_Callbacks CaptureSessionOnFocusStateChange");
    OH_LOG_INFO(LOG_APP, "CaptureSessionOnFocusStateChange");
}

void CaptureSessionOnError(Camera_CaptureSession *session, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "CaptureSession_Callbacks CaptureSessionOnError");
    OH_LOG_INFO(LOG_APP, "CaptureSession errorCode = %{public}d", errorCode);
}

CaptureSession_Callbacks *NDKCamera::GetCaptureSessionRegister(void)
{
    static CaptureSession_Callbacks captureSessionCallbacks = {.onFocusStateChange = CaptureSessionOnFocusStateChange,
                                                               .onError = CaptureSessionOnError};
    return &captureSessionCallbacks;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallback(void)
{
    result_ = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister());
    if (result_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_RegisterCallback failed.");
    }
    return result_;
}
} // namespace OHOS_CAMERA_SAMPLE