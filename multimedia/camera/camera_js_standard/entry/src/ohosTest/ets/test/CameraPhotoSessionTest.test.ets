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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

const TAG = "CameraPhotoSessionTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;

let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;

let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput | null = null;
let mPhotoOutput: camera.PhotoOutput | null = null;
let mVideoOutput: camera.VideoOutput | null = null;
let nbiasRangeArray: Array<number> ;
let nzoomRatioRange: Array<number> = [];

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

export default function CameraPhotoSessionTest() {

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
      console.info('createPhotoSession FAILED');
    }
    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createPhotoSession FAILED");
      return false;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    console.info('Exit releaseCameraSessionInstance');
    if (!isEmpty(mCameraSession)) {
      await mCameraSession.release();
      // mCameraSession = null;
    }
    mPreviewOutput = null;
    mPhotoOutput = null;
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

  let createOutput = (idx: number) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);

    if (!isEmpty(cameraOutputCap)) {
      if (!isEmpty(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceIds);
          if (!isEmpty(mPreviewOutput)) {
            break;
          }
        }

        if (isEmpty(mPreviewOutput)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }

      if (!isEmpty(cameraOutputCap.photoProfiles)) {
        console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

        for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
          if (!isEmpty(mPhotoOutput)) {
            break;
          }
        }

        if (isEmpty(mPhotoOutput)) {
          console.info(TAG + "createPhotoOutput FAILED");
        }

        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
      }

      if (!isEmpty(cameraOutputCap.videoProfiles)) {
        console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length);
        for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
          try {
            mVideoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i],surfaceIds);
            if (!isEmpty(mVideoOutput)) {
              break;
            }
          } catch {
            console.info(TAG + "createVideoOutput FAILED");
          }
        }

        if (isEmpty(mVideoOutput)) {
          console.info(TAG + "createVideoOutput FAILED");
        }

        console.info(TAG + "createVideoOutput: " + mVideoOutput);
      }

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

    if (!isEmpty(mPhotoOutput)) {
      await mPhotoOutput?.release();
      mPhotoOutput = null;
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

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

    if (!isEmpty(mPhotoOutput)) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession.addOutput(mPhotoOutput);
    }

    await sleep(30);

    await mCameraSession.commitConfig();

    await sleep(50);

    await mCameraSession.start();

    if (!isEmpty(mPreviewOutput)) {
      mPreviewOutput?.getActiveProfile();
    }

    if (!isEmpty(mPhotoOutput)) {
      mPhotoOutput?.getActiveProfile();
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

  describe('CameraPhotoSessionTest', () => {
    console.info(TAG + '----------CameraPhotoSessionTest--------------')

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
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_0100
     * @tc.name      : Create photo session hashflash
     * @tc.desc      : Create photo session hashflash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        await startCameraSession(0);
        try {
            let ishashflash = mCameraSession.hasFlash();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_0100 ishashflash" + ishashflash);
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_0100 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_ERRORCODE_0100
     * @tc.name      : Create photo session hashflash errorcode
     * @tc.desc      : Create photo session hashflash errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_ERRORCODE_0100--------------");
  
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_ERRORCODE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          //await startCameraSession(0);
          try {
              let ishashflash = mCameraSession.hasFlash();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_ERRORCODE_0100 ishashflash" + ishashflash);
              expect(true).assertFalse();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_HASHFLASH_ERRORCODE_0100 FAILED" + err.code);
              expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_0100
     * @tc.name      : Create photo session isFlashModeSupported
     * @tc.desc      : Create photo session isFlashModeSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_0100--------------");
  
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let isFlashModeSupported = mCameraSession.isFlashModeSupported(camera.FlashMode.FLASH_MODE_AUTO);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_0100 isFlashModeSupported" + isFlashModeSupported);
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_ERRORCODE_0100
     * @tc.name      : Create photo session isFlashModeSupported errorcode
     * @tc.desc      : Create photo session isFlashModeSupported errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_ERRORCODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let isFlashModeSupported = mCameraSession.isFlashModeSupported(camera.FlashMode.FLASH_MODE_AUTO);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_ERRORCODE_0100 isFlashModeSupported" + isFlashModeSupported);
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFLASHMODESUPPORTED_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_0100
     * @tc.name      : Create photo session getFlashMode
     * @tc.desc      : Create photo session getFlashMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        await startCameraSession(0);
        try {
            let FlashModes = mCameraSession.getFlashMode();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_0100 FlashModes:" + FlashModes);
            expect(true).assertTrue();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_0100 FAILED" + err.code);
            expect(true).assertFalse();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_ERRORCODE_0100
     * @tc.name      : Create photo session getFlashMode errorcode
     * @tc.desc      : Create photo session getFlashMode errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_ERRORCODE_0100--------------");
    
        if (mCameraNum == 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_ERRORCODE_0100 FAILED with NoCamera");
            expect(true).assertFail();
            done();
            return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let FlashModes = mCameraSession.getFlashMode();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_ERRORCODE_0100 FlashModes" + FlashModes);
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFLASHMODE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_0100
     * @tc.name      : Create photo session setFlashMode
     * @tc.desc      : Create photo session setFlashMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_0100--------------");
  
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let ishashflash = mCameraSession.hasFlash();
              let isFlashModeSupported = mCameraSession.isFlashModeSupported(camera.FlashMode.FLASH_MODE_OPEN);
              if(isFlashModeSupported&&ishashflash){
              mCameraSession.setFlashMode(camera.FlashMode.FLASH_MODE_OPEN);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_0100 ishashflash" );
              }
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_ERRORCODE_0100
     * @tc.name      : Create photo session setFlashMode errorcode
     * @tc.desc      : Create photo session setFlashMode errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_ERRORCODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            mCameraSession.setFlashMode(camera.FlashMode.FLASH_MODE_OPEN);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_ERRORCODE_0100 FAILED" );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SET_FLASH_MODE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        done(); 
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_0100
     * @tc.name      : Create photo session isExposureModeSupported
     * @tc.desc      : Create photo session isExposureModeSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_0100--------------");
  
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let isExposureModeSupported = mCameraSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_0100 Success isExposureModeSupported " +isExposureModeSupported );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERRORCODE_0100
     * @tc.name      : Create photo session isExposureModeSupported errorcode
     * @tc.desc      : Create photo session isExposureModeSupported errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERRORCODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let isExposureModeSupported = mCameraSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERRORCODE_0100 Success isExposureModeSupported " +isExposureModeSupported );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        done(); 
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_0100
     * @tc.name      : Create photo session getExposureBiasRange
     * @tc.desc      : Create photo session getExposureBiasRange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_0100--------------");
  
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let biasRangeArray: Array<number> = mCameraSession.getExposureBiasRange();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_0100 Success biasRangeArray " +biasRangeArray );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_ERRORCODE_0100
     * @tc.name      : Create photo session getExposureBiasRange errorcode
     * @tc.desc      : Create photo session getExposureBiasRange errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_ERRORCODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let  biasRangeArray: Array<number> = mCameraSession.getExposureBiasRange();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_ERRORCODE_0100 Success biasRangeArray " +biasRangeArray );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREBIASRANGE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        done(); 
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_0100
     * @tc.name      : Create photo session getExposureMode
     * @tc.desc      : Create photo session getExposureMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_0100--------------");
  
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let  exposureMode: camera.ExposureMode = mCameraSession.getExposureMode();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_ERRORCODE_0100 Success exposureMode " +exposureMode );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_ERRORCODE_0100
     * @tc.name      : Create photo session getExposureMode errorcode
     * @tc.desc      : Create photo session getExposureMode errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_ERRORCODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let  exposureMode: camera.ExposureMode = mCameraSession.getExposureMode();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_ERRORCODE_0100 Success exposureMode " +exposureMode );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREMODE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        done(); 
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_0100
     * @tc.name      : Create photo session setExposureMode
     * @tc.desc      : Create photo session setExposureMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_0100--------------");
  
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              mCameraSession.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_0100 Success  " );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100
     * @tc.name      : Create photo session setExposureMode errorcode
     * @tc.desc      : Create photo session setExposureMode errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            mCameraSession.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100 Success " );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        done(); 
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_0100
     * @tc.name      : Create photo session getMeteringPoint
     * @tc.desc      : Create photo session getMeteringPoint
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_0100--------------");
        // let Point:camera.Point = {
        //     x : 10,
        //     y : 10
        // }
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let Point:camera.Point = mCameraSession.getMeteringPoint();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_0100 Success  Point =="+Point );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_ERRORCODE_0100
     * @tc.name      : Create photo session getMeteringPoint errorcode
     * @tc.desc      : Create photo session getMeteringPoint errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_ERRORCODE_0100--------------");

        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let Point:camera.Point = mCameraSession.getMeteringPoint();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_ERRORCODE_0100 Success " );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETMETERINGPOINT_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_0100
     * @tc.name      : Create photo session setMeteringPoint
     * @tc.desc      : Create photo session setMeteringPoint
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_0100--------------");
        const point: camera.Point = {x: 1, y: 1};
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              mCameraSession.setMeteringPoint(point);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_0100 Success  Success" );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_0100
     * @tc.name      : Create photo session setMeteringPoint errorcode
     * @tc.desc      : Create photo session setMeteringPoint errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_0100--------------");
        const point: camera.Point = {x: 1, y: 1};
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            mCameraSession.setMeteringPoint(point);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_0100 Success " );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_0100
     * @tc.name      : Create photo session setExposureBias
     * @tc.desc      : Create photo session setExposureBias
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
            nbiasRangeArray = mCameraSession.getExposureBiasRange();
          try {
              mCameraSession.setExposureBias(nbiasRangeArray[0]);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_0100 Success " );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0100
     * @tc.name      : Create photo session setExposureBias errorcode
     * @tc.desc      : Create photo session setExposureBias errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            mCameraSession.setExposureBias(nbiasRangeArray[0]);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0100 Success " );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0200
     * @tc.name      : Create photo session setExposureBias errorcode
     * @tc.desc      : Create photo session setExposureBias errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0200--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0200 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        await startCameraSession(0);
        await mCameraInput.close();
        await sleep(100);
        try {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0200 nbiasRangeArray = " + nbiasRangeArray );
            mCameraSession.setExposureBias(nbiasRangeArray[1]);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0200 Success " );
            //expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREBIAS_ERRORCODE_0200 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_0100
     * @tc.name      : Create photo session getExposureValue
     * @tc.desc      : Create photo session getExposureValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let exposureValue = mCameraSession.getExposureValue();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_0100 Success exposureValue == " + exposureValue );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_ERRORCODE_0100
     * @tc.name      : Create photo session setExposureBias errorcode
     * @tc.desc      : Create photo session setExposureBias errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let exposureValue = mCameraSession.getExposureValue();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_ERRORCODE_0100 Success exposureValue == " + exposureValue );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETEXPOSUREVALUE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_0100
     * @tc.name      : Create photo session isFocusModeSupported
     * @tc.desc      : Create photo session isFocusModeSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let isFocusModeSupported = mCameraSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_AUTO);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_0100 Success isFocusModeSupported == " + isFocusModeSupported );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_ERRORCODE_0100
     * @tc.name      : Create photo session isFocusModeSupported errorcode
     * @tc.desc      : Create photo session isFocusModeSupported errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let isFocusModeSupported = mCameraSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_AUTO);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_ERRORCODE_0100 Success isFocusModeSupported == " + isFocusModeSupported );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISFOCUSMODESUPPORTED_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_0100
     * @tc.name      : Create photo session getFocusMode
     * @tc.desc      : Create photo session getFocusMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let FocusMode = mCameraSession.getFocusMode();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_0100 Success isFocusModeSupported == " + FocusMode );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_ERRORCODE_0100
     * @tc.name      : Create photo session getFocusMode errorcode
     * @tc.desc      : Create photo session getFocusMode errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let FocusMode = mCameraSession.getFocusMode();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_ERRORCODE_0100 Success FocusMode == " + FocusMode );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSMODE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_0100
     * @tc.name      : Create photo session setFocusMode
     * @tc.desc      : Create photo session setFocusMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
             let isFocusModeSupported = mCameraSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_AUTO);
             if(isFocusModeSupported){
              mCameraSession.setFocusMode(camera.FocusMode.FOCUS_MODE_AUTO);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_0100 Success"  );
             }
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_ERRORCODE_0100
     * @tc.name      : Create photo session setFocusMode errorcode
     * @tc.desc      : Create photo session setFocusMode errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            mCameraSession.setFocusMode(camera.FocusMode.FOCUS_MODE_AUTO);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_ERRORCODE_0100 Success " );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSMODE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_0100
     * @tc.name      : Create photo session setFocusPoint
     * @tc.desc      : Create photo session setFocusPoint
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        let focusPoint: camera.Point = {x: 1, y: 1};
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              mCameraSession.setFocusPoint(focusPoint);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_0100 Success"  );
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_ERRORCODE_0100
     * @tc.name      : Create photo session setFocusPoint errorcode
     * @tc.desc      : Create photo session setFocusPoint errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        let focusPoint: camera.Point = {x: 1, y: 1};
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            mCameraSession.setFocusPoint(focusPoint);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_ERRORCODE_0100 Success " );
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETFOCUSPOINT_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_0100
     * @tc.name      : Create photo session getFocusPoint
     * @tc.desc      : Create photo session getFocusPoint
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
            let point: camera.Point =  mCameraSession.getFocusPoint();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_ERRORCODE_0100 Success point == " + point);
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_ERRORCODE_0100
     * @tc.name      : Create photo session getFocusPoint errorcode
     * @tc.desc      : Create photo session getFocusPoint errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let point: camera.Point =  mCameraSession.getFocusPoint();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_ERRORCODE_0100 Success point == " + point);
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCUSPOINT_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_0100
     * @tc.name      : Create photo session getFocalLength
     * @tc.desc      : Create photo session getFocalLength
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let focalLength: number =  mCameraSession.getFocalLength();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_ERRORCODE_0100 Success focalLength == " + focalLength);
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_ERRORCODE_0100
     * @tc.name      : Create photo session getFocalLength errorcode
     * @tc.desc      : Create photo session getFocalLength errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let focalLength: number =  mCameraSession.getFocalLength();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_ERRORCODE_0100 Success focalLength == " + focalLength);
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETFOCALLENGTH_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_0100
     * @tc.name      : Create photo session getZoomRatioRange
     * @tc.desc      : Create photo session getZoomRatioRange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let zoomRatioRange: Array<number> =  mCameraSession.getZoomRatioRange();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_0100 Success zoomRatioRange == " + zoomRatioRange);
              expect(true).assertTrue();
          } catch(err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_ERRORCODE_0100
     * @tc.name      : Create photo session getZoomRatioRange errorcode
     * @tc.desc      : Create photo session getZoomRatioRange errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let zoomRatioRange: Array<number> =  mCameraSession.getZoomRatioRange();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_ERRORCODE_0100 Success zoomRatioRange == " + zoomRatioRange);
            expect(true).assertFalse();
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIORANGE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_0100
     * @tc.name      : Create photo session getZoomRatio
     * @tc.desc      : Create photo session getZoomRatio
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let zoomRatio: number =  mCameraSession.getZoomRatio();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100 Success zoomRatio == " + zoomRatio);
              expect(true).assertTrue();
          } catch (err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_0100 FAILED" + err.code);
              if (err.code == camera.CameraErrorCode.SERVICE_FATAL_ERROR || err.code == camera.CameraErrorCode.DEVICE_DISABLED){
                expect(true).assertTrue();
              }else{
                expect(true).assertFalse();
              }
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100
     * @tc.name      : Create photo session getZoomRatio errorcode
     * @tc.desc      : Create photo session getZoomRatio errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
            let zoomRatio: number =  mCameraSession.getZoomRatio();
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100 Success zoomRatio == " + zoomRatio);
            expect(true).assertFalse();
        } catch (err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_0100
     * @tc.name      : Create photo session setZoomRatio
     * @tc.desc      : Create photo session setZoomRatio
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          nzoomRatioRange = mCameraSession.getZoomRatioRange();
          try {
            if (!isEmpty(nzoomRatioRange)) {
              mCameraSession.setZoomRatio(nzoomRatioRange[0]);
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_0100 Success ");
            }
          } catch (err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_ERRORCODE_0100
     * @tc.name      : Create photo session setZoomRatio errorcode
     * @tc.desc      : Create photo session setZoomRatio errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
          console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100 Success nzoomRatioRange.length == " +nzoomRatioRange.length);
          if (!isEmpty(nzoomRatioRange)) {
            mCameraSession.setZoomRatio(nzoomRatioRange[0]);
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETZOOMRATIO_ERRORCODE_0100 Success ");
            expect(true).assertFalse();
          }
        } catch (err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETZOOMRATIO_ERRORCODE_0100 FAILED" + err.code);
            if (err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG) {
              expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            }else{
              expect(err.code == undefined).assertTrue();
            }
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_0100
     * @tc.name      : Create photo session getSupportedColorSpaces
     * @tc.desc      : Create photo session getSupportedColorSpaces
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let colorSpaces: Array<colorSpaceManager.ColorSpace> = mCameraSession.getSupportedColorSpaces();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_0100 Success colorSpaces == " + colorSpaces);
          } catch (err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**无法抛出7400103，已提单,等下一个版本回归测试通过后使用
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_ERRORCODE_0100
     * @tc.name      : Create photo session getSupportedColorSpaces errorcode
     * @tc.desc      : Create photo session getSupportedColorSpaces errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    // it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
    //     console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_ERRORCODE_0100--------------");
    //     if (mCameraNum == 0) {
    //     console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_ERRORCODE_0100 FAILED with NoCamera");
    //     expect(true).assertFail();
    //     done();
    //     return;
    //     }
    //     createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
    //     //await startCameraSession(0);
    //     try {
    //       let colorSpaces: Array<colorSpaceManager.ColorSpace> = mCameraSession.getSupportedColorSpaces();
    //       console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_ERRORCODE_0100 Success colorSpaces == " + colorSpaces);
    //       expect(true).assertFail();
    //     } catch (err) {
    //         console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETSUPPORTEDCOLORSPACES_ERRORCODE_0100 FAILED err.code === " + err.code);
    //         expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    //     } 
    //     done();
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_0100
     * @tc.name      : Create photo session getActiveColorSpace
     * @tc.desc      : Create photo session getActiveColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          try {
              let colorSpace: colorSpaceManager.ColorSpace = mCameraSession.getActiveColorSpace();
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_0100 Success colorSpaces == " + colorSpace);
          } catch (err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_ERRORCODE_0100
     * @tc.name      : Create photo session getActiveColorSpace errorcode
     * @tc.desc      : Create photo session getActiveColorSpace errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
          let colorSpace: colorSpaceManager.ColorSpace = mCameraSession.getActiveColorSpace();
          console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_ERRORCODE_0100 Success colorSpaces == " + colorSpace);
          expect(true).assertFail();
        } catch (err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_GETACTIVECOLORSPACE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_0100
     * @tc.name      : Create photo session setColorSpace
     * @tc.desc      : Create photo session setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
          try {
              colorSpaces = mCameraSession.getSupportedColorSpaces();
              if (colorSpaces.length>0&&!isEmpty(colorSpaces)) {
                mCameraSession.setColorSpace(colorSpaces[0]);
                console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_0100 Success " );
              }
          } catch (err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0100
     * @tc.name      : Create photo session setColorSpace errorcode 7400103
     * @tc.desc      : Create photo session setColorSpace errorcode 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
        //await startCameraSession(0);
        try {
          mCameraSession.setColorSpace(colorSpaceManager.ColorSpace.DISPLAY_P3);
          console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0100 Success " );
          expect(true).assertFail();
        } catch (err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0100 FAILED" + err.code);
            expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        } 
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0200
     * @tc.name      : Create photo session setColorSpace errorcode 7400101
     * @tc.desc      : Create photo session setColorSpace errorcode 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0200--------------");
      if (mCameraNum == 0) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0200 FAILED with NoCamera");
      expect(true).assertFail();
      done();
      return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      try {
        mCameraSession.setColorSpace(null);
        console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0200 Success " );
        expect(true).assertFail();
      } catch (err) {
          console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETCOLORSPACE_ERRORCODE_0200 FAILED" + err.code);
          if(err.code == camera.CameraErrorCode.INVALID_ARGUMENT){
            expect(err.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          }else{
            expect(err.code == camera.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          }
      } 
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_0100
     * @tc.name      : Create photo session setSmoothZoom
     * @tc.desc      : Create photo session setSmoothZoom
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          nzoomRatioRange =  mCameraSession.getZoomRatioRange();
          try {
              if (!isEmpty(nzoomRatioRange)) {
                mCameraSession.setSmoothZoom(nzoomRatioRange[0]+0.1,camera.SmoothZoomMode.NORMAL);
                console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_0100 Success " );
                expect(true).assertTrue();
              }
          } catch (err) {
              console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_0100 FAILED" + err.code);
              expect(true).assertFalse();
          }
          done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_0100
     * @tc.desc      : white balance api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try{
          createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
          await startCameraSession(0);
          let flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.CLOUDY);
          let range = mCameraSession.getWhiteBalanceRange();
          mCameraSession.setWhiteBalanceMode(camera.WhiteBalanceMode.DAYLIGHT);
          let mode = mCameraSession.getWhiteBalanceMode();
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.AUTO);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.CLOUDY);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.INCANDESCENT);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.FLUORESCENT);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.DAYLIGHT);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.MANUAL);
          flag = mCameraSession.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.LOCKED);
          let value = 5000;
          mCameraSession.setWhiteBalance(value);
          let whiteBalance = mCameraSession.getWhiteBalance();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_0100 start PASSED");
          expect(true).assertTrue();
        } catch (err) {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_0100 FAILED" + err.code);
            expect(true).assertFalse();
        }
        done();
      }
    })

    /**无法抛出7400103，已提单，等下一个版本回归测试通过后使用
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_ERRORCODE_0100
     * @tc.name      : Create photo session setSmoothZoom errorcode
     * @tc.desc      : Create photo session setSmoothZoom errorcode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    // it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
    //     console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_ERRORCODE_0100--------------");
    //     if (mCameraNum == 0) {
    //     console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_ERRORCODE_0100 FAILED with NoCamera");
    //     expect(true).assertFail();
    //     done();
    //     return;
    //     }
    //     createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
    //     //await startCameraSession(0);
    //     try {
    //         mCameraSession.setSmoothZoom(nzoomRatioRange[0]+0.1,camera.SmoothZoomMode.NORMAL);
    //         console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_ERRORCODE_0100 FAILED " );
    //         expect(true).assertFalse();
    //     } catch (err) {
    //         console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETSMOOTHZOOM_ERRORCODE_0100  err.code = " + err.code);
    //         expect(err.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    //     } 
    //     done();
    // })
  })
}