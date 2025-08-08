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

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { surfaceIds } from '../testability/pages/Index';

const TAG = "CameraPreconfigTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.PhotoSession;
let mVideoSession: cameraObj.VideoSession;
let mPhotoOutput: cameraObj.PhotoOutput;
let cameraOutputCap: cameraObj.CameraOutputCapability;
let mPreviewOutput: cameraObj.PreviewOutput;
let mMetadataObjectTypeArray: Array<cameraObj.MetadataObjectType> | undefined;
let metadataOutput: cameraObj.MetadataOutput;
let mCameraInput: cameraObj.CameraInput;

let mPhotoSurface: string | cameraObj.Profile;
let mCameraNum: number;

let receiver: image.ImageReceiver;
let context = getContext();

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
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

  let createCameraSessionInstance = (sceneMode: cameraObj.SceneMode) => {
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
  }

  let createVideoSessionInstance = () => {
    console.info('Enter createVideoSessionInstance');

    try {
      mVideoSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_VIDEO);
    } catch {
      console.info('createVideoSession FAILED');
    }

    if (isEmpty(mVideoSession)) {
      console.info(TAG + "createVideoSession FAILED");
      return false;
    }

    mVideoSession.beginConfig();

    console.info('Exit createVideoSessionInstance');

    return true;
  }

  let createOutput = (idx: number) => {
    console.info(TAG + 'Enter createOutput');
    cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);
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
    if (!isEmpty(cameraOutputCap.supportedMetadataObjectTypes)) {
      mMetadataObjectTypeArray = cameraOutputCap.supportedMetadataObjectTypes;
      if (isEmpty(mMetadataObjectTypeArray)) {
        console.info(TAG + "mMetadataObjectTypeArray is null");
      } else {
        console.info(TAG + "createMetadataOutput")
        metadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypeArray);
      }
    }
    console.info(TAG + 'Exit createOutputs');
    return true;
  }

  let createInput = async (idx: number) => {
    console.info(TAG + 'Enter createInput');
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
    sleep(100);
    console.info(idx + 'th CameraInput is: ' + mCameraInput);
    console.info(TAG + 'Exit createInput');
    return true;
  }

  let releaseInput = async () => {
    console.info(TAG + 'Enter releaseInput');

    if (!isEmpty(mCameraInput)) {
      await mCameraInput!.close();
      // mCameraInput = null;
    }

    console.info(TAG + 'Exit releaseInput');

    return true;
  }


  describe('CameraNoPermissionErrorCodeTest', () => {
    console.info(TAG + '----------CameraPreconfigTest--------------')

    beforeAll(async () => {
      sleep(100);
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createVideoSessionInstance();
      createCameraSessionInstance(cameraObj.SceneMode.NORMAL_PHOTO)
      console.info('beforeAll case');
    })

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(100);
      await releaseInput();
    })

    afterAll(async () => {
      await releaseCameraSessionInstance();
      await sleep(1000);
      console.info('afterAll case');
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200
     * @tc.name      : test Photo session canpreconfig api with error code 7400201
     * @tc.desc      : test Photo session canpreconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200--------------");
      try {
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200 SUCCESS");
        let canPreconfig = mCameraSession.canPreconfig(0);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_0200 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400201');
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200
     * @tc.name      : test Photo session preconfig api with error code 7400201
     * @tc.desc      : test Photo session preconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200 SUCCESS");
        mCameraSession.preconfig(0);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_0200 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400201');
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100
     * @tc.name      : test video session preconfig api with error code 7400201
     * @tc.desc      : test video session preconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100--------------");
        try {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100 SUCCESS");
          mVideoSession.preconfig(0);
          done();
        } catch (error) {
          let err = error as BusinessError;
          console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_ERROR_CODE_0100 ERRORCODE: " + err.code);
          expect(err.code).assertEqual('7400201');
          done();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100
     * @tc.name      : test video session canpreconfig api with error code 7400201
     * @tc.desc      : test video session canpreconfig api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100--------------");
        try {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100 SUCCESS");
          mVideoSession.canPreconfig(0);
          done();
        } catch (error) {
          let err = error as BusinessError;
          console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CANPRECONFIG_ERROR_CODE_0100 ERRORCODE: " + err.code);
          expect(err.code == 7400201).assertTrue();
          done();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0100
     * @tc.name      : test create camera input api with error code 7400102
     * @tc.desc      : test create camera input api with error code 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0100 SUCCESS");
        if (mCameraNum >= 1) {
          mCameraManager.createCameraInput(mCameraDevicesArray[0]);
        }
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400102).assertTrue();
        
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0200
     * @tc.name      : test create camera input api with error code 7400201
     * @tc.desc      : test create camera input api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0200 SUCCESS");
        mCameraManager.createCameraInput(0,0);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_ERROR_CODE_0200 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400201');
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_ERROR_CODE_0100
     * @tc.name      : test create photo output api with error code 7400101
     * @tc.desc      : test create photo output api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_ERROR_CODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_ERROR_CODE_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_ERROR_CODE_0100 SUCCESS");
        mCameraManager.createPhotoOutput(null);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_ERROR_CODE_0100 ERRORCODE: " + err.code);
        expect(err.code).assertEqual('7400101');
        done();
      }
      done();
    })

     /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_SSESION_ERROR_CODE_0100
     * @tc.name      : test create ssesion api with error code 7400101
     * @tc.desc      : test create ssesion api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_SSESION_ERROR_CODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_SSESION_ERROR_CODE_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_SSESION_ERROR_CODE_0100 SUCCESS");
        mCameraManager.createSession(null);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_SSESION_ERROR_CODE_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400101).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0100
     * @tc.name      : test enable moving photo api with error code 7400201
     * @tc.desc      : test enable moving photo api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0100 SUCCESS");
        let photoOutput = mCameraManager.createPhotoOutput();
        photoOutput.enableMovingPhoto(true);
        photoOutput.enableMovingPhoto(false);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400201).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0200
     * @tc.name      : test enable moving photo api with error code 7400101
     * @tc.desc      : test enable moving photo api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0200 SUCCESS");
        let photoOutput = mCameraManager.createPhotoOutput();
        photoOutput.enableMovingPhoto(null);
        photoOutput.enableMovingPhoto(undefined);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ENABLE_MOVING_PHOTO_0200 ERRORCODE: " + err.code);
        expect(err.code == 7400101).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0100
     * @tc.name      : test enable mirror api with error code 7400103
     * @tc.desc      : test enable mirror api with error code 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0100 SUCCESS");
        let photoOutput = mCameraManager.createPhotoOutput();
        photoOutput.enableMirror(true);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0200
     * @tc.name      : test enable mirror api with error code 7400101
     * @tc.desc      : test enable mirror api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0200 SUCCESS");
        if (mCameraNum >= 1) {
          let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
          let photoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
          photoOutput.enableMirror(null);
        }
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_0200 ERRORCODE: " + err.code);
        expect(err.code == 7400101).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0100
     * @tc.name      : test set preview rotation api with error code 7400101
     * @tc.desc      : test set preview rotation api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0100 SUCCESS");
        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
        let mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
        mPreviewOutput.setPreviewRotation(null, null);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400101).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0200
     * @tc.name      : test set preview rotation api with error code 7400201
     * @tc.desc      : test set preview rotation api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0200 SUCCESS");
        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
        let mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
        mPreviewOutput.setPreviewRotation(cameraObj.ImageRotation.ROTATION_0, false);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_PREVIEW_ROTATION_0200 ERRORCODE: " + err.code);
        expect(err.code == 7400201).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0100
     * @tc.name      : test get preview rotation api with error code 7400101
     * @tc.desc      : test get preview rotation api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0100 SUCCESS");
        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
        let mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
        mPreviewOutput.getPreviewRotation(null);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400101).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0200
     * @tc.name      : test get preview rotation api with error code 7400201
     * @tc.desc      : test get preview rotation api with error code 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0200--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0200 SUCCESS");
        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
        let mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
        mPreviewOutput.getPreviewRotation(cameraObj.ImageRotation.ROTATION_0);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_PREVIEW_ROTATION_0200 ERRORCODE: " + err.code);
        expect(err.code == 7400201).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ADD_SECURE_OUTPUT_0100
     * @tc.name      : test add secure output api with error code 7400101
     * @tc.desc      : test add secure output api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ADD_SECURE_OUTPUT_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ADD_SECURE_OUTPUT_0100--------------");
      let cameraSession:cameraObj.SecureSession = mCameraManager.createSession(12);
      cameraSession.beginConfig();
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ADD_SECURE_OUTPUT_0100 SUCCESS");
        cameraSession.addSecureOutput(null);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ADD_SECURE_OUTPUT_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400101).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SET_QUALITY_PRIORITIZATION_0100
     * @tc.name      : test set quality prioritization api with error code 7400101
     * @tc.desc      : test set quality prioritization api with error code 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SET_QUALITY_PRIORITIZATION_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SET_QUALITY_PRIORITIZATION_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SET_QUALITY_PRIORITIZATION_0100 SUCCESS");
        let cameraSession:cameraObj.VideoSession = mCameraManager.createSession(2);
        cameraSession.setQualityPrioritization(1);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SET_QUALITY_PRIORITIZATION_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_START_0100
     * @tc.name      : test start api with error code 7400103
     * @tc.desc      : test start api with error code 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_START_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_START_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_0100 SUCCESS");
        let cameraSession:cameraObj.VideoSession = mCameraManager.createSession(2);
        await cameraSession.start();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_START_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_COLOR_SPACE_0100
     * @tc.name      : test set color space api with error code 7400103
     * @tc.desc      : test set color space api with error code 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_COLOR_SPACE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_COLOR_SPACE_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_COLOR_SPACE_0100 SUCCESS");
        let cameraSession:cameraObj.PhotoSession = mCameraManager.createSession(1);
        cameraSession.setColorSpace(0);
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_SET_COLOR_SPACE_0100 ERRORCODE: " + err.code);
        expect(err.code == 7400103).assertTrue();
        done();
      }
      done();
    })
  })
}