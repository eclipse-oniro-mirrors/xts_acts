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


#include "CameraFunctionTest.h"
#include "native_common.h"
#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include <string>
#include <vector>
#include <map>
#include <functional>

#define TEST_OK 0
#define TEST_FAILED (-1)

static CameraFunctionTest *g_ndkCamera = nullptr;
using ArkCameraTestFunc = napi_value (*)(napi_env, napi_callback_info);
using ArkCameraTestFuncEx = napi_value (*)(napi_env, napi_callback_info, int32_t);

static napi_value ExecuteCameraFunction(napi_env env, napi_callback_info info, std::function<int()> cameraFunc)
{
    int ret = cameraFunc();
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ExecuteCameraIntArgFunction(napi_env env, napi_callback_info info, int32_t caseCode,
                                              const std::function<int32_t(int32_t)> &cameraFunc)
{
    int ret = cameraFunc(caseCode);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ExecuteCameraIntArgOp(napi_env env, napi_callback_info info,
                                        std::function<Camera_ErrorCode(int32_t)> cameraOp)
{
    int32_t index = CameraTestUtils::GetArgsOneParameterByInt(env, info);
    int ret = TEST_FAILED;
    if (cameraOp(index) == TEST_OK) {
        ret = TEST_OK;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value InitCamera(napi_env env, napi_callback_info info)
{
    char *surfaceId = CameraTestUtils::GetArgsOneParameterByStr(env, info);
    g_ndkCamera = new CameraFunctionTest(surfaceId, surfaceId);
    napi_value result;
    if (g_ndkCamera->valid_) {
        napi_create_int32(env, CAMERA_OK, &result);
    } else {
        napi_create_int32(env, CAMERA_SERVICE_FATAL_ERROR, &result);
    }
    return result;
}

static napi_value ReleaseCameraManger(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_ndkCamera->valid_) {
        int ret = g_ndkCamera->ReleaseCameraManger();
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, CAMERA_OK, &result);
    return result;
}

static napi_value OHCameraOperationNotAllowed(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_OPERATION_NOT_ALLOWED;
    if (expect == g_ndkCamera->CameraOperationNotAllowed()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraSessionNotConfig(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_SESSION_NOT_CONFIG;
    if (expect == g_ndkCamera->CameraSessionNotConfig()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraSessionNotRunning(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_SESSION_NOT_RUNNING;
    if (expect == g_ndkCamera->CameraSessionNotRunning()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraSessionConfigLocked(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_SESSION_CONFIG_LOCKED;
    if (expect == g_ndkCamera->CameraSessionConfigLocked()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraDeviceSettingLocked(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_DEVICE_SETTING_LOCKED;
    if (expect == g_ndkCamera->FrameworkToNdkCameraError(CAMERA_DEVICE_SETTING_LOCKED)) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraConflictCamera(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_CONFLICT_CAMERA;
    if (expect == g_ndkCamera->CameraConflictCamera()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraDeviceDisabled(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_DEVICE_DISABLED;
    if (expect == g_ndkCamera->CameraDeviceDisabled()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraDevicePreempted(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_DEVICE_PREEMPTED;
    if (expect == g_ndkCamera->CameraDevicePreempted()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraUnresolvedConflictsWithCurrentConfigurations(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS;
    if (expect == g_ndkCamera->CameraUnresolvedConflictsWithCurrentConfigurations()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

const std::map<std::string, ArkCameraTestFunc> FunctionErroCodeMap = {
    {"CAMERA_OPERATION_NOT_ALLOWED", OHCameraOperationNotAllowed},
    {"CAMERA_SESSION_NOT_CONFIG", OHCameraSessionNotConfig},
    {"CAMERA_SESSION_NOT_RUNNING", OHCameraSessionNotRunning},
    {"CAMERA_SESSION_CONFIG_LOCKED", OHCameraSessionConfigLocked},
    {"CAMERA_DEVICE_SETTING_LOCKED", OHCameraDeviceSettingLocked},
    {"CAMERA_CONFLICT_CAMERA", OHCameraConflictCamera},
    {"CAMERA_DEVICE_DISABLED", OHCameraDeviceDisabled},
    {"CAMERA_DEVICE_PREEMPTED", OHCameraDevicePreempted},
    {"CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS", OHCameraUnresolvedConflictsWithCurrentConfigurations},
};

static napi_value CameraErrorCode(napi_env env, napi_callback_info info)
{
    char *errcode = CameraTestUtils::GetArgsOneParameterByStr(env, info);
    std::string key(errcode);

    auto it = FunctionErroCodeMap.find(key);
    if (it != FunctionErroCodeMap.end()) {
        return it->second(env, info);
    } else {
        OH_LOG_ERROR(LOG_APP, "CameraErrorCode find %{public}s failed....", key.c_str());
        napi_value result;
        napi_create_int32(env, TEST_FAILED, &result);
        return result;
    }
}

static napi_value OHCameraGetCameraManagerTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHGetCameraManagerInvalidTest(code);
    });
}

static napi_value OHCameraDeleteCameraManagerTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraDeleteCameraManagerTest(code);
    });
}

static napi_value OHCameraDeviceGetCameraOrientationTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraDeviceGetCameraOrientationTest(code);
    });
}

static napi_value OHCameraDeviceGetHostDeviceNameTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraDeviceGetHostDeviceNameTest(code);
    });
}

static napi_value OHCameraDeviceGetHostDeviceTypeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraDeviceGetHostDeviceTypeTest(code);
    });
}

static napi_value OHCameraInputRegisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputRegisterCallbackTest(code);
    });
}

static napi_value OHCameraInputUnregisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputUnregisterCallbackTest(code);
    });
}

