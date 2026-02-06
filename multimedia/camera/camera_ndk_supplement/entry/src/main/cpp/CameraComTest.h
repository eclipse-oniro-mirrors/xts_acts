/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef CAMERA_COM_TEST_H
#define CAMERA_COM_TEST_H
#include <ohcamera/camera_manager.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/photo_output.h>

namespace OHOS {
namespace CameraStandard {
class CameraNdkCommon {
public:
    static const int32_t photoDefaultWidth = 1280;
    static const int32_t photoDefaultHeight = 960;
    static const int32_t previewDefaultWidth = 640;
    static const int32_t previewDefaultHeight = 480;
    static const int32_t videoDefaultWidth = 640;
    static const int32_t videoDefaultHeight = 480;

    Camera_Manager *cameraManager = nullptr;
    Camera_Device *cameraDevice = nullptr;
    uint32_t cameraDeviceSize = 0;
    void InitCamera(void);
    void ReleaseCamera(void);
    ~CameraNdkCommon();
    void ObtainAvailableFrameRate(Camera_FrameRateRange activeframeRateRange, Camera_FrameRateRange*& frameRateRange,
                                  uint32_t size, int32_t &minFps, int32_t &maxFps);
    void SessionCommit(Camera_CaptureSession *captureSession);
    void SessionControlParams(Camera_CaptureSession *captureSession);
    Camera_PhotoOutput* CreatePhotoOutput(const char *surfaceId, int32_t width = photoDefaultWidth,
        int32_t height = photoDefaultHeight);
    Camera_PreviewOutput* CreatePreviewOutput(const char *surfaceId, int32_t width = previewDefaultWidth,
                                              int32_t height = previewDefaultHeight);
    Camera_VideoOutput* CreateVideoOutput(const char *surfaceId, int32_t width = videoDefaultWidth,
        int32_t height = videoDefaultHeight);
    Camera_MetadataOutput* CreateMetadataOutput(Camera_MetadataObjectType type);
};
} // CameraStandard
} // OHOS
#endif // CAMERA_COM_TEST_H