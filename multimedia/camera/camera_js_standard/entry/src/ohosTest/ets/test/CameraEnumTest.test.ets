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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CAMERASTATUS_0100
     * @tc.name      : Camera CameraStatus Eunm
     * @tc.desc      : Camera CameraStatus Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION_0100
     * @tc.name      : Camera CameraPosition Eunm
     * @tc.desc      : Camera CameraPosition Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100
     * @tc.name      : Camera ScenMode Eunm
     * @tc.desc      : Camera ScenMode Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100--------------");
      expect(camera.SceneMode.NORMAL_PHOTO == 1).assertTrue();
      expect(camera.SceneMode.NORMAL_VIDEO == 2).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_SCENEMODE_0100 ends here");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE_0100
     * @tc.name      : Camera CameraType Eunm
     * @tc.desc      : Camera CameraType Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE_0100
     * @tc.name      : Camera ConnectionType Eunm
     * @tc.desc      : Camera ConnectionType Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAFORMAT_0100
     * @tc.name      : Camera CameraFormat Eunm
     * @tc.desc      : Camera CameraFormat Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_FLASHMODE_0100
     * @tc.name      : Camera FlashMode Eunm
     * @tc.desc      : Camera FlashMode Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_EXPOSUREMODE_0100
     * @tc.name      : Camera ExposureMode Eunm
     * @tc.desc      : CameraExposureMode  Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSMODE_0100
     * @tc.name      : Camera FocusMode  Eunm
     * @tc.desc      : Camera FocusMode  Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_FOCUSSTATE_0100
     * @tc.name      : Camera FocusState Eunm
     * @tc.desc      : Camera FocusState Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOSTABILIZATIONMODE_0100
     * @tc.name      : Camera VideoStabilizationMode Eunm
     * @tc.desc      : Camera VideoStabilizationMode Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_IMAGEROTATION_0100
     * @tc.name      : Camera ImageRotation Eunm
     * @tc.desc      : Camera ImageRotation Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_QUALITYLEVEL_0100
     * @tc.name      : Camera QualityLevel Eunm
     * @tc.desc      : Camera QualityLevel Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100
     * @tc.name      : Camera MetadataObjectType Eunm
     * @tc.desc      : Camera MetadataObjectType Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100--------------");
      expect(camera.MetadataObjectType.FACE_DETECTION == 0).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_METADATAOBJECTTYPE_0100 ends here");
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAERRORCODE_0100
     * @tc.name      : Camera CameraErrorCode  Eunm
     * @tc.desc      : Camera CameraErrorCode Eunm
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
      expect(camera.CameraErrorCode.SERVICE_FATAL_ERROR == 7400201).assertTrue();
      console.info(TAG + "--------------SERVICE_FATAL_ERROR--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAERRORCODE_0100 ends here");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_TORCH_0100
     * @tc.name      : test torchMode enum
     * @tc.desc      : assert all torchMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOCODECTYPE_0100
     * @tc.name      : test VideoCodecType enum
     * @tc.desc      : assert all VideoCodecType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_VIDEOCODECTYPE_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.VideoCodecType.AVC == 0).assertTrue();
      console.info(`${TAG} VideoCodecType.AVC: ${camera.VideoCodecType.AVC}`);
      expect(camera.VideoCodecType.HEVC == 1).assertTrue();
      console.info(`${TAG} VideoCodecType.HEVC: ${camera.VideoCodecType.HEVC}`);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0100
     * @tc.name      : test preconfig type enum
     * @tc.desc      : assert all preconfig type enums
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_PRECONFIG_0101
     * @tc.name      : test preconfig ratio enum
     * @tc.desc      : assert all preconfig ratio enums
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_FOLD_STATUS_0100
     * @tc.name      : test fold status enum
     * @tc.desc      : assert all fold status enums
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_SMOOTH_ZOOM_MODE_0100
     * @tc.name      : test smooth zoom mode enum
     * @tc.desc      : assert all smooth zoom mode enums
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENUM_SMOOTH_ZOOM_MODE_0100', Level.LEVEL0, async (done: Function) => {
      expect(camera.SmoothZoomMode.NORMAL == 0).assertTrue();
      console.info(`${TAG} SmoothZoomMode.NORMAL:${camera.SmoothZoomMode.NORMAL}`);
      done();
    })
  })
}