static napi_value OHCameraInputOpenTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputOpenTest(code);
    });
}

static napi_value OHCameraInputOpenSecureCameraTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputOpenSecureCameraTest(code);
    });
}

static napi_value OHCameraInputOpenConcurrentCamerasTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputOpenConcurrentCamerasTest(code);
    });
}

static napi_value OHCameraInputCloseTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputCloseTest(code);
    });
}

static napi_value OHCameraInputReleaseTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputReleaseTest(code);
    });
}

static napi_value OHCameraManagerRegisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerRegisterCallbackTest(code);
    });
}

static napi_value OHCameraManagerUnregisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerUnregisterCallbackTest(code);
    });
}

static napi_value OHCameraManagerGetSupportedCamerasTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetSupportedCamerasTest(code);
    });
}

static napi_value OHCameraManagerDeleteSupportedCamerasTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerDeleteSupportedCamerasTest(code);
    });
}

static napi_value OHGetSupportedCameraOutputCapabilityTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetSupportedCameraOutputCapabilityTest(code);
    });
}

static napi_value OHCameraOutputCapabilityWithSceneModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest(code);
    });
}

static napi_value OHDeleteSupportedCameraOutputCapabilityTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerDeleteSupportedCameraOutputCapabilityTest(code);
    });
}

static napi_value OHCameraManagerIsCameraMutedTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerIsCameraMutedTest(code);
    });
}

static napi_value OHCameraManagerCreateCaptureSessionTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreateCaptureSessionTest(code);
    });
}

static napi_value OHCameraManagerCreateCameraInputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreateCameraInputTest(code);
    });
}

static napi_value OHCreateCameraInputWithPositionAndTypeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreateCameraInputWithPositionAndTypeTest(code);
    });
}

static napi_value OHCameraManagerCreatePreviewOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreatePreviewOutputTest(code);
    });
}

static napi_value OHCreatePreviewOutputUsedInPreconfigTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreatePreviewOutputUsedInPreconfigTest(code);
    });
}

static napi_value OHCameraManagerCreatePhotoOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreatePhotoOutputTest(code);
    });
}

static napi_value OHCreatePhotoOutputUsedInPreconfigTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreatePhotoOutputUsedInPreconfigTest(code);
    });
}

static napi_value OHCreatePhotoOutputWithoutSurfaceTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreatePhotoOutputWithoutSurfaceTest(code);
    });
}

static napi_value OHCameraManagerCreateVideoOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreateVideoOutputTest(code);
    });
}

static napi_value OHCreateVideoOutputUsedInPreconfigTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreateVideoOutputUsedInPreconfigTest(code);
    });
}

static napi_value OHCameraManagerCreateMetadataOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerCreateMetadataOutputTest(code);
    });
}

static napi_value OHCameraManagerGetSupportedSceneModesTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetSupportedSceneModesTest(code);
    });
}

static napi_value OHIsTorchSupportedByTorchModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerIsTorchSupportedByTorchModeTest(code);
    });
}

static napi_value OHCameraManagerSetTorchModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerSetTorchModeTest(code);
    });
}

static napi_value OHCameraManagerGetCameraDeviceTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetCameraDeviceTest(code);
    });
}

