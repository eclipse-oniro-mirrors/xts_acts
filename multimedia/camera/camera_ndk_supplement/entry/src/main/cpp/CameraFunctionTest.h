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

#ifndef CAMERA_TEST_SUPPLEMENT_CAMERAFUNCTIONTEST_H
#define CAMERA_TEST_SUPPLEMENT_CAMERAFUNCTIONTEST_H

#include <CameraTest.h>

class CameraFunctionTest : public NDKCamera {
public:
    explicit CameraFunctionTest(char *surfaceId, char *videoId) : NDKCamera(surfaceId)
    {
        videoOutput_ = nullptr;
        videoId_ = std::string(videoId);
    }
    Camera_ErrorCode CreateVideoOutput(void);
    Camera_ErrorCode ReleaseVideoOutput(void);

    int32_t OHGetCameraManagerInvalidTest(int32_t caseCode);
    int32_t OHCameraDeleteCameraManagerTest(int32_t caseCode);
    int32_t OHCameraDeviceGetCameraOrientationTest(int32_t caseCode);
    int32_t OHCameraDeviceGetHostDeviceNameTest(int32_t caseCode);
    int32_t OHCameraDeviceGetHostDeviceTypeTest(int32_t caseCode);
    int32_t OHCameraInputRegisterCallbackTest(int32_t caseCode);
    int32_t OHCameraInputUnregisterCallbackTest(int32_t caseCode);
    int32_t OHCameraInputOpenTest(int32_t caseCode);
    int32_t OHCameraInputOpenSecureCameraTest(int32_t caseCode);
    int32_t OHCameraInputOpenConcurrentCamerasTest(int32_t caseCode);
    int32_t OHCameraInputCloseTest(int32_t caseCode);
    int32_t OHCameraInputReleaseTest(int32_t caseCode);
    int32_t OHCameraManagerRegisterCallbackTest(int32_t caseCode);
    int32_t OHCameraManagerUnregisterCallbackTest(int32_t caseCode);
    int32_t OHCameraManagerGetSupportedCamerasTest(int32_t caseCode);
    int32_t OHCameraManagerDeleteSupportedCamerasTest(int32_t caseCode);
    int32_t OHCameraManagerGetSupportedCameraOutputCapabilityTest(int32_t caseCode);
    int32_t OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest(int32_t caseCode);
    int32_t OHCameraManagerDeleteSupportedCameraOutputCapabilityTest(int32_t caseCode);
    int32_t OHCameraManagerIsCameraMutedTest(int32_t caseCode);
    int32_t OHCameraManagerCreateCaptureSessionTest(int32_t caseCode);
    int32_t OHCameraManagerCreateCameraInputTest(int32_t caseCode);
    int32_t OHCameraManagerCreateCameraInputWithPositionAndTypeTest(int32_t caseCode);
    int32_t OHCameraManagerCreatePreviewOutputTest(int32_t caseCode);
    int32_t OHCameraManagerCreatePreviewOutputUsedInPreconfigTest(int32_t caseCode);
    int32_t OHCameraManagerCreatePhotoOutputTest(int32_t caseCode);
    int32_t OHCameraManagerCreatePhotoOutputUsedInPreconfigTest(int32_t caseCode);
    int32_t OHCameraManagerCreatePhotoOutputWithoutSurfaceTest(int32_t caseCode);
    int32_t OHCameraManagerCreateVideoOutputTest(int32_t caseCode);
    int32_t OHCameraManagerCreateVideoOutputUsedInPreconfigTest(int32_t caseCode);
    int32_t OHCameraManagerCreateMetadataOutputTest(int32_t caseCode);
    int32_t OHCameraManagerGetSupportedSceneModesTest(int32_t caseCode);
    int32_t OHCameraManagerIsTorchSupportedByTorchModeTest(int32_t caseCode);
    int32_t OHCameraManagerSetTorchModeTest(int32_t caseCode);
    int32_t OHCameraManagerGetCameraDeviceTest(int32_t caseCode);
    int32_t OHCameraManagerGetCameraConcurrentInfosTest(int32_t caseCode);
    int32_t OHCaptureSessionSetSessionModeTest(int32_t caseCode);
    int32_t OHCaptureSessionBeginConfigTest(int32_t caseCode);
    int32_t OHCaptureSessionCommitConfigTest(int32_t caseCode);
    int32_t OHCaptureSessionAddInputTest(int32_t caseCode);
    int32_t OHCaptureSessionRemoveInputTest(int32_t caseCode);
    int32_t OHCaptureSessionAddPreviewOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionRemovePreviewOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionAddPhotoOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionRemovePhotoOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionAddVideoOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionRemoveVideoOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionAddMetadataOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionRemoveMetadataOutputTest(int32_t caseCode);
    int32_t OHCaptureSessionStartTestTest(int32_t caseCode);
    int32_t OHCaptureSessionStopTest(int32_t caseCode);
    int32_t OHCaptureSessionReleaseTest(int32_t caseCode);
    int32_t OHCaptureSessionHasFlashTest(int32_t caseCode);
    int32_t OHCaptureSessionIsFlashModeSupportedTest(int32_t caseCode);
    int32_t OHCaptureSessionGetFlashModeTest(int32_t caseCode);
    int32_t OHCaptureSessionSetFlashModeTest(int32_t caseCode);
    int32_t OHCaptureSessionIsExposureModeSupportedTest(int32_t caseCode);
    int32_t OHCaptureSessionGetExposureModeTest(int32_t caseCode);
    int32_t OHCaptureSessionSetExposureModeTest(int32_t caseCode);
    int32_t OHCaptureSessionGetMeteringPointTest(int32_t caseCode);
    int32_t OHCaptureSessionSetMeteringPointTest(int32_t caseCode);
    int32_t OHCaptureSessionGetExposureBiasRangeTest(int32_t caseCode);
    int32_t OHCaptureSessionSetExposureBiasTest(int32_t caseCode);
    int32_t OHCaptureSessionGetExposureBiasTest(int32_t caseCode);
    int32_t OHCaptureSessionIsFocusModeSupportedTest(int32_t caseCode);
    int32_t OHCaptureSessionGetFocusModeTest(int32_t caseCode);
    int32_t OHCaptureSessionSetFocusModeTest(int32_t caseCode);
    int32_t OHCaptureSessionGetFocusPointTest(int32_t caseCode);
    int32_t OHCaptureSessionSetFocusPointTest(int32_t caseCode);
    int32_t OHCaptureSessionGetZoomRatioRangeTest(int32_t caseCode);
    int32_t OHCaptureSessionGetZoomRatioTest(int32_t caseCode);
    int32_t OHCaptureSessionSetZoomRatioTest(int32_t caseCode);
    int32_t OHCaptureSessionIsVideoStabilizationModeSupportedTest(int32_t caseCode);
    int32_t OHCaptureSessionGetVideoStabilizationModeTest(int32_t caseCode);
    int32_t OHCaptureSessionSetVideoStabilizationModeTest(int32_t caseCode);
    int32_t OHCaptureSessionPreconfigTest(int32_t caseCode);
    int32_t OHCaptureSessionPreconfigWithRatioTest(int32_t caseCode);
    int32_t OHCaptureSessionGetExposureValueTest(int32_t caseCode);
    int32_t OHCaptureSessionGetFocalLengthTest(int32_t caseCode);
    int32_t OHCaptureSessionSetSmoothZoomTest(int32_t caseCode);
    int32_t OHCaptureSessionGetActiveColorSpaceTest(int32_t caseCode);
    int32_t OHCaptureSessionSetActiveColorSpaceTest(int32_t caseCode);

private:
    Camera_VideoOutput* videoOutput_;
    std::string videoId_;
};


#endif //CAMERA_TEST_SUPPLEMENT_CAMERAFUNCTIONTEST_H
