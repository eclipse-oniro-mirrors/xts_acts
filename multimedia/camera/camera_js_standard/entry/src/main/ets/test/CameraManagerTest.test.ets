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
import fs from '@ohos.file.fs';
import media from '@ohos.multimedia.media';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';
const TAG = "CameraUnitTest: ";


let mCameraManager;
let mCameraDevicesArray;

let mPhotoSurface;
let mVideoRecorder;
let mVideoSurface;
let mFileAsset;
let mFdPath;
let mFdNumber;

let mCameraNum;
let receiver;
let context = featureAbility.getContext();
let mVideoProfileCfg = {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: 'audio/mp4a-latm',
    audioSampleRate: 48000,
    durationTime: 1000,
    fileFormat: 'mp4',
    videoBitrate: 2000000,
    videoCodec: 'video/avc',
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
}
  
let mVideoConfig = {
    audioSourceType: 1,
    videoSourceType: 0,
    profile: mVideoProfileCfg,
    url: 'file:///data/media/CameraManager.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

export default function cameraManagerTest() {

    async function getImageReceiverSurfaceId() {
        console.log(TAG + 'Entering create Image receiver')
        receiver = image.createImageReceiver(640, 480, 4, 8)
        console.log(TAG + 'before receiver check')
        if (receiver !== undefined) {
            console.log(TAG + 'Receiver is ok')
            mPhotoSurface = await receiver.getReceivingSurfaceId()
            console.log(TAG + 'Received id: ' + JSON.stringify(mPhotoSurface))
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
        mFileAsset = file;
        mFdNumber = file.fd;
        mFdPath = "fd://" + mFdNumber.toString();
        console.info('case getFd number is: ' + mFdNumber);
    }
    
    async function closeFd() {
        console.info('case come in closeFd')
        if (mFdNumber != null) {
            fs.closeSync(mFdNumber);
        } else {
            console.info('[fs.closeSync] case fdNumber is null');
        }
    }

    async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('CameraManager.mp4');
        mVideoConfig.url = mFdPath;
        media.createAVRecorder((err, recorder) => {
            if (!err) {
                console.info(TAG + 'Entering create video receiver')
                mVideoRecorder = recorder
                console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder))
                console.info(TAG + 'videoRecorder.prepare called.')
                mVideoRecorder.prepare(mVideoConfig, (err) => {
                    if (!err) {
                        console.info(TAG + 'videoRecorder.prepare success.')
                        mVideoRecorder.getInputSurface((err, id) => {
                            console.info(TAG + 'getInputSurface called')
                            if (!err) {
                                mVideoSurface = id
                                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(mVideoSurface))
                            } else {
                                console.info(TAG + 'getInputSurface FAILED')
                            }
                        })
                    } else {
                        console.info(TAG + 'prepare FAILED')
                    }
                })
            } else {
                console.info(TAG + 'createVideoRecorder FAILED')
            }
        })
        console.log(TAG + 'Exit getVideoReceiveSurface')
    }

    async function releaseVideoReceiveSurface() {
        console.log(TAG + 'Entering releaseVideoReceiveSurface')
        await mVideoRecorder.release()
        mVideoRecorder = null
        await closeFd();
        console.log(TAG + 'Exit releaseVideoReceiveSurface')
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

    function getCameraManagerInstance() {
        console.info('Enter getCameraManagerInstance');

        mCameraManager = cameraObj.getCameraManager(context);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }

        console.info('Exit getCameraManagerInstance');

        return true;
    }

    function getCameraSupportDevicesArray() {
        console.info('Enter getCameraSupportDevicesArray');
        
        mCameraDevicesArray = mCameraManager.getSupportedCameras();
        /*
        mCameraManager.getSupportedCameras(async (err, data) => {
            console.info(TAG + "Entering getCameraSupportDevicesArray callback");
            if (!err) {
                if (data != null || data != undefined) {
                    mCameraDevicesArray = data;
                    console.info(TAG + "Entering getCameraSupportDevicesArray PASSED with CameraDevicesArray is: " + data);
                } else {
                    console.info(TAG + "Entering getCameraSupportDevicesArray FAILED with CameraDevicesArray is: " + data);
                }
            } else {
                console.info(TAG + "Entering getCameraSupportDevicesArray FAILED : " + err.message);
            }
        })
        await sleep(3000);
        */
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

    function getSupportedOutputCapability(cameraDevice) {
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering getSupportedOutputCapability cameraManager == null || undefined")
            expect().assertFail();
            return undefined;
        }

        let outputCapability = mCameraManager.getSupportedOutputCapability(cameraDevice);

        if (isEmpty(outputCapability)) {
            console.info(TAG + "Entering getSupportedOutputCapability outputCapability == null || undefined")
        } else {
            console.info("CameraUnitTest: getSupportedOutputCapability: " + JSON.stringify(outputCapability));
        }

        return outputCapability;
    }

