/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "camera_manager_ndk.h"
#include <js_native_api.h>
#include "ohcamera/camera.h"
#include <string.h>
#include "hilog/log.h"

static NDKCamera* ndkCamera_ = nullptr;
const static int NUMBER_2 = 2;
struct Capture_Setting {
    int32_t quality;
    int32_t rotation;
    int32_t location;
    bool mirror;
    int32_t latitude;
    int32_t longitude;
    int32_t altitude;
};

static napi_value InitCamera(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    size_t typeLen = 0;
    char* surfaceId = nullptr;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    surfaceId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], surfaceId, typeLen + 1, &typeLen);

    int32_t  cameraDeviceIndex;
    napi_get_value_int32(env, args[1], &cameraDeviceIndex);

    ndkCamera_ = new NDKCamera(surfaceId);
    napi_create_int32(env, CAMERA_OK, &result);
    return result;
}

static napi_value VideoOutputStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->VideoOutputStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetSupportedCameras(napi_env env, napi_callback_info info)
{
    ndkCamera_->GetSupportedCameras();

    napi_value cameraInfo = nullptr;
    napi_create_object(env, &cameraInfo);

    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->cameras_->cameraPosition, &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraPosition", jsValue);

    napi_create_int32(env, ndkCamera_->cameras_->cameraType, &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraType", jsValue);

    napi_create_int32(env, ndkCamera_->cameras_->connectionType, &jsValue);
    napi_set_named_property(env, cameraInfo, "connectionType", jsValue);

    napi_create_string_utf8(env, ndkCamera_->cameras_->cameraId, sizeof(ndkCamera_->cameras_->cameraId) + 1 , &jsValue);
    napi_set_named_property(env, cameraInfo, "cameraId", jsValue);

    return cameraInfo;
}

static napi_value GetCameraOrientation(napi_env env, napi_callback_info info)
{
    ndkCamera_->GetCameraOrientation();

    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->GetCameraOrientation(), &jsValue);

    return jsValue;
}

static napi_value GetCameraHostName(napi_env env, napi_callback_info info)
{
    ndkCamera_->GetCameraHostName();

    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->GetCameraHostName(), &jsValue);

    return jsValue;
}

static napi_value GetCameraHostType(napi_env env, napi_callback_info info)
{
    ndkCamera_->GetCameraHostType();

    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->GetCameraHostType(), &jsValue);

    return jsValue;
}


static napi_value CreateCameraInput(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_ErrorCode ret = ndkCamera_->CreateCameraInput();
    napi_create_int32(env, ret, &result);
    return result;
}

static Camera_Position GetPosition(int position)
{
    switch (position) {
        case 1:
            return Camera_Position::CAMERA_POSITION_BACK;
        case 2: // 2:Camera_Position::CAMERA_POSITION_FRONT
            return Camera_Position::CAMERA_POSITION_FRONT;
        default:
            return Camera_Position::CAMERA_POSITION_UNSPECIFIED;
    }
}

static Camera_Type GetType(int type)
{
    switch (type) {
        case 1:
            return Camera_Type::CAMERA_TYPE_WIDE_ANGLE;
        case 2: // 2:Camera_Type::CAMERA_TYPE_ULTRA_WIDE
            return Camera_Type::CAMERA_TYPE_ULTRA_WIDE;
        case 3: // 3:Camera_Type::CAMERA_TYPE_TELEPHOTO
            return Camera_Type::CAMERA_TYPE_TELEPHOTO;
        case 4: // 4:Camera_Type::CAMERA_TYPE_TRUE_DEPTH
            return Camera_Type::CAMERA_TYPE_TRUE_DEPTH;
        default:
            return Camera_Type::CAMERA_TYPE_DEFAULT;
    }
}

static napi_value CreateCameraInputWithPositionAndType(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int x;
    napi_get_value_int32(env, args[0], &x);

    napi_valuetype valuetype1;
    napi_typeof(env, args[0], &valuetype1);
    int y;
    napi_get_value_int32(env, args[1], &y);

    Camera_Position position = GetPosition(x);
    Camera_Type type = GetType(y);
    Camera_ErrorCode ret = ndkCamera_->CreateCameraInputWithPositionAndType(position, type);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetSupportedOutputCapability(napi_env env, napi_callback_info info)
{
    ndkCamera_->GetSupportedOutputCapability();

    napi_value cameraOutputCapability = nullptr;
    napi_create_object(env, &cameraOutputCapability);

    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->previewProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "previewProfilesSize", jsValue);

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->photoProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "photoProfilesSize", jsValue);

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->videoProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "videoProfilesSize", jsValue);

    napi_create_int32(env, ndkCamera_->cameraOutputCapability_->metadataProfilesSize, &jsValue);
    napi_set_named_property(env, cameraOutputCapability, "metadataProfilesSize", jsValue);

    return cameraOutputCapability;
}

