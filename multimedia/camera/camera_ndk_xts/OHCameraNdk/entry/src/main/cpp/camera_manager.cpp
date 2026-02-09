/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include "camera_manager.h"
#include <thread>

CameraCallbackCode NDKCamera::cameraCallbackCode_ = NO_RECEIVED;
volatile bool g_isCaptureReady = false;
void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    NDKCamera::cameraCallbackCode_ = CAMERA_MANAGER_STATUS;
    LOG("状态码回调%{public}d", status);
}

CameraManager_Callbacks *NDKCamera::GetCameraManagerListener(void)
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}
void PreviewOutputOnFrameStart(Camera_PreviewOutput *previewOutput)
{
    NDKCamera::cameraCallbackCode_ = PREVIEW_ON_FRAME_START;
    LOG("PreviewOutputOnFrameStart");
}

void PreviewOutputOnFrameEnd(Camera_PreviewOutput *previewOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = PREVIEW_ON_FRAME_END;
    LOG("PreviewOutput frameCount = %d", frameCount);
}

void PreviewOutputOnError(Camera_PreviewOutput *previewOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = PREVIEW_ON_ERROR;
    LOG("PreviewOutput errorCode = %d", errorCode);
}
PreviewOutput_Callbacks *NDKCamera::GetPreviewOutputListener(void)
{
    static PreviewOutput_Callbacks previewOutputListener = {.onFrameStart = PreviewOutputOnFrameStart,
                                                            .onFrameEnd = PreviewOutputOnFrameEnd,
                                                            .onError = PreviewOutputOnError};
    return &previewOutputListener;
}
NDKCamera::NDKCamera(char *str, int index)
    : cameras_(nullptr), cameraOutputCapability_(nullptr), captureSession_(nullptr), size_(0), profile_(nullptr),
      previewOutput_(nullptr), photoOutput_(nullptr), videoOutput_(nullptr), metaDataObjectType_(nullptr),
      metadataOutput_(nullptr), cameraInput_(nullptr), isCameraMuted_(nullptr), previewSurfaceId_(str),
      ret_(CAMERA_OK) {
    valid_ = false;
    // 创建CameraManager实例。
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager_);
    if (cameraManager_ == nullptr || ret != CAMERA_OK) {
        LOG("创建CameraManager实例 失败. %{public}d", ret);
    }
    CameraManagerRegisterCallback(index);
    valid_ = true;
}
NDKCamera::~NDKCamera()
{
    valid_ = false;

    Camera_ErrorCode ret = OH_CaptureSession_Release(captureSession_);
    if (ret != CAMERA_OK) {
        LOG("释放捕获会话 失败. %{public}d", ret);
    }

    if (cameraManager_) {
        ret = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
        if (ret != CAMERA_OK) {
            LOG("删除支持的相机成功. %{public}d", ret);
        } else {
            LOG("删除支持的相机失败. %{public}d", ret);
        }

        ret = OH_CameraManager_DeleteSupportedCameraOutputCapability(cameraManager_, cameraOutputCapability_);
        if (ret != CAMERA_OK) {
            LOG("删除支持的输出功能成功. %{public}d", ret);
        } else {
            LOG("删除支持的输出功能失败. %{public}d", ret);
        }

        ret = OH_Camera_DeleteCameraManager(cameraManager_);
        if (ret != CAMERA_OK) {
            LOG("删除CameraManager实例成功. %{public}d", ret);
        } else {
            LOG("删除CameraManager实例失败. %{public}d", ret);
        }
        cameraManager_ = nullptr;
    }

    CameraManagerUnRegisterCallback(PARAMETER_OK);
}