static napi_value OHCameraManagerGetCameraConcurrentInfosTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetCameraConcurrentInfosTest(code);
    });
}

static napi_value OHCaptureSessionSetSessionModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetSessionModeTest(code);
    });
}

static napi_value OHCaptureSessionBeginConfigTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionBeginConfigTest(code);
    });
}

static napi_value OHCaptureSessionCommitConfigTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionCommitConfigTest(code);
    });
}

static napi_value OHCaptureSessionAddInputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionAddInputTest(code);
    });
}

static napi_value OHCaptureSessionRemoveInputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionRemoveInputTest(code);
    });
}

static napi_value OHCaptureSessionAddPreviewOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionAddPreviewOutputTest(code);
    });
}

static napi_value OHCaptureSessionRemovePreviewOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionRemovePreviewOutputTest(code);
    });
}

static napi_value OHCaptureSessionAddPhotoOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionAddPhotoOutputTest(code);
    });
}

static napi_value OHCaptureSessionRemovePhotoOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionRemovePhotoOutputTest(code);
    });
}

static napi_value OHCaptureSessionAddVideoOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionAddVideoOutputTest(code);
    });
}

static napi_value OHCaptureSessionRemoveVideoOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionRemoveVideoOutputTest(code);
    });
}

static napi_value OHCaptureSessionAddMetadataOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionAddMetadataOutputTest(code);
    });
}

static napi_value OHCaptureSessionRemoveMetadataOutputTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionRemoveMetadataOutputTest(code);
    });
}

static napi_value OHCaptureSessionStartTestTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionStartTestTest(code);
    });
}

static napi_value OHCaptureSessionStopTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionStopTest(code);
    });
}

static napi_value OHCaptureSessionReleaseTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionReleaseTest(code);
    });
}

static napi_value OHCaptureSessionHasFlashTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionHasFlashTest(code);
    });
}

static napi_value OHCaptureSessionIsFlashModeSupportedTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionIsFlashModeSupportedTest(code);
    });
}

static napi_value OHCaptureSessionGetFlashModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetFlashModeTest(code);
    });
}

static napi_value OHCaptureSessionSetFlashModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetFlashModeTest(code);
    });
}

static napi_value OHCaptureSessionIsExposureModeSupportedTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionIsExposureModeSupportedTest(code);
    });
}

static napi_value OHCaptureSessionGetExposureModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetExposureModeTest(code);
    });
}

static napi_value OHCaptureSessionSetExposureModeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetExposureModeTest(code);
    });
}

static napi_value OHCaptureSessionGetMeteringPointTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetMeteringPointTest(code);
    });
}

static napi_value OHCaptureSessionSetMeteringPointTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetMeteringPointTest(code);
    });
}

static napi_value OHCaptureSessionGetExposureBiasRangeTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetExposureBiasRangeTest(code);
    });
}

static napi_value OHCaptureSessionSetExposureBiasTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetExposureBiasTest(code);
    });
}

static napi_value OHCaptureSessionGetExposureBias(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetExposureBiasTest(code);
    });
}

static napi_value OHCaptureSessionIsFocusModeSupported(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionIsFocusModeSupportedTest(code);
    });
}

static napi_value OHCaptureSessionGetFocusMode(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetFocusModeTest(code);
    });
}

static napi_value OHCaptureSessionSetFocusMode(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetFocusModeTest(code);
    });
}

static napi_value OHCaptureSessionGetFocusPoint(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetFocusPointTest(code);
    });
}

static napi_value OHCaptureSessionSetFocusPoint(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetFocusPointTest(code);
    });
}

static napi_value OHCaptureSessionGetZoomRatioRange(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetZoomRatioRangeTest(code);
    });
}

static napi_value OHCaptureSessionGetZoomRatio(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetZoomRatioTest(code);
    });
}

static napi_value OHCaptureSessionSetZoomRatio(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetZoomRatioTest(code);
    });
}

static napi_value OHCaptureSessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info,
                                                                    
                                                                    int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionIsVideoStabilizationModeSupportedTest(code);
    });
}

static napi_value OHCaptureSessionGetVideoStabilizationMode(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetVideoStabilizationModeTest(code);
    });
}

static napi_value OHCaptureSessionSetVideoStabilizationMode(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetVideoStabilizationModeTest(code);
    });
}

