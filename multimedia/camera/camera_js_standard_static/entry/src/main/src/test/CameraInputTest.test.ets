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

import cameraObj from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import hilog from "@ohos.hilog";
import Utils from './Util.test';
import Context from "application.Context";
import image from '@ohos.multimedia.image';

const TAG = "CameraInputTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.VideoSession;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let receiver: image.ImageReceiver | undefined;
let surfaceId: string = '';

let isEmpty01 = (data: cameraObj.CameraManager) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty02 = (data: Array<cameraObj.CameraDevice>) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty03 = (data: cameraObj.VideoSession) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty04 = (data: cameraObj.CameraInput) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty05 = (data: cameraObj.CameraOutputCapability) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty06 = (data: Array<cameraObj.Profile>) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty07 = (data: cameraObj.PreviewOutput) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty08 = (data: BusinessError) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

 export default function cameraInputTest() {

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

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');

    let appContext: Context = Hypium.get("Context") as Context;
    console.info('Enter appContext');
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (isEmpty01(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }

    console.info('Exit getCameraManagerInstance');

    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');

    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let beginCameraSessionConfig = () => {
    console.info('Enter beginCameraSessionConfig');

    console.info(TAG + "Entering beginConfig start");
    mCameraSession.beginConfig();
    console.info(TAG + "Entering beginConfig end");
    console.info('Exit beginCameraSessionConfig');

    return true;
  }

  let commitCameraSessionConfig = async (): Promise<boolean> => {
    console.info('Enter commitCameraSessionConfig');

    await mCameraSession.commitConfig();

    await Utils.msSleep(500);

    console.info('Exit commitCameraSessionConfig');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
    } catch(err: BusinessError) {
      console.info('createCaptureSession FAILED');
    }

    if (isEmpty03(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }

    console.info('Exit createCameraSessionInstance');

    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession.release();
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');

    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    console.info('Enter mCameraDevicesArray');
    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx.toInt()]);
    console.info('Enter mCameraInput');

    if (isEmpty04(mCameraInput)) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }

    await mCameraInput.open();

    await Utils.msSleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');

    if (!isEmpty04(mCameraInput)) {
      await mCameraInput.close();
    }

    console.info('Exit releaseInput');

    return true;
  }

   let mPhotoSurface: string = "";
   let getPhotoReceiverSurface = async () => {
     console.log(TAG + 'Entering getPhotoReceiverSurface')
     receiver = image.createImageReceiver({height:960, width:1280} as image.Size, image.ImageFormat.JPEG, 8)
     console.log(TAG + 'before receiver check')
     if (receiver !== undefined) {
       console.log(TAG + 'Photo receiver is created successfully')
       mPhotoSurface = await receiver!.getReceivingSurfaceId()
       console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
     } else {
       console.log(TAG + 'Photo receiver is created failed')
     }
     console.log(TAG + 'Exit getPhotoReceiverSurface')
   }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()],
      cameraObj.SceneMode.NORMAL_VIDEO);
    console.log(TAG + 'Exit createOutput cameraOutputCap001')

    if (!isEmpty05(cameraOutputCap)) {
      if (!isEmpty06(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          console.log(TAG + 'Enter createOutput cameraOutputCap002')
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          console.log(TAG + 'Enter createOutput cameraOutputCap003')
          if (!isEmpty07(mPreviewOutput)) {
            break;
          }
        }

        if (isEmpty07(mPreviewOutput)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (!isEmpty07(mPreviewOutput)) {
      await mPreviewOutput.release();
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int): Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    beginCameraSessionConfig();
    await createInput(idx);
    console.info(TAG + "Enter startCameraSession createInput");
    createOutput(idx);
    console.info(TAG + "Enter startCameraSession createOutput");

    await Utils.msSleep(1);

    if (!isEmpty04(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty07(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    await Utils.msSleep(1);

    await commitCameraSessionConfig();

    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");

    if (!isEmpty04(mCameraInput)) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession.removeInput(mCameraInput);
    }

    if (!isEmpty07(mPreviewOutput)) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession.removeOutput(mPreviewOutput);
    }

    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }



   describe('CameraInputTest', () => {
    console.info(TAG + '----------CameraInputTest--------------');
    beforeAll(() => {
      try {
        await Utils.msSleep(1000);
        getPreviewOutputSurface();
        await getPhotoReceiverSurface();
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        createCameraSessionInstance();
        console.info('beforeAll case');
      } catch (err) {
        console.error('  beforeAll failed, err is ' + err);
      }
    });

    beforeEach(() => {
      await Utils.msSleep(1000);
      console.info('beforeEach case');
    });

    afterEach(() => {
      console.info('afterEach case');
    });

    afterAll(() => {
      await releaseCameraSessionInstance();
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100
     * @tc.desc   camera status callback on CameraInput async api for error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 start for camera[" + i + "]");
          await startCameraSession(i);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 startCameraSession");

          mCameraInput.onError(mCameraDevicesArray[i], (err: BusinessError) => {
            if (isEmpty08(err)) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 err == null || undefined");
              await stopCameraSession();
              expect().assertFail();
            } else {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 Callback SUCCESSFUL");
            }
            await Utils.msSleep(1);
          })

          try {
            mCameraInput.offError( mCameraDevicesArray[i]);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 off('reeor') SUCCESSFUL");
            done();
          } catch (error:BusinessError) {
            let err = error as BusinessError
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 off('error') FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            await stopCameraSession();
            expect().assertFail()
          }
          await stopCameraSession();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_STATIC_0100 PASSED");
        done();
      }
    });

    let occlusionDetectChange = (err: BusinessError | null, result: cameraObj.CameraOcclusionDetectionResult | undefined) => {
      if (err) {
        console.info(TAG, 'cameraOcclusionDetection err.');
      }
      if (!result) {
        console.info(TAG, 'cameraOcclusionDetection: undefined');
        return;
      }
      if (result.isCameraOccluded) {
        console.info(TAG, `onCameraOcclusionDetection isCameraOccluded: ${result.isCameraOccluded}`);
      }
      if (result.isCameraLensDirty) {
        console.info(TAG, `onCameraOcclusionDetection isCameraLensDirty: ${result.isCameraLensDirty}`);
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100
     * @tc.desc   camera status callback on CameraInput async api for cameraOcclusionDetection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100--------------");
   
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 start for camera[" + i + "]");
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          try {
            cameraInput.onCameraOcclusionDetection(occlusionDetectChange);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 onCameraOcclusionDetection SUCCESSFUL");
            done();
          } catch (error:BusinessError) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 onCameraOcclusionDetection FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            expect().assertFail()
            done();
          }
 
          try {
            cameraInput.offCameraOcclusionDetection(occlusionDetectChange);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 offCameraOcclusionDetectChange SUCCESSFUL");
            done();
          } catch (error:BusinessError) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 offCameraOcclusionDetectChange FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            expect().assertFail()
            done();
          }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_CAMERAOCCLUSIONDETECTION_0100 PASSED");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100
     * @tc.desc   open/close Camera with cameraInput callback api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100--------------");
      if (isEmpty01(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let successFlag = false;
          console.info(TAG + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          //expect(isEmpty04(cameraInput)).assertFalse();
          cameraInput.open((err: BusinessError | null) => {
            if (!err || err.code == 0) {
              successFlag = true;
              console.info(TAG +
                " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100 PASSED open with CameraID :" +
              camerasArray[i].cameraId);
            } else {
              successFlag = false;
              console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100 open FAILED: " +
              err.code);
            }
          });
          await Utils.msSleep(400);
          cameraInput.close((err) => {
            if (!err || err.code == 0) {
              console.info(TAG +
                " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100 PASSED close with CameraID :" +
              camerasArray[i].cameraId);
            } else {
              console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100 close FAILED: " +
              err.message);
              expect(false).assertTrue();
            }
          });
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_STATIC_0100 ends here");
      await Utils.msSleep(1000);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100
     * @tc.desc   open/close Camera with cameraInput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100";
      console.info(functionTag);
      if (isEmpty01(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let successFlag = false;
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 createCameraInput with camera: " +
          camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

          expect(isEmpty04(cameraInput)).assertFalse();
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 cameraInput open with camera: " +
          camerasArray[i].cameraId);
          cameraInput.open().then(() => {
            successFlag = true;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 PASSED open with CameraID :" +
            camerasArray[i].cameraId);
          }).catch((err: Error) => {
            successFlag = false;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 open FAILED: " + err.message);
          });
          await Utils.msSleep(400);
          successFlag = false;
          cameraInput.close().then(() => {
            successFlag = true;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 PASSED close with CameraID :" +
            camerasArray[i].cameraId);
          }).catch((err: Error) => {
            successFlag = false;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 close FAILED: " + err.message);
          });
          await Utils.msSleep(100);
          expect(successFlag).assertTrue();
          await Utils.msSleep(600);
        }
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_STATIC_0100 ends here");
      done();
    });
  })
}