Camera_ErrorCode NDKCamera::CameraManagerDeleteSupportedCameraOutputCapability(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_DeleteSupportedCameraOutputCapability(cameraManager_, cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_DeleteSupportedCameraOutputCapability(cameraManager_, nullptr);
    } else {
        ret_ = OH_CameraManager_DeleteSupportedCameraOutputCapability(nullptr, cameraOutputCapability_);
    }

    return ret_;
}
Camera_ErrorCode NDKCamera::CameraManagerDeleteSupportedCameras(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, -1);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_DeleteSupportedCameras(cameraManager_, nullptr, size_);
    } else {
        ret_ = OH_CameraManager_DeleteSupportedCameras(nullptr, cameras_, size_);
    }
    if (ret_ != CAMERA_OK) {
        LOG("删除支持的相机成功. %{public}d", ret_);
    } else {
        LOG("删除支持的相机失败. %{public}d", ret_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CameraDeleteCameraManager(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_Camera_DeleteCameraManager(cameraManager_);
    } else {
        ret_ = OH_Camera_DeleteCameraManager(nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("删除CameraManager实例失败. %{public}d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraManagerUnRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_UnregisterCallback(cameraManager_, GetCameraManagerListener());
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_UnregisterCallback(nullptr, GetCameraManagerListener());
    } else {
        ret_ = OH_CameraManager_UnregisterCallback(cameraManager_, nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("注销摄像机状态更改事件回调失败. %{public}d", ret_);
    }
    return ret_;
}


Camera_ErrorCode NDKCamera::CameraManagerRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_RegisterCallback(cameraManager_, GetCameraManagerListener());
    } else if (useCaseCode == PARAMETER1_ERROR) {
        ret_ = OH_CameraManager_RegisterCallback(nullptr, GetCameraManagerListener());
    } else {
        ret_ = OH_CameraManager_RegisterCallback(cameraManager_, nullptr);
    }

    return ret_;
}
Camera_ErrorCode NDKCamera::GetSupportedCameras(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_GetSupportedCameras(cameraManager_, &cameras_, &size_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameras(cameraManager_, &cameras_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameras(cameraManager_, nullptr, &size_);
    } else {
        ret_ = OH_CameraManager_GetSupportedCameras(nullptr, &cameras_, &size_);
    }
    if (cameras_ == nullptr || ret_ != CAMERA_OK) {
        LOG("获取支持相机的描述失败. %{public}d", ret_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::GetSupportedOutputCapability(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &cameraOutputCapability_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, nullptr, &cameraOutputCapability_);
    } else {
        ret_ = OH_CameraManager_GetSupportedCameraOutputCapability(nullptr, cameras_, &cameraOutputCapability_);
    }

    if (cameraOutputCapability_ == nullptr || ret_ != CAMERA_OK) {
        LOG("获取特定相机和特定模式支持的输出功能失败");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CreatePreviewOutput(int useCaseCode)
{
    profile_ = cameraOutputCapability_->previewProfiles[0];
    int videoWidth = vProfile_->size.width;
    int videoHeight = vProfile_->size.height;
    int previewWidth = cameraOutputCapability_->previewProfiles[0]->size.width;
    int previewHeight = cameraOutputCapability_->previewProfiles[0]->size.height;
    for (decltype(cameraOutputCapability_->videoProfilesSize) i = 0;
    i < cameraOutputCapability_->videoProfilesSize; i++) {
        for (decltype(cameraOutputCapability_->previewProfilesSize) j = 0;
        j < cameraOutputCapability_->previewProfilesSize; j++) {
            videoWidth = cameraOutputCapability_->videoProfiles[i]->size.width;
            videoHeight = cameraOutputCapability_->videoProfiles[i]->size.height;
            previewWidth = cameraOutputCapability_->previewProfiles[j]->size.width;
            previewHeight = cameraOutputCapability_->previewProfiles[j]->size.height;
            if (videoWidth * previewHeight == videoHeight * previewWidth) {
                profile_ = cameraOutputCapability_->previewProfiles[j];
                break;
            }
        }
    }

    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePreviewOutput(cameraManager_, profile_, previewSurfaceId_, &previewOutput_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutput(cameraManager_, profile_, previewSurfaceId_, nullptr);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutput(cameraManager_, profile_, nullptr, &previewOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePreviewOutput(cameraManager_, nullptr, previewSurfaceId_, &previewOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePreviewOutput(nullptr, profile_, previewSurfaceId_, &previewOutput_);
    }

    return ret_;
}
Camera_ErrorCode NDKCamera::CreateCameraInput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreateCameraInput(cameraManager_, cameras_, &cameraInput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreateCameraInput(cameraManager_, cameras_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreateCameraInput(cameraManager_, nullptr, &cameraInput_);
    } else {
        ret_ = OH_CameraManager_CreateCameraInput(nullptr, cameras_, &cameraInput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CreateCameraInputWithPositionAndType(Camera_Position position, Camera_Type type,
                                                                 int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreateCameraInput_WithPositionAndType(cameraManager_, position, type, &cameraInput_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_CreateCameraInput_WithPositionAndType(cameraManager_, position, type, nullptr);
    } else {
        ret_ = OH_CameraManager_CreateCameraInput_WithPositionAndType(nullptr, position, type, &cameraInput_);
    }

    return ret_;
}
Camera_ErrorCode NDKCamera::CreateSession(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreateCaptureSession(cameraManager_, nullptr);
    } else {
        ret_ = OH_CameraManager_CreateCaptureSession(nullptr, &captureSession_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PreviewOutputRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_RegisterCallback(previewOutput_, GetPreviewOutputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_RegisterCallback(previewOutput_, nullptr);
    } else {
        ret_ = OH_PreviewOutput_RegisterCallback(nullptr, GetPreviewOutputListener());
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PreviewOutputUnRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_UnregisterCallback(previewOutput_, GetPreviewOutputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PreviewOutput_UnregisterCallback(previewOutput_, nullptr);
    } else {
        ret_ = OH_PreviewOutput_UnregisterCallback(nullptr, GetPreviewOutputListener());
    }
    return ret_;
}

void PhotoOutputCaptureReadyCallback(Camera_PhotoOutput* photoOutput)
{
    while (g_isCaptureReady) {};
    g_isCaptureReady = true;
    LOG("RegisterPhotoOutputCaptureReadyCallback");
}

Camera_ErrorCode NDKCamera::PhotoOutputRegisterCaptureReadyCallback()
{
    LOG("PhotoOutputRegisterCaptureReadyCallback");
    return OH_PhotoOutput_RegisterCaptureReadyCallback(photoOutput_, PhotoOutputCaptureReadyCallback);
}
Camera_ErrorCode NDKCamera::PhotoOutputUnRegisterCaptureReadyCallback()
{
    LOG("PhotoOutputUnRegisterCaptureReadyCallback");
    return OH_PhotoOutput_UnregisterCaptureReadyCallback(photoOutput_, PhotoOutputCaptureReadyCallback);
}


Camera_ErrorCode NDKCamera::CreatePhotoOutput(char *photoSurfaceId, int useCaseCode)
{
    profile_ = cameraOutputCapability_->photoProfiles[0];
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, photoSurfaceId, &photoOutput_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, photoSurfaceId, nullptr);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, nullptr, &photoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreatePhotoOutput(cameraManager_, nullptr, photoSurfaceId, &photoOutput_);
    } else {
        ret_ = OH_CameraManager_CreatePhotoOutput(nullptr, profile_, photoSurfaceId, &photoOutput_);
    }

    return ret_;
}
Camera_ErrorCode NDKCamera::CreateMetadataOutput(int useCaseCode)
{
    LOG("创建元数据输出实例1 %{public}p", cameraOutputCapability_);
    metaDataObjectType_ = cameraOutputCapability_->supportedMetadataObjectTypes[0];
    LOG("创建元数据输出实例2%{public}s", metaDataObjectType_);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreateMetadataOutput(cameraManager_, metaDataObjectType_, &metadataOutput_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreateMetadataOutput(cameraManager_, metaDataObjectType_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreateMetadataOutput(cameraManager_, nullptr, &metadataOutput_);
    } else {
        ret_ = OH_CameraManager_CreateMetadataOutput(nullptr, metaDataObjectType_, &metadataOutput_);
    }
    if (metadataOutput_ == nullptr || ret_ != CAMERA_OK) {
        LOG("创建元数据输出实例 失败.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraInputOpen(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_Open(cameraInput_);
    } else {
        ret_ = OH_CameraInput_Open(nullptr);
    }

    if (ret_ != CAMERA_OK) {
        LOG("打开相机 failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CameraInputClose(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_Close(cameraInput_);
    } else {
        ret_ = OH_CameraInput_Close(nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("ndkXTS CameraInput_Close failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CameraInputRelease(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_Release(cameraInput_);
    } else {
        ret_ = OH_CameraInput_Release(nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("释放相机输入实例。失败");
    }
    return ret_;
}
void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = CAMERA_INPUT_STATUS;
    LOG("OnCameraInput errorCode = %d", errorCode);
}

CameraInput_Callbacks *NDKCamera::GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}
Camera_ErrorCode NDKCamera::CameraInputRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_RegisterCallback(cameraInput_, GetCameraInputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraInput_RegisterCallback(cameraInput_, nullptr);
    } else {
        ret_ = OH_CameraInput_RegisterCallback(nullptr, GetCameraInputListener());
    }
    if (ret_ != CAMERA_OK) {
        LOG("OH_CameraInput_RegisterCallback failed.");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CameraInputUnRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_UnregisterCallback(cameraInput_, GetCameraInputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraInput_UnregisterCallback(cameraInput_, nullptr);
    } else {
        ret_ = OH_CameraInput_UnregisterCallback(nullptr, GetCameraInputListener());
    }
    if (ret_ != CAMERA_OK) {
        LOG("注册相机输入更改事件回调失败");
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
Camera_ErrorCode NDKCamera::CameraInputRegisterOcclusionDetectionCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput_, OcclusionDetectionCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput_, nullptr);
    } else {
        ret_ = OH_CameraInput_RegisterOcclusionDetectionCallback(nullptr, OcclusionDetectionCallback);
    }
    if (ret_ != CAMERA_OK) {
        LOG("注册相机镜头脏污遮挡事件回调失败");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CameraInputUnRegisterOcclusionDetectionCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput_, OcclusionDetectionCallback);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput_, nullptr);
    } else {
        ret_ = OH_CameraInput_UnregisterOcclusionDetectionCallback(nullptr, OcclusionDetectionCallback);
    }
    if (ret_ != CAMERA_OK) {
        LOG("注销相机镜头脏污遮挡事件回调失败");
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionBegin(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_BeginConfig(captureSession_);
    } else {
        ret_ = OH_CaptureSession_BeginConfig(nullptr);
    }
    if (ret_ != CAMERA_OK) {
        LOG("开始捕获会话配置 失败. %d and captureSession_ addr = %p", ret_, captureSession_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionCommitConfig(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_CommitConfig(captureSession_);
    } else {
        ret_ = OH_CaptureSession_CommitConfig(nullptr);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionStart(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_Start(captureSession_);
    } else {
        ret_ = OH_CaptureSession_Start(nullptr);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionStop(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_Stop(captureSession_);
    } else {
        ret_ = OH_CaptureSession_Stop(nullptr);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionRelease(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_Release(captureSession_);
    } else {
        ret_ = OH_CaptureSession_Release(nullptr);
    }
    return ret_;
}
void CaptureSessionOnFocusStateChange(Camera_CaptureSession *session, Camera_FocusState focusState)
{
    NDKCamera::cameraCallbackCode_ = SESSION_ON_FOCUS_STATE_CHANGE;
    LOG("CaptureSessionOnFocusStateChange");
}

void CaptureSessionOnError(Camera_CaptureSession *session, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = SESSION_ON_ERROR;
    LOG("CaptureSession errorCode = %d", errorCode);
}

CaptureSession_Callbacks *NDKCamera::GetCaptureSessionRegister(void)
{
    static CaptureSession_Callbacks captureSessionCallbacks = {.onFocusStateChange = CaptureSessionOnFocusStateChange,
                                                               .onError = CaptureSessionOnError};
    return &captureSessionCallbacks;
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
        LOG("注册捕获会话事件回调监听");
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
Camera_ErrorCode NDKCamera::SessionGetExposureBias(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetExposureBias(captureSession_, &exposureBias_);
        LOG("获取当前曝光补偿 %{public}f", &exposureBias_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetExposureBias(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetExposureBias(nullptr, &exposureBias_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionAddInput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_AddInput(captureSession_, cameraInput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_AddInput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_AddInput(nullptr, cameraInput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionRemoveInput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RemoveInput(captureSession_, cameraInput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RemoveInput(captureSession_, nullptr);
    } else {
        ret_ =OH_CaptureSession_RemoveInput(nullptr, cameraInput_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionAddPreviewOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_AddPreviewOutput(captureSession_, previewOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_AddPreviewOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_AddPreviewOutput(nullptr, previewOutput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionAddPhotoOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_AddPhotoOutput(captureSession_, photoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_AddPhotoOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_AddPhotoOutput(nullptr, photoOutput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetExposureBiasRange(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetExposureBiasRange(captureSession_, &minExposureBias_, &maxExposureBias_, &step_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CaptureSession_GetExposureBiasRange(captureSession_, &minExposureBias_, &maxExposureBias_, nullptr);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_GetExposureBiasRange(captureSession_, &minExposureBias_, nullptr, &step_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetExposureBiasRange(captureSession_, nullptr, &maxExposureBias_, &step_);
    } else {
        ret_ = OH_CaptureSession_GetExposureBiasRange(nullptr, &minExposureBias_, &maxExposureBias_, &step_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::IsCameraMuted(int useCaseCode)
{
    LOG("确定相机是否静音");
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_IsCameraMuted(cameraManager_, isCameraMuted_);
        LOG("确定相机是否静音 %{public}d", ret_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_IsCameraMuted(cameraManager_, nullptr);
    } else {
        ret_ = OH_CameraManager_IsCameraMuted(nullptr, isCameraMuted_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetExposureMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetExposureMode(captureSession_, &exposureMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetExposureMode(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetExposureMode(nullptr, &exposureMode_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionIsExposureModeSupported(uint32_t mode, int useCaseCode)
{
    Camera_ExposureMode exposureMode = static_cast<Camera_ExposureMode>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_IsExposureModeSupported(captureSession_, exposureMode, &isExposureMode_);
        LOG("检查是否支持指定的曝光模式 %{public}d 曝光:%{public}d", exposureMode, isExposureMode_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_IsExposureModeSupported(captureSession_, exposureMode, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        LOG("确定相机是否静音 %{public}d", exposureMode);
        ret_ = OH_CaptureSession_IsExposureModeSupported(captureSession_, exposureMode, &isExposureMode_);
    } else {
        ret_ = OH_CaptureSession_IsExposureModeSupported(nullptr, exposureMode, &isExposureMode_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionSetExposureMode(uint32_t mode, int useCaseCode)
{
    Camera_ExposureMode exposureMode = static_cast<Camera_ExposureMode>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetExposureMode(captureSession_, exposureMode);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CaptureSession_SetExposureMode(captureSession_, exposureMode);
    } else {
        ret_ = OH_CaptureSession_SetExposureMode(nullptr, exposureMode);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionSetExposureBias(float exposureBias, int useCaseCode)
{
    ret_ = OH_CaptureSession_GetExposureBiasRange(captureSession_, &minExposureBias_, &maxExposureBias_, &step_);
    LOG("最小曝光 %{public}.2f 最大曝光%{public}.2f", minExposureBias_, maxExposureBias_);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetExposureBias(captureSession_, exposureBias);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_SetExposureBias(captureSession_, exposureBias);
    } else {
        ret_ = OH_CaptureSession_SetExposureBias(nullptr, exposureBias);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionHasFlash(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_HasFlash(captureSession_, &hasFlash_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_HasFlash(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_HasFlash(nullptr, &hasFlash_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionIsFlashModeSupported(uint32_t mode, int useCaseCode)
{
    Camera_FlashMode flashMode = static_cast<Camera_FlashMode>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, &isFlashMode_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, &isFlashMode_);
    } else {
        ret_ = OH_CaptureSession_IsFlashModeSupported(nullptr, flashMode, &isFlashMode_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionSetFlashMode(uint32_t mode, int useCaseCode)
{
    Camera_FlashMode flashMode = static_cast<Camera_FlashMode>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetFlashMode(captureSession_, flashMode);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CaptureSession_SetFlashMode(captureSession_, flashMode);
    } else {
        ret_ = OH_CaptureSession_SetFlashMode(nullptr, flashMode);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetFlashMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetFlashMode(captureSession_, &flashMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetFlashMode(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetFlashMode(nullptr, &flashMode_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionIsFocusModeSupported(uint32_t mode, int useCaseCode)
{
    Camera_FocusMode focusMode = static_cast<Camera_FocusMode>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, &isFocusSupported_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, &isFocusSupported_);
    } else {
        ret_ = OH_CaptureSession_IsFocusModeSupported(nullptr, focusMode, &isFocusSupported_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetFocusMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetFocusMode(captureSession_, &focusMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetFocusMode(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetFocusMode(nullptr, &focusMode_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetFocusPoint(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetFocusPoint(captureSession_, &focusPoint_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetFocusPoint(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetFocusPoint(nullptr, &focusPoint_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionSetFocusPoint(double point_x, double point_y, int useCaseCode)
{
    Camera_Point point;
    point.x = point_x;
    point.y = point_y;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetFocusPoint(captureSession_, point);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CaptureSession_SetFocusPoint(captureSession_, point);
    } else {
        ret_ = OH_CaptureSession_SetFocusPoint(nullptr, point);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetMeteringPoint(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetMeteringPoint(captureSession_, &point_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetMeteringPoint(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetMeteringPoint(nullptr, &point_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetZoomRatio(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetZoomRatio(captureSession_, &zoom_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetZoomRatio(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetZoomRatio(nullptr, &zoom_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetZoomRatioRange(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetZoomRatioRange(captureSession_, &minZoom_, &maxZoom_);
        LOG("最小缩放 %{public}.2f 最大缩放%{public}.2f", minZoom_, maxZoom_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetZoomRatioRange(captureSession_, &minZoom_, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetZoomRatioRange(captureSession_, nullptr, &maxZoom_);
    } else {
        ret_ = OH_CaptureSession_GetZoomRatioRange(nullptr, &minZoom_, &maxZoom_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionSetZoomRatio(float zoom, int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetZoomRatio(captureSession_, zoom);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_SetZoomRatio(captureSession_, zoom);
    } else {
        ret_ = OH_CaptureSession_SetZoomRatio(nullptr, zoom);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionSetMeteringPoint(double point_x, double point_y, int useCaseCode)
{
    Camera_Point point;
    point.x = point_x;
    point.y = point_y;
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetMeteringPoint(captureSession_, point);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_SetMeteringPoint(captureSession_, point);
    } else {
        ret_ = OH_CaptureSession_SetMeteringPoint(nullptr, point);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionIsVideoStabilizationModeSupported(uint32_t mode, int useCaseCode)
{
    Camera_VideoStabilizationMode videoMode = static_cast<Camera_VideoStabilizationMode>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ =OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession_, videoMode, &isVideoSupported_);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ =OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession_, videoMode, nullptr);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession_, videoMode, &isVideoSupported_);
    } else {
        ret_ = OH_CaptureSession_IsVideoStabilizationModeSupported(nullptr, videoMode, &isVideoSupported_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionGetVideoStabilizationMode(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_GetVideoStabilizationMode(captureSession_, &videoMode_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_GetVideoStabilizationMode(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_GetVideoStabilizationMode(nullptr, &videoMode_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionSetVideoStabilizationMode(uint32_t mode, int useCaseCode)
{
    Camera_VideoStabilizationMode videoMode = static_cast<Camera_VideoStabilizationMode>(mode);
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_SetVideoStabilizationMode(captureSession_, videoMode);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        return CAMERA_INVALID_ARGUMENT;
        ret_ = OH_CaptureSession_SetVideoStabilizationMode(captureSession_, videoMode);
    } else {
        ret_ = OH_CaptureSession_SetVideoStabilizationMode(nullptr, videoMode);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::SessionRemovePreviewOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RemovePreviewOutput(captureSession_, previewOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RemovePreviewOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_RemovePreviewOutput(nullptr, previewOutput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionRemovePhotoOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RemovePhotoOutput(captureSession_, photoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RemovePhotoOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_RemovePhotoOutput(nullptr, photoOutput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::AddVideoOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_AddVideoOutput(captureSession_, videoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_AddVideoOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_AddVideoOutput(nullptr, videoOutput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::CreateVideoOutput(char *videoId, int useCaseCode)
{
    vProfile_ = cameraOutputCapability_->videoProfiles[0];
    int videoWidth = vProfile_->size.width;
    int videoHeight = vProfile_->size.height;
    int previewWidth = cameraOutputCapability_->previewProfiles[0]->size.width;
    int previewHeight = cameraOutputCapability_->previewProfiles[0]->size.height;
    for (decltype(cameraOutputCapability_->videoProfilesSize) i = 0;
    i < cameraOutputCapability_->videoProfilesSize; i++) {
        for (decltype(cameraOutputCapability_->previewProfilesSize) j = 0;
        j < cameraOutputCapability_->previewProfilesSize; j++) {
            videoWidth = cameraOutputCapability_->videoProfiles[i]->size.width;
            videoHeight = cameraOutputCapability_->videoProfiles[i]->size.height;
            previewWidth = cameraOutputCapability_->previewProfiles[j]->size.width;
            previewHeight = cameraOutputCapability_->previewProfiles[j]->size.height;
            if (videoWidth * previewHeight == videoHeight * previewWidth) {
                vProfile_ = cameraOutputCapability_->videoProfiles[i];
                break;
            }
        }
    }

    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CameraManager_CreateVideoOutput(cameraManager_, vProfile_, videoId, &videoOutput_);
    } else if (useCaseCode == PARAMETER4_ERROR) {
        ret_ = OH_CameraManager_CreateVideoOutput(cameraManager_, vProfile_, videoId, nullptr);
    } else if (useCaseCode == PARAMETER3_ERROR) {
        ret_ = OH_CameraManager_CreateVideoOutput(cameraManager_, vProfile_, nullptr, &videoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CameraManager_CreateVideoOutput(cameraManager_, nullptr, videoId, &videoOutput_);
    } else {
        ret_ = OH_CameraManager_CreateVideoOutput(nullptr, vProfile_, videoId, &videoOutput_);
    }
    return ret_;
}
void VideoOutputOnFrameStart(Camera_VideoOutput *videoOutput)
{
    NDKCamera::cameraCallbackCode_ = VIDEO_ON_FRAME_START;
    LOG("VideoOutputOnFrameStart");
}

void VideoOutputOnFrameEnd(Camera_VideoOutput *videoOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = VIDEO_ON_FRAME_END;
    LOG("VideoOutput frameCount = %d", frameCount);
}

void VideoOutputOnError(Camera_VideoOutput *videoOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = VIDEO_ON_ERROR;
    LOG("VideoOutput errorCode = %d", errorCode);
}
VideoOutput_Callbacks *NDKCamera::GetVideoOutputListener(void)
{
    static VideoOutput_Callbacks videoOutputListener = {
        .onFrameStart = VideoOutputOnFrameStart, .onFrameEnd = VideoOutputOnFrameEnd, .onError = VideoOutputOnError};
    return &videoOutputListener;
}
Camera_ErrorCode NDKCamera::VideoOutputRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_RegisterCallback(videoOutput_, GetVideoOutputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_RegisterCallback(videoOutput_, nullptr);
    } else {
        ret_ = OH_VideoOutput_RegisterCallback(nullptr, GetVideoOutputListener());
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputUnRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_UnregisterCallback(videoOutput_, GetVideoOutputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_VideoOutput_UnregisterCallback(videoOutput_, nullptr);
    } else {
        ret_ = OH_VideoOutput_UnregisterCallback(nullptr, GetVideoOutputListener());
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputStart(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_Start(videoOutput_);
    } else {
        ret_ = OH_VideoOutput_Start(nullptr);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputStop(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_Stop(videoOutput_);
    } else {
        ret_ = OH_VideoOutput_Stop(nullptr);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::SessionRemoveVideoOutput(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_CaptureSession_RemoveVideoOutput(captureSession_, videoOutput_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_CaptureSession_RemoveVideoOutput(captureSession_, nullptr);
    } else {
        ret_ = OH_CaptureSession_RemoveVideoOutput(nullptr, videoOutput_);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::VideoOutputRelease(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_VideoOutput_Release(videoOutput_);
    } else {
        ret_ = OH_VideoOutput_Release(nullptr);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PreviewOutputStart(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_Start(previewOutput_);
    } else {
        ret_ = OH_PreviewOutput_Start(nullptr);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PreviewOutputStop(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PreviewOutput_Stop(previewOutput_);
    } else {
        ret_ = OH_PreviewOutput_Stop(nullptr);
    }
    return ret_;
}
void PhotoOutputOnFrameStart(Camera_PhotoOutput *photoOutput)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_FRAME_START;
    LOG("PhotoOutputOnFrameStart");
}

void PhotoOutputOnFrameShutter(Camera_PhotoOutput *photoOutput, Camera_FrameShutterInfo *info)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_FRAME_SHUTTER;
    LOG("PhotoOutputOnFrameShutter");
}

void PhotoOutputOnFrameEnd(Camera_PhotoOutput *photoOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_FRAME_END;
    LOG("PhotoOutput frameCount = %d", frameCount);
}

void PhotoOutputOnError(Camera_PhotoOutput *photoOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_ERROR;
    LOG("PhotoOutput errorCode = %d", errorCode);
}

Camera_ErrorCode NDKCamera::PreviewOutputRelease(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        if (previewOutput_ != nullptr) {
            ret_ = OH_PreviewOutput_Release(previewOutput_);
            previewOutput_ = nullptr;
        }
    } else {
        ret_ = OH_PreviewOutput_Release(nullptr);
    }
    return ret_;
}
PhotoOutput_Callbacks *NDKCamera::GetPhotoOutputListener(void)
{
    static PhotoOutput_Callbacks photoOutputListener = {.onFrameStart = PhotoOutputOnFrameStart,
                                                        .onFrameShutter = PhotoOutputOnFrameShutter,
                                                        .onFrameEnd = PhotoOutputOnFrameEnd,
                                                        .onError = PhotoOutputOnError};
    return &photoOutputListener;
}

Camera_ErrorCode NDKCamera::PhotoOutputRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_RegisterCallback(photoOutput_, GetPhotoOutputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_RegisterCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_RegisterCallback(nullptr, GetPhotoOutputListener());
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputUnRegisterCallback(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_UnregisterCallback(photoOutput_, GetPhotoOutputListener());
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_UnregisterCallback(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_UnregisterCallback(nullptr, GetPhotoOutputListener());
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::IsMirrorSupported(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_IsMirrorSupported(photoOutput_, &isMirror_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_IsMirrorSupported(photoOutput_, nullptr);
    } else {
        ret_ = OH_PhotoOutput_IsMirrorSupported(nullptr, &isMirror_);
    }
    return ret_;
}
bool NDKCamera::getMirrorSupported()
{
    ret_ = OH_PhotoOutput_IsMirrorSupported(photoOutput_, &isMirror_);
    return isMirror_;
}
Camera_ErrorCode NDKCamera::EnableMirror(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_EnableMirror(photoOutput_, isEnableMirror_);
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_EnableMirror(photoOutput_, 0);
    } else {
        ret_ = OH_PhotoOutput_EnableMirror(nullptr, isEnableMirror_);
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::PhotoOutputCapture(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_Capture(photoOutput_);
    } else {
        ret_ = OH_PhotoOutput_Capture(nullptr);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::TakePictureWithPhotoSettings(Camera_PhotoCaptureSetting photoSetting, int useCaseCode)
{
    int32_t gSleepTotalTime = 500;
    std::this_thread::sleep_for(std::chrono::milliseconds(gSleepTotalTime));
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_Capture_WithCaptureSetting(photoOutput_, photoSetting);
        g_isCaptureReady = false;
    } else if (useCaseCode == PARAMETER2_ERROR) {
        ret_ = OH_PhotoOutput_Capture_WithCaptureSetting(photoOutput_, photoSetting);
        g_isCaptureReady = false;
    } else {
        ret_ = OH_PhotoOutput_Capture_WithCaptureSetting(nullptr, photoSetting);
    }
    return ret_;
}
Camera_ErrorCode NDKCamera::PhotoOutputRelease(int useCaseCode)
{
    if (useCaseCode == PARAMETER_OK) {
        ret_ = OH_PhotoOutput_Release(photoOutput_);
    } else {
        ret_ = OH_PhotoOutput_Release(nullptr);
    }
    return ret_;
}