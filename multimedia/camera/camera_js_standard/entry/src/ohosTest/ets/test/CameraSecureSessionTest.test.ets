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

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { surfaceIds } from '../testability/pages/Index';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = "CameraSecureSessionTest: ";

// Define global letiables
let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.SecureSession;
let mPhotoSurface: string;


// CAMERA-0 letiables
let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mSecurePreviewOutput: cameraObj.PreviewOutput;
let receiver: image.ImageReceiver;
let secureSeqId: ESObject;

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

export default function cameraSecureSessionTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getSecurePreviewOutput = async () => {
    console.log(TAG + 'Entering getSecurePreviewOutput')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Secure receiver is created successfully')
      mPhotoSurface = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Secure received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Secure receiver is created failed')
    }
    console.log(TAG + 'Exit getSecurePreviewOutput')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');

    mCameraManager = cameraObj.getCameraManager(null);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }

    console.info('Exit getCameraManagerInstance');

    return true;
  }

  // let getModeManagerInstance = () => {
  //     console.info('Enter getModeManagerInstance');
  //
  //     mModeManager = cameraObj.getModeManager(null);
  //     if (isEmpty(mModeManager)) {
  //         console.info(TAG + "getModeManager FAILED");
  //         return false;
  //     }
  //
  //     console.info('Exit getModeManagerInstance');
  //
  //     return true;
  // }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');

    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    //mCameraNum = 1;
    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let isSceneModesupport = (sceneMode: number) => {
    let num: number = -1;
    for (let i = 0; i < mCameraDevicesArray.length; i++) {
      let modes = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[i]);
      console.info(TAG + `camera ${i} modes is: `  + modes);
      if (modes.includes(sceneMode)) {
        num = i
      }
    }
    return num;
  }

  let createSecureSessionInstance = () => {
    console.info('Enter createSecureSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession(12);
    } catch {
      console.info('createSecureSessionInstance FAILED');
    }

    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createSecureSessionInstance FAILED");
      return false;
    }

    mCameraSession.beginConfig();

    console.info('Exit createSecureSessionInstance');

    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession.release();
  }

  let createInput = async (idx: number) => {
    console.info('Enter createInput');

    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);

    if (isEmpty(mCameraInput)) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }

    secureSeqId = await mCameraInput.open(true);

    await sleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput + 'secureSeqId = ' + secureSeqId);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async () => {
    console.info('Enter releaseInput');

    if (!isEmpty(mCameraInput)) {
      await mCameraInput.close();
    }

    console.info('Exit releaseInput');

    return true;
  }

  let createOutput = async (idx: number) => {
    console.info('Enter createOutput');

    let cameraOutputCap = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx], 12);

    if (!isEmpty(cameraOutputCap)) {
      if (!isEmpty(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput =
            await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceIds);
          if (!isEmpty(mPreviewOutput)) {
            break;
          }
        }

        if (isEmpty(mPreviewOutput)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async () => {
    console.info('Enter releaseOutput');

    if (!isEmpty(mPreviewOutput)) {
      await mPreviewOutput.release();
    }

    if (!isEmpty(mSecurePreviewOutput)) {
      await mSecurePreviewOutput.release();
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    await createOutput(idx);

    console.info(TAG + "Start to addInput");


    await sleep(1);

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    if (!isEmpty(mSecurePreviewOutput)) {
      console.info(TAG + "Start to addOutput mSecurePreviewOutput");
      mCameraSession.addOutput(mSecurePreviewOutput);
      mCameraSession.addSecureOutput(mSecurePreviewOutput);
    }

    await sleep(1);

    await mCameraSession.commitConfig();

    console.info(TAG + "Entering startCameraSession start session begin");

    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async () => {
    console.info(TAG + "Enter stopCameraSession");
    await releaseOutput();
    await releaseInput();
    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  let startSecureCameraSession = async () => {
    console.info(TAG + "Enter startSecureCameraSession" + cameraObj.SceneMode.SECURE_PHOTO);
    for (let cameraIndex = 0; cameraIndex < mCameraNum; cameraIndex++) {
      let cameraMode = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[cameraIndex]);
      console.info(TAG + "cameraModeTmp = " + JSON.stringify(cameraMode));
      if (cameraMode != null && cameraMode.length > 0) {
        for (let modeIndex = 0; modeIndex < cameraMode.length; modeIndex++) {
          let cameraModeTmp = cameraMode[modeIndex];
          console.info(TAG + "cameraModeTmp = " + cameraModeTmp);
          if (cameraModeTmp == cameraObj.SceneMode.SECURE_PHOTO) {
            console.info(TAG + "Enter startSecureCameraSession %d" + cameraObj.SceneMode.SECURE_PHOTO);
            createSecureSessionInstance();
            startCameraSession(cameraIndex);
            return true;
          }
        }
      }
    }
    console.info(TAG + "Exit startSecureCameraSession");
    return false;
  }

  describe('cameraSecureSessionTest', () => {
    console.info(TAG + '----------CameraSecureSessionTest--------------')

    beforeAll(async () => {
      let dr = Driver.create();
      sleep(100);
      getCameraManagerInstance();
      // getModeManagerInstance();
      getCameraSupportDevicesArray();
      await getSecurePreviewOutput();
      console.info('Device type = ' + deviceInfo.deviceType);
      secureSeqId = 0;
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

    beforeEach(() => {
      sleep(1000);
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(() => {
      releaseCameraSessionInstance();
      sleep(500);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100
     * @tc.desc   Check open secure cameraid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let cameraIndex = 0; cameraIndex < mCameraNum; cameraIndex++) {
          let cameraMode = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[cameraIndex]);
          for (let modeIndex = 0; modeIndex < cameraMode.length; modeIndex++) {
            let cameraModeTmp = cameraMode[modeIndex];
            if (cameraModeTmp == cameraObj.SceneMode.SECURE_PHOTO) {
              mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[cameraIndex]);
              if (isEmpty(mCameraInput)) {
                console.info(TAG + "createCameraInput FAILED");
                expect().assertFail();
                done();
              }
              await sleep(5000);
              secureSeqId = await mCameraInput.open(true);
              console.info('th CameraInput is: ' + mCameraInput + 'secureSeqId = ' + secureSeqId);
              if (secureSeqId == 0) {
                expect().assertFail();
                done();
              }
              await releaseInput();
              await sleep(1000);
            }
          }
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100
     * @tc.desc   Check add secure output flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        console.info("SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100 start ");
        for (let cameraIndex = 0; cameraIndex < mCameraNum; cameraIndex++) {
          let cameraMode = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[cameraIndex]);
          console.info(TAG + "cameraModeTmp = " + JSON.stringify(cameraMode));
          if (cameraMode != null && cameraMode.length > 0) {
            for (let modeIndex = 0; modeIndex < cameraMode.length; modeIndex++) {
              let cameraModeTmp = cameraMode[modeIndex];
              console.info(TAG + "cameraModeTmp = " + cameraModeTmp);
              if (cameraModeTmp == cameraObj.SceneMode.SECURE_PHOTO) {
                await sleep(500);
                createSecureSessionInstance();
                startCameraSession(cameraIndex);
                await releaseOutput();
                await releaseCameraSessionInstance();
                await releaseInput();
                await sleep(500);
              }
            }
          }
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100 ends here");
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_ERROR_0100
     * @tc.desc   Test secure session on callback error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_ERROR_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_ERROR_0100--------------");
      createSecureSessionInstance();
      try {
        mCameraSession.on('error', (err) => {
          if (err) {
            console.error(`Secure session error code: ${err.code}`)
          } else {
            console.info(`Secure session success to listen on error`)
          }
        })
        expect(true).assertTrue()
      } catch (err) {
        console.error(`Secure session failed to listen on error: ${err.code}`)
        expect().assertFail()
      }
      console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_ERROR_0100--------------");
      await releaseCameraSessionInstance()
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_ERROR_0100
     * @tc.desc   Test secure session off callback error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_ERROR_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_ERROR_0100--------------");
      createSecureSessionInstance();

      // 打开监听
      mCameraSession.on('error', (err) => {
          console.error(`Secure session error code: ${err.code}`)
      })

      // 关闭监听
      try {
        mCameraSession.off('error', (err) => {
          if (err) {
            console.error(`Secure session error code: ${err.code}`)
            expect().assertFail()
          } else {
            console.info(`Secure session success to turn off listen on error`)
          }
        })
        expect(true).assertTrue()
      } catch (err) {
        console.error(`Secure session failed to turn off listen on error: ${err.code}`)
        expect().assertFail()
      }
      console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_ERROR_0100--------------");
      await releaseCameraSessionInstance()
      done()
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_FOCUS_STATE_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_FOCUS_STATE_CHANGE_0100
     * @tc.desc   Test secure session on callback focusStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_FOCUS_STATE_CHANGE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_FOCUS_STATE_CHANGE_0100--------------");
      createSecureSessionInstance();
      try {
        mCameraSession.on('focusStateChange', (err) => {
          if (err) {
            console.error(`Secure session error code: ${err.code}`)
            expect().assertFail()
          } else {
            console.info(`Secure session success to listen on error`)
          }
        })
        expect(true).assertTrue()
      } catch (err) {
        console.error(`Secure session failed to listen on error: ${err.code}`)
        expect().assertFail()
      }
      console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ON_CALLBACK_FOCUS_STATE_CHANGE_0100--------------");
      await releaseCameraSessionInstance()
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_FOCUS_STATE_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_FOCUS_STATE_CHANGE_0100
     * @tc.desc   Test secure session off callback focusStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_FOCUS_STATE_CHANGE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_FOCUS_STATE_CHANGE_0100--------------");
      createSecureSessionInstance();

      // 打开监听
      mCameraSession.on('focusStateChange', (err) => {
          console.error(`Secure session error code: ${err.code}`)
      })

      // 关闭监听
      try {
        mCameraSession.off('focusStateChange', (err) => {
          if (err) {
            console.error(`Secure session error code: ${err.code}`)
          } else {
            console.info(`Secure session success to turn off listen on error`)
          }
        })
        expect(true).assertTrue()
      } catch (err) {
        console.error(`Secure session failed to turn off listen on error: ${err.code}`)
        expect().assertFail()
      }
      console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_OFF_CALLBACK_FOCUS_STATE_CHANGE_0100--------------");
      await releaseCameraSessionInstance()
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0100
     * @tc.desc   Test secure session addSecureOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0100--------------");
      let i = isSceneModesupport(cameraObj.SceneMode.SECURE_PHOTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0100 i : " + i);
      if (i == -1) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0100 Pass with NoCamera Support Secure Session");
        expect(i == -1).assertTrue();
        done();
      } else {
        createSecureSessionInstance();
        await createInput(i);
        await createOutput(i);
    
        if (!isEmpty(mCameraInput)) {
          console.info(TAG + "Start to addInput");
          mCameraSession.addInput(mCameraInput);
        }

        if (!isEmpty(mPreviewOutput)) {
          console.info(TAG + "Start to addOutput mPreviewOutput");
          mCameraSession.addOutput(mPreviewOutput);
        }

        console.info(TAG + "Start to addSecureOutput");
        try {
          mCameraSession.addSecureOutput(mPreviewOutput);
          console.info(TAG + "Success to addSecureOutput mPreviewOutput");
          expect(true).assertTrue()
        } catch (err) {
          console.info(TAG + "Failed to addSecureOutput mPreviewOutput, error code: " + err.code);
          expect().assertFail()
        }
        await mCameraSession.commitConfig();
        console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0100--------------");
        await sleep(1000);
        await releaseCameraSessionInstance()
      }
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0200
     * @tc.desc   Test secure session addSecureOutput with errorCode 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0200--------------");
      let i = isSceneModesupport(cameraObj.SceneMode.SECURE_PHOTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0200 i : " + i);
      if (i == -1) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0200 Pass with NoCamera Support Secure Session");
        expect(i == -1).assertTrue();
        done();
      } else {
        createSecureSessionInstance();
        await createInput(i);
        await createOutput(i);
    
        if (!isEmpty(mCameraInput)) {
          console.info(TAG + "Start to addInput");
          mCameraSession.addInput(mCameraInput);
        }

        if (!isEmpty(mPreviewOutput)) {
          console.info(TAG + "Start to addOutput mPreviewOutput");
          mCameraSession.addOutput(mPreviewOutput);
        }

        console.info(TAG + "Start to addSecureOutput");
        try {
          mCameraSession.addSecureOutput(null);
          console.info(TAG + "Success to addSecureOutput mPreviewOutput");
          expect().assertFail()
        } catch (err) {
          console.info(TAG + "Failed to addSecureOutput mPreviewOutput, error code: " + err.code);
          expect(err.code == 7400101 ).assertTrue();
          // expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        }
        await mCameraSession.commitConfig();
        console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_SECURE_SESSION_ADD_SECURE_OUTPUT_0200--------------");
        await sleep(1000);
        await releaseCameraSessionInstance()
      }
      done()
    })


  })
}