static napi_value OHCaptureSessionPreconfig(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionPreconfigTest(code);
    });
}

static napi_value OHCaptureSessionPreconfigWithRatio(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionPreconfigWithRatioTest(code);
    });
}

static napi_value OHCaptureSessionGetExposureValue(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetExposureValueTest(code);
    });
}

static napi_value OHCaptureSessionGetFocalLength(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetFocalLengthTest(code);
    });
}

static napi_value OHCaptureSessionSetSmoothZoom(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetSmoothZoomTest(code);
    });
}

static napi_value OHCaptureSessionGetActiveColorSpace(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionGetActiveColorSpaceTest(code);
    });
}

static napi_value OHCaptureSessionSetActiveColorSpace(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCaptureSessionSetActiveColorSpaceTest(code);
    });
}

const std::map<std::string, ArkCameraTestFuncEx> CameraFunctionMap = {
    {"OH_Camera_GetCameraManager", OHCameraGetCameraManagerTest},
    {"OH_Camera_DeleteCameraManager", OHCameraDeleteCameraManagerTest},
    {"OH_CameraDevice_GetCameraOrientation", OHCameraDeviceGetCameraOrientationTest},
    {"OH_CameraDevice_GetHostDeviceName", OHCameraDeviceGetHostDeviceNameTest},
    {"OH_CameraDevice_GetHostDeviceType", OHCameraDeviceGetHostDeviceTypeTest},
    {"OH_CameraInput_RegisterCallback", OHCameraInputRegisterCallbackTest},
    {"OH_CameraInput_UnregisterCallback", OHCameraInputUnregisterCallbackTest},
    {"OH_CameraInput_Open", OHCameraInputOpenTest},
    {"OH_CameraInput_OpenSecureCamera", OHCameraInputOpenSecureCameraTest},
    {"OH_CameraInput_OpenConcurrentCameras", OHCameraInputOpenConcurrentCamerasTest},
    {"OH_CameraInput_Close", OHCameraInputCloseTest},
    {"OH_CameraInput_Release", OHCameraInputReleaseTest},
    {"OH_CameraManager_RegisterCallback", OHCameraManagerRegisterCallbackTest},
    {"OH_CameraManager_UnregisterCallback", OHCameraManagerUnregisterCallbackTest},
    {"OH_CameraManager_GetSupportedCameras", OHCameraManagerGetSupportedCamerasTest},
    {"OH_CameraManager_DeleteSupportedCameras", OHCameraManagerDeleteSupportedCamerasTest},
    {"OH_CameraManager_GetSupportedCameraOutputCapability", OHGetSupportedCameraOutputCapabilityTest},
    {"OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode", OHCameraOutputCapabilityWithSceneModeTest},
    {"OH_CameraManager_DeleteSupportedCameraOutputCapability", OHDeleteSupportedCameraOutputCapabilityTest},
    {"OH_CameraManager_IsCameraMuted", OHCameraManagerIsCameraMutedTest},
    {"OH_CameraManager_CreateCaptureSession", OHCameraManagerCreateCaptureSessionTest},
    {"OH_CameraManager_CreateCameraInput", OHCameraManagerCreateCameraInputTest},
    {"OH_CameraManager_CreateCameraInput_WithPositionAndType", OHCreateCameraInputWithPositionAndTypeTest},
    {"OH_CameraManager_CreatePreviewOutput", OHCameraManagerCreatePreviewOutputTest},
    {"OH_CameraManager_CreatePreviewOutputUsedInPreconfig", OHCreatePreviewOutputUsedInPreconfigTest},
    {"OH_CameraManager_CreatePhotoOutput", OHCameraManagerCreatePhotoOutputTest},
    {"OH_CameraManager_CreatePhotoOutputUsedInPreconfig", OHCreatePhotoOutputUsedInPreconfigTest},
    {"OH_CameraManager_CreatePhotoOutputWithoutSurface", OHCreatePhotoOutputWithoutSurfaceTest},
    {"OH_CameraManager_CreateVideoOutput", OHCameraManagerCreateVideoOutputTest},
    {"OH_CameraManager_CreateVideoOutputUsedInPreconfig", OHCreateVideoOutputUsedInPreconfigTest},
    {"OH_CameraManager_CreateMetadataOutput", OHCameraManagerCreateMetadataOutputTest},
    {"OH_CameraManager_GetSupportedSceneModes", OHCameraManagerGetSupportedSceneModesTest},
    {"OH_CameraManager_IsTorchSupportedByTorchMode", OHIsTorchSupportedByTorchModeTest},
    {"OH_CameraManager_SetTorchMode", OHCameraManagerSetTorchModeTest},
    {"OH_CameraManager_GetCameraDevice", OHCameraManagerGetCameraDeviceTest},
    {"OH_CameraManager_GetCameraConcurrentInfos", OHCameraManagerGetCameraConcurrentInfosTest},
};

