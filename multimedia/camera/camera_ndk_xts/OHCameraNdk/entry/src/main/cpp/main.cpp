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
#include "napi/native_api.h"
#include <hilog/log.h>


static NDKCamera *g_ndkCamera = nullptr;
const static int NUMBER_1 = 1;
const static int NUMBER_2 = 2;
const static int NUMBER_3 = 3;
const static int NUMBER_4 = 4;

static void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, "状态码回调");
}
static CameraManager_Callbacks *GetCameraManagerListener()
{
    static CameraManager_Callbacks listener = {.onCameraStatus = CameraManagerStatusCallback};
    return &listener;
}

static napi_value InitCamera(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    size_t typeLen = 0;
    char *surfaceId = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    surfaceId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], surfaceId, typeLen + 1, &typeLen);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    g_ndkCamera = new NDKCamera(surfaceId, index);
    napi_create_int32(env, CAMERA_OK, &result);
    return result;
}
// 只在测试此接口时使用
static napi_value CameraGetCameraManager(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    LOG("创建CameraManager实例");
    // 创建CameraManager实例。
    Camera_Manager *cameraManager_;
    Camera_ErrorCode code;
    if (index == PARAMETER_OK) {
        code = OH_Camera_GetCameraManager(&cameraManager_);
    } else {
        // 传null代码无法继续执行
        napi_create_int32(env, -1, &result);
        return result;
        LOG("创建CameraManager实例 1111");
        code = OH_Camera_GetCameraManager(nullptr);
        LOG("创建CameraManager实例 22222");
    }

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerRegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraManagerRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value CameraDeleteCameraManager(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraDeleteCameraManager(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value CameraManagerGetSupportedCameras(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->GetSupportedCameras(index);

    napi_value cameraInfo = nullptr;
    napi_create_object(env, &cameraInfo);
    if (code != CAMERA_OK) {
        return nullptr;
    }
    napi_value jsValue = nullptr;

    napi_create_int32(env, g_ndkCamera->cameras_->cameraPosition, &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraPosition", jsValue);

    napi_create_int32(env, g_ndkCamera->cameras_->cameraType, &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraType", jsValue);

    napi_create_int32(env, g_ndkCamera->cameras_->connectionType, &jsValue);
    napi_set_named_property(env, cameraInfo, "connectionType", jsValue);

    napi_create_string_utf8(env, g_ndkCamera->cameras_->cameraId,
                            sizeof(g_ndkCamera->cameras_->cameraId) + 1,
                            &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraId", jsValue);

    return cameraInfo;
}

static napi_value CameraManagerGetSupportedCameraInfos(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->GetSupportedCameras(index);

    napi_value cameraInfo = nullptr;

    if (code != CAMERA_OK) {
        return nullptr;
    }
    napi_value jsValue = nullptr;

    napi_value cameraInfos = nullptr;

    napi_status status = napi_create_array(env, &cameraInfos);
    
    for (uint32_t i = 0; i < g_ndkCamera->GetCameraDeviceSize(); i++) {
        napi_create_object(env, &cameraInfo);
        napi_create_string_utf8(env, g_ndkCamera->cameras_[i].cameraId,
                                sizeof(g_ndkCamera->cameras_[i].cameraId) + 1,
                                &jsValue);
        napi_set_named_property(env, cameraInfo, "cameraId", jsValue);

        napi_create_int32(env, g_ndkCamera->cameras_[i].cameraPosition, &jsValue);
        napi_set_named_property(env, cameraInfo, "cameraPosition", jsValue);

        napi_create_int32(env, g_ndkCamera->cameras_[i].cameraType, &jsValue);
        napi_set_named_property(env, cameraInfo, "cameraType", jsValue);

        napi_create_int32(env, g_ndkCamera->cameras_[i].connectionType, &jsValue);
        napi_set_named_property(env, cameraInfo, "connectionType", jsValue);

        napi_set_element(env, cameraInfos, i, cameraInfo);
    }
    return cameraInfos;
}

static napi_value CameraManagerDeleteSupportedCameras(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraManagerDeleteSupportedCameras(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value GetSupportedCameraOutputCapability(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->GetSupportedOutputCapability(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreatePreviewOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CreatePreviewOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreateCameraInput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CreateCameraInput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static Camera_Position GetPosition(int position)
{
    switch (position) {
        case NUMBER_1:
            return Camera_Position::CAMERA_POSITION_BACK;
        case NUMBER_2:
            return Camera_Position::CAMERA_POSITION_FRONT;
        default:
            return Camera_Position::CAMERA_POSITION_UNSPECIFIED;
    }
}
static Camera_Type GetType(int type)
{
    switch (type) {
        case NUMBER_1:
            return Camera_Type::CAMERA_TYPE_WIDE_ANGLE;
        case NUMBER_2:
            return Camera_Type::CAMERA_TYPE_ULTRA_WIDE;
        case NUMBER_3:
            return Camera_Type::CAMERA_TYPE_TELEPHOTO;
        case NUMBER_4:
            return Camera_Type::CAMERA_TYPE_TRUE_DEPTH;
        default:
            return Camera_Type::CAMERA_TYPE_DEFAULT;
    }
}
static napi_value OHCreateCameraInputWithPositionAndType(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t x;
    napi_get_value_int32(env, args[0], &x);

    int32_t y;
    napi_get_value_int32(env, args[1], &y);

    int32_t index;
    napi_get_value_int32(env, args[NUMBER_2], &index);

    Camera_Position position = GetPosition(x);
    Camera_Type type = GetType(y);
    Camera_ErrorCode ret = g_ndkCamera->CreateCameraInputWithPositionAndType(position, type, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHCameraManagerCreateCaptureSession(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CreateSession(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value CameraManagerDeleteSupportedCameraOutputCapability(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraManagerDeleteSupportedCameraOutputCapability(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value PreviewOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PreviewOutputRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreatePhotoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t typeLen = 0;
    char *surfaceId = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    surfaceId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], surfaceId, typeLen + 1, &typeLen);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);
    LOG("创建一个拍照输出实例. %{public}s====%{public}d", surfaceId, index);
    Camera_ErrorCode ret = g_ndkCamera->CreatePhotoOutput(surfaceId, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHCameraManagerCreateMetadataOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CreateMetadataOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraInputOpen(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraInputOpen(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraInputClose(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraInputClose(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraInputRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraInputRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraInputRegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraInputRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraInputUnregisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraInputUnRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionBeginConfig(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionBegin(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionCommitConfig(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionCommitConfig(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionStart(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionStart(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionStop(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionStop(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionRegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CaptureSessionRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionUnregisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CaptureSessionUnRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetExposureBias(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetExposureBias(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionAddInput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionAddInput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionRemoveInput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionRemoveInput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionAddPreviewOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionAddPreviewOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionAddPhotoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionAddPhotoOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetExposureBiasRange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetExposureBiasRange(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerIsCameraMuted(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->IsCameraMuted(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetExposureMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetExposureMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionIsExposureModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t exposureMode;
    napi_get_value_int32(env, args[0], &exposureMode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code =  g_ndkCamera->SessionIsExposureModeSupported(exposureMode, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionIsExposureModeSupportedForCheck(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t exposureMode;
    napi_get_value_int32(env, args[0], &exposureMode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code =  g_ndkCamera->SessionIsExposureModeSupported(exposureMode, index);
    LOG("SessionIsExposureModeSupported code is:  %{public}d", code);
    if (code == CAMERA_OK) {
        napi_get_boolean(env, g_ndkCamera->isExposureMode_, &result);
    } else {
        napi_get_undefined(env, &result);
    }
    return result;
}
static napi_value OHCaptureSessionSetExposureMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t exposureMode;
    napi_get_value_int32(env, args[0], &exposureMode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionSetExposureMode(exposureMode, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionSetExposureBias(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double exposureBias;
    napi_get_value_double(env, args[0], &exposureBias);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);
    
    Camera_ErrorCode ret = g_ndkCamera->SessionSetExposureBias(exposureBias, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHCaptureSessionIsFlashModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double exposureBias;
    napi_get_value_double(env, args[0], &exposureBias);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode ret = g_ndkCamera->SessionIsFlashModeSupported(exposureBias, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHCaptureSessionIsFlashModeSupportedForCheck(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double exposureBias;
    napi_get_value_double(env, args[0], &exposureBias);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);
    Camera_ErrorCode ret = g_ndkCamera->SessionIsFlashModeSupported(exposureBias, index);
    LOG("OHCaptureSessionIsFlashModeSupportedForCheck code is: %{public}d", ret);
    if (ret == CAMERA_OK) {
        napi_get_boolean(env, g_ndkCamera->isFlashMode_, &result);
    } else {
        napi_get_undefined(env, &result);
    }
    return result;
}
static napi_value OHCaptureSessionHasFlash(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionHasFlash(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionSetFlashMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t flashMode;
    napi_get_value_int32(env, args[0], &flashMode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionSetFlashMode(flashMode, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetFlashMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetFlashMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionIsFocusModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t focusMode;
    napi_get_value_int32(env, args[0], &focusMode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionIsFocusModeSupported(focusMode, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetFocusMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetFocusMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetFocusPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetFocusPoint(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionSetFocusPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value value = nullptr;
    napi_get_named_property(env, args[0], "x", &value);
    double x;
    napi_get_value_double(env, value, &x);

    napi_get_named_property(env, args[0], "y", &value);
    double y;
    napi_get_value_double(env, value, &y);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);
    
    Camera_ErrorCode ret = g_ndkCamera->SessionSetFocusPoint(x, y, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHCaptureSessionGetMeteringPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetMeteringPoint(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetZoomRatio(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetZoomRatio(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionGetZoomRatioRange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetZoomRatioRange(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionSetZoomRatio(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double zoomRatio;
    napi_get_value_double(env, args[0], &zoomRatio);
    
    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionSetZoomRatio(zoomRatio, index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionSetMeteringPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value value = nullptr;
    napi_get_named_property(env, args[0], "x", &value);
    double x;
    napi_get_value_double(env, value, &x);

    napi_get_named_property(env, args[0], "y", &value);
    double y;
    napi_get_value_double(env, value, &y);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode ret = g_ndkCamera->SessionSetMeteringPoint(x, y, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHCaptureSessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t mode;
    napi_get_value_int32(env, args[0], &mode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionIsVideoStabilizationModeSupported(mode, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionIsVideoStabilizationModeSupportedForCheck(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t mode;
    napi_get_value_int32(env, args[0], &mode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionIsVideoStabilizationModeSupported(mode, index);
    LOG("OHCaptureSessionIsVideoStabilizationModeSupportedForCheck code is:  %{public}d", code);
    if (code == CAMERA_OK) {
        napi_get_boolean(env, g_ndkCamera->isVideoSupported_, &result);
    } else {
        napi_get_undefined(env, &result);
    }
    return result;
}
static napi_value OHCaptureSessionGetVideoStabilizationMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionGetVideoStabilizationMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionSetVideoStabilizationMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t mode;
    napi_get_value_int32(env, args[0], &mode);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionSetVideoStabilizationMode(mode, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionRemovePreviewOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionRemovePreviewOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionRemovePhotoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionRemovePhotoOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionAddVideoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->AddVideoOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerCreateVideoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    size_t videoIdLen = 0;
    char *videoId = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &videoIdLen);
    videoId = new char[videoIdLen + 1];
    napi_get_value_string_utf8(env, args[0], videoId, videoIdLen + 1, &videoIdLen);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);
    
    Camera_ErrorCode ret = g_ndkCamera->CreateVideoOutput(videoId, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHVideoOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->VideoOutputRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHVideoOutputUnregisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->VideoOutputUnRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHVideoOutputStart(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->VideoOutputStart(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHVideoOutputStop(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->VideoOutputStop(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionRemoveVideoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->SessionRemoveVideoOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHVideoOutputRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->VideoOutputRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerUnregisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->CameraManagerUnRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPreviewOutputStart(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PreviewOutputStart(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPreviewOutputStop(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PreviewOutputStop(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPreviewOutputRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PreviewOutputRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PhotoOutputRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputUnregisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PhotoOutputUnRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputIsMirrorSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->IsMirrorSupported(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputEnableMirror(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->EnableMirror(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputCapture(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PhotoOutputCapture(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterCaptureReadyCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_ErrorCode code = g_ndkCamera->PhotoOutputRegisterCaptureReadyCallback();
    
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnRegisterCaptureReadyCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_ErrorCode code = g_ndkCamera->PhotoOutputUnRegisterCaptureReadyCallback();
    
    napi_create_int32(env, code, &result);
    return result;
}

struct Capture_Setting {
    int32_t quality;
    int32_t rotation;
    int32_t location;
    bool mirror;
    int32_t latitude;
    int32_t longitude;
    int32_t altitude;
};
static napi_value GetCaptureParam(napi_env env, napi_value captureConfigValue, Capture_Setting *config)
{
    napi_value value = nullptr;
    napi_get_named_property(env, captureConfigValue, "quality", &value);
    napi_get_value_int32(env, value, &config->quality);

    napi_get_named_property(env, captureConfigValue, "rotation", &value);
    napi_get_value_int32(env, value, &config->rotation);

    napi_get_named_property(env, captureConfigValue, "mirror", &value);
    napi_get_value_bool(env, value, &config->mirror);

    napi_get_named_property(env, captureConfigValue, "latitude", &value);
    napi_get_value_int32(env, value, &config->latitude);

    napi_get_named_property(env, captureConfigValue, "longitude", &value);
    napi_get_value_int32(env, value, &config->longitude);

    napi_get_named_property(env, captureConfigValue, "altitude", &value);
    napi_get_value_int32(env, value, &config->altitude);

    return 0;
}
static void SetConfig(Capture_Setting settings, Camera_PhotoCaptureSetting *photoSetting, Camera_Location *location)
{
    if (photoSetting == nullptr || location == nullptr) {
        return;
    }
    photoSetting->quality = static_cast<Camera_QualityLevel>(settings.quality);
    photoSetting->rotation = static_cast<Camera_ImageRotation>(settings.rotation);
    photoSetting->mirror = settings.mirror;
    location->altitude = settings.altitude;
    location->latitude = settings.latitude;
    location->longitude = settings.longitude;
    photoSetting->location = location;
}
static napi_value OHPhotoOutputCaptureWithCaptureSetting(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    Camera_PhotoCaptureSetting photoSetting;
    Capture_Setting settingInner;
    Camera_Location *location = new Camera_Location;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    GetCaptureParam(env, args[0], &settingInner);
    SetConfig(settingInner, &photoSetting, location);

    int32_t index;
    napi_get_value_int32(env, args[1], &index);
    napi_value result;
    Camera_ErrorCode ret = g_ndkCamera->TakePictureWithPhotoSettings(photoSetting, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHPhotoOutputRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = g_ndkCamera->PhotoOutputRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}
EXTERN_C_START
napi_property_descriptor desc1[] = {
    {"initCamera", nullptr, InitCamera, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCameraGetCameraManager", nullptr, CameraGetCameraManager, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"oHCameraManagerRegisterCallback", nullptr, OHCameraManagerRegisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraDeleteCameraManager", nullptr, CameraDeleteCameraManager, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"oHCameraManagerGetSupportedCameras", nullptr, CameraManagerGetSupportedCameras, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraManagerGetSupportedCameraInfos", nullptr, CameraManagerGetSupportedCameraInfos, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraManagerDeleteSupportedCameras", nullptr, CameraManagerDeleteSupportedCameras, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHGetSupportedCameraOutputCapability", nullptr, GetSupportedCameraOutputCapability, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCameraManagerCreatePreviewOutput", nullptr, OHCameraManagerCreatePreviewOutput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraManagerCreateCameraInput", nullptr, OHCameraManagerCreateCameraInput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCreateCameraInputWithPositionAndType", nullptr, OHCreateCameraInputWithPositionAndType, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCameraManagerCreateCaptureSession", nullptr, OHCameraManagerCreateCaptureSession, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCameraManagerDeleteSupportedCameraOutputCapability", nullptr,
     CameraManagerDeleteSupportedCameraOutputCapability, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHPreviewOutputRegisterCallback", nullptr, PreviewOutputRegisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraManagerCreatePhotoOutput", nullptr, OHCameraManagerCreatePhotoOutput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraManagerCreateMetadataOutput", nullptr, OHCameraManagerCreateMetadataOutput, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCameraInputOpen", nullptr, OHCameraInputOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCameraInputClose", nullptr, OHCameraInputClose, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCameraInputRelease", nullptr, OHCameraInputRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCameraInputUnregisterCallback", nullptr, OHCameraInputUnregisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraInputRegisterCallback", nullptr, OHCameraInputRegisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionBeginConfig", nullptr, OHCaptureSessionBeginConfig, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionCommitConfig", nullptr, OHCaptureSessionCommitConfig, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionStart", nullptr, OHCaptureSessionStart, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionStop", nullptr, OHCaptureSessionStop, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionRelease", nullptr, OHCaptureSessionRelease, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"oHCaptureSessionRegisterCallback", nullptr, OHCaptureSessionRegisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionUnregisterCallback", nullptr, OHCaptureSessionUnregisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetExposureBias", nullptr, OHCaptureSessionGetExposureBias, nullptr, nullptr, nullptr,
     napi_default, nullptr},
};
napi_property_descriptor desc2[] = {
    {"oHCaptureSessionAddInput", nullptr, OHCaptureSessionAddInput, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"oHCaptureSessionRemoveInput", nullptr, OHCaptureSessionRemoveInput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionAddPreviewOutput", nullptr, OHCaptureSessionAddPreviewOutput, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCaptureSessionAddPhotoOutput", nullptr, OHCaptureSessionAddPhotoOutput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetExposureBiasRange", nullptr, OHCaptureSessionGetExposureBiasRange, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCameraManagerIsCameraMuted", nullptr, OHCameraManagerIsCameraMuted, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetExposureMode", nullptr, OHCaptureSessionGetExposureMode, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionIsExposureModeSupported", nullptr, OHCaptureSessionIsExposureModeSupported, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionIsExposureModeSupportedForCheck", nullptr, OHCaptureSessionIsExposureModeSupported,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionSetExposureBias", nullptr, OHCaptureSessionSetExposureBias, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionSetExposureMode", nullptr, OHCaptureSessionSetExposureMode, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionHasFlash", nullptr, OHCaptureSessionHasFlash, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"oHCaptureSessionIsFlashModeSupported", nullptr, OHCaptureSessionIsFlashModeSupported, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCaptureSessionIsFlashModeSupportedForCheck", nullptr, OHCaptureSessionIsFlashModeSupportedForCheck,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionSetFlashMode", nullptr, OHCaptureSessionSetFlashMode, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetFlashMode", nullptr, OHCaptureSessionGetFlashMode, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionIsFocusModeSupported", nullptr, OHCaptureSessionIsFocusModeSupported, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCaptureSessionGetFocusMode", nullptr, OHCaptureSessionGetFocusMode, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetFocusPoint", nullptr, OHCaptureSessionGetFocusPoint, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionSetFocusPoint", nullptr, OHCaptureSessionSetFocusPoint, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetMeteringPoint", nullptr, OHCaptureSessionGetMeteringPoint, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetZoomRatio", nullptr, OHCaptureSessionGetZoomRatio, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionGetZoomRatioRange", nullptr, OHCaptureSessionGetZoomRatioRange, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCaptureSessionSetZoomRatio", nullptr, OHCaptureSessionSetZoomRatio, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCaptureSessionSetMeteringPoint", nullptr, OHCaptureSessionSetMeteringPoint, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCaptureSessionIsVideoStabilizationModeSupported", nullptr,
     OHCaptureSessionIsVideoStabilizationModeSupported, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionIsVideoStabilizationModeSupportedForCheck", nullptr,
     OHCaptureSessionIsVideoStabilizationModeSupportedForCheck, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionGetVideoStabilizationMode", nullptr, OHCaptureSessionGetVideoStabilizationMode,
     nullptr, nullptr, nullptr, napi_default, nullptr},
};
napi_property_descriptor desc3[] = {
    {"oHCaptureSessionSetVideoStabilizationMode", nullptr, OHCaptureSessionSetVideoStabilizationMode,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionRemovePreviewOutput", nullptr, OHCaptureSessionRemovePreviewOutput, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionRemovePhotoOutput", nullptr, OHCaptureSessionRemovePhotoOutput, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHCaptureSessionAddVideoOutput", nullptr, OHCaptureSessionAddVideoOutput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHCameraManagerCreateVideoOutput", nullptr, OHCameraManagerCreateVideoOutput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHVideoOutputRegisterCallback", nullptr, OHVideoOutputRegisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHVideoOutputUnregisterCallback", nullptr, OHVideoOutputUnregisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHVideoOutputStart", nullptr, OHVideoOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHVideoOutputStop", nullptr, OHVideoOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCaptureSessionRemoveVideoOutput", nullptr, OHCaptureSessionRemoveVideoOutput, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHVideoOutputRelease", nullptr, OHVideoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHCameraManagerUnRegisterCallback", nullptr, OHCameraManagerUnregisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHPreviewOutputStart", nullptr, OHPreviewOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHPreviewOutputStop", nullptr, OHPreviewOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHPreviewOutputRelease", nullptr, OHPreviewOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHPhotoOutputRegisterCallback", nullptr, OHPhotoOutputRegisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHPhotoOutputUnregisterCallback", nullptr, OHPhotoOutputUnregisterCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHPhotoOutputIsMirrorSupported", nullptr, OHPhotoOutputIsMirrorSupported, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHPhotoOutputEnableMirror", nullptr, OHPhotoOutputEnableMirror, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"oHPhotoOutputCapture", nullptr, OHPhotoOutputCapture, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"oHPhotoOutputRegisterCaptureReadyCallback", nullptr, OHPhotoOutputRegisterCaptureReadyCallback, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"oHPhotoOutputUnRegisterCaptureReadyCallback", nullptr, OHPhotoOutputUnRegisterCaptureReadyCallback, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"oHPhotoOutputCaptureWithCaptureSetting", nullptr, OHPhotoOutputCaptureWithCaptureSetting, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"oHPhotoOutputRelease", nullptr, OHPhotoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr}
};

static napi_value Init(napi_env env, napi_value exports)
{
    size_t mergedLength = sizeof(desc1) / sizeof(desc1[0]) +
        sizeof(desc2) / sizeof(desc2[0]) + sizeof(desc3) / sizeof(desc3[0]);
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[i] = desc1[i];
    }
    for (size_t i = 0; i < sizeof(desc2) / sizeof(desc2[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + i] = desc2[i];
    }
    for (size_t i = 0; i < sizeof(desc3) / sizeof(desc3[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + sizeof(desc2) / sizeof(desc2[0]) + i] = desc3[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
