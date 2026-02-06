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

#include "camera_manager_ndk.h"
#include <unistd.h>
#include <ohcamera/camera_device.h>

#define CAMERA_LOG_TAG "CAMERA_TAGLOG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
CameraCallbackCode NDKCamera::cameraCallbackCode_ = NoReceived;
OH_PhotoNative* NDKCamera::g_photoNative = nullptr;

const Camera_Profile DEFAULT_PREVIEW_PROFILE = { CAMERA_FORMAT_YUV_420_SP, { 640, 480 } };
const Camera_Profile DEFAULT_PHOTO_PROFILE = { CAMERA_FORMAT_JPEG, { 640, 480 } };
const Camera_Profile YUV_PHOTO_PROFILE = { CAMERA_FORMAT_YUV_420_SP, { 640, 480 } };
const Camera_VideoProfile DEFAULT_VIDEO_PROFILE = { CAMERA_FORMAT_YUV_420_SP, { 640, 480 }, {30, 30} };

Camera_Size SecureSize = {640, 480};
Camera_Profile PhotoOutputWithoutSurface = {CAMERA_FORMAT_JPEG, {1920, 1080}};
Camera_Profile PreviewOutputSample = {CAMERA_FORMAT_YUV_420_SP, {1920, 1080}};
static OH_NativeBuffer_ColorSpace oHNativeBufferColorSpace[15]
    = {OH_NativeBuffer_ColorSpace::OH_COLORSPACE_NONE,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_P3_FULL,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_SRGB_FULL,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT709_FULL,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT2020_HLG_FULL,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT2020_PQ_FULL,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_P3_HLG_FULL,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_P3_PQ_FULL,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_P3_LIMIT,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_SRGB_LIMIT,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT709_LIMIT,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT2020_HLG_LIMIT,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_BT2020_PQ_LIMIT,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_P3_HLG_LIMIT,
       OH_NativeBuffer_ColorSpace::OH_COLORSPACE_P3_PQ_LIMIT};

NDKCamera::NDKCamera(char* str)
    : cameras_(nullptr), cameraOutputCapability_(nullptr),
      isAddInput_(false), camera_(nullptr), sceneModes_(nullptr), sceneMode_(NORMAL_PHOTO),
      secureSeqId_(0), canPreconfig_(false), sceneModesSize_(0), isMovingPhotoSupported_(false),
      isPhotoQualityPrioritizationSupported_(false), photoNative_(nullptr),
      mainImage_(nullptr), isTorchSupportedByTorchMode_(false), torchMode_(ON), frameRatesSize_(0),
      videoFrameRatesSize_(0), colorSpacesSize_(0), colorSpace_(nullptr), activeColorSpace_(OH_COLORSPACE_P3_PQ_LIMIT),
      setcolorSpace_(OH_COLORSPACE_NONE),
      frameRateRange_(nullptr), activeFrameRateRange_({0, 0}), videoFrameRateRange_(0),
      videoActiveFrameRateRange_({0, 0}), isCreatePhotoOutputWithoutSurface_(false),
      captureSession_(nullptr), size_(0),
      profile_(nullptr), photoProfile_(nullptr), previewOutput_(nullptr), photoOutput_(nullptr), videoOutput_(nullptr),
      metaDataObjectType_(nullptr), metadataOutput_(nullptr), cameraInput_(nullptr),
      isCameraMuted_(nullptr), previewSurfaceId_(str),
      cameraProfile_(nullptr), videoActiveProfile_(nullptr),
      ret_(CAMERA_OK), orientation_(0), cameraDeviceIndex_(0),
      pictureNative_(nullptr)
{
    valid_ = false;
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager_);
    if (cameraManager_ == nullptr || ret != CAMERA_OK) {
        LOG("ndkXTS Get CameraManager failed.");
    }
    CameraManagerRegisterCallback();
    valid_ = true;
}

NDKCamera::~NDKCamera() {
    valid_ = false;

    Camera_ErrorCode ret = OH_CaptureSession_Release(captureSession_);
    if (ret != CAMERA_OK) {
        LOG("ndkXTS Release failed.");
    }

    if (cameraManager_) {
        LOG("Release OH_CameraManager_DeleteSupportedCameras. enter");
        ret = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
        if (ret != CAMERA_OK) {
            LOG("Delete Cameras failed.");
        } else {
            LOG("Release OH_CameraManager_DeleteSupportedCameras. ok");
        }

        ret = OH_CameraManager_DeleteSupportedCameraOutputCapability(cameraManager_, cameraOutputCapability_);
        if (ret != CAMERA_OK) {
            LOG("Delete CameraOutputCapability failed.");
        } else {
            LOG("Release OH_CameraManager_DeleteSupportedCameraOutputCapability. ok");
        }

        ret = OH_Camera_DeleteCameraManager(cameraManager_);
        if (ret != CAMERA_OK) {
            LOG("Delete CameraManager failed.");
        } else {
            LOG("Release OH_Camera_DeleteCameraManager. ok");
        }
        cameraManager_ = nullptr;
    }

    PreviewOutputStop();
    PreviewOutputRelease();
    PhotoOutputRelease();
    CameraManagerUnRegisterCallback();
}

