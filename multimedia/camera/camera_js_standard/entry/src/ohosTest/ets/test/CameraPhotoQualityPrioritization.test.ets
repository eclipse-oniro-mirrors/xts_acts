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
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import { BusinessError } from "@kit.BasicServicesKit";

const TAG = "CameraPhotoQualityPrioritizationTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.PhotoSession;

let mPhotoSurface: string;

let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;

let context = getContext();
let receiver: image.ImageReceiver;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

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

export default function CameraPhotoQualityPrioritizationTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let file: ESObject;
  let fdNumber: number;

  let getFd = async (pathName: string) => {
    let fileDir: ESObject = await await AppStorage.get('pathDir');
    pathName = fileDir + '/' + pathName;
    file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let fileAsset: ESObject = file;
    fdNumber = file.fd;
    let fdPath = "fd://" + fdNumber.toString();
    console.info('case getFd number is: ' + fdNumber);
  }

  let closeFd = async () => {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
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

    mCameraManager = cameraObj.getCameraManager(context);
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

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
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

    await mCameraInput.open();

    await sleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

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

  let createOutput = (idx: number) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx],
      cameraObj.SceneMode.NORMAL_PHOTO);

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
    }

    console.info(TAG + 'Exit createOutputs');

    return true;
  }

  let releaseOutput = async () => {
    console.info(TAG + 'Enter releaseOutput');

    if (!isEmpty(mPreviewOutput)) {
      await mPreviewOutput.release();
    }

    if (!isEmpty(mPhotoOutput)) {
      await mPhotoOutput.release();
    }
    console.info(TAG + 'Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    mCameraSession.beginConfig();
    console.info(TAG + "Start to beginConfig");

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
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async () => {
    console.info(TAG + "Enter stopCameraSession");

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession.removeInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession.removeOutput(mPreviewOutput);
    }

    if (!isEmpty(mPhotoOutput)) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      mCameraSession.removeOutput(mPhotoOutput);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('CameraPhotoQualityPrioritizationTest', () => {
    console.info(TAG + '----------CameraPhotoQualityPrioritizationTest--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      await ability();
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }

      console.info(TAG + 'beforeAll case');
    })

    beforeEach(async () => {
      createCameraSessionInstance();
      await sleep(500);
      console.info(TAG + 'beforeEach case');
    })

    afterEach(async () => {
      await releaseCameraSessionInstance();
      await sleep(1000);
      console.info(TAG + 'afterEach case');
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100
     * @tc.desc   Check whether photo quality prioritization of the HIGH_QUALITY type is supported and set it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100 FAILED with NoCamera");
        done();
      }
      await startCameraSession(0);
      let isSupported: boolean = false;
      isSupported = mPhotoOutput.isPhotoQualityPrioritizationSupported(cameraObj.PhotoQualityPrioritization.HIGH_QUALITY)
      if (isSupported == false) {
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100 not Support PhotoQualityPrioritization');
        await stopCameraSession();
        console.info('stopCameraSession end');
        done();
        return;
      }
      
      try {
        mPhotoOutput.setPhotoQualityPrioritization(cameraObj.PhotoQualityPrioritization.HIGH_QUALITY);
        console.info(TAG + "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100 finish");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100 FAILED err : " + JSON.stringify(err));
        expect().assertFail();
      }
      await stopCameraSession();
      console.info(TAG +'stopCameraSession end');
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200
     * @tc.desc   Check whether photo quality prioritization of the SPEED type is supported and set it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200 FAILED with NoCamera");
        done();
        return;
      }
      await startCameraSession(0);
      let isSupported: boolean = false;
      isSupported = mPhotoOutput.isPhotoQualityPrioritizationSupported(cameraObj.PhotoQualityPrioritization.SPEED)
      if (isSupported == false) {
        console.info(TAG +
          'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200 not Support PhotoQualityPrioritization');
        await stopCameraSession();
        console.info(TAG +'stopCameraSession end');
        done();
        return;
      }
      try {
          mPhotoOutput.setPhotoQualityPrioritization(cameraObj.PhotoQualityPrioritization.SPEED);
          console.info(TAG + "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200 finish");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200 FAILED err : " + JSON.stringify(err));
        expect().assertFail();
      }
      await stopCameraSession();
      console.info(TAG + 'stopCameraSession end');
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0200 ends here");
      done();   
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300
     * @tc.desc   Check whether photo quality prioritization of the invalid type is supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300 FAILED with NoCamera");
        done();
        return;
      }
      await startCameraSession(0);
      let isSupported: boolean = false;
      let value: number = -1;
      let quality: cameraObj.PhotoQualityPrioritization = value as cameraObj.PhotoQualityPrioritization;
      try {
        isSupported = mPhotoOutput.isPhotoQualityPrioritizationSupported(quality)
        console.info(TAG + "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300 finish");
        expect(isSupported).assertFalse();
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300 FAILED err : " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0300 ends here");
      await stopCameraSession();
      console.info(TAG +'stopCameraSession end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400
     * @tc.desc   Check whether photo quality prioritization is supported when session is not config.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400 FAILED with NoCamera");
        done();
        return;
      }
      let isSupported: boolean = false;
      try {
        isSupported = mPhotoOutput.isPhotoQualityPrioritizationSupported(cameraObj.PhotoQualityPrioritization.HIGH_QUALITY);
        console.info(TAG + "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400 finish");
        expect(isSupported).assertFalse();
      } catch (err) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400 ends here");
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0400 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500
     * @tc.desc   Set photo quality prioritization of the invalid type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500 FAILED with NoCamera");
        done();
        return;
      }
      await startCameraSession(0);

      try {
        let value: number = -1;
        let quality: cameraObj.PhotoQualityPrioritization = value as cameraObj.PhotoQualityPrioritization;
        mPhotoOutput.setPhotoQualityPrioritization(quality)
        console.info(TAG + "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500 Success");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500 FAILED err : " + JSON.stringify(err));
          expect(err.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_PHOTO_QUALITY_PRIORITIZATION_0500 ends here");
      await stopCameraSession();
      console.info(TAG + 'stopCameraSession end');
      done();
    })
  })
}