/*
 * Copyright (C) 2024-2024 Huawei Device Co., Ltd.
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
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { surfaceIds } from '../testability/pages/Index';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';

const TAG = "CameraPreconfigTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;

let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;

let mCameraInput: camera.CameraInput | null = null;
let mPreviewOutput: camera.PreviewOutput | null = null;
let mVideoOutput: camera.VideoOutput | null = null;

let receiver: image.ImageReceiver;
let context = getContext();

let permission = ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
  'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
  'ohos.permission.START_INVISIBLE_ABILITY',
  'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
];

let power: ESObject;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'TestAbility'
  }
  await delegator.startAbility(want)
  await sleep(1000)
}

export default function cameraPreconfigTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = (sceneMode: camera.SceneMode) => {
    console.info('Enter createCameraSessionInstance' + sceneMode);
    try {
      mCameraSession = mCameraManager.createSession(sceneMode);
    } catch {
      console.info('createCaptureSession FAILED');
    }
    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    if (!isEmpty(mCameraSession)) {
      await mCameraSession.release();
      // mCameraSession = null;
    }
    mPreviewOutput = null;
    mVideoOutput = null;
  }

  let createInput = async (idx: number) => {
    console.info('Enter createInput');
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
    await mCameraInput.open();
    await sleep(100);
    console.info(idx + 'th CameraInput is: ' + mCameraInput);
    console.info('Exit createInput');
    return true;
  }

  let releaseInput = async () => {
    console.info('Enter releaseInput');
    if (!isEmpty(mCameraInput)) {
      await mCameraInput?.close();
    }
    console.info('Exit releaseInput');
    return true;
  }

  let createOutput = (sceneMode: camera.SceneMode) => {
    console.info('Enter createOutput');

    if (sceneMode == camera.SceneMode.NORMAL_VIDEO) {
      mVideoOutput = mCameraManager.createVideoOutput(surfaceIds);
      if (isEmpty(mVideoOutput)) {
        console.info(TAG + "createVideoOutput FAILED");
      }
      console.info(TAG + "createVideoOutput: " + mVideoOutput);
    } else {
      mPreviewOutput = mCameraManager.createPreviewOutput(surfaceIds);
      if (isEmpty(mPreviewOutput)) {
        console.info(TAG + "createPreviewOutput FAILED");
      }
      console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
    }

    console.info('Exit createOutputs');
    return true;
  }

  let releaseOutput = async () => {
    console.info('Enter releaseOutput');

    if (!isEmpty(mPreviewOutput)) {
      await mPreviewOutput?.release();
      mPreviewOutput = null;
    }

    if (!isEmpty(mVideoOutput)) {
      await mVideoOutput?.release();
      mVideoOutput = null;
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number, sceneMode: camera.SceneMode, preconfigType: camera.PreconfigType) => {
    console.info(TAG + "Enter startCameraSession");

    if (!mCameraSession.canPreconfig(preconfigType)) {
      console.error(TAG + "Check mCameraSession.canPreconfig fail");
      return false;
    }
    mCameraSession.preconfig(preconfigType);
    await createInput(idx);
    createOutput(sceneMode);

    await sleep(1);

    mCameraSession.beginConfig();

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    if (!isEmpty(mVideoOutput)) {
      console.info(TAG + "Start to addOutput mVideoOutput");
      mCameraSession.addOutput(mVideoOutput);
    }

    await sleep(30);

    await mCameraSession.commitConfig();

    await sleep(50);

    await mCameraSession.start();

    if (!isEmpty(mPreviewOutput)) {
      mPreviewOutput?.getActiveProfile();
    }

    if (!isEmpty(mVideoOutput)) {
      mVideoOutput?.getActiveProfile();
    }

    await sleep(100);
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async () => {
    console.info(TAG + "Enter stopCameraSession");
    mCameraSession.beginConfig();
    await mCameraSession.stop();
    await sleep(100);

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession.removeInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession.removeOutput(mPreviewOutput);
    }

    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('CameraPreconfigTest', () => {
    console.info(TAG + '----------CameraPreconfigTest--------------')

    beforeAll(async () => {
      let dr = Driver.create();
      sleep(100);
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await ability();
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
    })

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(100);
      await releaseCameraSessionInstance();
    })

    afterAll(async () => {
      await releaseCameraSessionInstance();
      await sleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100
     * @tc.name      : Create photo session
     * @tc.desc      : Create photo session
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
        return;
      }

      let result = createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      expect(result).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100 PASSED");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100
     * @tc.name      : Photo session preconfig
     * @tc.desc      : Photo session preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
        return;
      }

      let result = createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      expect(result).assertTrue();
      let selectedPreconfigType: camera.PreconfigType | null = null;
      let types: Array<camera.PreconfigType> = [camera.PreconfigType.PRECONFIG_720P,
        camera.PreconfigType.PRECONFIG_1080P,
        camera.PreconfigType.PRECONFIG_4K,
        camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
      ];
      for (let type of types) {
        if (mCameraSession.canPreconfig(type)) {
          selectedPreconfigType = type;
          break;
        }
      }
      if (selectedPreconfigType == null || !mCameraSession.canPreconfig(selectedPreconfigType)) {
        console.info(TAG + "CameraSession.canPreconfig return fail, skip preconfig interface check");
        expect(true).assertTrue();
        done();
        return;
      }

      result = await startCameraSession(0, camera.SceneMode.NORMAL_PHOTO, selectedPreconfigType);
      expect(result).assertTrue();

      console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100 PASSED");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100
     * @tc.name      : Video session preconfig
     * @tc.desc      : Video session preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
        return;
      }

      let result = createCameraSessionInstance(camera.SceneMode.NORMAL_VIDEO);
      expect(result).assertTrue();
      let selectedPreconfigType: camera.PreconfigType | null = null;
      let types: Array<camera.PreconfigType> = [camera.PreconfigType.PRECONFIG_720P,
        camera.PreconfigType.PRECONFIG_1080P,
        camera.PreconfigType.PRECONFIG_4K,
        camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
      ];
      for (let type of types) {
        if (mCameraSession.canPreconfig(type)) {
          selectedPreconfigType = type;
          break;
        }
      }
      if (selectedPreconfigType == null || !mCameraSession.canPreconfig(selectedPreconfigType)) {
        console.info(TAG + "CameraSession.canPreconfig return fail, skip preconfig interface check");
        expect(true).assertTrue();
        done();
        return;
      }

      result = await startCameraSession(0, camera.SceneMode.NORMAL_VIDEO, selectedPreconfigType);
      expect(result).assertTrue();

      console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100 PASSED");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0100
     * @tc.name      : test Photo session canpreconfig api with error code 7400101
     * @tc.desc      : test Photo session canpreconfig api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0100--------------");
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0100 SUCCESS");
        let canPreconfig = mCameraSession.canPreconfig(null);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0100 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400101');
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0100
     * @tc.name      : test Photo session preconfig api with error code 7400101
     * @tc.desc      : test Photo session preconfig api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0100--------------");
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0100 SUCCESS");
        mCameraSession.preconfig(null);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0100 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400101');
        done();
      }
      done();
    })
  })
}