Camera_ErrorCode NDKCamera::ReleaseCamera(void)
{
    Camera_ErrorCode ret = CAMERA_OK;
    if (videoOutput_) {
        VideoOutputRelease();
    }
    if (photoOutput_) {
        PhotoOutputRelease();
    }
    if (previewOutput_) {
        SessionRemovePreviewOutput();
        PreviewOutputRelease();
    }
    if (cameraInput_) {
        SessionRemoveInput();
        CameraInputClose();
        CameraInputRelease();
    }
    if (captureSession_) {
        SessionRelease();
    }
    if (cameraManager_) {
        CameraManagerUnRegisterCallback();
        LOG("Release OH_CameraManager_DeleteSupportedCameras. enter");
        ret = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
        if (ret != CAMERA_OK) {
            LOG("Delete Cameras failed.");
        }

        ret = OH_CameraManager_DeleteSupportedCameraOutputCapability(cameraManager_, cameraOutputCapability_);
        if (ret != CAMERA_OK) {
            LOG("Delete CameraOutputCapability failed.");
        }

        ret = OH_Camera_DeleteCameraManager(cameraManager_);
        if (ret != CAMERA_OK) {
            LOG("Delete CameraManager failed.");
        }
        cameraManager_ = nullptr;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CreateSession(void)
{
    if (!cameraManager_) {
          return Camera_ErrorCode::CAMERA_INVALID_ARGUMENT;
    }
    Camera_ErrorCode ret =  OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    if (captureSession_ == nullptr || ret != CAMERA_OK) {
        LOG("ndkXTS Create captureSession failed.");
    }
    CaptureSessionRegisterCallback();
    return ret;
}

Camera_ErrorCode NDKCamera::HasFlashFn(uint32_t mode)
{
    Camera_FlashMode flashMode = static_cast<Camera_FlashMode>(mode);
    // 检测是否有闪关灯
    bool hasFlash = false;
    Camera_ErrorCode ret = OH_CaptureSession_HasFlash(captureSession_, &hasFlash);
    if (captureSession_ == nullptr || ret != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_HasFlash failed.");
    }
    if (hasFlash) {
        LOG("ndkXTS hasFlash success-----");
    } else {
        LOG("ndkXTS hasFlash fail-----");
    }

    // 检测闪光灯模式是否支持
    bool isSupported = false;
    ret = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, &isSupported);
    if (ret != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_IsFlashModeSupported failed.");
    }
    if (isSupported) {
        LOG("ndkXTS isFlashModeSupported success-----");
    } else {
        LOG("ndkXTS isFlashModeSupported fail-----");
    }

    // 设置闪光灯模式
    ret = OH_CaptureSession_SetFlashMode(captureSession_, flashMode);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_SetFlashMode success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_SetFlashMode failed. %d ", ret);
    }

    // 获取当前设备的闪光灯模式
    ret = OH_CaptureSession_GetFlashMode(captureSession_, &flashMode);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_GetFlashMode success. flashMode: %d ", flashMode);
    } else {
        LOG("ndkXTS OH_CaptureSession_GetFlashMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::setZoomRatioFn(uint32_t zoomRatio)
{
    float zoom = float(zoomRatio);
    // 获取支持的变焦范围
    float minZoom;
    float maxZoom;
    Camera_ErrorCode ret = OH_CaptureSession_GetZoomRatioRange(captureSession_, &minZoom, &maxZoom);
    if (captureSession_ == nullptr || ret != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_GetZoomRatioRange failed.");
    } else {
        LOG("ndkXTS OH_CaptureSession_GetZoomRatioRange success. minZoom: %f, maxZoom: %f", minZoom, maxZoom);
    }

    // 设置变焦
    ret = OH_CaptureSession_SetZoomRatio(captureSession_, zoom);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_SetZoomRatio success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_SetZoomRatio failed. %d ", ret);
    }

    // 获取当前设备的变焦值
    ret = OH_CaptureSession_GetZoomRatio(captureSession_, &zoom);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_GetZoomRatio success. zoom:%f ", zoom);
    } else {
        LOG("ndkXTS OH_CaptureSession_GetZoomRatio failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionBegin(void)
{
    Camera_ErrorCode ret =  OH_CaptureSession_BeginConfig(captureSession_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_BeginConfig success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_BeginConfig failed. %d and captureSession_ addr = %p", ret, captureSession_);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionCommitConfig(void)
{
    Camera_ErrorCode ret =  OH_CaptureSession_CommitConfig(captureSession_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CommitConfig success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_CommitConfig failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionStart(void)
{
    Camera_ErrorCode ret =  OH_CaptureSession_Start(captureSession_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_Start success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_Start failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionStop(void)
{
    Camera_ErrorCode ret =  OH_CaptureSession_Stop(captureSession_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_Stop success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_Stop failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CreateCameraInput(void)
{
    LOG("ndkXTS CreateCameraInput start.");
    if (cameraManager_ == nullptr) {
        LOG("ndkXTS cameraManager_ is NULL.");
    } else if (cameras_ == nullptr) {
        LOG("ndkXTS cameras_ is NULL.");
    }
    if (sceneMode_ == SECURE_PHOTO) {
        ret_ = GetCameraFromCameras(cameras_, &camera_, FRONT_CAMERA);
        ret_ = OH_CameraManager_CreateCameraInput(cameraManager_, camera_, &cameraInput_);
    } else {
        ret_ = OH_CameraManager_CreateCameraInput(cameraManager_, cameras_, &cameraInput_);
    }
    if (cameraInput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreateCameraInput failed = %d. cameraInput_ = %p", ret_, cameraInput_);
        return CAMERA_INVALID_ARGUMENT;
    }
    CameraInputRegisterCallback();
    LOG("ndkXTS CreateCameraInput end.");
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraInputOpen(void)
{
    ret_ = OH_CameraInput_Open(cameraInput_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CameraInput_Open failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraInputClose(void)
{
    ret_ = OH_CameraInput_Close(cameraInput_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CameraInput_Close failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraInputRelease(void)
{
    ret_ = CameraInputUnRegisterCallback();
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CameraInputUnRegisterCallback failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraInput_Release(cameraInput_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CameraInput_Release failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedCameras(void)
{

    ret_ = OH_CameraManager_GetSupportedCameras(cameraManager_, &cameras_, &size_);
    if (cameras_ == nullptr || ret_ != CAMERA_OK) {
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraOrientation(void)
{
    if (size_ <= 0) {
        return CAMERA_OK;
    }
    ret_ = OH_CameraDevice_GetCameraOrientation(&cameras_[cameraDeviceIndex_], &orientation_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraDevice_GetCameraOrientation failed.");
        return CAMERA_SERVICE_FATAL_ERROR;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraHostNameErrorParameter(void)
{
    ret_ = OH_CameraDevice_GetHostDeviceName(nullptr, nullptr);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraDevice_GetCameraHostName failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraHostTypeErrorParameter(void)
{
    ret_ = OH_CameraDevice_GetHostDeviceType(nullptr, nullptr);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraDevice_GetCameraHostType failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraHostNameInspection(void)
{
    for (int32_t deviceIndex = 0; deviceIndex < size_; deviceIndex++) {
        ret_ = OH_CameraDevice_GetHostDeviceName(&cameras_[deviceIndex], &hostName_);
        if (ret_ != CAMERA_OK) {
            LOG("ndkXTS OH_CameraDevice_GetCameraHostName failed.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraHostTypeInspection(void)
{
    for (int32_t deviceIndex = 0; deviceIndex < size_; deviceIndex++) {
        ret_ = OH_CameraDevice_GetHostDeviceType(&cameras_[deviceIndex], &hostType_);
        if (ret_ != CAMERA_OK) {
            LOG("ndkXTS OH_CameraDevice_GetCameraHostType failed.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraHostName(void)
{
    if (size_ <= 0) {
        return CAMERA_OK;
    }
    ret_ = OH_CameraDevice_GetHostDeviceName(&cameras_[cameraDeviceIndex_], &hostName_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraDevice_GetCameraHostName failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraHostType(void)
{
    if (size_ <= 0) {
        return CAMERA_OK;
    }
    LOG("HostDeviceType value: %{public}d", HOST_DEVICE_TYPE_UNKNOWN_TYPE);
    LOG("HostDeviceType value: %{public}d", HOST_DEVICE_TYPE_PHONE);
    LOG("HostDeviceType value: %{public}d", HOST_DEVICE_TYPE_TABLET);
    ret_ = OH_CameraDevice_GetHostDeviceType(&cameras_[cameraDeviceIndex_], &hostType_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraDevice_GetCameraHostType failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedOutputCapability(void)
{
    if (cameraManager_ == nullptr) {
        LOG("ndkXTS cameraManager_ is null.");
    } else if (cameras_ == nullptr) {
        LOG("ndkXTS cameras_ is null.");
    }
    ret_ = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &cameraOutputCapability_);
    if (cameraOutputCapability_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS GetSupportedCameraOutputCapability failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedFullOutputCapability(void)
{
    if (cameraManager_ == nullptr) {
        LOG("ndkXTS cameraManager_ is null.");
    } else if (cameras_ == nullptr) {
        LOG("ndkXTS cameras_ is null.");
    }
    ret_ = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
        cameraManager_, cameras_, NORMAL_PHOTO, &cameraOutputCapability_);
    if (cameraOutputCapability_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS GetSupportedFullCameraOutputCapabilityWithSceneMode failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

int NDKCamera::AdjustHeifIdx(int idx)
{
    if (idx == -1) {
        return idx;
    }
    if (cameraOutputCapability_ == nullptr) {
        return CAMERA_INVALID_ARGUMENT;
    }
    for (; idx < cameraOutputCapability_->photoProfilesSize; idx++) {
        if (cameraOutputCapability_->photoProfiles[idx]->format == CAMERA_FORMAT_HEIC) {
            break;
        }
    }
    if (idx >= cameraOutputCapability_->photoProfilesSize) {
        idx = -1;
    }
    return idx;
}

Camera_ErrorCode NDKCamera::CreatePreviewOutput(void)
{
    profile_ = cameraOutputCapability_->previewProfiles[0];
    for (decltype(cameraOutputCapability_->previewProfilesSize) i = 0; i < cameraOutputCapability_->previewProfilesSize;
         i++) {
        if (cameraOutputCapability_->previewProfiles[i]->size.width == DEFAULT_PREVIEW_PROFILE.size.width &&
            cameraOutputCapability_->previewProfiles[i]->size.height == DEFAULT_PREVIEW_PROFILE.size.height) {
            profile_ = cameraOutputCapability_->previewProfiles[i];
            break;
        }
    }
    if (sceneMode_ == SECURE_PHOTO) {
        for (decltype(cameraOutputCapability_ -> previewProfilesSize) i = 0;
             i< cameraOutputCapability_ -> previewProfilesSize; i++) {
            if (cameraOutputCapability_->previewProfiles[i]->size.width == SecureSize.width &&
                cameraOutputCapability_->previewProfiles[i]->size.height == SecureSize.height) {
                profile_ = cameraOutputCapability_->previewProfiles[i];
                break;
            }
        }
    } else if (isCreatePhotoOutputWithoutSurface_) {
        for (decltype(cameraOutputCapability_ -> previewProfilesSize) i = 0;
             i< cameraOutputCapability_ -> previewProfilesSize; i++) {
            if (cameraOutputCapability_->previewProfiles[i]->size.width == PreviewOutputSample.size.width &&
                cameraOutputCapability_->previewProfiles[i]->size.height == PreviewOutputSample.size.height &&
                cameraOutputCapability_->previewProfiles[i]->format == PreviewOutputSample.format) {
                profile_ = cameraOutputCapability_->previewProfiles[i];
                break;
            }
        }
    }
    if (profile_ == nullptr) {
        LOG("ndkXTS Get previewProfiles failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraManager_CreatePreviewOutput(cameraManager_, profile_, previewSurfaceId_, &previewOutput_);
    if (previewSurfaceId_ == nullptr || previewOutput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreatePreviewOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    PreviewOutputRegisterCallback();
    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePhotoOutput(char* photoSurfaceId)
{
    LOG("ndkXTS CreatePhotoOutput start.");
    profile_ = cameraOutputCapability_->photoProfiles[0];
    for (decltype(cameraOutputCapability_->photoProfilesSize) i = 0; i < cameraOutputCapability_->photoProfilesSize;
         i++) {
        if (cameraOutputCapability_->photoProfiles[i]->size.width == DEFAULT_PHOTO_PROFILE.size.width &&
            cameraOutputCapability_->photoProfiles[i]->size.height == DEFAULT_PHOTO_PROFILE.size.height) {
            profile_ = cameraOutputCapability_->photoProfiles[i];
            break;
        }
    }
    LOG("ndkXTS CreatePhotoOutput photoProfiles start.");
    if (profile_ == nullptr) {
        LOG("ndkXTS Get photoProfiles failed.");
        return CAMERA_INVALID_ARGUMENT;
    }

    if (photoSurfaceId == nullptr) {
        LOG("ndkXTS CreatePhotoOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    LOG("ndkXTS CreatePhotoOutput start.");
    ret_ = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, photoSurfaceId, &photoOutput_);
    PhotoOutputRegisterCallback();

    return ret_;
}

Camera_ErrorCode NDKCamera::CreateHeifPhotoOutput(char* photoSurfaceId, int idx)
{
    LOG("ndkXTS CreateHeifPhotoOutput start.");
    profile_ = cameraOutputCapability_->photoProfiles[idx];
    LOG("ndkXTS CreateHeifPhotoOutput photoProfiles start.");
    if (profile_ == nullptr) {
        LOG("ndkXTS Get photoProfiles failed.");
        return CAMERA_INVALID_ARGUMENT;
    }

    if (photoSurfaceId == nullptr) {
        LOG("ndkXTS CreateHeifPhotoOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    LOG("ndkXTS CreateHeifPhotoOutput start.");
    ret_ = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, photoSurfaceId, &photoOutput_);
    PhotoOutputRegisterCallback();

    return ret_;
}

Camera_ErrorCode NDKCamera::CreateVideoOutput(char* videoId)
{
    LOG("ndkXTS CreateVideoOutput start.");
    videoProfile_ = cameraOutputCapability_->videoProfiles[0];
    for (decltype(cameraOutputCapability_->videoProfilesSize) i = 0; i < cameraOutputCapability_->videoProfilesSize;
         i++) {
        if (cameraOutputCapability_->videoProfiles[i]->size.width == DEFAULT_VIDEO_PROFILE.size.width &&
            cameraOutputCapability_->videoProfiles[i]->size.height == DEFAULT_VIDEO_PROFILE.size.height) {
            videoProfile_ = cameraOutputCapability_->videoProfiles[i];
            break;
        }
    }
    LOG("ndkXTS CreateVideoOutput videoProfiles start.");
    if (videoProfile_ == nullptr) {
        LOG("ndkXTS Get videoProfiles failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraManager_CreateVideoOutput(cameraManager_, videoProfile_, videoId, &videoOutput_);
    if (videoId == nullptr || videoOutput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreateVideoOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }

    return ret_;
}

Camera_ErrorCode NDKCamera::AddVideoOutput(void)
{
    LOG("ndkXTS AddVideoOutput start.");
    Camera_ErrorCode ret = OH_CaptureSession_AddVideoOutput(captureSession_, videoOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddVideoOutput success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_AddVideoOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CreateMetadataOutput(void)
{
    metaDataObjectType_ = cameraOutputCapability_->supportedMetadataObjectTypes[0];
    
    LOG("NDKCamera::CreateMetadataOutput supportedMetadataObjectTypes end.");
    if (metaDataObjectType_ == nullptr) {
        LOG("ndkXTS Get metaDataObjectType failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraManager_CreateMetadataOutput(cameraManager_, metaDataObjectType_, &metadataOutput_);
    if (metadataOutput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreateMetadataOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsCameraMuted(void)
{
    ret_ = OH_CameraManager_IsCameraMuted(cameraManager_, isCameraMuted_);
    if (isCameraMuted_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS IsCameraMuted failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PreviewOutputStop(void)
{
    ret_ = OH_PreviewOutput_Stop(previewOutput_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS PreviewOutputStop failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PreviewOutputRelease(void)
{
    ret_ = PreviewOutputUnRegisterCallback();
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS PreviewOutputUnRegisterCallback failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_PreviewOutput_Release(previewOutput_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS PreviewOutputRelease failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoOutputRelease(void)
{
    ret_ = PhotoOutputUnRegisterCallback();
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS PhotoOutputUnRegisterCallback failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_PhotoOutput_Release(photoOutput_);
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS PhotoOutputRelease failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::StartVideo(char* videoId)
{
    LOG("ndkXTS startVideo begin.");
    Camera_ErrorCode ret = SessionStop();
    if (ret == CAMERA_OK) {
        LOG("ndkXTS SessionStop success.");
    } else {
        LOG("ndkXTS SessionStop failed. %d ", ret);
    }
    ret = SessionBegin();
    if (ret == CAMERA_OK) {
        LOG("ndkXTS SessionBegin success.");
    } else {
        LOG("ndkXTS SessionBegin failed. %d ", ret);
    }
    CreateVideoOutput(videoId);
    AddVideoOutput();
    SessionCommitConfig();
    SessionStart();
    return ret;
}

Camera_ErrorCode NDKCamera::VideoOutputStart(void)
{
    LOG("ndkXTS VideoOutputStart begin.");
    Camera_ErrorCode ret = OH_VideoOutput_Start(videoOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_VideoOutput_Start success.");
    } else {
        LOG("ndkXTS OH_VideoOutput_Start failed. %d ", ret);
    }
    VideoOutputRegisterCallback();
    return ret;
}

Camera_ErrorCode NDKCamera::PreviewOutputStart(void)
{
    LOG("ndkXTS PreviewOutputStart begin.");
    Camera_ErrorCode ret = OH_PreviewOutput_Start(previewOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_PreviewOutput_Start success.");
    } else {
        LOG("ndkXTS OH_PreviewOutput_Start failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::PhotoOutputCapture(void)
{
    LOG("ndkXTS Capture begin.");
    Camera_ErrorCode ret = OH_PhotoOutput_Capture(photoOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_PhotoOutput_Capture success.");
    } else {
        LOG("ndkXTS OH_PhotoOutput_Capture failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::TakePictureWithPhotoSettings(Camera_PhotoCaptureSetting photoSetting)
{
    Camera_ErrorCode ret = CAMERA_OK;
    ret = OH_PhotoOutput_Capture_WithCaptureSetting(photoOutput_, photoSetting);

    LOG("ndkXTS takePicture TakePictureWithPhotoSettings ret = %d.", ret);
    if (ret != CAMERA_OK) {
        LOG("ndkXTS startPhoto failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::IsMirrorSupported(void)
{
    LOG("ndkXTS IsMirrorSupported begin.");
    Camera_ErrorCode ret = OH_PhotoOutput_IsMirrorSupported(photoOutput_, &IsMirror_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_PhotoOutput_IsMirrorSupported success.");
    } else {
        LOG("ndkXTS OH_PhotoOutput_IsMirrorSupported failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::VideoOutputStop(void)
{
    LOG("ndkXTS VideoOutputStop begin.");
    Camera_ErrorCode ret = OH_VideoOutput_Stop(videoOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_VideoOutput_Stop success.");
    } else {
        LOG("ndkXTS OH_VideoOutput_Stop failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::VideoOutputRelease(void)
{
    LOG("ndkXTS VideoOutputRelease begin.");
    ret_ = VideoOutputUnRegisterCallback();
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS VideoOutputUnRegisterCallback failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    Camera_ErrorCode ret = OH_VideoOutput_Release(videoOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_VideoOutput_Release success.");
    } else {
        LOG("ndkXTS OH_VideoOutput_Release failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::IsVideoMirrorSupported(void)
{
    LOG("ndkXTS IsVideoMirrorSupported begin.");
    Camera_ErrorCode ret = OH_VideoOutput_IsMirrorSupported(videoOutput_, &IsVideoMirror_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_VideoOutput_IsMirrorSupported success.");
    } else {
        LOG("ndkXTS OH_VideoOutput_IsMirrorSupported failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::EnableVideoMirror(bool isEnable)
{
    LOG("ndkXTS EnableVideoMirror begin.");
    Camera_ErrorCode ret = OH_VideoOutput_EnableMirror(videoOutput_, isEnable);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_VideoOutput_EnableVideoMirror success.");
    } else {
        LOG("ndkXTS OH_VideoOutput_EnableVideoMirror failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::MetadataOutputStart(void)
{
    LOG("ndkXTS MetadataOutputStart begin.");
    Camera_ErrorCode ret = OH_MetadataOutput_Start(metadataOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_MetadataOutput_Start success.");
    } else {
        LOG("ndkXTS OH_MetadataOutput_Start failed. %d ", ret);
    }
    ret = MetadataOutputRegisterCallback();
    if (ret != CAMERA_OK) {
        LOG("ndkXTS MetadataOutputUnRegisterCallback failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::MetadataOutputStop(void)
{
    LOG("ndkXTS MetadataOutputStop begin.");
    Camera_ErrorCode ret = OH_MetadataOutput_Stop(metadataOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_MetadataOutput_Stop success.");
    } else {
        LOG("ndkXTS OH_MetadataOutput_Stop failed. %d ", ret);
    }
    ret = MetadataOutputUnRegisterCallback();
    if (ret != CAMERA_OK) {
        LOG("ndkXTS MetadataOutputUnRegisterCallback failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::MetadataOutputRelease(void)
{
    LOG("ndkXTS MetadataOutputRelease begin.");
    Camera_ErrorCode ret = OH_MetadataOutput_Release(metadataOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_MetadataOutput_Release success.");
    } else {
        LOG("ndkXTS OH_MetadataOutput_Release failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionAddInput(void)
{
    LOG("ndkXTS CaptureSessionAddInput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_AddInput(captureSession_, cameraInput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddInput success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_AddInput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::MetadataOutputRemoveMetadataObjectTypes()
{
    LOG("ndkXTS MetadataOutputRemoveMetadataObjectTypes begin.");
    uint32_t size = 1;
    Camera_MetadataObjectType* types = new Camera_MetadataObjectType[size];
    types[0] = Camera_MetadataObjectType::CAMERA_METADATA_OBJECT_TYPE_HUMAN_BODY;
    Camera_ErrorCode ret = OH_MetadataOutput_RemoveMetadataObjectTypes(metadataOutput_, types, size);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_MetadataOutput_RemoveMetadataObjectTypes success.");
    } else {
        LOG("ndkXTS OH_MetadataOutput_RemoveMetadataObjectTypes failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::MetadataOutputAddMetadataObjectTypes()
{
    LOG("ndkXTS MetadataOutputAddMetadataObjectTypes begin.");
    uint32_t size = 1;
    Camera_MetadataObjectType* types = new Camera_MetadataObjectType[size];
    types[0] = Camera_MetadataObjectType::CAMERA_METADATA_OBJECT_TYPE_HUMAN_BODY;
    Camera_ErrorCode ret = OH_MetadataOutput_AddMetadataObjectTypes(metadataOutput_, types, size);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_MetadataOutput_AddMetadataObjectTypes success.");
    } else {
        LOG("ndkXTS OH_MetadataOutput_AddMetadataObjectTypes failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CreateMetadataOutputWithObjectTypes()
{
    uint32_t size = 2;
    Camera_MetadataObjectType* types = new Camera_MetadataObjectType[size];
    types[0] = Camera_MetadataObjectType::CAMERA_METADATA_OBJECT_TYPE_HUMAN_BODY;
    types[1] = Camera_MetadataObjectType::CAMERA_METADATA_OBJECT_TYPE_FACE_DETECTION;
    ret_ = OH_CameraManager_CreateMetadataOutputWithObjectTypes(cameraManager_, types, size, &metadataOutput_);
    if (metadataOutput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreateMetadataOutputWithMetadataObjectTypes failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionRemoveInput(void)
{
    LOG("ndkXTS CaptureSessionRemoveInput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_RemoveInput(captureSession_, cameraInput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_RemoveInput success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_RemoveInput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionAddPreviewOutput(void)
{
    LOG("ndkXTS CaptureSessionAddPreviewOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_AddPreviewOutput(captureSession_, previewOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddPreviewOutput success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_AddPreviewOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionAddPhotoOutput(void)
{
    LOG("ndkXTS CaptureSessionAddPhotoOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_AddPhotoOutput(captureSession_, photoOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddPhotoOutput success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_AddPhotoOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionAddVideoOutput(void)
{
    LOG("ndkXTS CaptureSessionAddVideoOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_AddVideoOutput(captureSession_, videoOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddVideoOutput success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_AddVideoOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionAddMetadataOutput(void)
{
    LOG("ndkXTS CaptureSessionAddMetadataOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_AddMetadataOutput(captureSession_, metadataOutput_);
    if (ret == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddMetadataOutput success.");
    } else {
        LOG("ndkXTS OH_CaptureSession_AddMetadataOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionRemovePreviewOutput(void)
{
    LOG("RemovePreviewOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_RemovePreviewOutput(captureSession_, previewOutput_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_RemovePreviewOutput success.");
    } else {
        LOG("OH_CaptureSession_RemovePreviewOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionRemovePhotoOutput(void)
{
    LOG("RemovePhotoOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_RemovePhotoOutput(captureSession_, photoOutput_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_RemovePhotoOutput success.");
    } else {
        LOG("OH_CaptureSession_RemovePhotoOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionRemoveVideoOutput(void)
{
    LOG("RemoveVideoOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_RemoveVideoOutput(captureSession_, videoOutput_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_RemoveVideoOutput success.");
    } else {
        LOG("OH_CaptureSession_RemoveVideoOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionRemoveMetadataOutput(void)
{
    LOG("RemoveMetadataOutput begin.");
    Camera_ErrorCode ret = OH_CaptureSession_RemoveMetadataOutput(captureSession_, metadataOutput_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_RemoveMetadataOutput success.");
    } else {
        LOG("OH_CaptureSession_RemoveMetadataOutput failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionRelease(void)
{
    LOG("SessionRelease begin.");
    ret_ = CaptureSessionUnRegisterCallback();
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CaptureSessionUnRegisterCallback failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    Camera_ErrorCode ret = OH_CaptureSession_Release(captureSession_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_Release success.");
    } else {
        LOG("OH_CaptureSession_Release failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionHasFlash(void)
{
    LOG("HasFlash begin.");
    Camera_ErrorCode ret = OH_CaptureSession_HasFlash(captureSession_, &HasFlash_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_HasFlash success.");
    } else {
        LOG("OH_CaptureSession_HasFlash failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionIsFlashModeSupported(uint32_t mode)
{
    LOG("HasFlash begin.");
    Camera_FlashMode flashMode = static_cast<Camera_FlashMode>(mode);
    Camera_ErrorCode ret = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, &IsFlashMode_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_HasFlash success.");
    } else {
        LOG("OH_CaptureSession_HasFlash failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetFlashMode(void)
{
    LOG("GetFlashMode begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetFlashMode(captureSession_, &flashMode_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetFlashMode success.");
    } else {
        LOG("OH_CaptureSession_GetFlashMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetFlashMode(uint32_t mode)
{
    LOG("SetFlashMode begin.");
    Camera_FlashMode flashMode = static_cast<Camera_FlashMode>(mode);
    Camera_ErrorCode ret = OH_CaptureSession_SetFlashMode(captureSession_, flashMode);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetFlashMode success.");
    } else {
        LOG("OH_CaptureSession_SetFlashMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetPhotoRotation(int rotation)
{
    LOG("GetVideoRotation begin.");
    int32_t testRotation = static_cast<int32_t>(rotation);
////11
    Camera_ErrorCode ret = OH_PhotoOutput_GetPhotoRotation(photoOutput_, testRotation, &imageRotation_);
    if (ret == CAMERA_OK) {
        LOG("OH_PhotoOutput_GetPhotoRotation success.");
    } else {
        LOG("OH_PhotoOutput_GetPhotoRotation failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetPhotoRotationWithoutDeviceDegree()
{
    LOG("GetPhotoRotationWithoutDeviceDegree begin.");
    Camera_ErrorCode ret = OH_PhotoOutput_GetPhotoRotationWithoutDeviceDegree(photoOutput_, &imageRotation_);
    if (ret == CAMERA_OK) {
        LOG("OH_PhotoOutput_GetPhotoRotationWithoutDeviceDegree success.");
    } else {
        LOG("OH_PhotoOutput_GetPhotoRotationWithoutDeviceDegree failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetVideoRotation(int rotation)
{
    LOG("GetVideoRotation begin.");
    int32_t testRotation = static_cast<int32_t>(rotation);
////问题12
    Camera_ErrorCode ret = OH_VideoOutput_GetVideoRotation(videoOutput_, testRotation, &imageRotation_);
    if (ret == CAMERA_OK) {
        LOG("OH_VideoOutput_GetVideoRotation success.");
    } else {
        LOG("OH_VideoOutput_GetVideoRotation failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetVideoRotationWithoutDeviceDegree()
{
    LOG("GetVideoRotationWithoutDeviceDegree begin.");
    Camera_ErrorCode ret = OH_VideoOutput_GetVideoRotationWithoutDeviceDegree(videoOutput_, &imageRotation_);
    if (ret == CAMERA_OK) {
        LOG("OH_VideoOutput_GetVideoRotationWithoutDeviceDegree success.");
    } else {
        LOG("OH_VideoOutput_GetVideoRotationWithoutDeviceDegree failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetPreviewRotation(int rotation)
{
    LOG("GetPreviewRotation begin.");
    int32_t testRotation = static_cast<int32_t>(rotation);
////问题13
    Camera_ErrorCode ret = OH_PreviewOutput_GetPreviewRotation(previewOutput_, testRotation, &imageRotation_);
    if (ret == CAMERA_OK) {
        LOG("OH_PreviewOutput_GetPreviewRotation success.");
    } else {
        LOG("OH_PreviewOutput_GetPreviewRotation failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetPreviewRotationWithoutDisplayRotation()
{
    LOG("GetPreviewRotationWithoutDisplayRotation begin.");
    Camera_ErrorCode ret = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(previewOutput_, &imageRotation_);
    if (ret == CAMERA_OK) {
        LOG("OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation success.");
    } else {
        LOG("OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation failed. %d ", ret);
    }
    return ret;
}

Camera_ImageRotation GetCameraImageRotation(int rotation)
{
    Camera_ImageRotation testRotation = static_cast<Camera_ImageRotation>(-1);
    switch (rotation) {
        case IMAGE_0:
            testRotation = IAMGE_ROTATION_0;
            break;
        case IMAGE_90:
            testRotation = IAMGE_ROTATION_90;
            break;
        case IMAGE_180:
            testRotation = IAMGE_ROTATION_180;
            break;
        case IMAGE_270:
            testRotation = IAMGE_ROTATION_270;
            break;
        case ROTATION_0:
            testRotation = CAMERA_IMAGE_ROTATION_0;
            break;
        case ROTATION_90:
            testRotation = CAMERA_IMAGE_ROTATION_90;
            break;
        case ROTATION_180:
            testRotation = CAMERA_IMAGE_ROTATION_180;
            break;
        case ROTATION_270:
            testRotation = CAMERA_IMAGE_ROTATION_270;
            break;
        default: break;
    }
    return testRotation;
}

Camera_ErrorCode NDKCamera::SessionSetPreviewRotation(int rotation, bool isDisplayLocked)
{
    LOG("SetPreviewRotation begin.");
////问题14
    Camera_ImageRotation testRotation = GetCameraImageRotation(rotation);
    Camera_ErrorCode ret = OH_PreviewOutput_SetPreviewRotation(previewOutput_, testRotation, isDisplayLocked);
    if (ret == CAMERA_OK) {
        LOG("SessionSetPreviewRotation success.");
    } else {
        LOG("SessionSetPreviewRotation failed. %d ", ret);
    }
    return ret;
}
Camera_ErrorCode NDKCamera::SessionIsExposureModeSupported(uint32_t mode)
{
    LOG("SetFlashMode begin.");
    Camera_ExposureMode exposureMode = static_cast<Camera_ExposureMode>(mode);
    Camera_ErrorCode ret = OH_CaptureSession_IsExposureModeSupported(captureSession_, exposureMode, &IsExposureMode_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetFlashMode success.");
    } else {
        LOG("OH_CaptureSession_SetFlashMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetExposureMode(void)
{
    LOG("GetExposureMode begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetExposureMode(captureSession_, &exposureMode_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetExposureMode success.");
    } else {
        LOG("OH_CaptureSession_GetExposureMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetExposureMode(uint32_t mode)
{
    LOG("SetExposureMode begin.");
    Camera_ExposureMode exposureMode = static_cast<Camera_ExposureMode>(mode);
    Camera_ErrorCode ret = OH_CaptureSession_SetExposureMode(captureSession_, exposureMode);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetExposureMode success.");
    } else {
        LOG("OH_CaptureSession_SetExposureMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetMeteringPoint(void)
{
    LOG("OH_CaptureSession_GetMeteringPoint begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetMeteringPoint(captureSession_, &point_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetMeteringPoint success [%f, %f].", point_.x, point_.y);
    } else {
        LOG("OH_CaptureSession_GetMeteringPoint failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetMeteringPoint(double point_x, double point_y)
{
    LOG("SetMeteringPoint begin.");
    Camera_Point point;
    point.x = point_x;
    point.y = point_y;
    LOG("SetMeteringPoint begin. [%f, %f]", point_x, point_y);
    Camera_ErrorCode ret = OH_CaptureSession_SetMeteringPoint(captureSession_, point);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetMeteringPoint success.");
    } else {
        LOG("OH_CaptureSession_SetMeteringPoint failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetExposureBiasRange(void)
{
    LOG("GetExposureBiasRange begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetExposureBiasRange(captureSession_, &minExposureBias_, &maxExposureBias_, &step_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetExposureBiasRange success[%f, %f].", minExposureBias_, maxExposureBias_);
    } else {
        LOG("OH_CaptureSession_GetExposureBiasRange failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetExposureBias(float exposureBias)
{
    LOG("SetExposureBias begin.");
    Camera_ErrorCode ret = OH_CaptureSession_SetExposureBias(captureSession_, exposureBias);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetExposureBias success.");
    } else {
        LOG("OH_CaptureSession_SetExposureBias failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetExposureBias(void)
{
    LOG("GetExposureBias begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetExposureBias(captureSession_, &exposureBias_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetExposureBias success.");
    } else {
        LOG("OH_CaptureSession_GetExposureBias failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionIsFocusModeSupported(uint32_t mode)
{
    LOG("isFocusModeSupported begin.");
    Camera_FocusMode focusMode = static_cast<Camera_FocusMode>(mode);
    Camera_ErrorCode ret = OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, &isFocusSupported_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_isFocusModeSupported success.");
    } else {
        LOG("OH_CaptureSession_isFocusModeSupported failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetFocusMode(void)
{
    LOG("GetFocusMode begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetFocusMode(captureSession_, &focusMode_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetFocusMode success.");
    } else {
        LOG("OH_CaptureSession_GetFocusMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionIsControlCenterSupported(void)
{
    LOG("IsControlCenterSupported begin.");
    Camera_ErrorCode ret = OH_CaptureSession_IsControlCenterSupported(captureSession_, &isContolCenterSupported_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_IsControlCenterSupported success.");
    } else {
        LOG("OH_CaptureSession_IsControlCenterSupported failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetSupportedEffectTypes(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        controlCenterEffectType_ = new Camera_ControlCenterEffectType[1];
        ret_ = OH_CaptureSession_GetSupportedEffectTypes(captureSession_, &controlCenterEffectType_, &effectTypeSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedEffectTypes(nullptr, &controlCenterEffectType_, &effectTypeSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedEffectTypes(captureSession_, nullptr, &effectTypeSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedEffectTypes(captureSession_, &controlCenterEffectType_, nullptr);
    }
    if (controlCenterEffectType_ == nullptr || effectTypeSize_ == 0 || ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetSupportedEffectTypes failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionDeleteSupportedEffectTypes(int useCaseCode)
{
    LOG("NDKCamera::SessionDeleteSupportedEffectTypes");
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession_, controlCenterEffectType_, effectTypeSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_DeleteSupportedEffectTypes(nullptr, controlCenterEffectType_, effectTypeSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession_, nullptr, effectTypeSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession_, controlCenterEffectType_, 0);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_DeleteSupportedEffectTypes failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionEnableControlCenter(bool enabled)
{
    ret_ = OH_CaptureSession_EnableControlCenter(captureSession_, enabled);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_EnableControlCenter failed.");
    }
    return ret_;
}

void ControlCenterEffectStatusChange(Camera_CaptureSession* session,
    Camera_ControlCenterStatusInfo* controlCenterStatusInfo)
{
    LOG("ControlCenterEffectStatusChange is called.");
}

Camera_ErrorCode NDKCamera::RegisterControlCenterEffectStatusChange(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterControlCenterEffectStatusChangeCallback(captureSession_,
            ControlCenterEffectStatusChange);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_RegisterControlCenterEffectStatusChangeCallback(nullptr,
            ControlCenterEffectStatusChange);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterControlCenterEffectStatusChangeCallback(captureSession_,
            nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterControlCenterEffectStatusChangeCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::UnregisterControlCenterEffectStatusChange(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterControlCenterEffectStatusChangeCallback(captureSession_,
            ControlCenterEffectStatusChange);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_UnregisterControlCenterEffectStatusChangeCallback(nullptr,
            ControlCenterEffectStatusChange);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterControlCenterEffectStatusChangeCallback(captureSession_,
            nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterControlCenterEffectStatusChangeCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionSetFocusMode(uint32_t mode)
{
    LOG("SetFocusMode begin.");
    Camera_FocusMode focusMode = static_cast<Camera_FocusMode>(mode);
    Camera_ErrorCode ret = OH_CaptureSession_SetFocusMode(captureSession_, focusMode);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetFocusMode success.");
    } else {
        LOG("OH_CaptureSession_SetFocusMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetFocusPoint(double point_x, double point_y)
{
    LOG("SetFocusPoint begin.");
    Camera_Point point;
    point.x = point_x;
    point.y = point_y;
    Camera_ErrorCode ret = OH_CaptureSession_SetFocusPoint(captureSession_, point);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetFocusPoint success.");
    } else {
        LOG("OH_CaptureSession_SetFocusPoint failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetFocusPoint(void)
{
    LOG("GetFocusMode begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetFocusPoint(captureSession_, &focusPoint_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetFocusMode success.");
    } else {
        LOG("OH_CaptureSession_GetFocusMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetZoomRatioRange(void)
{
    LOG("GetZoomRatioRange begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetZoomRatioRange(captureSession_, &minZoom_, &maxZoom_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetZoomRatioRange success.");
    } else {
        LOG("OH_CaptureSession_GetZoomRatioRange failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetZoomRatio(void)
{
    LOG("GetZoomRatio begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetZoomRatio(captureSession_, &zoom_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetZoomRatio success.");
    } else {
        LOG("OH_CaptureSession_GetZoomRatio failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetZoomRatio(float zoom)
{
    LOG("SetZoomRatio begin.");
    Camera_ErrorCode ret = OH_CaptureSession_SetZoomRatio(captureSession_, zoom);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetZoomRatio success.");
    } else {
        LOG("OH_CaptureSession_SetZoomRatio failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionIsVideoStabilizationModeSupported(uint32_t mode)
{
    LOG("isVideoStabilizationModeSupported begin.");
    Camera_VideoStabilizationMode videoMode = static_cast<Camera_VideoStabilizationMode>(mode);
    LOG("OH_CaptureSession_IsVideoStabilizationModeSupported begin.");
    Camera_ErrorCode ret = OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession_, videoMode, &isVideoSupported_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_isVideoStabilizationModeSupported success.");
    } else {
        LOG("OH_CaptureSession_isVideoStabilizationModeSupported failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionGetVideoStabilizationMode(void)
{
    LOG("GetVideoStabilizationMode begin.");
    Camera_ErrorCode ret = OH_CaptureSession_GetVideoStabilizationMode(captureSession_, &videoMode_);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_GetVideoStabilizationMode success = %d.", videoMode_);
    } else {
        LOG("OH_CaptureSession_GetVideoStabilizationMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetVideoStabilizationMode(uint32_t mode)
{
    LOG("SetVideoStabilizationMode begin.");
    Camera_VideoStabilizationMode videoMode = static_cast<Camera_VideoStabilizationMode>(mode);
    Camera_ErrorCode ret = OH_CaptureSession_SetVideoStabilizationMode(captureSession_, videoMode);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetVideoStabilizationMode success.");
    } else {
        LOG("OH_CaptureSession_SetVideoStabilizationMode failed. %d ", ret);
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionSetQualityPrioritization(uint32_t quality)
{
    LOG("SetQualityPrioritization begin.");
    Camera_QualityPrioritization qualityPrioritization = static_cast<Camera_QualityPrioritization>(quality);
    Camera_ErrorCode ret = OH_CaptureSession_SetQualityPrioritization(captureSession_, qualityPrioritization);
    if (ret == CAMERA_OK) {
        LOG("OH_CaptureSession_SetQualityPrioritization success.");
    } else {
        LOG("OH_CaptureSession_SetQualityPrioritization failed. %d ", ret);
    }
    return ret;
}

// CameraManager Callback
void CameraManagerStatusCallback(Camera_Manager* cameraManager, Camera_StatusInfo* status)
{
    NDKCamera::cameraCallbackCode_ = CameraManager_Status;
    LOG("CameraManagerStatusCallback");
}

CameraManager_Callbacks* NDKCamera::GetCameraManagerListener(void)
{
    static CameraManager_Callbacks cameraManagerListener = {
        .onCameraStatus = CameraManagerStatusCallback
    };
    return &cameraManagerListener;
}

Camera_ErrorCode NDKCamera::CameraManagerRegisterCallback(void)
{
    ret_ = OH_CameraManager_RegisterCallback(cameraManager_, GetCameraManagerListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraManagerUnRegisterCallback(void)
{
    ret_ = OH_CameraManager_UnregisterCallback(cameraManager_, GetCameraManagerListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_UnregisterCallback failed.");
    }
    return ret_;
}

// CameraInput Callback
void OnCameraInputError(const Camera_Input* cameraInput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = CameraInput_Status;
    LOG("OnCameraInput errorCode = %d", errorCode);
}

CameraInput_Callbacks* NDKCamera::GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {
        .onError = OnCameraInputError
    };
    return &cameraInputCallbacks;
}

Camera_ErrorCode NDKCamera::CameraInputRegisterCallback(void)
{
    ret_ = OH_CameraInput_RegisterCallback(cameraInput_, GetCameraInputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraInputUnRegisterCallback(void)
{
    ret_ = OH_CameraInput_UnregisterCallback(cameraInput_, GetCameraInputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_UnregisterCallback failed.");
    }
    return ret_;
}

void OcclusionDetectionCallback(const Camera_Input* cameraInput,
    Camera_OcclusionDetectionResult occlusionDetectionResult)
{
    if (occlusionDetectionResult.isCameraOccluded) {
        LOG("isCameraOccluded true");
    }
    if (occlusionDetectionResult.isCameraLensDirty) {
        LOG("isCameraLensDirty true");
    }
}

Camera_ErrorCode NDKCamera::CameraInputRegisterOcclusionDetectionCallback(void)
{
    LOG("CameraOcclusionDetectChangeTest begin.");
    if (cameraInput_ == nullptr) {
        LOG("ndkXTS CameraInput is nullptr");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraInput_RegisterOcclusionDetectionCallback(
        cameraInput_, OcclusionDetectionCallback);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_RegisterOcclusionDetectionCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraInputUnRegisterOcclusionDetectionCallback(void)
{
    LOG("CameraOcclusionDetectChangeTest begin.");
    if (cameraInput_ == nullptr) {
        LOG("ndkXTS CameraInput is nullptr");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraInput_UnregisterOcclusionDetectionCallback(
        cameraInput_, OcclusionDetectionCallback);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_UnregisterOcclusionDetectionCallback failed.");
    }
    return ret_;
}

// PreviewOutput Callback
void PreviewOutputOnFrameStart(Camera_PreviewOutput *previewOutput)
{
    NDKCamera::cameraCallbackCode_ = Preview_OnFrameStart;
    LOG("PreviewOutputOnFrameStart");
}

void PreviewOutputOnFrameEnd(Camera_PreviewOutput* previewOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = Preview_OnFrameEnd;
    LOG("PreviewOutput frameCount = %d", frameCount);
}

void PreviewOutputOnError(Camera_PreviewOutput* previewOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = Preview_OnError;
    LOG("PreviewOutput errorCode = %d", errorCode);
}

PreviewOutput_Callbacks* NDKCamera::GetPreviewOutputListener(void)
{
    static PreviewOutput_Callbacks previewOutputListener = {
        .onFrameStart = PreviewOutputOnFrameStart,
        .onFrameEnd = PreviewOutputOnFrameEnd,
        .onError = PreviewOutputOnError
    };
    return &previewOutputListener;
}

Camera_ErrorCode NDKCamera::PreviewOutputRegisterCallback(void)
{
    ret_ = OH_PreviewOutput_RegisterCallback(previewOutput_, GetPreviewOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PreviewOutputUnRegisterCallback(void)
{
    ret_ = OH_PreviewOutput_UnregisterCallback(previewOutput_, GetPreviewOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_UnregisterCallback failed.");
    }
    return ret_;
}

// PhotoOutput Callback
void PhotoOutputOnFrameStart(Camera_PhotoOutput* photoOutput)
{
    NDKCamera::cameraCallbackCode_ = Photo_OnFrameStart;
    LOG("PhotoOutputOnFrameStart");
}

void PhotoOutputOnFrameShutter(Camera_PhotoOutput* photoOutput, Camera_FrameShutterInfo* info)
{
    NDKCamera::cameraCallbackCode_ = Photo_OnFrameShutter;
    LOG("PhotoOutputOnFrameShutter");
}

void PhotoOutputOnFrameEnd(Camera_PhotoOutput* photoOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = Photo_OnFrameEnd;
    LOG("PhotoOutput frameCount = %d", frameCount);
}

void PhotoOutputOnError(Camera_PhotoOutput* photoOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = Photo_OnError;
    LOG("PhotoOutput errorCode = %d", errorCode);
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
    ret_ = OH_PhotoOutput_RegisterCallback(photoOutput_, GetPhotoOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoOutputUnRegisterCallback(void)
{
    ret_ = OH_PhotoOutput_UnregisterCallback(photoOutput_, GetPhotoOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterCallback failed.");
    }
    return ret_;
}

// VideoOutput Callback
void VideoOutputOnFrameStart(Camera_VideoOutput* videoOutput)
{
    NDKCamera::cameraCallbackCode_ = Video_OnFrameStart;
    LOG("VideoOutputOnFrameStart");
}

void VideoOutputOnFrameEnd(Camera_VideoOutput* videoOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = Video_OnFrameEnd;
    LOG("VideoOutput frameCount = %d", frameCount);
}

void VideoOutputOnError(Camera_VideoOutput* videoOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = Video_OnError;
    LOG("VideoOutput errorCode = %d", errorCode);
}

VideoOutput_Callbacks* NDKCamera::GetVideoOutputListener(void)
{
    static VideoOutput_Callbacks videoOutputListener = {
        .onFrameStart = VideoOutputOnFrameStart,
        .onFrameEnd = VideoOutputOnFrameEnd,
        .onError = VideoOutputOnError
    };
    return &videoOutputListener;
}

Camera_ErrorCode NDKCamera::VideoOutputRegisterCallback(void)
{
    ret_ = OH_VideoOutput_RegisterCallback(videoOutput_, GetVideoOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::VideoOutputUnRegisterCallback(void)
{
    ret_ = OH_VideoOutput_UnregisterCallback(videoOutput_, GetVideoOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_UnregisterCallback failed.");
    }
    return ret_;
}

// Metadata Callback
void OnMetadataObjectAvailable(Camera_MetadataOutput* metadataOutput,
    Camera_MetadataObject* metadataObject, uint32_t size)
{
    NDKCamera::cameraCallbackCode_ = Metadata_Object_Available;
    LOG("size = %d", size);
}

void OnMetadataOutputError(Camera_MetadataOutput* metadataOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = Metadata_Output_Error;
    LOG("OnMetadataOutput errorCode = %d", errorCode);
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
    ret_ = OH_MetadataOutput_RegisterCallback(metadataOutput_, GetMetadataOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_MetadataOutput_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::MetadataOutputUnRegisterCallback(void)
{
    ret_ = OH_MetadataOutput_UnregisterCallback(metadataOutput_, GetMetadataOutputListener());
    if (ret_ != CAMERA_OK) {
        LOG("OH_MetadataOutput_UnregisterCallback failed.");
    }
    return ret_;
}

// Session Callback
void CaptureSessionOnFocusStateChange(Camera_CaptureSession* session, Camera_FocusState focusState)
{
    NDKCamera::cameraCallbackCode_ = Session_OnFocusState_Change;
    LOG("CaptureSessionOnFocusStateChange");
}

void CaptureSessionOnError(Camera_CaptureSession* session, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = Session_OnError;
    LOG("CaptureSession errorCode = %d", errorCode);
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
    ret_ = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CaptureSessionUnRegisterCallback(void)
{
    ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, GetCaptureSessionRegister());
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreateCameraInputWithPositionAndType(Camera_Position position, Camera_Type type)
{
    LOG("ndkXTS CreateCameraInputWithPositionAndType start.");
    if (cameraManager_ == nullptr) {
        LOG("ndkXTS cameraManager_ is NULL.");
    }
    ret_ = OH_CameraManager_CreateCameraInput_WithPositionAndType(cameraManager_, position, type, &cameraInput_);
    if (cameraInput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreateCameraInputWithPositionAndType failed = %d. cameraInput_ = %p", ret_, cameraInput_);
    }
    LOG("ndkXTS CreateCameraInputWithPositionAndType end.");
    return ret_;
}

CaptureSession_Callbacks *NDKCamera::GetCaptureSessionRegister(int useCaseCode)
{
    static CaptureSession_Callbacks captureSessionCallbacks;
    if (useCaseCode == ALL_CALLBACK_IS_NULL) {
        captureSessionCallbacks = {.onFocusStateChange = nullptr,
                                   .onError = nullptr};
    } else if (useCaseCode == ONLY_ON_ERROR) {
        captureSessionCallbacks = {.onFocusStateChange = nullptr,
                                   .onError = CaptureSessionOnError};
    } else if (useCaseCode == ONLY_ON_FOCUS_STATE_CHANGE) {
        captureSessionCallbacks = {.onFocusStateChange = CaptureSessionOnFocusStateChange,
                                   .onError = nullptr};
    }
    return &captureSessionCallbacks;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallbackOn(int useCaseCode)
{
    ret_ = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister(useCaseCode));
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_RegisterCallback failed.%d", ret_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CaptureSessionUnregisterCallbackOff(int useCaseCode)
{
    ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, GetCaptureSessionRegister(useCaseCode));
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_UnregisterCallback failed.%d", ret_);
    }
    return ret_;
}


Camera_ErrorCode NDKCamera::GetCameraFromCameras(Camera_Device* cameras, Camera_Device** camera,
    size_t cameraIndex)
{
    if (cameras != nullptr) {
        LOG("supported cameras list is not null.");
        if (cameraIndex < this->size_) {
            *camera = &cameras[cameraIndex];
            ret_ = CAMERA_OK;
        } else {
            ret_ = CAMERA_INVALID_ARGUMENT;
            LOG("fail to get valid camera, size is out of supported cameras list range. %d", ret_);
        }
    } else {
        ret_ = CAMERA_INVALID_ARGUMENT;
        LOG("get camera from supported cameras list failed, the list is null. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterCallback(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_RegisterCallback(nullptr, GetCaptureSessionRegister());
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CaptureSessionRegisterCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CaptureSessionUnRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, GetCaptureSessionRegister());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterCallback(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_UnregisterCallback(nullptr, GetCaptureSessionRegister());
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedSceneModes(int useCaseCode)
{
    if (camera_ == nullptr) {
        ret_ = GetCameraFromCameras(cameras_, &camera_);
    }
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, &sceneModes_, &sceneModesSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, &sceneModes_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, nullptr, &sceneModesSize_);
    } else if (useCaseCode == SET_CAMERA_FRONT_FOR_SECURE_PHOTO) {
        ret_ = GetCameraFromCameras(cameras_, &camera_, FRONT_CAMERA);
        ret_ = OH_CameraManager_GetSupportedSceneModes(camera_, &sceneModes_, &sceneModesSize_);
    } else {
        ret_ = OH_CameraManager_GetSupportedSceneModes(nullptr, &sceneModes_, &sceneModesSize_);
    }
    if (ret_ == CAMERA_OK && sceneModesSize_ > 1) {
        isNormalPhoto_ = false;
        isNormalVideo_ = false;
        isSecurePhoto_ = false;
        for (decltype(sceneModesSize_) index = 0; index < sceneModesSize_; index++) {
            switch (sceneModes_[index]) {
                case NORMAL_PHOTO:
                    isNormalPhoto_ = true;
                    break;
                case NORMAL_VIDEO:
                    isNormalVideo_ = true;
                    break;
                case SECURE_PHOTO:
                    isSecurePhoto_ = true;
                    break;
                default: break;
            }
        }
        LOG("isSupported_NORMAL_PHOTO: %d, isSupported_NORMAL_VIDEO: %d, isSupported_NSECURE_PHOTO: %d.",
            isNormalPhoto_, isNormalVideo_, isSecurePhoto_);
    } else {
        ret_ = CAMERA_INVALID_ARGUMENT;
        LOG("ndkXTS OH_CameraManager_GetSupportedSceneModes failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::DeleteSceneModes(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_DeleteSceneModes(cameraManager_, sceneModes_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_DeleteSceneModes(cameraManager_, nullptr);
    } else {
        ret_ = OH_CameraManager_DeleteSceneModes(nullptr, sceneModes_);
    }
    if (sceneModes_ != nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraManager_DeleteSceneModes failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedCameraOutputCapabilityWithSceneMode(int useCaseCode)
{
    if (camera_ == nullptr) {
        ret_ = GetCameraFromCameras(cameras_, &camera_);
    }
    if (useCaseCode == PARAMETER_OK) {
        if (sceneMode_ == SECURE_PHOTO) {
        ret_ = GetCameraFromCameras(cameras_, &camera_, FRONT_CAMERA);
        }
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, camera_, sceneMode_,
        &cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, camera_, sceneMode_,
        nullptr);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, camera_,
            static_cast<Camera_SceneMode>(0), &cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, nullptr, sceneMode_,
        &cameraOutputCapability_);
    } else {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(nullptr, camera_, sceneMode_,
        &cameraOutputCapability_);
    }
    if (cameraOutputCapability_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_UnregisterCallback failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedFullCameraOutputCapabilityWithSceneMode(int useCaseCode)
{
    if (camera_ == nullptr) {
        ret_ = GetCameraFromCameras(cameras_, &camera_);
    }
    if (useCaseCode == PARAMETER_OK) {
        if (sceneMode_ == SECURE_PHOTO) {
            ret_ = GetCameraFromCameras(cameras_, &camera_, FRONT_CAMERA);
        }
        ret_ = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(cameraManager_,
            camera_, sceneMode_, &cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(cameraManager_,
            camera_, sceneMode_, nullptr);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(cameraManager_,
            camera_, static_cast<Camera_SceneMode>(0), &cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(cameraManager_,
            nullptr, sceneMode_, &cameraOutputCapability_);
    } else {
        ret_ = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(nullptr,
            camera_, sceneMode_, &cameraOutputCapability_);
    }
    if (cameraOutputCapability_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_UnregisterCallback failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetSceneMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        sceneMode_ = NORMAL_PHOTO;
    } else if (useCaseCode == PARAMETER1_ERROR) {
        sceneMode_ = NORMAL_VIDEO;
    } else if (useCaseCode == PARAMETER2_ERROR) {
        sceneMode_ = SECURE_PHOTO;
    }
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::SetSessionMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetSessionMode(captureSession_, sceneMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_SetSessionMode(captureSession_, static_cast<Camera_SceneMode>(0));
    } else {
        ret_ = OH_CaptureSession_SetSessionMode(nullptr, sceneMode_);
    }
    if (ret_ == CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_SetSessionMode successful.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddInput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddInput(captureSession_, cameraInput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddInput(captureSession_, cameraInput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddInput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddInput(nullptr, cameraInput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddInput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add input.");
        } else {
            LOG("can not add input.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddPreviewOutput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(captureSession_, previewOutput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(captureSession_, previewOutput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddPreviewOutput(nullptr, previewOutput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddPreviewOutput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add preview output.");
        } else {
            LOG("can not add preview output.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddPhotoOutput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(captureSession_, photoOutput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(captureSession_, photoOutput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddPhotoOutput(nullptr, photoOutput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddPhotoOutput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add photo output.");
        } else {
            LOG("can not add photo output.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CanAddVideoOutput(int useCaseCode)
{
    isAddInput_ = false;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanAddVideoOutput(captureSession_, videoOutput_, &isAddInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanAddVideoOutput(captureSession_, videoOutput_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_CanAddVideoOutput(captureSession_, nullptr, &isAddInput_);
    } else {
        ret_ = OH_CaptureSession_CanAddVideoOutput(nullptr, videoOutput_, &isAddInput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_CanAddVideoOutput failed.%d", ret_);
    } else {
        if (isAddInput_ == true) {
            LOG("can add video output.");
        } else {
            LOG("can not add video output.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::AddSecureOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_AddSecureOutput(captureSession_, previewOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_AddSecureOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_AddSecureOutput(nullptr, previewOutput_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CaptureSession_AddSecureOutput successful.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::OpenSecureCamera(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_OpenSecureCamera(cameraInput_, &secureSeqId_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraInput_OpenSecureCamera(cameraInput_, nullptr);
    } else {
        ret_ = OH_CameraInput_OpenSecureCamera(nullptr, &secureSeqId_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraInput_OpenSecureCamera failed.%d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsPhysicalCameraOrientationVariable(bool* isVariable)
{
    ret_ = OH_CameraInput_IsPhysicalCameraOrientationVariable(cameraInput_, isVariable);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_IsPhysicalCameraOrientationVariable failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetPhysicalCameraOrientation(uint32_t* orientation)
{
    ret_ = OH_CameraInput_GetPhysicalCameraOrientation(cameraInput_, orientation);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_GetPhysicalCameraOrientation failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::UsePhysicalCameraOrientation(bool isUsed)
{
    ret_ = OH_CameraInput_UsePhysicalCameraOrientation(cameraInput_, isUsed);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_UsePhysicalCameraOrientation failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePreviewOutputUsedInPreconfig(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, previewSurfaceId_, &previewOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, previewSurfaceId_, nullptr);
    } else if (useCaseCode == INVALID_SURFACE_ID) {
        const char* abnormalSurfaceId = "0";
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, abnormalSurfaceId, &previewOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, nullptr, &previewOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(nullptr, previewSurfaceId_, &previewOutput_);
    }

    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePhotoOutputUsedInPreconfig(char *photoSurfaceId, int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, photoSurfaceId, &photoOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(cameraManager_, photoSurfaceId, nullptr);
    } else if (useCaseCode == INVALID_SURFACE_ID) {
        const char* abnormalSurfaceId = "0";
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, abnormalSurfaceId, &photoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, nullptr, &photoOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(nullptr, photoSurfaceId, &photoOutput_);
    }

    return ret_;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfig(uint32_t mode, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanPreconfig(captureSession_, preconfigType, &canPreconfig_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_CanPreconfig(captureSession_, preconfigType, nullptr);
    } else {
        ret_ = OH_CaptureSession_CanPreconfig(nullptr, preconfigType, &canPreconfig_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfigWithRatio(uint32_t mode, uint32_t mode2, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    Camera_PreconfigRatio preconfigRatio = static_cast<Camera_PreconfigRatio>(mode2);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CanPreconfigWithRatio(captureSession_, preconfigType, preconfigRatio, &canPreconfig_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CaptureSession_CanPreconfigWithRatio(captureSession_, preconfigType, preconfigRatio, nullptr);
    } else {
        ret_ = OH_CaptureSession_CanPreconfigWithRatio(nullptr, preconfigType, preconfigRatio, &canPreconfig_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionPreconfig(uint32_t mode, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_Preconfig(captureSession_, preconfigType);
    } else {
        ret_ = OH_CaptureSession_Preconfig(nullptr, preconfigType);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionPreconfigWithRatio(uint32_t mode, uint32_t mode2, int useCaseCode)
{
    Camera_PreconfigType preconfigType = static_cast<Camera_PreconfigType>(mode);
    Camera_PreconfigRatio preconfigRatio = static_cast<Camera_PreconfigRatio>(mode2);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_PreconfigWithRatio(captureSession_, preconfigType, preconfigRatio);
    } else {
        ret_ = OH_CaptureSession_PreconfigWithRatio(nullptr, preconfigType, preconfigRatio);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreateVideoOutputUsedInPreconfig(char *videoId, int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, videoId, &videoOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, videoId, nullptr);
    } else if (useCaseCode == INVALID_SURFACE_ID) {
        const char* abnormalVideoId = "0";
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, abnormalVideoId, &videoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, nullptr, &videoOutput_);
    } else {
        ret_ = OH_CameraManager_CreateVideoOutputUsedInPreconfig(nullptr,  videoId, &videoOutput_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::VideoOutputGetActiveProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_GetActiveProfile(videoOutput_, &videoActiveProfile_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetActiveProfile(videoOutput_, nullptr);
    } else {
        ret_ = OH_VideoOutput_GetActiveProfile(nullptr, &videoActiveProfile_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::VideoOutputDeleteProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_DeleteProfile(videoActiveProfile_);
    } else {
        ret_ = OH_VideoOutput_DeleteProfile(nullptr);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PreviewOutputGetActiveProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_GetActiveProfile(previewOutput_, &cameraProfile_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_GetActiveProfile(previewOutput_, nullptr);
    } else {
        ret_ = OH_PreviewOutput_GetActiveProfile(nullptr, &cameraProfile_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PreviewOutputDeleteProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_DeleteProfile(cameraProfile_);
    } else {
        ret_ = OH_PreviewOutput_DeleteProfile(nullptr);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoOutputGetActiveProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_GetActiveProfile(photoOutput_, &cameraProfile_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_GetActiveProfile(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_GetActiveProfile(nullptr, &cameraProfile_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoOutputDeleteProfile(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_DeleteProfile(cameraProfile_);
    } else {
        ret_ = OH_PhotoOutput_DeleteProfile(nullptr);
    }
    return ret_;
}

void PhotoOutputOnPhotoAvailable(Camera_PhotoOutput* photoOutput, OH_PhotoNative* photo)
{
    NDKCamera::g_photoNative = photo;
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_PHOTO_AVAILABLE;
    LOG("PhotoOutputOnPhotoAvailable is called.");
}

Camera_ErrorCode NDKCamera::RegisterPhotoAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterPhotoAvailableCallback(photoOutput_, PhotoOutputOnPhotoAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterPhotoAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_RegisterPhotoAvailableCallback(nullptr, PhotoOutputOnPhotoAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterPhotoAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::UnregisterPhotoAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAvailableCallback(photoOutput_, PhotoOutputOnPhotoAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_UnregisterPhotoAvailableCallback(nullptr, PhotoOutputOnPhotoAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterPhotoAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

void PhotoOutputOnPhotoAssetAvailable(Camera_PhotoOutput* photoOutput, OH_MediaAsset* photoAsset)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_PHOTO_ASSET_AVAILABLE;
    LOG("PhotoOutputOnPhotoAssetAvailable is called.");
}

Camera_ErrorCode NDKCamera::RegisterPhotoAssetAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput_, PhotoOutputOnPhotoAssetAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(nullptr, PhotoOutputOnPhotoAssetAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterPhotoAssetAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::UnregisterPhotoAssetAvailableCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback(photoOutput_, PhotoOutputOnPhotoAssetAvailable);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback(nullptr, PhotoOutputOnPhotoAssetAvailable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterPhotoAssetAvailableCallback failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsMovingPhotoSupported(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_IsMovingPhotoSupported(photoOutput_, &isMovingPhotoSupported_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_IsMovingPhotoSupported(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_IsMovingPhotoSupported(nullptr, &isMovingPhotoSupported_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_IsMovingPhotoSupported failed. %d", ret_);
    } else {
        if (isMovingPhotoSupported_ != true) {
            LOG("moving photo is not supported.");
        } else {
            LOG("moving photo is supported.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::EnableMovingPhoto(int useCaseCode, bool enable)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_EnableMovingPhoto(photoOutput_, enable);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_EnableMovingPhoto(nullptr, enable);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_EnableMovingPhoto failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsPhotoQualityPrioritizationSupported(int useCaseCode, int quality)
{
    Camera_PhotoQualityPrioritization qualityPrioritization = static_cast<Camera_PhotoQualityPrioritization>(quality);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_IsPhotoQualityPrioritizationSupported(photoOutput_, qualityPrioritization,
            &isPhotoQualityPrioritizationSupported_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_IsPhotoQualityPrioritizationSupported(nullptr, qualityPrioritization,
            &isPhotoQualityPrioritizationSupported_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_IsPhotoQualityPrioritizationSupported(photoOutput_, qualityPrioritization,
            &isPhotoQualityPrioritizationSupported_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_PhotoOutput_IsPhotoQualityPrioritizationSupported(photoOutput_, qualityPrioritization, nullptr);
    }

    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_IsPhotoQualityPrioritizationSupported failed. %d", ret_);
    } else {
        if (isMovingPhotoSupported_ != true) {
            LOG("PhotoQualityPrioritization is not supported.");
        } else {
            LOG("PhotoQualityPrioritization is supported.");
        }
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetPhotoQualityPrioritization(int useCaseCode, int quality)
{
    Camera_PhotoQualityPrioritization qualityPrioritization = static_cast<Camera_PhotoQualityPrioritization>(quality);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_SetPhotoQualityPrioritization(photoOutput_, qualityPrioritization);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_SetPhotoQualityPrioritization(nullptr, qualityPrioritization);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_SetPhotoQualityPrioritization(photoOutput_, qualityPrioritization);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_SetPhotoQualityPrioritization failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetMainImage(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoNative_GetMainImage(photoNative_, &mainImage_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoNative_GetMainImage(photoNative_, nullptr);
    } else {
        ret_ = OH_PhotoNative_GetMainImage(nullptr, &mainImage_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoNative_GetMainImage failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetUncompressedImage(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoNative_GetUncompressedImage(g_photoNative, &pictureNative_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoNative_GetUncompressedImage(g_photoNative, nullptr);
    } else {
        ret_ = OH_PhotoNative_GetUncompressedImage(nullptr, &pictureNative_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoNative_GetUncompressedImage failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoNativeRelease(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoNative_Release(photoNative_);
        ret_ = OH_PhotoNative_Release(g_photoNative);
    } else {
        ret_ = OH_PhotoNative_Release(nullptr);
    }
    if (ret_ != CAMERA_OK || !photoNative_) {
        LOG("OH_PhotoNative_Release failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePhotoOutputWithoutSurface(int useCaseCode)
{
    for (decltype(cameraOutputCapability_->photoProfilesSize) i = 0;
            i< cameraOutputCapability_->photoProfilesSize; i++) {
        if (cameraOutputCapability_->photoProfiles[i]->size.width == PhotoOutputWithoutSurface.size.width &&
            cameraOutputCapability_->photoProfiles[i]->size.height == PhotoOutputWithoutSurface.size.height &&
            cameraOutputCapability_->photoProfiles[i]->format == PhotoOutputWithoutSurface.format) {
            photoProfile_ = cameraOutputCapability_->photoProfiles[i];
            break;
        }
    }
    if (!photoProfile_) {
        photoProfile_ = cameraOutputCapability_->photoProfiles[0];
    }
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, photoProfile_, &photoOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, photoProfile_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, nullptr, &photoOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(nullptr, photoProfile_, &photoOutput_);
    }
    if (ret_ != CAMERA_OK || !photoOutput_) {
        ret_ = CAMERA_INVALID_ARGUMENT;
        LOG("OH_CameraManager_CreatePhotoOutputWithoutSurface failed. %d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreateYuvPhotoOutputWithoutSurface(int useCaseCode)
{
    for (decltype(cameraOutputCapability_->photoProfilesSize) i = 0;
            i < cameraOutputCapability_->photoProfilesSize; i++) {
        if (cameraOutputCapability_->photoProfiles[i]->format == YUV_PHOTO_PROFILE.format) {
            photoProfile_ = cameraOutputCapability_->photoProfiles[i];
            break;
        }
    }
    if (!photoProfile_) {
        LOG("photoProfile_ is not yuv");
        photoProfile_ = cameraOutputCapability_->photoProfiles[0];
    }
    LOG("createYuvPhotoOutputWithoutSurface photoProfile width=%u, height=%u, format=%d",
        photoProfile_->size.width, photoProfile_->size.height, photoProfile_->format);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, photoProfile_, &photoOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, photoProfile_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, nullptr, &photoOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePhotoOutputWithoutSurface(nullptr, photoProfile_, &photoOutput_);
    }
    if (ret_ != CAMERA_OK || !photoOutput_) {
        ret_ = CAMERA_INVALID_ARGUMENT;
        LOG("createYuvPhotoOutputWithoutSurface failed. %d", ret_);
    }
    ret_ = OH_PhotoOutput_RegisterPhotoAvailableCallback(photoOutput_, PhotoOutputOnPhotoAvailable);
    return ret_;
}

Camera_ErrorCode NDKCamera::IsTorchSupported(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_IsTorchSupported(cameraManager_, &isTorchSupported_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupported(nullptr, &isTorchSupported_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupported(cameraManager_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_IsTorchSupported failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::TorchMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        torchMode_ = OFF;
    } else if (useCaseCode == PARAMETER1_ERROR) {
        torchMode_ = ON;
    } else if (useCaseCode == PARAMETER2_ERROR) {
        torchMode_ = AUTO;
    } else if (useCaseCode == TORCH_MODE_OFF) {
        torchMode_ = CAMERA_TORCH_MODE_OFF;
    } else if (useCaseCode == TORCH_MODE_ON) {
        torchMode_ = CAMERA_TORCH_MODE_ON;
    } else if (useCaseCode == TORCH_MODE_AUTO) {
        torchMode_ = CAMERA_TORCH_MODE_AUTO;
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_IsTorchSupported failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::IsTorchSupportedByTorchMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(cameraManager_, torchMode_, &isTorchSupportedByTorchMode_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(nullptr, torchMode_, &isTorchSupportedByTorchMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(cameraManager_, static_cast<Camera_TorchMode>(-1),
            &isTorchSupported_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_IsTorchSupportedByTorchMode(cameraManager_, torchMode_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_IsTorchSupportedByTorchMode failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetTorchMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_SetTorchMode(cameraManager_, torchMode_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_SetTorchMode(nullptr, torchMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_SetTorchMode(cameraManager_, static_cast<Camera_TorchMode>(-1));
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_SetTorchMode failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetExposureValue(int useCaseCode)
{
    float exposureValue;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetExposureValue(captureSession_, &exposureValue);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetExposureValue(nullptr, &exposureValue);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetExposureValue(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetExposureValue failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetFocalLength(int useCaseCode)
{
    float focalLength = 0;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetFocalLength(captureSession_, &focalLength);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetFocalLength(nullptr, &focalLength);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetFocalLength(captureSession_, nullptr);
    }
    if (focalLength == 0 || ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetFocalLength failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetSmoothZoom(int useCaseCode)
{
    float targetZoom = TARGET_ZOOM;
    Camera_SmoothZoomMode smoothZoomMode = NORMAL;
    Camera_SmoothZoomMode cameraSmoothZoomMode = CAMERA_SMOOTH_ZOOM_MODE_NORMAL;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetSmoothZoom(captureSession_, targetZoom, smoothZoomMode);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_SetSmoothZoom(nullptr, targetZoom, smoothZoomMode);
    } else if (useCaseCode == SMOOTH_ZOOM_MODE_NORMAL) {
        ret_ = OH_CaptureSession_SetSmoothZoom(captureSession_, targetZoom, cameraSmoothZoomMode);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_SetSmoothZoom failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedColorSpaces(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, &colorSpace_, &colorSpacesSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(nullptr, &colorSpace_, &colorSpacesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, nullptr, &colorSpacesSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, &colorSpace_, nullptr);
    }
    if (colorSpace_ == nullptr || colorSpacesSize_ == 0 || ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetSupportedColorSpaces failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::DeleteColorSpaces(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_DeleteColorSpaces(captureSession_, colorSpace_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_DeleteColorSpaces(nullptr, colorSpace_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_DeleteColorSpaces(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_DeleteColorSpaces failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::GetActiveColorSpace(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetActiveColorSpace(captureSession_, &activeColorSpace_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_GetActiveColorSpace(nullptr, &activeColorSpace_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetActiveColorSpace(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_GetActiveColorSpace failed.");
    }
    return ret_;
}
int32_t NDKCamera::ColorSpace(void)
{
    int32_t nativeColorSpaceSize = sizeof(oHNativeBufferColorSpace)/sizeof(oHNativeBufferColorSpace[0]);
    bool flag = false;
    ret_ = OH_CaptureSession_GetSupportedColorSpaces(captureSession_, &colorSpace_, &colorSpacesSize_);
    if (colorSpacesSize_ == 0) {
        setcolorSpace_ = oHNativeBufferColorSpace[SET_OH_COLORSPACE_SRGB_FULL];
        return COLOR_SPACE_NOT_SUPPORTED;
    }
    for (uint32_t nativeIndex = 0; nativeIndex < nativeColorSpaceSize; nativeIndex++) {
        flag = false;
        for (int32_t supportedIndex = 0; supportedIndex < colorSpacesSize_; supportedIndex++) {
            if (oHNativeBufferColorSpace[nativeIndex] == colorSpace_[supportedIndex]) {
                flag = true;
                break;
            }
        }
        if (!flag) {
            setcolorSpace_ = oHNativeBufferColorSpace[nativeIndex];
            return COLOR_SPACE_NOT_SUPPORTED;
        }
    }
    return colorSpacesSize_;
}
Camera_ErrorCode NDKCamera::SetColorSpace(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(captureSession_, activeColorSpace_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(nullptr, activeColorSpace_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(captureSession_, static_cast<OH_NativeBuffer_ColorSpace>(-1));
    } else if (useCaseCode == COLOR_SPACE_NOT_SUPPORTED_MODE) {
        ret_ = OH_CaptureSession_SetActiveColorSpace(captureSession_, setcolorSpace_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_SetActiveColorSpace failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::GetSupportedFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(previewOutput_, &frameRateRange_, &frameRatesSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(nullptr, &frameRateRange_, &frameRatesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(previewOutput_, nullptr, &frameRatesSize_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_PreviewOutput_GetSupportedFrameRates(previewOutput_, &frameRateRange_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_GetSupportedFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::DeleteFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_DeleteFrameRates(previewOutput_, frameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_DeleteFrameRates(nullptr, frameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_DeleteFrameRates(previewOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_DeleteFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SetFrameRate(int useCaseCode)
{
    int32_t minFps = activeFrameRateRange_.min;
    int32_t maxFps = activeFrameRateRange_.max;
    bool flag = false;
    for (uint32_t i = 0; i < frameRatesSize_; i++) {
        if (frameRateRange_[i].min != activeFrameRateRange_.min ||
            frameRateRange_[i].max != activeFrameRateRange_.max) {
            minFps = frameRateRange_[i].min;
            maxFps = frameRateRange_[i].max;
            flag = true;
            break;
        }
    }
    if (!flag) {
        if (maxFps > minFps) {
            minFps++;
        }
    }
    if (useCaseCode == PARAMETER_OK) {
        if (maxFps <= minFps + INVALID_MIN_FPS) {
            return CAMERA_OK;
        }
        ret_ = OH_PreviewOutput_SetFrameRate(previewOutput_, minFps, maxFps);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_SetFrameRate(nullptr, minFps, maxFps);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_SetFrameRate(previewOutput_, INVALID_MIN_FPS, maxFps + INVALID_MAX_FPS);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_DeleteFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::GetActiveFrameRate(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_GetActiveFrameRate(previewOutput_, &activeFrameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PreviewOutput_GetActiveFrameRate(nullptr, &activeFrameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_GetActiveFrameRate(previewOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PreviewOutput_GetActiveFrameRate failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputGetSupportedFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(videoOutput_, &videoFrameRateRange_, &videoFrameRatesSize_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(nullptr, &videoFrameRateRange_, &videoFrameRatesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(videoOutput_, nullptr, &videoFrameRatesSize_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetSupportedFrameRates(videoOutput_, &videoFrameRateRange_, nullptr);
    }
    if (videoFrameRatesSize_ == 0 || ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_GetSupportedFrameRates failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputGetActiveFrameRate(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_GetActiveFrameRate(videoOutput_, &videoActiveFrameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_GetActiveFrameRate(nullptr, &videoActiveFrameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_GetActiveFrameRate(videoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_GetActiveFrameRate failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputSetFrameRate(int useCaseCode)
{
    uint32_t minFps = videoActiveFrameRateRange_.min;
    uint32_t maxFps = videoActiveFrameRateRange_.max;
    bool flag = false;
    for (uint32_t i = 0; i < videoFrameRatesSize_; i++) {
        if (videoFrameRateRange_[i].min != videoActiveFrameRateRange_.min ||
            videoFrameRateRange_[i].max != videoActiveFrameRateRange_.max) {
            minFps = videoFrameRateRange_[i].min;
            maxFps = videoFrameRateRange_[i].max;
            flag = true;
            break;
        }
    }
    if (!flag) {
        if (maxFps > minFps) {
            minFps++;
        }
    }
    if (useCaseCode == PARAMETER_OK) {
        if (maxFps <= minFps + INVALID_MIN_FPS) {
            return CAMERA_OK;
        }
        ret_ = OH_VideoOutput_SetFrameRate(videoOutput_, minFps, maxFps);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_SetFrameRate(nullptr, minFps, maxFps);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_SetFrameRate(videoOutput_, INVALID_MIN_FPS, maxFps + INVALID_MAX_FPS);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_SetFrameRate failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputDeleteFrameRates(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_DeleteFrameRates(videoOutput_, videoFrameRateRange_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_VideoOutput_DeleteFrameRates(nullptr, videoFrameRateRange_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_DeleteFrameRates(videoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_VideoOutput_DeleteFrameRates failed.");
    }
    return ret_;
}
void CameraManagerTorchStatusCallback(Camera_Manager *cameraManager, Camera_TorchStatusInfo *status)
{
    LOG("CameraManagerTorchStatusCallback");
}
Camera_ErrorCode NDKCamera::CameraManagerRegisterTorchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_RegisterTorchStatusCallback(cameraManager_, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_RegisterTorchStatusCallback(nullptr, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_RegisterTorchStatusCallback(cameraManager_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_RegisterTorchStatusCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CameraManagerUnregisterTorchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_UnregisterTorchStatusCallback(cameraManager_, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_UnregisterTorchStatusCallback(nullptr, CameraManagerTorchStatusCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_UnregisterTorchStatusCallback(cameraManager_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraManager_UnregisterTorchStatusCallback failed.");
    }
    return ret_;
}
void CaptureSessionSmoothZoomInfoCallback(Camera_CaptureSession *session, Camera_SmoothZoomInfo *smoothZoomInfo)
{
    LOG("CaptureSessionSmoothZoomInfoCallback");
}
Camera_ErrorCode NDKCamera::CaptureSessionRegisterSmoothZoomInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterSmoothZoomInfoCallback(captureSession_, CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_RegisterSmoothZoomInfoCallback(nullptr, CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterSmoothZoomInfoCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterSmoothZoomInfoCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CaptureSessionUnregisterSmoothZoomInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterSmoothZoomInfoCallback(captureSession_,
            CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_UnregisterSmoothZoomInfoCallback(nullptr, CaptureSessionSmoothZoomInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterSmoothZoomInfoCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterSmoothZoomInfoCallback failed.");
    }
    return ret_;
}
void PhotoOutputCaptureStartWithInfoCallback(Camera_PhotoOutput* photoOutput, Camera_CaptureStartInfo* Info)
{
    LOG("PhotoOutputCaptureStartWithInfoCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureStartWithInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(photoOutput_,
            PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(nullptr, PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureStartWithInfoCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterCaptureStartWithInfoCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterCaptureStartWithInfoCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback(photoOutput_,
            PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback(nullptr, PhotoOutputCaptureStartWithInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterCaptureStartWithInfoCallback failed.");
    }
    return ret_;
}
void PhotoOutputCaptureEndCallback(Camera_PhotoOutput* photoOutput, int32_t frameCount)
{
    LOG("PhotoOutputCaptureEndCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterCaptureEndCallback(photoOutput_, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureEndCallback(nullptr, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterCaptureEndCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterCaptureEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterCaptureEndCallback(photoOutput_, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureEndCallback(nullptr, PhotoOutputCaptureEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("CaptureSessionUnregisterSmoothZoomInfoCallback failed.");
    }
    return ret_;
}
void PhotoOutputFrameShutterEndCallback(Camera_PhotoOutput* photoOutput, Camera_FrameShutterInfo* Info)
{
    LOG("PhotoOutputFrameShutterEndCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterFrameShutterEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterFrameShutterEndCallback(photoOutput_, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterFrameShutterEndCallback(nullptr, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterFrameShutterEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterFrameShutterEndCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterFrameShutterEndCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterFrameShutterEndCallback(photoOutput_, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterFrameShutterEndCallback(nullptr, PhotoOutputFrameShutterEndCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterFrameShutterEndCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterFrameShutterEndCallback failed.");
    }
    return ret_;
}
void PhotoOutputCaptureReadyCallback(Camera_PhotoOutput* photoOutput)
{
    LOG("PhotoOutputCaptureReadyCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureReadyCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterCaptureReadyCallback(photoOutput_, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureReadyCallback(nullptr, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCaptureReadyCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterCaptureReadyCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterCaptureReadyCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterCaptureReadyCallback(photoOutput_, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureReadyCallback(nullptr, PhotoOutputCaptureReadyCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCaptureReadyCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterCaptureReadyCallback failed.");
    }
    return ret_;
}
void PhotoOutputEstimatedCaptureDurationCallback(Camera_PhotoOutput* photoOutput, int64_t duration)
{
    LOG("PhotoOutputEstimatedCaptureDurationCallback");
}
Camera_ErrorCode NDKCamera::PhotoOutputRegisterEstimatedCaptureDurationCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback(photoOutput_,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback(nullptr,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_RegisterEstimatedCaptureDurationCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnregisterEstimatedCaptureDurationCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback(photoOutput_,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback(nullptr,
            PhotoOutputEstimatedCaptureDurationCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback(photoOutput_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::ReadyCreatePhotoOutputWithoutSurface()
{
    isCreatePhotoOutputWithoutSurface_ = true;
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::IsAutoDeviceSwitchSupported(bool* isSupported)
{
    ret_ = OH_CaptureSession_IsAutoDeviceSwitchSupported(captureSession_, isSupported);
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_IsAutoDeviceSwitchSupported failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::EnableAutoDeviceSwitch(bool isEnable)
{
    ret_ = OH_CaptureSession_EnableAutoDeviceSwitch(captureSession_, isEnable);
    if (ret_ != CAMERA_OK) {
        LOG("OH_PhotoOutput_UnregisterEstimatedCaptureDurationCallback failed.");
    }
    return ret_;
}
 
void CameraAutoDeviceSwitchStatusInfoCallback(Camera_CaptureSession* session,
    Camera_AutoDeviceSwitchStatusInfo* autoDeviceSwitchStatusInfo)
{
    LOG("CameraAutoDeviceSwitchStatusInfoCallback is called.");
}
Camera_ErrorCode NDKCamera::RegisterAutoDeviceSwitchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(captureSession_,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(nullptr,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterAutoDeviceSwitchStatusCallback failed.");
    }
    return ret_;
}
 
Camera_ErrorCode NDKCamera::UnegisterAutoDeviceSwitchStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(captureSession_,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(nullptr,
            CameraAutoDeviceSwitchStatusInfoCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterAutoDeviceSwitchStatusCallback failed.");
    }
    return ret_;
}
 
void CameraSystemPressureLevelCallback(Camera_CaptureSession* session,
    Camera_SystemPressureLevel systemPressureLevel)
{
    LOG("CameraSystemPressureLevelCallback is called.");
}
 
Camera_ErrorCode NDKCamera::RegisterSystemPressureLevel(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession_,
            CameraSystemPressureLevelCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(nullptr,
            CameraSystemPressureLevelCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_RegisterSystemPressureLevelChangeCallback failed.");
    }
    return ret_;
}
 
Camera_ErrorCode NDKCamera::UnregisterSystemPressureLevel(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession_,
            CameraSystemPressureLevelCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(nullptr,
            CameraSystemPressureLevelCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback failed.");
    }
    return ret_;
}

void CameraFoldStatusInfoCallback(Camera_Manager *cameraManager, Camera_FoldStatusInfo *foldStatusInfo)
{
    LOG("CameraFoldStatusInfoCallback is called.");
}
 
Camera_ErrorCode NDKCamera::CameraManagerRegisterFoldStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_RegisterFoldStatusInfoCallback(cameraManager_, CameraFoldStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_RegisterFoldStatusInfoCallback(nullptr, CameraFoldStatusInfoCallback);
    } else {
        ret_ = OH_CameraManager_RegisterFoldStatusInfoCallback(cameraManager_, nullptr);
    }
    return ret_;
}
 
Camera_ErrorCode NDKCamera::CameraManagerUnregisterFoldStatusCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_UnregisterFoldStatusInfoCallback(cameraManager_, CameraFoldStatusInfoCallback);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_UnregisterFoldStatusInfoCallback(nullptr, CameraFoldStatusInfoCallback);
    } else {
        ret_ = OH_CameraManager_UnregisterFoldStatusInfoCallback(cameraManager_, nullptr);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraDevice(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        Camera_Device* cameraArray;
        OH_CameraManager_GetSupportedCameras(cameraManager_, &cameraArray, &size_);
        LOG("camera getSupportedCameras success : %d", size_);
        if (size_ == 0) {
            return CAMERA_OK;
        }
        Camera_Device* cameranow = nullptr;
        if (cameraManager_ == nullptr) {
            return ret_;
        }
        ret_ = OH_CameraManager_GetCameraDevice(cameraManager_,
            cameraArray[0].cameraPosition, cameraArray[0].cameraType, cameranow);
    }
    return ret_;
}
 
Camera_ErrorCode NDKCamera::GetCameraConcurrentInfos(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        Camera_Device* cameraArray;
        OH_CameraManager_GetSupportedCameras(cameraManager_, &cameraArray, &size_);
        uint32_t deviceSize = 2;
        if (size_ < deviceSize || cameraManager_ == nullptr) {
            delete[] cameraArray;
            cameraArray = nullptr;
            GetSupportedCameras();
            return ret_;
        }
        uint32_t infoSize = 0;
        Camera_ConcurrentInfo* cameraConcurrentInfo;
        int retcode = OH_CameraManager_GetCameraDevice(cameraManager_,
            Camera_Position::CAMERA_POSITION_BACK, Camera_Type::CAMERA_TYPE_DEFAULT, &cameraArray[0]);
        if (retcode != CAMERA_OK || cameraArray[0].cameraId == nullptr) {
            delete[] cameraArray;
            cameraArray = nullptr;
            GetSupportedCameras();
            return ret_;
        }
        retcode = OH_CameraManager_GetCameraDevice(cameraManager_,
            Camera_Position::CAMERA_POSITION_FRONT, Camera_Type::CAMERA_TYPE_DEFAULT, &cameraArray[1]);
        if (retcode != CAMERA_OK || cameraArray[1].cameraId == nullptr) {
            delete[] cameraArray;
            cameraArray = nullptr;
            GetSupportedCameras();
            return ret_;
        }
        retcode = OH_CameraManager_GetCameraConcurrentInfos(cameraManager_,
            cameraArray, deviceSize, &cameraConcurrentInfo, &infoSize);
        if (retcode != CAMERA_OK || cameraConcurrentInfo == nullptr) {
            delete[] cameraArray;
            cameraArray = nullptr;
            GetSupportedCameras();
            return ret_;
        }
        Camera_Input* cameraInputnow;
        retcode = OH_CameraManager_CreateCameraInput(cameraManager_, &cameraArray[0], &cameraInputnow);
        if (retcode == CAMERA_OK && cameraInputnow != nullptr) {
            ret_ = OH_CameraInput_OpenConcurrentCameras(cameraInputnow,
                Camera_ConcurrentType::CAMERA_CONCURRENT_TYPE_LIMITED_CAPABILITY);
        }
        OH_CameraInput_Close(cameraInputnow);
        OH_CameraInput_Release(cameraInputnow);
        delete[] cameraArray;
        cameraArray = nullptr;
    }
    GetSupportedCameras();
    CreateCameraInput();
    return ret_;
}

Camera_ErrorCode NDKCamera::GetCameraDevices(int useCaseCode)
{
    cameraDevices_ = nullptr;
    cameraSize_ = 0;
    OH_CameraManager_GetSupportedCameras(cameraManager_, &cameraDevices_, &cameraSize_);
    if (isDeviceQueryInfoInvalid_) {
        deviceQueryInfo_ = new Camera_DeviceQueryInfo;
        deviceQueryInfo_->cameraPosition = CAMERA_POSITION_UNSPECIFIED;
        deviceQueryInfo_->connectionType = CAMERA_CONNECTION_BUILT_IN;
        deviceQueryInfo_->cameraTypeSize = 0;
        Camera_Type* types = new Camera_Type[1];
        types[0] = CAMERA_TYPE_DEFAULT;
        deviceQueryInfo_->cameraType = types;
    } else {
        deviceQueryInfo_ = new Camera_DeviceQueryInfo;
        deviceQueryInfo_->cameraPosition = cameraDevices_[0].cameraPosition;
        deviceQueryInfo_->connectionType = cameraDevices_[0].connectionType;
        deviceQueryInfo_->cameraTypeSize = 1;
        Camera_Type* types = new Camera_Type[1];
        types[0] = cameraDevices_[0].cameraType;
        deviceQueryInfo_->cameraType = types;
    }
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_GetCameraDevices(cameraManager_, deviceQueryInfo_, &cameraSize_, &cameraDevices_);
        if (ret_ == CAMERA_OK) {
            LOG("camera getCameraDevices success");
        }
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_GetCameraDevices(nullptr, deviceQueryInfo_, &cameraSize_, &cameraDevices_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_GetCameraDevices(cameraManager_, nullptr, &cameraSize_, &cameraDevices_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetCameraDevices(cameraManager_, deviceQueryInfo_, nullptr, &cameraDevices_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_GetCameraDevices(cameraManager_, deviceQueryInfo_, &cameraSize_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraManager_GetCameraDevices failed : %{public}d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::DeleteCameraDevices(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_DeleteCameraDevices(cameraManager_, cameraDevices_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_DeleteCameraDevices(nullptr, cameraDevices_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_DeleteCameraDevices(cameraManager_, nullptr);
    }
    if (cameras_ != nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS OH_CameraManager_DeleteCameraDevices failed : %{public}d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SetInvalidDeviceQueryInfo(bool isDeviceQueryInfoInvalid)
{
    isDeviceQueryInfoInvalid_ = isDeviceQueryInfoInvalid;
    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::SessionIsMacroSupported(int useCaseCode)
{
    LOG("isMacroSupported begin.");
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_IsMacroSupported(captureSession_, &isMacroSupported_);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_IsMacroSupported(captureSession_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_IsMacroSupported(nullptr, &isMacroSupported_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionEnableMacro(int useCaseCode, bool isEnable)
{
    LOG("EnableMacro begin.");
    if (useCaseCode == PARAMETER_OK){
        ret_ = OH_CaptureSession_EnableMacro(captureSession_, isEnable);
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CaptureSession_EnableMacro(nullptr, isEnable);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::WhiteBalanceTest(void)
{
    LOG("WhiteBalanceTest begin.");
    bool flag;
    ret_ = OH_CaptureSession_IsWhiteBalanceModeSupported(
        captureSession_, Camera_WhiteBalanceMode::CAMERA_WHITE_BALANCE_MODE_CLOUDY, &flag);
    int32_t max = 0;
    int32_t min = 0;
    ret_ = OH_CaptureSession_GetWhiteBalanceRange(captureSession_, &min, &max);
    int32_t temp = 3000;
    ret_ = OH_CaptureSession_SetWhiteBalance(captureSession_, temp);
    ret_ = OH_CaptureSession_GetWhiteBalance(captureSession_, &temp);
    ret_ = OH_CaptureSession_SetWhiteBalanceMode(
        captureSession_, Camera_WhiteBalanceMode::CAMERA_WHITE_BALANCE_MODE_CLOUDY);
    Camera_WhiteBalanceMode mode = Camera_WhiteBalanceMode::CAMERA_WHITE_BALANCE_MODE_AUTO;
    ret_ = OH_CaptureSession_GetWhiteBalanceMode(captureSession_, &mode);
    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePreviewOutputByIndex(int index)
{
    profile_ = cameraOutputCapability_->previewProfiles[index];
    if (profile_ == nullptr) {
        LOG("ndkXTS Get previewProfiles failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraManager_CreatePreviewOutput(cameraManager_, profile_, previewSurfaceId_, &previewOutput_);
    if (previewSurfaceId_ == nullptr || previewOutput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreatePreviewOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    PreviewOutputRegisterCallback();
    return ret_;
}

Camera_ErrorCode NDKCamera::CreateVideoOutputByIndex(char* videoId, int index)
{
    LOG("ndkXTS CreateVideoOutput start.");
    videoProfile_ = cameraOutputCapability_->videoProfiles[index];
    LOG("ndkXTS CreateVideoOutput videoProfiles start.");
    if (videoProfile_ == nullptr) {
        LOG("ndkXTS Get videoProfiles failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    ret_ = OH_CameraManager_CreateVideoOutput(cameraManager_, videoProfile_, videoId, &videoOutput_);
    if (videoId == nullptr || videoOutput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("ndkXTS CreateVideoOutput failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret_;
}

void OnMacroStatusChange(Camera_CaptureSession* session, bool isMacroActive)
{
    LOG("OnMacroStatusChange MacroStatus ENTER");
}

Camera_ErrorCode NDKCamera::MacroStatusChangeTest(void)
{
    LOG("MacroStatusChangeTest begin.");
    bool flag;
    ret_ = OH_CaptureSession_RegisterMacroStatusChangeCallback(
        captureSession_, OnMacroStatusChange);
    ret_ = OH_CaptureSession_UnregisterMacroStatusChangeCallback(
        captureSession_, OnMacroStatusChange);
    return ret_;
}

void OnIsoInfoChange(Camera_CaptureSession* session, int32_t isoValue)
{
    LOG("OnIsoInfoChange IsoInfo ENTER");
}

Camera_ErrorCode NDKCamera::IsoInfoChangeTest(void)
{
    LOG("IsoInfoChangeTest begin.");
    ret_ = OH_CaptureSession_RegisterIsoChangeCallback(
        captureSession_, OnIsoInfoChange);
    ret_ = OH_CaptureSession_UnregisterIsoChangeCallback(
        captureSession_, OnIsoInfoChange);
    return ret_;
}