const std::map<std::string, ArkCameraTestFuncEx> CaptureSessionFunctionMap = {
    {"OH_CaptureSession_SetSessionMode", OHCaptureSessionSetSessionModeTest},
    {"OH_CaptureSession_BeginConfig", OHCaptureSessionBeginConfigTest},
    {"OH_CaptureSession_CommitConfig", OHCaptureSessionCommitConfigTest},
    {"OH_CaptureSession_AddInput", OHCaptureSessionAddInputTest},
    {"OH_CaptureSession_RemoveInput", OHCaptureSessionRemoveInputTest},
    {"OH_CaptureSession_AddPreviewOutput", OHCaptureSessionAddPreviewOutputTest},
    {"OH_CaptureSession_RemovePreviewOutput", OHCaptureSessionRemovePreviewOutputTest},
    {"OH_CaptureSession_AddPhotoOutput", OHCaptureSessionAddPhotoOutputTest},
    {"OH_CaptureSession_RemovePhotoOutput", OHCaptureSessionRemovePhotoOutputTest},
    {"OH_CaptureSession_AddVideoOutput", OHCaptureSessionAddVideoOutputTest},
    {"OH_CaptureSession_RemoveVideoOutput", OHCaptureSessionRemoveVideoOutputTest},
    {"OH_CaptureSession_AddMetadataOutput", OHCaptureSessionAddMetadataOutputTest},
    {"OH_CaptureSession_RemoveMetadataOutput", OHCaptureSessionRemoveMetadataOutputTest},
    {"OH_CaptureSession_Start", OHCaptureSessionStartTestTest},
    {"OH_CaptureSession_Stop", OHCaptureSessionStopTest},
    {"OH_CaptureSession_Release", OHCaptureSessionReleaseTest},
    {"OH_CaptureSession_HasFlash", OHCaptureSessionHasFlashTest},
    {"OH_CaptureSession_IsFlashModeSupported", OHCaptureSessionIsFlashModeSupportedTest},
    {"OH_CaptureSession_GetFlashMode", OHCaptureSessionGetFlashModeTest},
    {"OH_CaptureSession_SetFlashMode", OHCaptureSessionSetFlashModeTest},
    {"OH_CaptureSession_IsExposureModeSupported", OHCaptureSessionIsExposureModeSupportedTest},
    {"OH_CaptureSession_GetExposureMode", OHCaptureSessionGetExposureModeTest},
    {"OH_CaptureSession_SetExposureMode", OHCaptureSessionSetExposureModeTest},
    {"OH_CaptureSession_GetMeteringPoint", OHCaptureSessionGetMeteringPointTest},
    {"OH_CaptureSession_SetMeteringPoint", OHCaptureSessionSetMeteringPointTest},
    {"OH_CaptureSession_GetExposureBiasRange", OHCaptureSessionGetExposureBiasRangeTest},
    {"OH_CaptureSession_SetExposureBias", OHCaptureSessionSetExposureBiasTest},
    {"OH_CaptureSession_GetExposureBias", OHCaptureSessionGetExposureBias},
    {"OH_CaptureSession_IsFocusModeSupported", OHCaptureSessionIsFocusModeSupported},
    {"OH_CaptureSession_GetFocusMode", OHCaptureSessionGetFocusMode},
    {"OH_CaptureSession_SetFocusMode", OHCaptureSessionSetFocusMode},
    {"OH_CaptureSession_GetFocusPoint", OHCaptureSessionGetFocusPoint},
    {"OH_CaptureSession_SetFocusPoint", OHCaptureSessionSetFocusPoint},
    {"OH_CaptureSession_GetZoomRatioRange", OHCaptureSessionGetZoomRatioRange},
    {"OH_CaptureSession_GetZoomRatio", OHCaptureSessionGetZoomRatio},
    {"OH_CaptureSession_SetZoomRatio", OHCaptureSessionSetZoomRatio},
    {"OH_CaptureSession_IsVideoStabilizationModeSupported", OHCaptureSessionIsVideoStabilizationModeSupported},
    {"OH_CaptureSession_GetVideoStabilizationMode", OHCaptureSessionGetVideoStabilizationMode},
    {"OH_CaptureSession_SetVideoStabilizationMode", OHCaptureSessionSetVideoStabilizationMode},
    {"OH_CaptureSession_Preconfig", OHCaptureSessionPreconfig},
    {"OH_CaptureSession_PreconfigWithRatio", OHCaptureSessionPreconfigWithRatio},
    {"OH_CaptureSession_GetExposureValue", OHCaptureSessionGetExposureValue},
    {"OH_CaptureSession_GetFocalLength", OHCaptureSessionGetFocalLength},
    {"OH_CaptureSession_SetSmoothZoom", OHCaptureSessionSetSmoothZoom},
    {"OH_CaptureSession_GetActiveColorSpace", OHCaptureSessionGetActiveColorSpace},
    {"OH_CaptureSession_SetActiveColorSpace", OHCaptureSessionSetActiveColorSpace},
};