describe('CameraManagerTest', function () {
    console.info(TAG + '----------CameraManagerTest--------------')

    beforeAll(async function () {
        getCameraManagerInstance();
        await getImageReceiverSurfaceId();
        await getVideoReceiveSurface();
        getCameraSupportDevicesArray();
        console.info('beforeAll case');
    })
  
    beforeEach(function () {
        sleep(5000);
        console.info('beforeEach case');
    })

    afterEach(async function () {
        console.info('afterEach case');
    })

    afterAll(async function () {
        await releaseVideoReceiveSurface();
        sleep(1000);
        console.info('afterAll case');
    })



    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100
      * @tc.name      : Create camera manager instance promise api
      * @tc.desc      : Create camera manager instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100', 2, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100--------------");
        let cameraManagerPromise = cameraObj.getCameraManager(context);
        expect(isEmpty(cameraManagerPromise)).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_0100 cameraManagerPromise: " + JSON.stringify(cameraManagerPromise));
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100
      * @tc.name      : Get camera from cameramanager to get array of camera promise api
      * @tc.desc      : Get camera from cameramanager to get array of camera promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
            expect().assertFail();
        } else {
            let mCameraDevicesArrayPromise = mCameraManager.getSupportedCameras();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100: " + JSON.stringify(mCameraDevicesArrayPromise));
            if (mCameraDevicesArrayPromise != null && mCameraDevicesArrayPromise.length > 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 success");
                for (let i = 0; i < mCameraDevicesArrayPromise.length; i++) {
                    let cameraId = mCameraDevicesArrayPromise[i].cameraId;
                    expect(isEmpty(cameraId)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Id: " + cameraId);
                    let cameraPosition = mCameraDevicesArrayPromise[i].cameraPosition;
                    expect(isEmpty(cameraPosition)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Position: " + cameraPosition);
                    let cameraType = mCameraDevicesArrayPromise[i].cameraType;
                    expect(isEmpty(cameraType)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 camera" + i + "Type: " + cameraType);
                    let connectionType = mCameraDevicesArrayPromise[i].connectionType
                    expect(isEmpty(connectionType)).assertFalse();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 connection" + i + "Type: " + connectionType);
                }
                expect(true).assertTrue();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 PASSED");
            } else {
                expect().assertFail();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 FAILED");
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 ends here");
        await sleep(1000);
        done();
    })

        /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100
      * @tc.name      : Get camera from cameramanager to get array of camera promise api
      * @tc.desc      : Get camera from cameramanager to get array of camera promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
        it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100 cameraManager == null || undefined")
                expect().assertFail();
            } else {
                let mCameraDevicesArrayPromise = mCameraManager.getSupportedCameras();
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100: " + JSON.stringify(mCameraDevicesArrayPromise));
                if (mCameraDevicesArrayPromise != null && mCameraDevicesArrayPromise.length > 0) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100 success");
                    for (let i = 0; i < mCameraDevicesArrayPromise.length; i++) {
                        let sceneModes = mCameraManager.getSupportedSceneModes(mCameraDevicesArrayPromise[i]);
                        if (sceneModes != null && sceneModes.length > 0) {
                            sceneModes.forEach(sceneMode => {
                                expect(isEmpty(sceneMode)).assertFalse();
                            });
                        }
                        expect(true).assertTrue();
                    }
                    expect(true).assertTrue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100 PASSED");
                } else {
                    expect().assertFail();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100 FAILED");
                }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_0100 ends here");
            await sleep(1000);
            done();
        })

    /*GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let sceneModes = mCameraManager.getSupportedSceneModes(camerasArray[i]);
            if (sceneModes != null && sceneModes.length > 0) {
                for (const sceneMode of sceneModes) {
                    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(camerasArray[i], sceneMode);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100 camera:" + camerasArray[i].cameraId);
                    if (!isEmpty(cameraOutputCap)) {
                        let previewProfilesArray = cameraOutputCap.previewProfiles;
                        if (isEmpty(previewProfilesArray)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100 previewProfilesArray == null || undefined")
                            expect().assertFail();
                        } 
                        let photoProfilesArray = cameraOutputCap.photoProfiles;
                        if (isEmpty(photoProfilesArray)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100 photoProfilesArray == null || undefined")
                            expect().assertFail();
                        } 
                        let videoProfilesArray = cameraOutputCap.videoProfiles;
                        // only videoMode has videoProfiles
                        if (isEmpty(videoProfilesArray) && sceneMode == 2) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100 videoProfilesArray == null || undefined")
                            expect().assertFail();
                        } else {
                            expect(true).assertTrue();
                        }
                        let metadataObjectTypesArray = cameraOutputCap.supportedMetadataObjectTypes;
                        if (isEmpty(metadataObjectTypesArray)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100 metadataObjectTypesArray == null || undefined")
                        } 
                    } 
                }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 ends here");
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100
      * @tc.name      : Create CaptureSession instance promise api
      * @tc.desc      : Create Capturesession instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
        it('SUB_MULTIMEDIA_CAMERA_CREATE_MODE_SESSION_PROMISE_BY_MODE_0100', 2, async function (done) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_MODE_SESSION_PROMISE_BY_MODE_0100 to operate");
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                let sceneModes = mCameraManager.getSupportedSceneModes(camerasArray[i]);
                if (sceneModes != null && sceneModes.length > 0) {
                    for (const sceneMode of sceneModes) {
                        let captureSessionPromise = mCameraManager.createSession(sceneMode);
                        if (isEmpty(captureSessionPromise)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_MODE_SESSION_PROMISE_BY_MODE_0100 captureSessionPromise == null || undefined")
                            expect().assertFail();
                        }
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_MODE_SESSION_PROMISE_BY_MODE_0100 PASSED");
                        await captureSessionPromise.release();
                    }
                }
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_MODE_SESSION_PROMISE_BY_MODE_0100 PASSED camera:" + camerasArray[i].cameraId);
            }
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_MODE_SESSION_PROMISE_BY_MODE_0100 ends here");
            done();
        })

    /*GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_TC*/
    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput async api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let previewProfilesArray = cameraOutputCap.previewProfiles;
                if (isEmpty(previewProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 previewProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                let photoProfilesArray = cameraOutputCap.photoProfiles;
                if (isEmpty(photoProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 photoProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                let videoProfilesArray = cameraOutputCap.videoProfiles;
                if (isEmpty(videoProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 videoProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                let metadataObjectTypesArray = cameraOutputCap.supportedMetadataObjectTypes;
                if (isEmpty(metadataObjectTypesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 metadataObjectTypesArray == null || undefined")
                } 
            } 

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_0100 ends here");
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100--------------");
        for (let i = 0; i < mCameraDevicesArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(mCameraDevicesArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 camera:" + mCameraDevicesArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let previewProfilesArray = cameraOutputCap.previewProfiles;
                if (isEmpty(previewProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 previewProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                let photoProfilesArray = cameraOutputCap.photoProfiles;
                if (isEmpty(photoProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 photoProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                let videoProfilesArray = cameraOutputCap.videoProfiles;
                if (isEmpty(videoProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 videoProfilesArray == null || undefined")
                    expect().assertFail();
                } 
                expect(isEmpty(videoProfilesArray)).assertFalse();

                let metadataObjectTypesArray = cameraOutputCap.supportedMetadataObjectTypes;
                if (isEmpty(metadataObjectTypesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 metadataObjectTypesArray == null || undefined")
                } 
            } 

            
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 PASSED camera:" + mCameraDevicesArray[i].cameraId);
        }
        console.info("CameraUnitTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_0100 ends here");
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let previewProfilesArray = cameraOutputCap.previewProfiles;
                if (isEmpty(previewProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 previewProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                for (let i = 0; i < previewProfilesArray.length; i++) {
                    let previewProfilesFormat = previewProfilesArray[i].format;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 previewProfilesFormat: " + previewProfilesFormat);
                    let previewProfilesSize = previewProfilesArray[i].size;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 width: " + previewProfilesSize.width);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 height: " + previewProfilesSize.height);
                }
                expect(true).assertTrue();
            } 
            
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let photoProfilesArray = cameraOutputCap.photoProfiles;
                if (isEmpty(cameraOutputCap)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 photoProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                for (let i = 0; i < photoProfilesArray.length; i++) {
                    let photoProfilesFormat = photoProfilesArray[i].format;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 photoProfilesFormat: " + photoProfilesFormat);
                    let photoProfilesSize = photoProfilesArray[i].size;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 width: " + photoProfilesSize.width);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 height: " + photoProfilesSize.height);
                }
                expect(true).assertTrue();
            } 

            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100
      * @tc.name      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.desc      : Get supported preview formats from camera-0 camerainput promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info("Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let videoProfilesArray = cameraOutputCap.videoProfiles;
                if (isEmpty(videoProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 videoProfilesArray == null || undefined")
                    expect().assertFail();
                } 

                for (let i = 0; i < videoProfilesArray.length; i++) {
                    let videoProfilesFormat = videoProfilesArray[i].format;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 videoProfilesFormat: " + videoProfilesFormat);
                    let videoProfilesSize = videoProfilesArray[i].size;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 width: " + videoProfilesSize.width);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 height: " + videoProfilesSize.height);
                    let videoProfilesFrameRateRange = videoProfilesArray[i].frameRateRange;
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 min: " + videoProfilesFrameRateRange.min);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 max: " + videoProfilesFrameRateRange.max);
                }
                expect(true).assertTrue();
            } 
            
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_0100 PASSED camera:" + camerasArray[i].cameraId);
        }
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraId promise api
      * @tc.desc      : Create camerainput from camera-0 cameraId promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 cameraManager == null || undefined")
            expect().assertFail();
        } else {
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                let cameraInputPromise = mCameraManager.createCameraInput(camerasArray[i]);
                if (isEmpty(cameraInputPromise)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 cameraInputPromise == null || undefined")
                    expect().assertFail();
                } 
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 camera: " + camerasArray[i].cameraId);
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 ends here");
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition back & cameratype unspecified promise api
      * @tc.desc      : Create camerainput from camera-0 cameraposition back & cameratype unspecified promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_0100 cameraManager == null || undefined")
            expect().assertFail();
        } else {
            let camerasArray = mCameraDevicesArray;
            for (let i = 0; i < camerasArray.length; i++) {
                let cameraInputPromiseByType = mCameraManager.createCameraInput(camerasArray[i].cameraPosition, camerasArray[i].cameraType);
                if (isEmpty(cameraInputPromiseByType)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_0100 cameraInputPromiseByType == null || undefined")
                    expect().assertFail();
                } 
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_0100 camera: " + camerasArray[i].cameraId);
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_0100 ends here");
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let previewProfilesArray = cameraOutputCap.previewProfiles;
                if (isEmpty(previewProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 previewProfilesArray == null || undefined")
                    expect().assertFail();
                } else {
                    for (let j = 0; j < previewProfilesArray.length; j++) {
                        let previewOutputPromise = mCameraManager.createPreviewOutput(previewProfilesArray[j], globalThis.surfaceId);
                        if (isEmpty(previewOutputPromise)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 previewOutputPromise == null || undefined")
                            expect().assertFail();
                        }
                    }
                }
                
            } 
            
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_0100 PASS");
        await sleep(1000);
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let photoProfilesArray = cameraOutputCap.photoProfiles;
                if (isEmpty(photoProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 photoProfilesArray == null || undefined")
                    expect().assertFail();
                } else {
                    for (let j = 0; j < photoProfilesArray.length; j++) {
                        let photoOutputPromise = mCameraManager.createPhotoOutput(photoProfilesArray[j], mPhotoSurface);
                        if (isEmpty(photoOutputPromise)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 photoOutputPromise == null || undefined")
                            expect().assertFail();
                        }
                    }
                }
                
            } 
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_0100 PASS");
        done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let videoProfilesArray = cameraOutputCap.videoProfiles;
                if (isEmpty(videoProfilesArray)) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 videoProfilesArray == null || undefined")
                    expect().assertFail();
                } else {
                    for (let j = 0; j < videoProfilesArray.length; j++) {
                        let videoOutputPromise = mCameraManager.createVideoOutput(videoProfilesArray[j], mVideoSurface);
                        if (isEmpty(videoOutputPromise)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 videoOutputPromise == null || undefined")
                            expect().assertFail();
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100 videoOutputPromise = " + videoOutputPromise);
                            break;
                        }
                    }
                }
                
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_0100 PASS");
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100
      * @tc.name      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.desc      : Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100', 2, async function (done) {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
            let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
            console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100 camera:" + camerasArray[i].cameraId);
            if (!isEmpty(cameraOutputCap)) {
                let metadataObjectTypeArray = cameraOutputCap.supportedMetadataObjectTypes;
                if (!isEmpty(metadataObjectTypeArray)) {
                    let metadataOutputPromise = mCameraManager.createMetadataOutput(metadataObjectTypeArray);
                    if (isEmpty(metadataOutputPromise)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100 metadataOutputPromise == null || undefined")
                        expect().assertFail();
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100 metadataOutputPromise = " + metadataOutputPromise)
                    }
                } else {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100 metadataObjectTypeArray == null || undefined")
                }
            }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_0100 PASS");
        done();
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100
      * @tc.name      : Create CaptureSession instance promise api
      * @tc.desc      : Create Capturesession instance promise api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100', 2, async function (done) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 to operate");
        let captureSessionPromise = mCameraManager.createCaptureSession();
        if (isEmpty(captureSessionPromise)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 captureSessionPromise == null || undefined")
            expect().assertFail();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_0100 PASSED");
        await captureSessionPromise.release();
        done();
    })

    /**
          * @tc.number    : SUB_MULTIMEDIA_CAMERA_IS_CAMERA_MUTED_0100
          * @tc.name      : Get camera mute 
          * @tc.desc      : Get camera mute
          * @tc.size      : MEDIUM
          * @tc.type      : Function
          * @tc.level     : Level 2
        */
     it('SUB_MULTIMEDIA_CAMERA_IS_CAMERA_MUTED_0100', 2, async function (done) {
        console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_IS_CAMERA_MUTED_0100--------------");
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_CAMERA_MUTED_0100 cameraManager == null || undefined")
            expect().assertFail();
        }
        try {
            let isCameraMuted = mCameraManager.isCameraMuted();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_IS_CAMERA_MUTED_0100 isCameraMuted : " + isCameraMuted);
            expect(isEmpty(isCameraMuted)).assertFalse();
        } catch (err) {
            console.log(TAG + "isCameraMuted has failed for " + err.message);
            expect().assertFail();
        }
        done();
    })


    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100
      * @tc.name      : camera manager on cameraStatus api
      * @tc.desc      : camera manager on cameraStatus api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100', 1, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100 mCameraManager == null || undefined")
                expect().assertFail();
            } else {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100 to operate");
                mCameraManager.on('cameraStatus', async (err, CameraStatusInfo) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100 camera:" + JSON.stringify(CameraStatusInfo.camera));
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100 status:" + JSON.stringify(CameraStatusInfo.status));
                        expect(true).assertTrue();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100 success");
                    } else {
                        expect().assertFail();
                        console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100 FAILED: " + err.message);
                    }
                    done();
                })
                try {
                    let camerasArray = mCameraDevicesArray;
                    let cameraInputPromise = mCameraManager.createCameraInput(camerasArray[0]);
                    await cameraInputPromise.open()
                    await sleep(500)
                    await cameraInputPromise.close()
                } catch (err) {
                    expect().assertFail();
                    console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_0100 err: " + JSON.stringify(err));
                    done()
                }
            }
    })

    /**
      * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100
      * @tc.name      : camera manager on fold status api
      * @tc.desc      : camera manager on fold status api
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 1
    */
    it('SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100', 1, async function (done) {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100 mCameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100 to operate");
        mCameraManager.on('foldStatusChange', async (err, foldStatusInfo) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100 supportedCameras:" + JSON.stringify(foldStatusInfo.supportedCameras));
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100 foldStatus:" + JSON.stringify(foldStatusInfo.foldStatus));
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_0100 failed");
            expect(false).assertTrue();
          }
        })
        mCameraManager.off('foldStatusChange');
      }
      done();
    })
})
}