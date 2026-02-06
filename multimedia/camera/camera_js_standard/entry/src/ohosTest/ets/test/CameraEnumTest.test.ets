/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import camera from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

const TAG = "CameraEnumTest: ";

export default function cameraEnumTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  describe('CameraEnumTest', () => {
    console.info(TAG + '----------CameraEnumTest--------------');

    beforeAll(async () => {
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('afterAll case');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_CAMERASTATUS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_CAMERASTATUS_0100
     * @tc.desc   Camera CameraStatus Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_CAMERASTATUS_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CAMERASTATUS_0100--------------");
      expect(camera.CameraStatus.CAMERA_STATUS_APPEAR == 0).assertTrue();
      expect(camera.CameraStatus.CAMERA_STATUS_DISAPPEAR == 1).assertTrue();
      expect(camera.CameraStatus.CAMERA_STATUS_AVAILABLE == 2).assertTrue();
      expect(camera.CameraStatus.CAMERA_STATUS_UNAVAILABLE == 3).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CAMERASTATUS_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION_0100
     * @tc.desc   Camera CameraPosition Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION_0100--------------");
      expect(camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED == 0).assertTrue();
      expect(camera.CameraPosition.CAMERA_POSITION_BACK == 1).assertTrue();
      expect(camera.CameraPosition.CAMERA_POSITION_FRONT == 2).assertTrue();
      expect(camera.CameraPosition.CAMERA_POSITION_FOLD_INNER == 3).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100
     * @tc.desc   Camera ScenMode Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100--------------");
      expect(camera.SceneMode.NORMAL_PHOTO == 1).assertTrue();
      expect(camera.SceneMode.NORMAL_VIDEO == 2).assertTrue();
      expect(camera.SceneMode.SECURE_PHOTO == 12).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE_0100
     * @tc.desc   Camera CameraType Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE_0100--------------");
      console.info("CameraType: " + JSON.stringify(camera.CameraType));
      expect(camera.CameraType.CAMERA_TYPE_DEFAULT == 0).assertTrue();
      expect(camera.CameraType.CAMERA_TYPE_WIDE_ANGLE == 1).assertTrue();
      expect(camera.CameraType.CAMERA_TYPE_ULTRA_WIDE == 2).assertTrue();
      expect(camera.CameraType.CAMERA_TYPE_TELEPHOTO == 3).assertTrue();
      expect(camera.CameraType.CAMERA_TYPE_TRUE_DEPTH == 4).assertTrue();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE_0100
     * @tc.desc   Camera ConnectionType Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE_0100--------------");
      expect(camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN == 0).assertTrue();
      expect(camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN == 1).assertTrue();
      expect(camera.ConnectionType.CAMERA_CONNECTION_REMOTE == 2).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_HOSTDEVICETYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_HOSTDEVICETYPE_0100
     * @tc.desc   Camera HostDeviceType Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_HOSTDEVICETYPE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_HOSTDEVICETYPE_0100--------------");
      expect(camera.HostDeviceType.UNKNOWN_TYPE == 0).assertTrue();
      expect(camera.HostDeviceType.PHONE == 0x0E).assertTrue();
      expect(camera.HostDeviceType.TABLET == 0x11).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_HOSTDEVICETYPE_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAFORMAT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAFORMAT_0100
     * @tc.desc   Camera CameraFormat Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAFORMAT_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAFORMAT_0100--------------");
      expect(camera.CameraFormat.CAMERA_FORMAT_RGBA_8888 == 3).assertTrue();
      expect(camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP == 1003).assertTrue();
      expect(camera.CameraFormat.CAMERA_FORMAT_JPEG == 2000).assertTrue();
      expect(camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 == 2001).assertTrue();
      expect(camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 == 2002).assertTrue();
      expect(camera.CameraFormat.CAMERA_FORMAT_HEIC == 2003).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAFORMAT_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_FLASHMODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_FLASHMODE_0100
     * @tc.desc   Camera FlashMode Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_FLASHMODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_FLASHMODE_0100--------------");
      expect(camera.FlashMode.FLASH_MODE_CLOSE == 0).assertTrue();
      expect(camera.FlashMode.FLASH_MODE_OPEN == 1).assertTrue();
      expect(camera.FlashMode.FLASH_MODE_AUTO == 2).assertTrue();
      expect(camera.FlashMode.FLASH_MODE_ALWAYS_OPEN == 3).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_FLASHMODE_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_EXPOSUREMODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_EXPOSUREMODE_0100
     * @tc.desc   CameraExposureMode  Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_EXPOSUREMODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_EXPOSUREMODE_0100--------------");
      expect(camera.ExposureMode.EXPOSURE_MODE_LOCKED == 0).assertTrue();
      expect(camera.ExposureMode.EXPOSURE_MODE_AUTO == 1).assertTrue();
      expect(camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO == 2).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_EXPOSUREMODE_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSMODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSMODE_0100
     * @tc.desc   Camera FocusMode  Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSMODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSMODE_0100--------------");
      expect(camera.FocusMode.FOCUS_MODE_MANUAL == 0).assertTrue();
      expect(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO == 1).assertTrue();
      expect(camera.FocusMode.FOCUS_MODE_AUTO == 2).assertTrue();
      expect(camera.FocusMode.FOCUS_MODE_LOCKED == 3).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSMODE_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSSTATE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSSTATE_0100
     * @tc.desc   Camera FocusState Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSSTATE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSSTATE_0100--------------");
      expect(camera.FocusState.FOCUS_STATE_SCAN == 0).assertTrue();
      expect(camera.FocusState.FOCUS_STATE_FOCUSED == 1).assertTrue();
      expect(camera.FocusState.FOCUS_STATE_UNFOCUSED == 2).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSSTATE_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOSTABILIZATIONMODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOSTABILIZATIONMODE_0100
     * @tc.desc   Camera VideoStabilizationMode Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOSTABILIZATIONMODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOSTABILIZATIONMODE_0100--------------");
      expect(camera.VideoStabilizationMode.OFF == 0).assertTrue();
      expect(camera.VideoStabilizationMode.LOW == 1).assertTrue();
      expect(camera.VideoStabilizationMode.MIDDLE == 2).assertTrue();
      expect(camera.VideoStabilizationMode.HIGH == 3).assertTrue();
      expect(camera.VideoStabilizationMode.AUTO == 4).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOSTABILIZATIONMODE_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_IMAGEROTATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_IMAGEROTATION_0100
     * @tc.desc   Camera ImageRotation Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_IMAGEROTATION_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_IMAGEROTATION_0100--------------");
      expect(camera.ImageRotation.ROTATION_0 == 0).assertTrue();
      expect(camera.ImageRotation.ROTATION_90 == 90).assertTrue();
      expect(camera.ImageRotation.ROTATION_180 == 180).assertTrue();
      expect(camera.ImageRotation.ROTATION_270 == 270).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_IMAGEROTATION_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_QUALITYLEVEL_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_QUALITYLEVEL_0100
     * @tc.desc   Camera QualityLevel Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_QUALITYLEVEL_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_QUALITYLEVEL_0100--------------");
      expect(camera.QualityLevel.QUALITY_LEVEL_HIGH == 0).assertTrue();
      expect(camera.QualityLevel.QUALITY_LEVEL_MEDIUM == 1).assertTrue();
      expect(camera.QualityLevel.QUALITY_LEVEL_LOW == 2).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_QUALITYLEVEL_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100
     * @tc.desc   Camera MetadataObjectType Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100--------------");
      expect(camera.MetadataObjectType.FACE_DETECTION == 0).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAERRORCODE_0100
     * @tc.desc   Camera CameraErrorCode Eunm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAERRORCODE_0100--------------");
      expect(camera.CameraErrorCode.INVALID_ARGUMENT == 7400101).assertTrue();
      console.info(TAG + "--------------INVALID_ARGUMENT--------------");
      expect(camera.CameraErrorCode.OPERATION_NOT_ALLOWED == 7400102).assertTrue();
      console.info(TAG + "--------------OPERATION_NOT_ALLOWED--------------");
      expect(camera.CameraErrorCode.SESSION_NOT_CONFIG == 7400103).assertTrue();
      console.info(TAG + "--------------SESSION_NOT_CONFIG--------------");
      expect(camera.CameraErrorCode.SESSION_NOT_RUNNING == 7400104).assertTrue();
      console.info(TAG + "--------------SESSION_NOT_RUNNING--------------");
      expect(camera.CameraErrorCode.SESSION_CONFIG_LOCKED == 7400105).assertTrue();
      console.info(TAG + "--------------SESSION_CONFIG_LOCKED--------------");
      expect(camera.CameraErrorCode.DEVICE_SETTING_LOCKED == 7400106).assertTrue();
      console.info(TAG + "--------------DEVICE_SETTING_LOCKED--------------");
      expect(camera.CameraErrorCode.CONFLICT_CAMERA == 7400107).assertTrue();
      console.info(TAG + "--------------CONFLICT_CAMERA--------------");
      expect(camera.CameraErrorCode.DEVICE_DISABLED == 7400108).assertTrue();
      console.info(TAG + "--------------DEVICE_DISABLED--------------");
      expect(camera.CameraErrorCode.DEVICE_PREEMPTED == 7400109).assertTrue();
      console.info(TAG + "--------------DEVICE_PREEMPTED --------------");
      expect(camera.CameraErrorCode.UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS == 7400110).assertTrue();
      console.info(TAG + "--------------UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS --------------");
      expect(camera.CameraErrorCode.SERVICE_FATAL_ERROR == 7400201).assertTrue();
      console.info(TAG + "--------------SERVICE_FATAL_ERROR--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAERRORCODE_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_TORCH_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_TORCH_0100
     * @tc.desc   assert all torchMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_TORCH_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.TorchMode.OFF == 0).assertTrue();
      console.info(`${TAG} TorchMode.OFF: ${camera.TorchMode.OFF}`);
      expect(camera.TorchMode.ON == 1).assertTrue();
      console.info(`${TAG} TorchMode.ON: ${camera.TorchMode.ON}`);
      expect(camera.TorchMode.AUTO == 2).assertTrue();
      console.info(`${TAG} TorchMode.AUTO: ${camera.TorchMode.AUTO}`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOCODECTYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOCODECTYPE_0100
     * @tc.desc   assert all VideoCodecType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOCODECTYPE_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.VideoCodecType.AVC == 0).assertTrue();
      console.info(`${TAG} VideoCodecType.AVC: ${camera.VideoCodecType.AVC}`);
      expect(camera.VideoCodecType.HEVC == 1).assertTrue();
      console.info(`${TAG} VideoCodecType.HEVC: ${camera.VideoCodecType.HEVC}`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0100
     * @tc.desc   assert all preconfig type enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.PreconfigType.PRECONFIG_720P == 0).assertTrue();
      console.info(`${TAG} PreconfigType.PRECONFIG_720P:${camera.PreconfigType.PRECONFIG_720P}`);
      expect(camera.PreconfigType.PRECONFIG_1080P == 1).assertTrue();
      console.info(`${TAG} PreconfigType.PRECONFIG_1080P:${camera.PreconfigType.PRECONFIG_1080P}`);
      expect(camera.PreconfigType.PRECONFIG_4K == 2).assertTrue();
      console.info(`${TAG} PreconfigType.PRECONFIG_4K:${camera.PreconfigType.PRECONFIG_4K}`);
      expect(camera.PreconfigType.PRECONFIG_HIGH_QUALITY == 3).assertTrue();
      console.info(`${TAG} PreconfigType.PRECONFIG_HIGH_QUALITY:${camera.PreconfigType.PRECONFIG_HIGH_QUALITY}`);
      expect(camera.PreconfigType.PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020 == 4).assertTrue();
      console.info(`${TAG} PreconfigType.PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020:${camera.PreconfigType.PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020}`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0101
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0101
     * @tc.desc   assert all preconfig ratio enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0101', Level.LEVEL0, async (done: Function) => {
      expect(camera.PreconfigRatio.PRECONFIG_RATIO_1_1 == 0).assertTrue();
      console.info(`${TAG} PreconfigRatio.PRECONFIG_RATIO_1_1:${camera.PreconfigRatio.PRECONFIG_RATIO_1_1}`);
      expect(camera.PreconfigRatio.PRECONFIG_RATIO_4_3 == 1).assertTrue();
      console.info(`${TAG} PreconfigRatio.PRECONFIG_RATIO_4_3:${camera.PreconfigRatio.PRECONFIG_RATIO_4_3}`);
      expect(camera.PreconfigRatio.PRECONFIG_RATIO_16_9 == 2).assertTrue();
      console.info(`${TAG} PreconfigRatio.PRECONFIG_RATIO_16_9:${camera.PreconfigRatio.PRECONFIG_RATIO_16_9}`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_FOLD_STATUS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_FOLD_STATUS_0100
     * @tc.desc   assert all fold status enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_FOLD_STATUS_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.FoldStatus.NON_FOLDABLE == 0).assertTrue();
      console.info(`${TAG} FoldStatus.NON_FOLDABLE:${camera.FoldStatus.NON_FOLDABLE}`);
      expect(camera.FoldStatus.EXPANDED == 1).assertTrue();
      console.info(`${TAG} FoldStatus.EXPANDED:${camera.FoldStatus.EXPANDED}`);
      expect(camera.FoldStatus.FOLDED == 2).assertTrue();
      console.info(`${TAG} FoldStatus.FOLDED:${camera.FoldStatus.FOLDED}`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_SMOOTH_ZOOM_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_SMOOTH_ZOOM_MODE_0100
     * @tc.desc   assert all smooth zoom mode enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_SMOOTH_ZOOM_MODE_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.SmoothZoomMode.NORMAL == 0).assertTrue();
      console.info(`${TAG} SmoothZoomMode.NORMAL:${camera.SmoothZoomMode.NORMAL}`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_CONCURRENT_TYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_CONCURRENT_TYPE_0100
     * @tc.desc   assert all concurrent type  enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_CONCURRENT_TYPE_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.CameraConcurrentType.CAMERA_LIMITED_CAPABILITY == 0).assertTrue();
      console.info(`${TAG} CameraConcurrentType.CAMERA_LIMITED_CAPABILITY:${camera.CameraConcurrentType.CAMERA_LIMITED_CAPABILITY}`);
      expect(camera.CameraConcurrentType.CAMERA_FULL_CAPABILITY == 1).assertTrue();
      console.info(`${TAG} CameraConcurrentType.CAMERA_FULL_CAPABILITY:${camera.CameraConcurrentType.CAMERA_FULL_CAPABILITY}`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENUM_PHOTO_QUALITY_PRIORITIZATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENUM_PHOTO_QUALITY_PRIORITIZATION_0100
     * @tc.desc   assert all photo quality prioritization enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_PHOTO_QUALITY_PRIORITIZATION_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.PhotoQualityPrioritization.HIGH_QUALITY == 0).assertTrue();
      console.info(`${TAG} PhotoQualityPrioritization.HIGH_QUALITY:${camera.PhotoQualityPrioritization.HIGH_QUALITY}`);
      expect(camera.PhotoQualityPrioritization.SPEED == 1).assertTrue();
      console.info(`${TAG} PhotoQualityPrioritization.SPEED:${camera.PhotoQualityPrioritization.SPEED}`);
      done();
    })
  })
}