static napi_value OHCameraFunctionHandle(napi_env env, napi_callback_info info)
{
    auto parameters = CameraTestUtils::GetArgsTwoParameters(env, info);
    std::string key(parameters.first);
    std::map<std::string, ArkCameraTestFuncEx> mergedMap;
    mergedMap.insert(CameraFunctionMap.begin(), CameraFunctionMap.end());
    mergedMap.insert(CaptureSessionFunctionMap.begin(), CaptureSessionFunctionMap.end());
    auto it = mergedMap.find(key);
    if (it != mergedMap.end()) {
        return it->second(env, info, parameters.second);
    } else {
        OH_LOG_ERROR(LOG_APP, "OHCameraFunctionHandle find %{public}s failed....", key.c_str());
        napi_value result;
        napi_create_int32(env, TEST_FAILED, &result);
        return result;
    }
}

static napi_value CameraStatusInfo(napi_env env, napi_callback_info info)
{
    char *charStatus = CameraTestUtils::GetArgsOneParameterByStr(env, info);
    int ret = TEST_FAILED;
    if (g_ndkCamera->SetCameraStatus(std::string(charStatus)) == TEST_OK) {
        ret = TEST_OK;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraFormat(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetCameraFormat(index);
    });
}

static napi_value CameraFlashMode(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->HasFlashMode(index);
    });
}

static napi_value GetExposureMode(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetExposureMode(index);
    });
}

static napi_value GetCameraFocusMode(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetCameraFocusMode(index);
    });
}

static napi_value GetCameraFocusState(napi_env env, napi_callback_info info)
{
    int32_t index = CameraTestUtils::GetArgsOneParameterByInt(env, info);
    int ret = TEST_FAILED;
    if (g_ndkCamera->CreateCaptureSession() == CAMERA_OK) {
        ret = TEST_OK;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionIsVideoStabilizationModeSupported(index);
    });
}

static napi_value TakePictureWithPhotoSettings(napi_env env, napi_callback_info info)
{
    auto indexPair = CameraTestUtils::GetArgsTwoParametersByInit(env, info);
    int ret = TEST_FAILED;
    if (g_ndkCamera->TakePictureWithPhotoSettings(indexPair.first, indexPair.second) == CAMERA_OK) {
        ret = TEST_OK;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetCameraConcurrentInfo(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetCameraConcurrentInfo(index);
    });
}

static napi_value SessionCanPreconfig(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionCanPreconfig(index);
    });
}

static napi_value SessionCanPreconfigWithRatio(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionCanPreconfigWithRatio(index);
    });
}

static napi_value PhotoOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->PhotoOutputRegisterCallback(); });
}

static napi_value MetadataOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->MetadataOutputRegisterCallback(); });
}

static napi_value CameraManagerRegisterTorchStatusCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->CameraManagerRegisterTorchStatusCallback(); });
}

static napi_value CaptureSessionRegisterSmoothZoomInfoCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->CaptureSessionRegisterSmoothZoomInfoCallback(); });
}

static napi_value PhotoOutputRegisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->PhotoOutputRegisterCaptureStartWithInfoCallback(); });
}

static napi_value CameraManagerRegisterFoldStatusCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->CameraManagerRegisterFoldStatusCallback(); });
}

static napi_value RegisterAutoDeviceSwitchStatusCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->RegisterAutoDeviceSwitchStatusCallback(); });
}