static napi_value CreatePreviewOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CreatePreviewOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CreatePhotoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t typeLen = 0;
    char* surfaceId = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    surfaceId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], surfaceId, typeLen + 1, &typeLen);
    Camera_ErrorCode ret = ndkCamera_->CreatePhotoOutput(surfaceId);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CreateVideoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    size_t videoIdLen = 0;
    char* videoId = nullptr;
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &videoIdLen);
    videoId = new char[videoIdLen + 1];
    napi_get_value_string_utf8(env, args[0], videoId, videoIdLen + 1, &videoIdLen);
    Camera_ErrorCode ret = ndkCamera_->CreateVideoOutput(videoId);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CreateMetadataOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CreateMetadataOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value IsCameraMuted(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->IsCameraMuted();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraInputOpen(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CameraInputOpen();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraInputClose(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CameraInputClose();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraInputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CameraInputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraManagerGetSupportedCameraInfos(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetSupportedCameras();

    napi_value cameraInfo = nullptr;

    if (code != CAMERA_OK) {
        return nullptr;
    }
    napi_value jsValue = nullptr;

    napi_value cameraInfos = nullptr;

    napi_status status = napi_create_array(env, &cameraInfos);
    
    for (uint32_t i = 0; i < ndkCamera_->GetCameraDeviceSize(); i++) {
        napi_create_object(env, &cameraInfo);
        napi_create_string_utf8(env, ndkCamera_->cameras_[i].cameraId,
                                sizeof(ndkCamera_->cameras_[i].cameraId) + 1,
                                &jsValue);
        napi_set_named_property(env, cameraInfo, "cameraId", jsValue);

        napi_create_int32(env, ndkCamera_->cameras_[i].cameraPosition, &jsValue);
        napi_set_named_property(env, cameraInfo, "cameraPosition", jsValue);

        napi_create_int32(env, ndkCamera_->cameras_[i].cameraType, &jsValue);
        napi_set_named_property(env, cameraInfo, "cameraType", jsValue);

        napi_create_int32(env, ndkCamera_->cameras_[i].connectionType, &jsValue);
        napi_set_named_property(env, cameraInfo, "connectionType", jsValue);

        napi_set_element(env, cameraInfos, i, cameraInfo);
    }
    return cameraInfos;
}

static napi_value PreviewOutputStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PreviewOutputStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PreviewOutputStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PreviewOutputStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PreviewOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PreviewOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PhotoOutputCapture(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PhotoOutputCapture();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PhotoOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->PhotoOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value IsMirrorSupported(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->IsMirrorSupported();
    napi_get_boolean(env, ndkCamera_->IsMirror_, &result);
    return result;
}

static napi_value VideoOutputStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->VideoOutputStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value VideoOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->VideoOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value IsVideoMirrorSupported(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->IsVideoMirrorSupported();
    napi_get_boolean(env, ndkCamera_->IsVideoMirror_, &result);
    return result;
}

static napi_value EnableVideoMirror(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isEnable;
    napi_get_value_bool(env, args[0], &isEnable);
    Camera_ErrorCode code = ndkCamera_->EnableVideoMirror(isEnable);
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value MetadataOutputStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->MetadataOutputStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MetadataOutputStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->MetadataOutputStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MetadataOutputRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->MetadataOutputRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddInput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddInput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemoveInput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemoveInput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddPreviewOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddPreviewOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddPhotoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddPhotoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddVideoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddVideoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionAddMetadataOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionAddMetadataOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemovePreviewOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemovePreviewOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemovePhotoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemovePhotoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemoveVideoOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemoveVideoOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRemoveMetadataOutput(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRemoveMetadataOutput();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionStart(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionStart();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionStop(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionStop();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionBegin(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionBegin();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionCommitConfig(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionCommitConfig();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionRelease(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->SessionRelease();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CreateSession(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode ret = ndkCamera_->CreateSession();
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionHasFlash(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionHasFlash();
    napi_get_boolean(env, ndkCamera_->HasFlash_, &result);
    return result;
}

static napi_value SessionIsFlashModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t flashMode;
    napi_get_value_int32(env, args[0], &flashMode);

    ndkCamera_->SessionIsFlashModeSupported(flashMode);
    napi_get_boolean(env, ndkCamera_->IsFlashMode_, &result);
    return result;
}

static napi_value SessionGetFlashMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetFlashMode();
    Camera_FlashMode flashMode = ndkCamera_->flashMode_;
    napi_create_int32(env, flashMode, &result);
    return result;
}

static napi_value SessionGetPhotoRotation(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t rotation;
    napi_get_value_int32(env, args[0], &rotation);
    Camera_ErrorCode ret = ndkCamera_->SessionGetPhotoRotation(rotation);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetVideoRotation(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t rotation;
    napi_get_value_int32(env, args[0], &rotation);
    Camera_ErrorCode ret = ndkCamera_->SessionGetVideoRotation(rotation);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetPreviewRotation(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t rotation;
    napi_get_value_int32(env, args[0], &rotation);
    Camera_ErrorCode ret = ndkCamera_->SessionGetPreviewRotation(rotation);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionSetPreviewRotation(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t rotation;
    napi_get_value_int32(env, args[0], &rotation);
    bool isDisplayLocked;
    napi_get_value_bool(env, args[1], &isDisplayLocked);
    Camera_ErrorCode ret = ndkCamera_->SessionSetPreviewRotation(rotation, isDisplayLocked);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionSetFlashMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t flashMode;
    napi_get_value_int32(env, args[0], &flashMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetFlashMode(flashMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionIsExposureModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t exposureMode;
    napi_get_value_int32(env, args[0], &exposureMode);

    ndkCamera_->SessionIsExposureModeSupported(exposureMode);
    napi_get_boolean(env, ndkCamera_->IsExposureMode_, &result);
    return result;
}

static napi_value SessionGetExposureMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetExposureMode();
    Camera_ExposureMode exposureMode = ndkCamera_->exposureMode_;
    napi_create_int32(env, exposureMode, &result);
    return result;
}

static napi_value SessionSetExposureMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    int32_t exposureMode;
    napi_get_value_int32(env, args[0], &exposureMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetExposureMode(exposureMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetMeteringPoint(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetMeteringPoint();
    Camera_Point point = ndkCamera_->point_;
    napi_value Point = nullptr;
    napi_create_object(env, &Point);

    napi_value jsValue = nullptr;
    napi_create_double(env, point.x, &jsValue);
    napi_set_named_property(env, Point, "x", jsValue);

    napi_create_double(env, point.y, &jsValue);
    napi_set_named_property(env, Point, "y", jsValue);

    return Point;
}

static napi_value SessionSetMeteringPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_value value = nullptr;
    napi_get_named_property(env, args[0], "x", &value);
    double x;
    napi_get_value_double(env, value, &x);

    napi_get_named_property(env, args[0], "y", &value);
    double y;
    napi_get_value_double(env, value, &y);

    Camera_ErrorCode ret = ndkCamera_->SessionSetMeteringPoint(x,y);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetExposureBiasRange(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetExposureBiasRange();
    napi_value exposureBias = nullptr;
    napi_create_object(env, &exposureBias);

    napi_value jsValue = nullptr;

    napi_create_double(env, ndkCamera_->minExposureBias_, &jsValue);
    napi_set_named_property(env, exposureBias, "minExposureBias", jsValue);

    napi_create_double(env, ndkCamera_->maxExposureBias_, &jsValue);
    napi_set_named_property(env, exposureBias, "maxExposureBias", jsValue);

    return exposureBias;
}

static napi_value SessionSetExposureBias(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    double exposureBias;
    napi_get_value_double(env, args[0], &exposureBias);
    Camera_ErrorCode ret = ndkCamera_->SessionSetExposureBias(exposureBias);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetExposureBias(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetExposureBias();
    double exposureBias = ndkCamera_->exposureBias_;
    napi_create_double(env, exposureBias, &result);
    return result;
}

static napi_value SessionIsFocusModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t focusMode;
    napi_get_value_int32(env, args[0], &focusMode);

    ndkCamera_->SessionIsFocusModeSupported(focusMode);
    napi_get_boolean(env, ndkCamera_->isFocusSupported_, &result);
    return result;
}

static napi_value SessionGetFocusMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetFocusMode();
    Camera_FocusMode focusMode = ndkCamera_->focusMode_;
    napi_create_int32(env, focusMode, &result);
    return result;
}

static napi_value SessionSetFocusMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t focusMode;
    napi_get_value_int32(env, args[0], &focusMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetFocusMode(focusMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionSetFocusPoint(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_value value = nullptr;
    napi_get_named_property(env, args[0], "x", &value);
    double x;
    napi_get_value_double(env, value, &x);

    napi_get_named_property(env, args[0], "y", &value);
    double y;
    napi_get_value_double(env, value, &y);

    Camera_ErrorCode ret = ndkCamera_->SessionSetFocusPoint(x,y);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionGetFocusPoint(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetFocusPoint();
    Camera_Point point = ndkCamera_->focusPoint_;
    napi_value Point = nullptr;
    napi_create_object(env, &Point);

    napi_value jsValue = nullptr;
    napi_create_double(env, point.x, &jsValue);
    napi_set_named_property(env, Point, "x", jsValue);

    napi_create_double(env, point.y, &jsValue);
    napi_set_named_property(env, Point, "y", jsValue);

    return Point;
}

static napi_value SessionGetZoomRatioRange(napi_env env, napi_callback_info info)
{
    ndkCamera_->SessionGetZoomRatioRange();

    napi_value zoomRatio = nullptr;
    napi_create_object(env, &zoomRatio);

    napi_value jsValue = nullptr;

    napi_create_double(env, ndkCamera_->minZoom_, &jsValue);
    napi_set_named_property(env, zoomRatio, "minZoom", jsValue);

    napi_create_double(env, ndkCamera_->maxZoom_, &jsValue);
    napi_set_named_property(env, zoomRatio, "maxZoom", jsValue);

    return zoomRatio;
}

static napi_value SessionGetZoomRatio(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetZoomRatio();
    napi_create_double(env, ndkCamera_->zoom_, &result);
    return result;
}

static napi_value SessionSetZoomRatio(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    double zoomRatio;
    napi_get_value_double(env, args[0], &zoomRatio);
    Camera_ErrorCode ret = ndkCamera_->SessionSetZoomRatio(zoomRatio);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    int32_t videoStabilizationMode;
    napi_get_value_int32(env, args[0], &videoStabilizationMode);
    ndkCamera_->SessionIsVideoStabilizationModeSupported(videoStabilizationMode);
    napi_get_boolean(env, ndkCamera_->isVideoSupported_, &result);
    return result;
}

static napi_value SessionGetVideoStabilizationMode(napi_env env, napi_callback_info info)
{
    napi_value result;

    ndkCamera_->SessionGetVideoStabilizationMode();
    Camera_VideoStabilizationMode videoMode = ndkCamera_->videoMode_;
    napi_create_int32(env, videoMode, &result);
    return result;
}

static napi_value SessionSetVideoStabilizationMode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    int32_t videoStabilizationMode;
    napi_get_value_int32(env, args[0], &videoStabilizationMode);
    Camera_ErrorCode ret = ndkCamera_->SessionSetVideoStabilizationMode(videoStabilizationMode);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionSetQualityPrioritization(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t quality;
    napi_get_value_int32(env, args[0], &quality);
    Camera_ErrorCode ret = ndkCamera_->SessionSetQualityPrioritization(quality);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetCameraCallbackCode(napi_env env, napi_callback_info info)
{
    napi_value result;

    CameraCallbackCode status  = ndkCamera_->cameraCallbackCode_;
    napi_create_int32(env, status, &result);
    return result;
}

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

static void SetConfig(Capture_Setting settings, Camera_PhotoCaptureSetting* photoSetting, Camera_Location* location)
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

static napi_value TakePictureWithSettings(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    Camera_PhotoCaptureSetting photoSetting;
    Capture_Setting setting_inner;
    Camera_Location* location = new Camera_Location;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    GetCaptureParam(env, args[0], &setting_inner);
    SetConfig(setting_inner, &photoSetting, location);

    napi_value result;
    Camera_ErrorCode ret = ndkCamera_->TakePictureWithPhotoSettings(photoSetting);
    napi_create_int32(env, ret, &result);
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

    Camera_ErrorCode code = ndkCamera_->CaptureSessionRegisterCallback(index);

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

    Camera_ErrorCode code = ndkCamera_->CaptureSessionUnRegisterCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerGetSupportedSceneModes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetSupportedSceneModes(index);

    napi_value supportedSceneModes = nullptr;
    napi_create_object(env, &supportedSceneModes);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->sceneModesSize_, &jsValue);
    napi_set_named_property(env, supportedSceneModes, "sceneModesSize", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, supportedSceneModes, "errorCode", jsValue);

    bool normalPhoto = ndkCamera_->isNormalPhoto_;
    napi_get_boolean(env, normalPhoto, &jsValue);
    napi_set_named_property(env, supportedSceneModes, "isNormalPhoto", jsValue);

    bool normalVideo = ndkCamera_->isNormalVideo_;
    napi_get_boolean(env, normalVideo, &jsValue);
    napi_set_named_property(env, supportedSceneModes, "isNormalVideo", jsValue);

    bool securePhoto = ndkCamera_->isSecurePhoto_;
    napi_get_boolean(env, securePhoto, &jsValue);
    napi_set_named_property(env, supportedSceneModes, "isSecurePhoto", jsValue);

    return supportedSceneModes;
}
static napi_value OHCameraManagerDeleteSceneModes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->DeleteSceneModes(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(napi_env env,
    napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetSupportedCameraOutputCapabilityWithSceneMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionSetSessionMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetSessionMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionCanAddInput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CanAddInput(index);

    napi_value canAddInput = nullptr;
    napi_create_object(env, &canAddInput);
    napi_value jsValue = nullptr;

    bool result = ndkCamera_->isAddInput_;
    napi_get_boolean(env, result, &jsValue);
    napi_set_named_property(env, canAddInput, "isAddInput", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, canAddInput, "errorCode", jsValue);

    return canAddInput;
}
static napi_value OHCaptureSessionCanAddPreviewOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CanAddPreviewOutput(index);

    napi_value canAddPreviewOutput = nullptr;
    napi_create_object(env, &canAddPreviewOutput);
    napi_value jsValue = nullptr;

    bool result = ndkCamera_->isAddInput_;
    napi_get_boolean(env, result, &jsValue);
    napi_set_named_property(env, canAddPreviewOutput, "isAddPreviewOutput", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, canAddPreviewOutput, "errorCode", jsValue);

    return canAddPreviewOutput;
}
static napi_value OHCaptureSessionCanAddPhotoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CanAddPhotoOutput(index);

    napi_value canAddPhotoOutput = nullptr;
    napi_create_object(env, &canAddPhotoOutput);
    napi_value jsValue = nullptr;

    bool result = ndkCamera_->isAddInput_;
    napi_get_boolean(env, result, &jsValue);
    napi_set_named_property(env, canAddPhotoOutput, "isAddPhotoOutput", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, canAddPhotoOutput, "errorCode", jsValue);

    return canAddPhotoOutput;
}
static napi_value OHCaptureSessionCanAddVideoOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CanAddVideoOutput(index);

    napi_value canAddVideoOutput = nullptr;
    napi_create_object(env, &canAddVideoOutput);
    napi_value jsValue = nullptr;

    bool result = ndkCamera_->isAddInput_;
    napi_get_boolean(env, result, &jsValue);
    napi_set_named_property(env, canAddVideoOutput, "isAddVideoOutput", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, canAddVideoOutput, "errorCode", jsValue);

    return canAddVideoOutput;
}
static napi_value OHCaptureSessionAddSecureOutput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->AddSecureOutput(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraInputOpenSecureCamera(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->OpenSecureCamera(index);

    napi_value secureCamera = nullptr;
    napi_create_object(env, &secureCamera);
    napi_value jsValue = nullptr;

    napi_create_bigint_uint64(env, ndkCamera_->secureSeqId_, &jsValue);
    napi_set_named_property(env, secureCamera, "secureSeqId", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, secureCamera, "errorCode", jsValue);

    return secureCamera;
}
static napi_value OHCameraManagerSetSceneMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetSceneMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreatePreviewOutputUsedInPreconfig(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CreatePreviewOutputUsedInPreconfig(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreatePhotoOutputUsedInPreconfig(napi_env env, napi_callback_info info)
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
    Camera_ErrorCode ret = ndkCamera_->CreatePhotoOutputUsedInPreconfig(surfaceId, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHCaptureSessionCanPreconfig(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t mode;
    napi_get_value_int32(env, args[0], &mode);
    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = ndkCamera_->SessionCanPreconfig(mode, index);
    napi_value sessionCanPreconfig = nullptr;
    napi_create_object(env, &sessionCanPreconfig);
    napi_value jsValue = nullptr;

    bool result = ndkCamera_->canPreconfig_;
    napi_get_boolean(env, result, &jsValue);
    napi_set_named_property(env, sessionCanPreconfig, "canPreconfig", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, sessionCanPreconfig, "errorCode", jsValue);

    return sessionCanPreconfig;
}
static napi_value OHCaptureSessionCanPreconfigWithRatio(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t preconfigTypeValue;
    napi_get_value_int32(env, args[0], &preconfigTypeValue);
    int32_t preconfigRatioValue;
    napi_get_value_int32(env, args[1], &preconfigRatioValue);
    int32_t index;
    napi_get_value_int32(env, args[NUMBER_2], &index);

    Camera_ErrorCode code = ndkCamera_->SessionCanPreconfigWithRatio(preconfigTypeValue, preconfigRatioValue, index);
    napi_value sessionCanPreconfig = nullptr;
    napi_create_object(env, &sessionCanPreconfig);
    napi_value jsValue = nullptr;

    bool result = ndkCamera_->canPreconfig_;
    napi_get_boolean(env, result, &jsValue);
    napi_set_named_property(env, sessionCanPreconfig, "canPreconfig", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, sessionCanPreconfig, "errorCode", jsValue);

    return sessionCanPreconfig;
}

static napi_value OHCaptureSessionPreconfig(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t mode;
    napi_get_value_int32(env, args[0], &mode);
    int32_t index;
    napi_get_value_int32(env, args[1], &index);

    Camera_ErrorCode code = ndkCamera_->SessionPreconfig(mode, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionPreconfigWithRatio(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t preconfigTypeValue;
    napi_get_value_int32(env, args[0], &preconfigTypeValue);
    int32_t preconfigRatioValue;
    napi_get_value_int32(env, args[1], &preconfigRatioValue);
    int32_t index;
    napi_get_value_int32(env, args[NUMBER_2], &index);

    Camera_ErrorCode code = ndkCamera_->SessionPreconfigWithRatio(preconfigTypeValue, preconfigRatioValue, index);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreateVideoOutputUsedInPreconfig(napi_env env, napi_callback_info info)
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

    Camera_ErrorCode ret = ndkCamera_->CreateVideoOutputUsedInPreconfig(videoId, index);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHVideoOutputGetActiveProfile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputGetActiveProfile(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHVideoOutputDeleteProfile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputDeleteProfile(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPreviewOutputGetActiveProfile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PreviewOutputGetActiveProfile(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPreviewOutputDeleteProfile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PreviewOutputDeleteProfile(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputGetActiveProfile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputGetActiveProfile(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputDeleteProfile(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputDeleteProfile(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionRegisterCallbackOn(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CaptureSessionRegisterCallbackOn(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCaptureSessionUnregisterCallbackOff(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CaptureSessionUnregisterCallbackOff(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputRegisterPhotoAvailableCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->RegisterPhotoAvailableCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputUnregisterPhotoAvailableCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->UnregisterPhotoAvailableCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputRegisterPhotoAssetAvailableCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->RegisterPhotoAssetAvailableCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputUnregisterPhotoAssetAvailableCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->UnregisterPhotoAssetAvailableCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoOutputIsMovingPhotoSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->IsMovingPhotoSupported(index);

    napi_value movingPhoto = nullptr;
    napi_create_object(env, &movingPhoto);
    napi_value jsValue = nullptr;

    bool isMovingPhoto = ndkCamera_->isMovingPhotoSupported_;
    napi_get_boolean(env, isMovingPhoto, &jsValue);
    napi_set_named_property(env, movingPhoto, "isMovingPhotoSupported", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, movingPhoto, "errorCode", jsValue);

    return movingPhoto;
}
static napi_value OHPhotoOutputEnableMovingPhoto(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[NUMBER_2] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    bool enable;
    napi_get_value_bool(env, args[1], &enable);

    Camera_ErrorCode code = ndkCamera_->EnableMovingPhoto(index, enable);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoNativeGetMainImage(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetMainImage(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHPhotoNativeRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoNativeRelease(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerCreatePhotoOutputWithoutSurface(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CreatePhotoOutputWithoutSurface(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value ReleaseCamera(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_ErrorCode code = ndkCamera_->ReleaseCamera();

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value OHCameraManagerIsTorchSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->IsTorchSupported(index);

    napi_value isTorchSupported = nullptr;
    napi_create_object(env, &isTorchSupported);
    napi_value jsValue = nullptr;

    napi_get_boolean(env, ndkCamera_->isTorchSupported_, &jsValue);
    napi_set_named_property(env, isTorchSupported, "isTorchSupported", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, isTorchSupported, "errorCode", jsValue);

    return isTorchSupported;
}

static napi_value OHCameraManagerIsTorchSupportedByTorchMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->IsTorchSupportedByTorchMode(index);

    napi_value isTorchSupportedByTorchMode = nullptr;
    napi_create_object(env, &isTorchSupportedByTorchMode);
    napi_value jsValue = nullptr;

    napi_get_boolean(env, ndkCamera_->isTorchSupportedByTorchMode_, &jsValue);
    napi_set_named_property(env, isTorchSupportedByTorchMode, "isTorchSupportedByTorchMode", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, isTorchSupportedByTorchMode, "errorCode", jsValue);

    return isTorchSupportedByTorchMode;
}

static napi_value OHCameraManagerSetTorchMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetTorchMode(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetExposureValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetExposureValue(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetFocalLength(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetFocalLength(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionSetSmoothZoom(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetSmoothZoom(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetSupportedColorSpaces(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetSupportedColorSpaces(index);

    napi_value colorSpacesSize = nullptr;
    napi_create_object(env, &colorSpacesSize);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->colorSpacesSize_, &jsValue);
    napi_set_named_property(env, colorSpacesSize, "colorSpacesSize", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, colorSpacesSize, "errorCode", jsValue);
    return colorSpacesSize;
}

static napi_value OHCaptureSessionDeleteColorSpaces(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->DeleteColorSpaces(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionGetActiveColorSpace(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetActiveColorSpace(index);

    napi_value activeColorSpace = nullptr;
    napi_create_object(env, &activeColorSpace);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->activeColorSpace_, &jsValue);
    napi_set_named_property(env, activeColorSpace, "activeColorSpace", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, activeColorSpace, "errorCode", jsValue);

    return activeColorSpace;
}

static napi_value OHNativeBufferColorSpace(napi_env env, napi_callback_info info)
{
    napi_value colorSpace = nullptr;
    napi_create_object(env, &colorSpace);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->ColorSpace(), &jsValue);
    napi_set_named_property(env, colorSpace, "colorSpaceSupportSize", jsValue);

    napi_create_int32(env, ndkCamera_->setcolorSpace_, &jsValue);
    napi_set_named_property(env, colorSpace, "setcolorSpace", jsValue);

    napi_create_int32(env, ndkCamera_->colorSpacesSize_, &jsValue);
    napi_set_named_property(env, colorSpace, "colorSpacesSize", jsValue);

    return colorSpace;
}


static napi_value OHCaptureSessionSetActiveColorSpace(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetColorSpace(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPreviewOutputGetSupportedFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetSupportedFrameRates(index);

    napi_value frameRatesSize = nullptr;
    napi_create_object(env, &frameRatesSize);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->frameRatesSize_, &jsValue);
    napi_set_named_property(env, frameRatesSize, "frameRatesSize", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, frameRatesSize, "errorCode", jsValue);

    return frameRatesSize;
}

static napi_value OHPreviewOutputSetFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->SetFrameRate(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPreviewOutputGetActiveFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->GetActiveFrameRate(index);

    napi_value activeFrameRateRange = nullptr;
    napi_create_object(env, &activeFrameRateRange);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->activeFrameRateRange_.min, &jsValue);
    napi_set_named_property(env, activeFrameRateRange, "min", jsValue);

    napi_create_int32(env, ndkCamera_->activeFrameRateRange_.max, &jsValue);
    napi_set_named_property(env, activeFrameRateRange, "max", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, activeFrameRateRange, "errorCode", jsValue);
    return activeFrameRateRange;
}

static napi_value OHVideoOutputGetSupportedFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputGetSupportedFrameRates(index);

    napi_value videoFrameRatesSize = nullptr;
    napi_create_object(env, &videoFrameRatesSize);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->videoFrameRatesSize_, &jsValue);
    napi_set_named_property(env, videoFrameRatesSize, "videoFrameRatesSize", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, videoFrameRatesSize, "errorCode", jsValue);
    return videoFrameRatesSize;
}

static napi_value OHVideoOutputSetFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputSetFrameRate(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHVideoOutputGetActiveFrameRate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputGetActiveFrameRate(index);

    napi_value videoActiveFrameRateRange = nullptr;
    napi_create_object(env, &videoActiveFrameRateRange);
    napi_value jsValue = nullptr;

    napi_create_int32(env, ndkCamera_->videoActiveFrameRateRange_.min, &jsValue);
    napi_set_named_property(env, videoActiveFrameRateRange, "min", jsValue);

    napi_create_int32(env, ndkCamera_->videoActiveFrameRateRange_.max, &jsValue);
    napi_set_named_property(env, videoActiveFrameRateRange, "max", jsValue);

    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, videoActiveFrameRateRange, "errorCode", jsValue);
    return videoActiveFrameRateRange;
}

static napi_value OHVideoOutputDeleteFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->VideoOutputDeleteFrameRates(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPreviewOutputDeleteFrameRates(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->DeleteFrameRates(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerRegisterTorchStatusCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CameraManagerRegisterTorchStatusCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerUnregisterTorchStatusCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CameraManagerUnregisterTorchStatusCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionRegisterSmoothZoomInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CaptureSessionRegisterSmoothZoomInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCaptureSessionUnregisterSmoothZoomInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->CaptureSessionUnregisterSmoothZoomInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterCaptureStartWithInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterCaptureStartWithInfoCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterCaptureEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterCaptureEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterCaptureEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterCaptureEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterFrameShutterEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterFrameShutterEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterFrameShutterEndCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterFrameShutterEndCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterCaptureReadyCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterCaptureReadyCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterCaptureReadyCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterCaptureReadyCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputRegisterEstimatedCaptureDurationCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputRegisterEstimatedCaptureDurationCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHPhotoOutputUnregisterEstimatedCaptureDurationCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->PhotoOutputUnregisterEstimatedCaptureDurationCallback(index);

    napi_create_int32(env, code, &result);
    return result;
}

static napi_value OHCameraManagerTorchMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    Camera_ErrorCode code = ndkCamera_->TorchMode(index);

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value ReadyCreatePhotoOutputWithoutSurface(napi_env env, napi_callback_info info)
{
    napi_value result;

    Camera_ErrorCode code = ndkCamera_->ReadyCreatePhotoOutputWithoutSurface();

    napi_create_int32(env, code, &result);
    return result;
}
static napi_value SessionIsAutoDeviceSwitchSupported(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    bool isSupported = false;
    Camera_ErrorCode code = ndkCamera_->IsAutoDeviceSwitchSupported(&isSupported);
    napi_value jsValue = nullptr;
    napi_create_int32(env, code, &jsValue);
    napi_set_named_property(env, obj, "errorCode", jsValue);
    napi_get_boolean(env, isSupported, &jsValue);
    napi_set_named_property(env, obj, "isSupported", jsValue);
    return obj;
}
static napi_value SessionEnableAutoDeviceSwitch(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isEnable;
    napi_get_value_bool(env, args[0], &isEnable);
    Camera_ErrorCode code = ndkCamera_->EnableAutoDeviceSwitch(isEnable);
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value SessionRegisterAutoDeviceSwitchStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->RegisterAutoDeviceSwitchStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value SessionUnregisterAutoDeviceSwitchStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->UnegisterAutoDeviceSwitchStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value CameraManagerRegisterFoldStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->CameraManagerRegisterFoldStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
static napi_value CameraManagerUnregisterFoldStatusChange(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
 
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
 
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
 
    Camera_ErrorCode code = ndkCamera_->CameraManagerUnregisterFoldStatusCallback(index);
 
    napi_create_int32(env, code, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "initCamera", nullptr, InitCamera, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getSupportedCameras", nullptr, GetSupportedCameras, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraOrientation", nullptr, GetCameraOrientation, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostName", nullptr, GetCameraHostName, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCameraHostType", nullptr, GetCameraHostType, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createCameraInput", nullptr, CreateCameraInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createCameraInputWithPositionAndType", nullptr, CreateCameraInputWithPositionAndType, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getSupportedOutputCapability", nullptr, GetSupportedOutputCapability, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "createPreviewOutput", nullptr, CreatePreviewOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createPhotoOutput", nullptr, CreatePhotoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createVideoOutput", nullptr, CreateVideoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createMetadataOutput", nullptr, CreateMetadataOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createSession", nullptr, CreateSession, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isCameraMuted", nullptr, IsCameraMuted, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputOpen", nullptr, CameraInputOpen, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputClose", nullptr, CameraInputClose, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraInputRelease", nullptr, CameraInputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStart", nullptr, PreviewOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStop", nullptr, PreviewOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputRelease", nullptr, PreviewOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "photoOutputCapture", nullptr, PhotoOutputCapture, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "photoOutputRelease", nullptr, PhotoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isMirrorSupported", nullptr, IsMirrorSupported, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputStart", nullptr, VideoOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputStop", nullptr, VideoOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "videoOutputRelease", nullptr, VideoOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isVideoMirrorSupported", nullptr, IsVideoMirrorSupported, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "enableVideoMirror", nullptr, EnableVideoMirror, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputStart", nullptr, MetadataOutputStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputStop", nullptr, MetadataOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "metadataOutputRelease", nullptr, MetadataOutputRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "previewOutputStop", nullptr, PreviewOutputStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddInput", nullptr, SessionAddInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionRemoveInput", nullptr, SessionRemoveInput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddPreviewOutput", nullptr, SessionAddPreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionAddPhotoOutput", nullptr, SessionAddPhotoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddVideoOutput", nullptr, SessionAddVideoOutput, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionAddMetadataOutput", nullptr, SessionAddMetadataOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemovePreviewOutput", nullptr, SessionRemovePreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemovePhotoOutput", nullptr, SessionRemovePhotoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemoveVideoOutput", nullptr, SessionRemoveVideoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRemoveMetadataOutput", nullptr, SessionRemoveMetadataOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionStart", nullptr, SessionStart, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionStop", nullptr, SessionStop, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionBegin", nullptr, SessionBegin, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionCommitConfig", nullptr, SessionCommitConfig, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRelease", nullptr, SessionRelease, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionHasFlash", nullptr, SessionHasFlash, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsFlashModeSupported", nullptr, SessionIsFlashModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetFlashMode", nullptr, SessionGetFlashMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFlashMode", nullptr, SessionSetFlashMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsExposureModeSupported", nullptr, SessionIsExposureModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetExposureMode", nullptr, SessionGetExposureMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetExposureMode", nullptr, SessionSetExposureMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetMeteringPoint", nullptr, SessionGetMeteringPoint, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetMeteringPoint", nullptr, SessionSetMeteringPoint, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetExposureBiasRange", nullptr, SessionGetExposureBiasRange, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetExposureBias", nullptr, SessionSetExposureBias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetExposureBias", nullptr, SessionGetExposureBias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsFocusModeSupported", nullptr, SessionIsFocusModeSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetFocusMode", nullptr, SessionGetFocusMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFocusMode", nullptr, SessionSetFocusMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetFocusPoint", nullptr, SessionSetFocusPoint, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetFocusPoint", nullptr, SessionGetFocusPoint, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetZoomRatioRange", nullptr, SessionGetZoomRatioRange, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetZoomRatio", nullptr, SessionGetZoomRatio, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionSetZoomRatio", nullptr, SessionSetZoomRatio, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionIsVideoStabilizationModeSupported", nullptr, SessionIsVideoStabilizationModeSupported,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionGetVideoStabilizationMode", nullptr, SessionGetVideoStabilizationMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetVideoStabilizationMode", nullptr, SessionSetVideoStabilizationMode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetQualityPrioritization", nullptr, SessionSetQualityPrioritization, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "getCameraCallbackCode", nullptr, GetCameraCallbackCode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "takePictureWithSettings", nullptr, TakePictureWithSettings, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetPhotoRotation", nullptr, SessionGetPhotoRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetVideoRotation", nullptr, SessionGetVideoRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionGetPreviewRotation", nullptr, SessionGetPreviewRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionSetPreviewRotation", nullptr, SessionSetPreviewRotation, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionIsAutoDeviceSwitchSupported", nullptr, SessionIsAutoDeviceSwitchSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionEnableAutoDeviceSwitch", nullptr, SessionEnableAutoDeviceSwitch, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sessionRegisterAutoDeviceSwitchStatusChange", nullptr, SessionRegisterAutoDeviceSwitchStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sessionUnregisterAutoDeviceSwitchStatusChange", nullptr, SessionUnregisterAutoDeviceSwitchStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraManagerRegisterFoldStatusChange", nullptr, CameraManagerRegisterFoldStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "cameraManagerUnregisterFoldStatusChange", nullptr, CameraManagerUnregisterFoldStatusChange,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_property_descriptor desc1[] = {
        {"oHCaptureSessionRegisterCallback", nullptr, OHCaptureSessionRegisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionUnregisterCallback", nullptr, OHCaptureSessionUnregisterCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraManagerGetSupportedSceneModes", nullptr, OHCameraManagerGetSupportedSceneModes, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"oHCameraManagerDeleteSceneModes", nullptr, OHCameraManagerDeleteSceneModes, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode", nullptr,
            OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionSetSessionMode", nullptr, OHCaptureSessionSetSessionMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionCanAddInput", nullptr, OHCaptureSessionCanAddInput, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionCanAddPreviewOutput", nullptr, OHCaptureSessionCanAddPreviewOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionCanAddPhotoOutput", nullptr, OHCaptureSessionCanAddPhotoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionCanAddVideoOutput", nullptr, OHCaptureSessionCanAddVideoOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionAddSecureOutput", nullptr, OHCaptureSessionAddSecureOutput, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraInputOpenSecureCamera", nullptr, OHCameraInputOpenSecureCamera, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionRegisterCallbackOn", nullptr, OHCaptureSessionRegisterCallbackOn, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCaptureSessionUnregisterCallbackOff", nullptr, OHCaptureSessionUnregisterCallbackOff, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"oHCameraManagerSetSceneMode", nullptr, OHCameraManagerSetSceneMode, nullptr, nullptr, nullptr, napi_default,
            nullptr},
    };
    napi_property_descriptor desc2[] = {
        {"oHCameraManagerCreatePreviewOutputUsedInPreconfig", nullptr,
            OHCameraManagerCreatePreviewOutputUsedInPreconfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCameraManagerCreatePhotoOutputUsedInPreconfig", nullptr, OHCameraManagerCreatePhotoOutputUsedInPreconfig,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionCanPreconfig", nullptr, OHCaptureSessionCanPreconfig, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionCanPreconfigWithRatio", nullptr, OHCaptureSessionCanPreconfigWithRatio, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"oHCaptureSessionPreconfig", nullptr, OHCaptureSessionPreconfig, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCaptureSessionPreconfigWithRatio", nullptr, OHCaptureSessionPreconfigWithRatio, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHCameraManagerCreateVideoOutputUsedInPreconfig", nullptr, OHCameraManagerCreateVideoOutputUsedInPreconfig,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHVideoOutputGetActiveProfile", nullptr, OHVideoOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHVideoOutputDeleteProfile", nullptr, OHVideoOutputDeleteProfile, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHPreviewOutputGetActiveProfile", nullptr, OHPreviewOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPreviewOutputDeleteProfile", nullptr, OHPreviewOutputDeleteProfile, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHPhotoOutputGetActiveProfile", nullptr, OHPhotoOutputGetActiveProfile, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPhotoOutputDeleteProfile", nullptr, OHPhotoOutputDeleteProfile, nullptr, nullptr, nullptr, napi_default,
            nullptr},
    };
    napi_property_descriptor desc3[] = {
        {"oHCameraManagerTorchMode", nullptr, OHCameraManagerTorchMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCameraManagerIsTorchSupported", nullptr, OHCameraManagerIsTorchSupported, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCameraManagerIsTorchSupportedByTorchMode", nullptr, OHCameraManagerIsTorchSupportedByTorchMode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCameraManagerSetTorchMode", nullptr, OHCameraManagerSetTorchMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionGetExposureValue", nullptr, OHCaptureSessionGetExposureValue, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionGetFocalLength", nullptr, OHCaptureSessionGetFocalLength, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionSetSmoothZoom", nullptr, OHCaptureSessionSetSmoothZoom, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCaptureSessionGetSupportedColorSpaces", nullptr, OHCaptureSessionGetSupportedColorSpaces, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionDeleteColorSpaces", nullptr, OHCaptureSessionDeleteColorSpaces, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionGetActiveColorSpace", nullptr, OHCaptureSessionGetActiveColorSpace, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeBufferColorSpace", nullptr, OHNativeBufferColorSpace, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHCaptureSessionSetActiveColorSpace", nullptr, OHCaptureSessionSetActiveColorSpace, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHPreviewOutputGetSupportedFrameRates", nullptr, OHPreviewOutputGetSupportedFrameRates, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHPreviewOutputSetFrameRate", nullptr, OHPreviewOutputSetFrameRate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHPreviewOutputGetActiveFrameRate", nullptr, OHPreviewOutputGetActiveFrameRate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHVideoOutputGetSupportedFrameRates", nullptr, OHVideoOutputGetSupportedFrameRates, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHVideoOutputSetFrameRate", nullptr, OHVideoOutputSetFrameRate, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHVideoOutputGetActiveFrameRate", nullptr, OHVideoOutputGetActiveFrameRate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHVideoOutputDeleteFrameRates", nullptr, OHVideoOutputDeleteFrameRates, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHPreviewOutputDeleteFrameRates", nullptr, OHPreviewOutputDeleteFrameRates, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHCameraManagerGetSupportedCameraInfos", nullptr, CameraManagerGetSupportedCameraInfos, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHCameraManagerRegisterTorchStatusCallback", nullptr, OHCameraManagerRegisterTorchStatusCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHCameraManagerUnregisterTorchStatusCallback", nullptr, OHCameraManagerUnregisterTorchStatusCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionRegisterSmoothZoomInfoCallback", nullptr, OHCaptureSessionRegisterSmoothZoomInfoCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHCaptureSessionUnregisterSmoothZoomInfoCallback", nullptr,
         OHCaptureSessionUnregisterSmoothZoomInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterCaptureStartWithInfoCallback", nullptr,
         OHPhotoOutputRegisterCaptureStartWithInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterCaptureStartWithInfoCallback", nullptr,
         OHPhotoOutputUnregisterCaptureStartWithInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterCaptureEndCallback", nullptr, OHPhotoOutputRegisterCaptureEndCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterCaptureEndCallback", nullptr, OHPhotoOutputUnregisterCaptureEndCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterFrameShutterEndCallback", nullptr, OHPhotoOutputRegisterFrameShutterEndCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterFrameShutterEndCallback", nullptr, OHPhotoOutputUnregisterFrameShutterEndCallback,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterCaptureReadyCallback", nullptr, OHPhotoOutputRegisterCaptureReadyCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterCaptureReadyCallback", nullptr, OHPhotoOutputUnregisterCaptureReadyCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterEstimatedCaptureDurationCallback", nullptr,
         OHPhotoOutputRegisterEstimatedCaptureDurationCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterEstimatedCaptureDurationCallback", nullptr,
         OHPhotoOutputUnregisterEstimatedCaptureDurationCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_property_descriptor desc4[] = {
        {"oHPhotoOutputRegisterPhotoAvailableCallback", nullptr, OHPhotoOutputRegisterPhotoAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterPhotoAvailableCallback", nullptr, OHPhotoOutputUnregisterPhotoAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputRegisterPhotoAssetAvailableCallback", nullptr, OHPhotoOutputRegisterPhotoAssetAvailableCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputUnregisterPhotoAssetAvailableCallback", nullptr,
            OHPhotoOutputUnregisterPhotoAssetAvailableCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPhotoOutputIsMovingPhotoSupported", nullptr, OHPhotoOutputIsMovingPhotoSupported, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPhotoOutputEnableMovingPhoto", nullptr, OHPhotoOutputEnableMovingPhoto, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"oHPhotoNativeGetMainImage", nullptr, OHPhotoNativeGetMainImage, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHPhotoNativeRelease", nullptr, OHPhotoNativeRelease, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"oHCameraManagerCreatePhotoOutputWithoutSurface", nullptr, OHCameraManagerCreatePhotoOutputWithoutSurface,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseCamera", nullptr, ReleaseCamera, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readyCreatePhotoOutputWithoutSurface", nullptr, ReadyCreatePhotoOutputWithoutSurface, nullptr, nullptr,
            nullptr, napi_default, nullptr},
    };
    size_t mergedLength = sizeof(desc) / sizeof(desc[0]) +
                          sizeof(desc1) / sizeof(desc1[0]) +
                          sizeof(desc2) / sizeof(desc2[0]) +
                          sizeof(desc3) / sizeof(desc3[0]) +
                          sizeof(desc4) / sizeof(desc4[0]);
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc) / sizeof(desc[0]); ++i) {
        mergedArray[i] = desc[i];
    }
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + i] = desc1[i];
    }
    for (size_t i = 0; i < sizeof(desc2) / sizeof(desc2[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + sizeof(desc1) / sizeof(desc1[0]) + i] = desc2[i];
    }
    for (size_t i = 0; i < sizeof(desc3) / sizeof(desc3[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + sizeof(desc1) / sizeof(desc1[0]) +
            sizeof(desc2) / sizeof(desc2[0]) + i] = desc3[i];
    }
    for (size_t i = 0; i < sizeof(desc4) / sizeof(desc4[0]); ++i) {
        mergedArray[sizeof(desc) / sizeof(desc[0]) + sizeof(desc1) / sizeof(desc1[0]) +
        sizeof(desc2) / sizeof(desc2[0]) + sizeof(desc3) / sizeof(desc3[0]) + i] = desc4[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
};
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
