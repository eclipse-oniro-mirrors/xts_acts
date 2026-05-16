/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';

const TAG = "CameraPhotoSessionTest: ";

let mCameraManager: camera.CameraManager | undefined;
let mCameraDevicesArray: Array<camera.CameraDevice> = [];
let mCameraSession: camera.PhotoSession | undefined;

let mPhotoSurface: string = '';
let surfaceId: string = '';
let mCameraNum: number;

let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let isSessionCreated: boolean = false;

let receiver: image.ImageReceiver | undefined;

let getPreviewOutputSurface = () => {
  console.log(TAG + 'Entering getPreviewOutputSurface')
  try {
    surfaceId = Hypium.get('SurfaceId') as string;
  } catch(err) {
    console.info(TAG +
      "getPreviewOutputSurface FAILED err " + JSON.stringify(err));
  }
  if (surfaceId == '') {
    console.error(TAG + ' getPreviewOutputSurface surfaceId failed, surfaceId is null')
    expect().assertFail();
  }
  console.info(TAG + 'getPreviewOutputSurface surfaceId: ' + surfaceId)
}

export default function cameraPhotoSessionTest() {

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({height:640, width:480} as image.Size, image.ImageFormat.JPEG, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + mPhotoSurface)
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = camera.getCameraManager(appContext);
    if (mCameraManager == null) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager!.getSupportedCameras();
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
    } catch(err) {
      console.info('createPhotoSession FAILED');
    }
    if (mCameraSession == undefined) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    } else {
      isSessionCreated = true;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let createCameraSessionInstanceWithSceneMode = (sceneMode: camera.SceneMode) => {
    console.info('Enter createCameraSessionInstance' + sceneMode);
    try {
      mCameraSession = mCameraManager!.createSession<camera.PhotoSession>(sceneMode) as camera.PhotoSession;
    } catch(err) {
      console.info('createPhotoSession FAILED');
    }
    if (mCameraSession == undefined) {
      console.info(TAG + "createPhotoSession FAILED");
      return false;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    console.info('Enter releaseCameraSessionInstance');
    if (isSessionCreated && mCameraSession != undefined) {
      await mCameraSession!.release();
      isSessionCreated = false;
    }
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray[idx]);
    if (mCameraInput == undefined) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await mCameraInput!.open();
    await Utils.msSleep(100);
    console.info(idx + 'CameraInput is: ' + mCameraInput);
    console.info('Exit createInput');
    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');
    if (mCameraInput != undefined && mCameraInput != null) {
      await mCameraInput!.close();
    }
    console.info('Exit releaseInput');
    return true;
  }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray[idx], camera.SceneMode.NORMAL_PHOTO);

    if (cameraOutputCap != undefined) {
      if (cameraOutputCap.previewProfiles != null) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager!.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (mPreviewOutput != undefined) {
            break;
          }
        }

        if (mPreviewOutput == undefined) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }

      if (cameraOutputCap.photoProfiles != null) {
        console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

        for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
          mPhotoOutput = mCameraManager!.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
          if (mPhotoOutput != undefined) {
            break;
          }
        }

        if (mPhotoOutput == undefined) {
          console.info(TAG + "createPhotoOutput FAILED");
        }

        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (mPreviewOutput != undefined && mPreviewOutput != null) {
      await mPreviewOutput!.release();
    }

    if (mPhotoOutput != undefined && mPhotoOutput != null) {
      await mPhotoOutput!.release();
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int): Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    await Utils.msSleep(1000);

    mCameraSession!.beginConfig();

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to addInput");
      mCameraSession!.addInput(mCameraInput!);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession!.addOutput(mPreviewOutput!);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession!.addOutput(mPhotoOutput!);
    }

    await Utils.msSleep(300);

    await mCameraSession!.commitConfig();
    console.info(TAG + "commitConfig end");
    await Utils.msSleep(50);

    await mCameraSession!.start();

    await Utils.msSleep(100);
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");
    await mCameraSession!.stop();
    await Utils.msSleep(100);
    mCameraSession!.beginConfig();

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession!.removeInput(mCameraInput!);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession!.removeOutput(mPreviewOutput!);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      mCameraSession!.removeOutput(mPhotoOutput!);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  let releaseCameraSession = async () => {
    console.info(TAG + "Enter releaseCameraSession");
    await mCameraSession!.stop();
    await Utils.msSleep(100);
    await releaseInput();
    await releaseOutput();
    await mCameraSession!.release();
    console.info(TAG + "Exit releaseCameraSession");
    return true;
  }

  describe('CameraPhotoSessionTest', () => {
    console.info(TAG + '----------CameraPhotoSessionTest--------------')

    beforeAll(async (): Promise<void> => {
      console.info('beforeAll case');
      await getPhotoReceiverSurface();
      getPreviewOutputSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      await Utils.msSleep(500);
    })

    beforeEach(async (): Promise<void> => {
      console.info('beforeEach case');
      await Utils.msSleep(100);
    })

    afterEach(async (): Promise<void> => {
      console.info('afterEach case');
      await Utils.msSleep(100);
      await releaseCameraSessionInstance();
    })

    afterAll(async (): Promise<void> => {
      console.info('afterAll case');
      await releaseCameraSessionInstance();
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100
     * @tc.desc   white balance api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try{
          createCameraSessionInstance();
          await startCameraSession(0);
          let flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.CLOUDY);
          let range = mCameraSession!.getWhiteBalanceRange();
          mCameraSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.DAYLIGHT);
          let mode = mCameraSession!.getWhiteBalanceMode();
          flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.AUTO);
          flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.CLOUDY);
          flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.INCANDESCENT);
          flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.FLUORESCENT);
          flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.DAYLIGHT);
          flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.MANUAL);
          flag = mCameraSession!.isWhiteBalanceModeSupported(camera.WhiteBalanceMode.LOCKED);
          let value: int = 5000;
          mCameraSession!.setWhiteBalance(value);
          let whiteBalance: int = mCameraSession!.getWhiteBalance();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100 start PASSED");
          await stopCameraSession();
        } catch (err) {
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_SESSION_WHITE_BALANCE_PROMISE_STATIC_0100 FAILED" + err.code);
          expect(true).assertFalse();
        }
        done();
      }
    })

    let exposureStateCallback = (exposureState: camera.ExposureState) => {
      console.info(TAG, `exposureState: ${exposureState}.`);
    }
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_EXPOSURE_STATE_CALLBACK_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_EXPOSURE_STATE_CALLBACK_PROMISE_0100
     * @tc.desc   exposureinfo callback api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_EXPOSURE_STATE_CALLBACK_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_EXPOSURE_STATE_CALLBACK_PROMISE_0100--------------");
 
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_EXPOSURE_STATE_CALLBACK_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try{
          createCameraSessionInstance();
          mCameraSession!.onExposureStateChange(exposureStateCallback);
          mCameraSession!.offExposureStateChange(exposureStateCallback);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_EXPOSURE_STATE_CALLBACK_PROMISE_0100 start PASSED");
        } catch (err) {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_SESSION_EXPOSURE_STATE_CALLBACK_PROMISE_0100 FAILED" + err.code);
            expect(true).assertFalse();
        }
        done();
      }
    })

    // ===========================================================【相机框架】支持Touch锁定曝光========================================================

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0100
     * @tc.name      SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0100
     * @tc.desc      test sub multimedia camera enum ExposureState
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("Enter SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0100")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);

      //--------------------------------------------测试过程------------------------------------------------------
      console.info("camera ExposureState EXPOSURE_STATE_SCAN: ", camera.ExposureState.EXPOSURE_STATE_SCAN)
      expect(camera.ExposureState.EXPOSURE_STATE_SCAN).assertEqual(0)
      console.info("camera ExposureState EXPOSURE_STATE_CONVERGED: ", camera.ExposureState.EXPOSURE_STATE_CONVERGED)
      expect(camera.ExposureState.EXPOSURE_STATE_CONVERGED).assertEqual(1)

      //--------------------------------------------后置处理------------------------------------------------------
      console.info("Exit SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0100")
      done()
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0200
     * @tc.name      SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0200
     * @tc.desc      test sub multimedia camera session on exposureStateChange success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      //--------------------------------------------预置条件------------------------------------------------------
        console.info("Enter SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0200")
        createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);

      //--------------------------------------------测试过程------------------------------------------------------
        mCameraSession!.onExposureStateChange((state: camera.ExposureState) => {
          console.info(`exposureStateChange, state: ${state}`)
        })
      } catch (error) {
        console.error(`on exposureStateChange failed: ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
        //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0200")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0300
     * @tc.name      SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0300
     * @tc.desc      test sub multimedia camera session off exposureStateChange success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      //--------------------------------------------预置条件------------------------------------------------------
        console.info("Enter SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0300")
        createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);

      //--------------------------------------------测试过程------------------------------------------------------
        mCameraSession!.offExposureStateChange((state: camera.ExposureState) => {
          console.info(`off exposureStateChange, state: ${state}`)
        })
      } catch (error) {
        console.error(`off exposureStateChange failed: ${JSON.stringify(error)}`)
        expect().assertFail()

      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0300")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0400
     * @tc.name      SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0400
     * @tc.desc      test sub multimedia camera session get exposureState success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info("Enter SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0400")
        createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
        await startCameraSession(0);
        let isExposureStart = false;
        let isExposureFinish = false;

        //--------------------------------------------测试过程------------------------------------------------------
        mCameraSession!.onExposureStateChange((state: camera.ExposureState) => {
          console.info(`on exposureStateChange, state: ${state}`)
          if (state == 0) {
            isExposureStart = true
          } else if (state == 1) {
            isExposureFinish = true
          }
        });

        mCameraSession!.start()

        let startTime = Date.now()
        while (!isExposureFinish) {
          await Utils.msSleep(100);
          if (Date.now() - startTime > 5000) {
            break;
          }
        }
        expect(isExposureStart).assertTrue();
        expect(isExposureFinish).assertTrue();

        mCameraSession!.offExposureStateChange()

      } catch (error) {
        console.error(`SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0400 failed: ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
        //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_EXPOSURE_STATE_0400")
        done()
        await releaseCameraSession();
      }
    })

    // ===========================================================【相机框架】支持色调调节========================================================

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0100
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0100
     * @tc.desc      test sub multimedia camera session getColorTintRange
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0100")
        createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
        await startCameraSession(0);

        //--------------------------------------------测试过程------------------------------------------------------
        let range = mCameraSession!.getColorTintRange()
        console.info(`camera session getColorTintRange, range: ${range}`)
        expect(range != undefined).assertTrue()
      } catch (error) {
        console.error(`getColorTintRange failed, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0100")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0200
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0200
     * @tc.desc      test sub multimedia camera session getColorTintRange with errorCode 7400103
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0200")
        createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);

      //--------------------------------------------测试过程------------------------------------------------------
        let range = mCameraSession!.getColorTintRange()
        console.error(`camera session getColorTintRange expected failed, but success, range: ${range}`)
        expect().assertFail()
      } catch (error) {
        console.error(`getColorTintRange failed, ${JSON.stringify(error)}`)
        expect(error.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0200")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0300
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0300
     * @tc.desc      test sub multimedia camera session setColorTint with minValue
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0300")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);

      //--------------------------------------------测试过程------------------------------------------------------
      let range = mCameraSession!.getColorTintRange();
      console.info(`camera session getColorTintRange, range: ${range}`);
      if (range.length < 1) {
        console.error(`not surported tone control, please check`)
        expect().assertFail()
      }
      try {
        mCameraSession!.setColorTint(range[0])
        let currentInt = mCameraSession!.getColorTint()
        console.info(`getColorTint: ${currentInt}`)
        expect(currentInt).assertEqual(range[0])
      } catch (error) {
        console.error(`setColorTint failed, value: ${range[0]}, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0300")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0400
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0400
     * @tc.desc      test sub multimedia camera session setColorTint with maxValue
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0400")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);

      //--------------------------------------------测试过程------------------------------------------------------
      let range = mCameraSession!.getColorTintRange();
      console.info(`camera session getColorTintRange, range: ${range}`);
      if (range.length < 1) {
        console.error(`not surported tone control, please check`)
        expect().assertFail()
      }
      try {
        mCameraSession!.setColorTint(range[1])
        let currentInt = mCameraSession!.getColorTint()
        console.info(`getColorTint: ${currentInt}`)
        expect(currentInt).assertEqual(range[1])
      } catch (error) {
        console.error(`setColorTint failed, value: ${range[1]}, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0400")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0500
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0500
     * @tc.desc      test sub multimedia camera session setColorTint with int
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0500")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);

      //--------------------------------------------测试过程------------------------------------------------------
      let range = mCameraSession!.getColorTintRange();
      console.info(`camera session getColorTintRange, range: ${range}`);
      if (range.length < 1) {
        console.error(`not surported tone control, please check`)
        expect().assertFail()
      }
      let val = Math.floor((range[0] + range[1]) / 2)
      try {
        console.info(`setColorTint: ${val}`);
        mCameraSession!.setColorTint(val)
        let currentInt = mCameraSession!.getColorTint()
        console.info(`getColorTint: ${currentInt}`)
        expect(currentInt).assertEqual(val)
      } catch (error) {
        console.error(`setColorTint failed, value: ${val}, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0500")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0600
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0600
     * @tc.desc      test sub multimedia camera session setColorTint with float
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0600")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);

      //--------------------------------------------测试过程------------------------------------------------------
      let range = mCameraSession!.getColorTintRange();
      console.info(`camera session getColorTintRange, range: ${range}`);
      if (range.length < 1) {
        console.error(`not surported tone control, please check`)
        expect().assertFail()
      }
      let val = (range[0] + range[1] - 0.1) * 0.99 / 2
      try {
        console.info(`setColorTint: ${val}`);
        mCameraSession!.setColorTint(val)
      } catch (error) {
        console.error(`setColorTint failed, value: ${val}, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0600")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0800
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0800
     * @tc.desc      test sub multimedia camera session setColorTint with value out of range
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0800")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);

      //--------------------------------------------测试过程------------------------------------------------------
      let range: number[] = mCameraSession!.getColorTintRange();
      console.info(`camera session getColorTintRange, range: ${range}`);
      if (range.length < 1) {
        console.error(`not surported tone control, please check`)
        expect().assertFail()
      }
      let testRange = [range[0]-1, range[1]+1]
      for (let val of testRange) {
        try {
          console.info(`setColorTint: ${val}`);
          mCameraSession!.setColorTint(val)
          console.error(`setColorTint expected failed, but success, value: ${val}`)
          expect().assertFail()
        } catch (error) {
          console.error(`setColorTint failed, value: ${val}, ${JSON.stringify(error)}`)
          expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue()
        }
      }

      //--------------------------------------------后置处理------------------------------------------------------
      console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0800")
      done()
      await releaseCameraSession();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0900
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0900
     * @tc.desc      test sub multimedia camera session setColorTint with errorCode 7400103
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0900")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);

      //--------------------------------------------测试过程------------------------------------------------------
      let val = 1
      try {
        console.info(`setColorTint: ${val}`);
        mCameraSession!.setColorTint(val)
        console.error(`setColorTint expected failed, but success, value: ${val}`)
        expect().assertFail()
      } catch (error) {
        console.error(`setColorTint failed, value: ${val}, ${JSON.stringify(error)}`)
        expect(error.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_0900")
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_1000
     * @tc.name      SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_1000
     * @tc.desc      test sub multimedia camera session getColorTint with errorCode 7400103
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      //--------------------------------------------预置条件------------------------------------------------------
      console.info("SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_1000")
      createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);

      //--------------------------------------------测试过程------------------------------------------------------
      try {
        let currentInt = mCameraSession!.getColorTint()
        console.error(`getColorTint expected failed, but success, value: ${currentInt}`)
        expect().assertFail()
      } catch (error) {
        console.error(`getColorTint failed, ${JSON.stringify(error)}`)
        expect(error.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue()
      } finally {
      //--------------------------------------------后置处理------------------------------------------------------
        console.info("Exit SUB_MULTIMEDIA_CAMERA_TONE_CONTROL_1000")
        done()
        await releaseCameraSession();
      }
    })

    // ===========================================【相机框架】快捷变焦点上报生态开放 ========================================
    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0100
     * @tc.name      SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0100
     * @tc.desc      test sub multimedia camera session getZoomPointInfos
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0100"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);
        await startCameraSession(0);

        //--------------------------------------------测试过程------------------------------------------------------
        let zoomPointInfos = mCameraSession!.getZoomPointInfos()
        console.info(`camera session getZoomPointInfos: ${JSON.stringify(zoomPointInfos)}`);
        expect(zoomPointInfos.length).assertLarger(0)
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, error: ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
        done()
        await releaseCameraSession();
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0200
     * @tc.name      SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0200
     * @tc.desc      test sub multimedia camera session getZoomPointInfos with errorCode 7400103
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_QUICK_ZOOM_POINT_0200"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        createCameraSessionInstanceWithSceneMode(camera.SceneMode.NORMAL_PHOTO);

        //--------------------------------------------测试过程------------------------------------------------------
        try {
          let zoomPointInfos = mCameraSession!.getZoomPointInfos()
          console.error(`camera session getZoomPointInfos expected failed, but success: ${JSON.stringify(zoomPointInfos)}`);
          expect().assertFail()
        } catch (error) {
          console.info(`camera session getZoomPointInfos failed: ${JSON.stringify(error)}`);
          expect(error.code == camera.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue()
        }
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED`)
        expect().assertFail()
      } finally {
        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
        done()
        await releaseCameraSession();
      }
    })
    
  })
}