static napi_value SessionSetQualityPrioritization(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionSetQualityPrioritization(index);
    });
}

static napi_value CameraOpenConcurrentCameras(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->CameraOpenConcurrentCameras(index);
    });
}

static napi_value IsWhiteBalanceSupported(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->IsWhiteBalanceSupported(index);
    });
}

static napi_value RegisterSystemPressureLevel(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->RegisterSystemPressureLevel(); });
}

static napi_value CameraManagerGetSupportedCameras(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->CreateCameras(); });
}

static napi_value SessionGetSupportedEffectTypes(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionGetSupportedEffectTypes(index);
    });
}

static napi_value RegisterControlCenterEffectStatusChange(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->RegisterControlCenterEffectStatusChange(); });
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc = {
        DECLARE_NAPI_FUNCTION("initCamera", InitCamera),
        DECLARE_NAPI_FUNCTION("cameraManagerGetSupportedCameras", CameraManagerGetSupportedCameras),
        DECLARE_NAPI_FUNCTION("releaseCameraManger", ReleaseCameraManger),
        DECLARE_NAPI_FUNCTION("cameraErrorCode", CameraErrorCode),
        DECLARE_NAPI_FUNCTION("cameraStatusInfo", CameraStatusInfo),
        DECLARE_NAPI_FUNCTION("cameraFormat", CameraFormat),
        DECLARE_NAPI_FUNCTION("cameraFlashMode", CameraFlashMode),
        DECLARE_NAPI_FUNCTION("getExposureMode", GetExposureMode),
        DECLARE_NAPI_FUNCTION("getCameraFocusMode", GetCameraFocusMode),
        DECLARE_NAPI_FUNCTION("getCameraFocusState", GetCameraFocusState),
        DECLARE_NAPI_FUNCTION("sessionIsVideoStabilizationModeSupported", SessionIsVideoStabilizationModeSupported),
        DECLARE_NAPI_FUNCTION("takePictureWithPhotoSettings", TakePictureWithPhotoSettings),
        DECLARE_NAPI_FUNCTION("getCameraConcurrentInfo", GetCameraConcurrentInfo),
        DECLARE_NAPI_FUNCTION("sessionCanPreconfig", SessionCanPreconfig),
        DECLARE_NAPI_FUNCTION("sessionCanPreconfigWithRatio", SessionCanPreconfigWithRatio),
        DECLARE_NAPI_FUNCTION("photoOutputRegisterCallback", PhotoOutputRegisterCallback),
        DECLARE_NAPI_FUNCTION("metadataOutputRegisterCallback", MetadataOutputRegisterCallback),
        DECLARE_NAPI_FUNCTION("cameraManagerRegisterTorchStatusCallback", CameraManagerRegisterTorchStatusCallback),
        DECLARE_NAPI_FUNCTION("captureSessionRegisterSmoothZoomInfoCallback",
                              CaptureSessionRegisterSmoothZoomInfoCallback),
        DECLARE_NAPI_FUNCTION("photoOutputRegisterCaptureStartWithInfoCallback",
                              PhotoOutputRegisterCaptureStartWithInfoCallback),
        DECLARE_NAPI_FUNCTION("cameraManagerRegisterFoldStatusCallback", CameraManagerRegisterFoldStatusCallback),
        DECLARE_NAPI_FUNCTION("registerAutoDeviceSwitchStatusCallback", RegisterAutoDeviceSwitchStatusCallback),
        DECLARE_NAPI_FUNCTION("sessionSetQualityPrioritization", SessionSetQualityPrioritization),
        DECLARE_NAPI_FUNCTION("cameraOpenConcurrentCameras", CameraOpenConcurrentCameras),
        DECLARE_NAPI_FUNCTION("isWhiteBalanceSupported", IsWhiteBalanceSupported),
        DECLARE_NAPI_FUNCTION("registerSystemPressureLevel", RegisterSystemPressureLevel),
        DECLARE_NAPI_FUNCTION("sessionGetSupportedEffectTypes", SessionGetSupportedEffectTypes),
        DECLARE_NAPI_FUNCTION("OHCameraFunctionHandle", OHCameraFunctionHandle),
        DECLARE_NAPI_FUNCTION("registerControlCenterEffectStatusChange", RegisterControlCenterEffectStatusChange),
    };

    napi_define_properties(env, exports, desc.size(), desc.data());
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
