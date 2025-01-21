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
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';
const TAG = "CameraUnitTest: ";

let captureLocation = {
  latitude: 0,
  longitude: 0,
  altitude: 0,
}

let captureSetting = {
  quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
  rotation: cameraObj.ImageRotation.ROTATION_0,
  location: captureLocation,
  mirror: false
}

// 创建视频录制的参数
let videoProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: 'audio/mp4a-latm',
  audioSampleRate: 48000,
  fileFormat: 'mp4',
  videoBitrate: 2000000,
  videoCodec: 'video/avc',
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
}

let videoConfig = {
  audioSourceType: 1,
  videoSourceType: 0,
  profile: videoProfile,
  url: 'file:///data/media/CameraOutput.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 },
  maxSize: 100,
  maxDuration: 500
}

// 创建录像输出流
let videoRecorder

let surfaceId1
let cameraManager;
let cameraDevicesArray;
let captureSession;
let cameraInput;
let previewOutput;
let photoOutput;
let videoOutput;
let metadataOutput;
let videoSurfaceId;
let fdPath;
let fileAsset;
let fdNumber;
let receiver;

let mMetadataObjectTypeArray;
let mMetadataObjectArray;
let context = featureAbility.getContext();
export default function cameraJSUnitOutput() {

  async function getImageReceiverSurfaceId() {
    console.log(TAG + 'Entering create Image receiver')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Receiver is ok')
      surfaceId1 = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Received id: ' + JSON.stringify(surfaceId1))
    } else {
      console.log(TAG + 'Receiver is not ok')
    }
  }

  async function getFd(pathName) {
    await featureAbility.getContext().getFilesDir().then((fileDir) => {
            console.info("case file dir is" + JSON.stringify(fileDir));
            pathName = fileDir + '/' + pathName;
            console.info("case pathName is" + pathName);
        });
        
        let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fileAsset = file;
        fdNumber = file.fd;
        fdPath = "fd://" + fdNumber.toString();
        console.info('case getFd number is: ' + fdObject.fdNumber);
  }

  async function closeFd() {
        console.info('case come in closeFd')
        if (fdNumber != null) {
            fs.closeSync(fdNumber);
        } else {
            console.info('[fs.closeSync] case fdNumber is null');
        }
  }

  async function getvideosurface() {
    await getFd('CameraOutput.mp4');
    await sleep(2000);
    videoConfig.url = fdPath;
    media.createAVRecorder((err, recorder) => {
      if (!err) {
        console.info(TAG + 'createVideoRecorder called')
        videoRecorder = recorder
        console.info(TAG + 'videoRecorder is :' + JSON.stringify(videoRecorder))
        console.info(TAG + 'videoRecorder.prepare called.')
        videoRecorder.prepare(videoConfig, (err) => {
          if (!err) {
            console.info(TAG + 'videoRecorder.prepare success.')
            videoRecorder.getInputSurface((err, id) => {
              console.info(TAG + 'getInputSurface called')
              if (!err) {
                videoSurfaceId = id
                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(videoSurfaceId))
              } else {
                console.info(TAG + 'getInputSurface FAILED')
              }
            })
          } else {
            console.info(TAG + 'prepare FAILED')
          }
        })
      }
      else {
        console.info(TAG + 'createVideoRecorder FAILED ,Code' + err.code)
      }
    })
  }

  async function release() {
    console.log(TAG + "start release");
    await videoRecorder.release();
    videoRecorder = null;
    await captureSession.release();
    console.log(TAG + "release end")
  }


  function sleep(ms) {
    console.info(TAG + "Entering sleep -> Promise constructor");
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  function isEmpty(data) {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  function getSupportedOutputCapabilityInPromise(cameraDevice) {
    if (isEmpty(cameraManager)) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
      expect().assertFail();
      return undefined;
    }
    let outputCapabilityPromise = cameraManager.getSupportedOutputCapability(cameraDevice);
    console.info("CameraUnitTest: Entering testSupportedOutputCapabilityPromise: " + JSON.stringify(outputCapabilityPromise));
    expect(isEmpty(outputCapabilityPromise)).assertFalse();

    return outputCapabilityPromise;
  }

  describe('cameraJSUnitOutput', function () {
    console.info(TAG + '----------cameraJSUnitOutput begin--------------')

    beforeAll(async function () {
      await getImageReceiverSurfaceId();
      await getvideosurface();
      sleep(2000);
      console.info('beforeAll case');
    })

    beforeEach(function () {
      sleep(5000);
      console.info('beforeEach case');
    })

    afterEach(async function () {
      console.info('afterEach case');
    })

    afterAll(function () {
      closeFd();
      release();
      console.info('afterAll case');
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100
      * @tc.name      : Create CameraManager instance async api
      * @tc.desc      : Create CameraManager instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100--------------");
      if (isEmpty(cameraObj)) {
        console.info(TAG + "Entering GET_CAMERA_MANAGER cameraManager == null || undefined")
        expect().assertFail();
      } else {
        cameraManager = cameraObj.getCameraManager(context);
        await sleep(1000);
        done();
      }
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100
      * @tc.name      : Get camera from cameramanager to get array of camera async api
      * @tc.desc      : Get camera from cameramanager to get array of camera async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100', 1, async function (done) {
      console.info("--------------GET_CAMERAS--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering GET_CAMERAS cameraManager == null || undefined")
        expect().assertFail();
      }
      cameraDevicesArray = cameraManager.getSupportedCameras();

      if (isEmpty(cameraDevicesArray)) {
        expect().assertFail();
        console.info(TAG + "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
      } else {
        console.info(TAG + "Entering GET_CAMERAS data is not null || undefined");
        if (cameraDevicesArray != null && cameraDevicesArray.length > 0) {
          for (let i = 0; i < cameraDevicesArray.length; i++) {
            // Get the variables from camera object
            let cameraId = cameraDevicesArray[i].cameraId;
            expect(isEmpty(cameraId)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS camera" + i + "Id: " + cameraId);
            let cameraPosition = cameraDevicesArray[i].cameraPosition;
            expect(isEmpty(cameraPosition)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS camera" + i + "Position: " + cameraPosition);
            let cameraType = cameraDevicesArray[i].cameraType;
            expect(isEmpty(cameraType)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS camera" + i + "Type: " + cameraType);
            let connectionType = cameraDevicesArray[i].connectionType
            expect(isEmpty(connectionType)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS connection" + i + "Type: " + connectionType);
          }
          expect(true).assertTrue();
          console.info(TAG + "Entering GET_CAMERAS PASSED");
        }
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 2, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering CREATE_CAMERA_INPUT cameraManager == null || undefined")
        expect().assertFail();
      } else {
        cameraInput = cameraManager.createCameraInput(cameraDevicesArray[0]);
        if (isEmpty(cameraInput)) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
        }
        cameraInput.open(async (err) => {
          if (!err) {
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
      }
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100")
        let cameraOutputCap = getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        let previewProfilesArray = cameraOutputCap.previewProfiles;
        if (isEmpty(previewProfilesArray)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 previewProfilesArray == null || undefined")
          expect(isEmpty(previewProfilesArray)).assertFalse();
        }
        previewOutput = cameraManager.createPreviewOutput(previewProfilesArray[0], globalThis.surfaceId);
      }
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100
      * @tc.name      : Create photoOutput instance async api
      * @tc.desc      : Create photoOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        let photoProfilesArray = cameraOutputCap.photoProfiles;
        if (isEmpty(photoProfilesArray)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 previewProfilesArray == null || undefined")
          expect().assertFalse();
        }
        photoOutput = cameraManager.createPhotoOutput(photoProfilesArray[0], surfaceId1);
        if (isEmpty(photoOutput)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 data is empty");
          expect().assertFalse();
        }
      }
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100
      * @tc.name      : Create videoOutput instance async api
      * @tc.desc      : Create videoOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 camera:" + cameraDevicesArray[0].cameraId);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap.videoProfiles;
        expect(isEmpty(videoProfilesArray)).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 start createVideoOutput")
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
      }
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Create metadataOutput instance async api
      * @tc.desc      : Create metadataOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise(cameraDevicesArray[0]);
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 camera:" + cameraDevicesArray[0].cameraId);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        mMetadataObjectTypeArray = cameraOutputCap.supportedMetadataObjectTypes;
        if (isEmpty(mMetadataObjectTypeArray) || mMetadataObjectTypeArray.length < 1) {
          console.info("SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 end with mMetadataObjectTypeArray is null");
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 start createMetadataOutput")
          metadataOutput = cameraManager.createMetadataOutput(mMetadataObjectTypeArray);
        }
      }
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100
      * @tc.name      : Create CaptureSession instance api
      * @tc.desc      : Create CaptureSession instance api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_0100', 1, async function (done) {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100")
        captureSession = cameraManager.createCaptureSession();
      }
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100
      * @tc.name      : captureSession beginConfig
      * @tc.desc      : captureSession beginConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.beginConfig();
      }
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100
      * @tc.name      : captureSession addInput
      * @tc.desc      : captureSession addInput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addInput(cameraInput)
      }
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : captureSession add previewOutput
      * @tc.desc      : captureSession add previewOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(previewOutput)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100 previewOutput == null || undefined")
          expect().assertFail();
        }
        captureSession.addOutput(previewOutput)
      }
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100
      * @tc.name      : captureSession add photoOutput
      * @tc.desc      : captureSession add photoOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(photoOutput)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 photoOutput == null || undefined")
          expect().assertFail();
        }
        console.info(TAG + "captureSession start add photoOutput")
        captureSession.addOutput(photoOutput)
      }
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100
      * @tc.name      : captureSession remove photoOutput
      * @tc.desc      : captureSession remove photoOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addOutput(videoOutput)
      }
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : captureSession add metadataOutput
      * @tc.desc      : captureSession add metadataOutput
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (!isEmpty(metadataOutput)) {
          captureSession.addOutput(metadataOutput)
        }
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100
      * @tc.name      : captureSession commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.commitConfig(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Start metadataOutput type async api
      * @tc.desc      : Start metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.on('metadataObjectsAvailable', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 success");
            mMetadataObjectArray = data;
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
        })

      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100
      * @tc.name      : metadata output callback on error api
      * @tc.desc      : metadata output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 metadata is not support")
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        metadataOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100
      * @tc.name      : captureSession start
      * @tc.desc      : captureSession start
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Start metadataOutput type async api
      * @tc.desc      : Start metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
        })
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100
      * @tc.name      : Start metadataOutput type async api
      * @tc.desc      : Start metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let type = mMetadataObjectArray[0].type;
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 success, type : " + type);
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100
      * @tc.name      : Start metadataOutput timestamp async api
      * @tc.desc      : Start metadataOutput timestamp async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let timeStamp = mMetadataObjectArray[0].timestamp;
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 success, timeStamp : " + timeStamp);
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100
      * @tc.name      : Start metadataOutput bounding box async api
      * @tc.desc      : Start metadataOutput bounding box async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let boundingBox = mMetadataObjectArray[0].boundingBox;
        let w = boundingBox.width;
        let h = boundingBox.height;
        let tx = boundingBox.topLeftX;
        let ty = boundingBox.topLeftY;
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 success, boundingBox : " + w + "x" + h);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 success, boundingBox : " + tx + "x" + ty);
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100
      * @tc.name      : Stop metadataOutput type async api
      * @tc.desc      : Stop metadataOutput type async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.stop(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
       * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100
       * @tc.name      : Create previewOutput instance promise api
       * @tc.desc      : Create previewOutput instance promise api
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 start")
        previewOutput.start();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 end")
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100
      * @tc.name      : Create previewOutput instance promise api
      * @tc.desc      : Create previewOutput instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 start")
        previewOutput.stop();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 end")
      }
      await sleep(1000);
      done();
    })




    /**
       * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100
       * @tc.name      : Create previewOutput instance async api
       * @tc.desc      : Create previewOutput instance async api
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        previewOutput.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        previewOutput.stop(async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100
      * @tc.name      : preview output callback on frameStart api
      * @tc.desc      : preview output callback on frameStart api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        let count = 0;
        previewOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 success");
            count++;
          } else {
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
        previewOutput.start();
        previewOutput.stop();
        // expect(count == 1).assertTrue();
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100
      * @tc.name      : preview output callback on frameEnd api
      * @tc.desc      : preview output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
        let count = 0;
        previewOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            count++
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        previewOutput.stop();
        // expect(count == 1).assertTrue();
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100
      * @tc.name      : preview output callback on frameEnd api
      * @tc.desc      : preview output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        previewOutput.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100
      * @tc.name      : check photoOutput is mirror supported with promise mode
      * @tc.desc      : check photoOutput is mirror supported with promise mode
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        let isMirrorSupportedFlag = photoOutput.isMirrorSupported();

        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 isMirrorSupportedFlag = ' + isMirrorSupportedFlag);
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100
      * @tc.name      : photoOutput capture with promise mode
      * @tc.desc      : photoOutput capture with promise mode
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        await photoOutput.capture().then(() => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 success');
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 failed :' + err);
          expect().assertFail();
        });
      }
      await sleep(3000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 ends here");
          await sleep(3000);
          done();
        })
      }
      await sleep(3000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.quality = ' + captureSetting.quality);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.rotation = ' + captureSetting.rotation);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.latitude = ' + captureSetting.location.latitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.longitude = ' + captureSetting.location.longitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.altitude = ' + captureSetting.location.altitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.mirror = ' + captureSetting.mirror);

        await photoOutput.capture(captureSetting).then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 failed :' + err);
        });

      }
      await sleep(3000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100
      * @tc.name      : photoOutput commitConfig
      * @tc.desc      : captureSession commitConfig
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(captureSetting, async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 ends here");
          await sleep(3000);
          done();
        })
      }
      await sleep(3000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
      * @tc.name      : photo output callback on captureStart
      * @tc.desc      : photo output callback on captureStart
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 to operate");
        let count = 0;
        photoOutput.on('captureStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 FAILED: " + err.message);
          }
        })
        await sleep(1000);
        photoOutput.capture();
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
     * @tc.name      : photo output callback on captureStart
     * @tc.desc      : photo output callback on captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 to operate");
        let count = 0;
        photoOutput.on('captureStartWithInfo', async (err, data : cameraObj.CaptureStartInfo) => {
          if (!err) {
            expect((!isEmpty(data.captureId)) && (!isEmpty(data.time))).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 FAILED: " + err.message);
          }
        })
        await sleep(1000);
        photoOutput.capture();
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100
      * @tc.name      : photo output callback on frameShutter
      * @tc.desc      : photo output callback on frameShutter
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 to operate");
        let count = 0;
        photoOutput.on('frameShutter', async (err, data) => {
          if (!err) {
            count++;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, captureId = " + data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, timestamp = " + data.timestamp);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
        photoOutput.capture();

      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100
      * @tc.name      : photo output callback on captureEnd
      * @tc.desc      : photo output callback on captureEnd
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 to operate");
        let count = 0;
        photoOutput.on('captureEnd', async (err, data) => {
          if (!err) {
            count++;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, captureId = " + data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, frameCount = " + data.frameCount);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 FAILED: " + err.message);
          }
        })
        await sleep(1000);
        done();
        photoOutput.capture();

      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100
      * @tc.name      : photo output callback on error
      * @tc.desc      : photo output callback on error
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        photoOutput.on('error', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " + err.message);
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100
      * @tc.name      : videoOutput start promise api
      * @tc.desc      : videoOutput start promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 start")
        videoOutput.start();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 end")
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100
      * @tc.name      : videoOutput stop promise api
      * @tc.desc      : videoOutput stop promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 start")
        videoOutput.stop();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 end")
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100
      * @tc.name      : Start metadataOutput sync api
      * @tc.desc      : Start metadataOutput sync api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.start().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 ends here");
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100
      * @tc.name      : Stop metadataOutput sync api
      * @tc.desc      : Stop metadataOutput aync api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.stop().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 ends here");
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100
      * @tc.name      : videoOutput start async api
      * @tc.desc      : videoOutput start async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        videoOutput.start(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100
      * @tc.name      : videoOutput stop async api
      * @tc.desc      : videoOutput stop async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        videoOutput.stop(async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100
      * @tc.name      : video output callback on frameStart api
      * @tc.desc      : video output callback on frameStart api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        videoOutput.on('frameStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100
      * @tc.name      : video output callback on frameEnd api
      * @tc.desc      : video output callback on frameEnd api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
        videoOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100
      * @tc.name      : video output callback on error api
      * @tc.desc      : video output callback on error api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100--------------");
      if (isEmpty(videoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 videoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 to operate");
        videoOutput.on('error', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 FAILED: " + err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100
      * @tc.name      : Create previewOutput instance async api
      * @tc.desc      : Create previewOutput instance async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100', 1, async function (done) {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.release(async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 FAILED: " + err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })
  })

}