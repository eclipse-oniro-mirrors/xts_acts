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
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';
const TAG = "CameraSessionVideoStabilizationTest: ";

let mCameraManager;
let mCameraDevicesArray;
let mCameraSession;

let mPhotoSurface;
let mVideoRecorder;
let mVideoSurface;
let mFileAsset;
let mFdPath;
let mFdNumber;

// CAMERA-0 letiables
let mCameraNum;

let mCameraInput;
let mPreviewOutput;
let mPhotoOutput;
let mVideoOutput;

let mIsVideoStabilizationModeSupportedArray;
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
    url: 'file:///data/media/CameraSessionVideoStabilization.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;
let receiver;

export default function cameraSessionVideoStabilizationTest() {

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

    async function getFd(pathName) {
        let displayName = pathName;
        const mediaTest = mediaLibrary.getMediaLibrary();
        let fileKeyObj = mediaLibrary.FileKey;
        let mediaType = mediaLibrary.MediaType.VIDEO;
        let publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
        let dataUri = await mediaTest.createAsset(mediaType, displayName, publicPath);
        if (dataUri != undefined) {
            let args = dataUri.id.toString();
            let fetchOp = {
                selections: fileKeyObj.ID + "=?",
                selectionArgs: [args],
            }
            let fetchFileResult = await mediaTest.getFileAssets(fetchOp);
            mFileAsset = await fetchFileResult.getAllObject();
            mFdNumber = await mFileAsset[0].open('Rw');
            mFdPath = "fd://" + mFdNumber.toString();
        }
    }
    
    async function closeFd() {
        if (mFileAsset != null) {
                await mFileAsset[0].close(mFdNumber).then(() => {
                console.info('[mediaLibrary] case close fd success');
            }).catch((err) => {
                console.info('[mediaLibrary] case close fd failed');
            });
        } else {
            console.info('[mediaLibrary] case fileAsset is null');
        }
    }

    async function getPhotoReceiverSurface() {
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

    async function getVideoReceiveSurface() {
        console.log(TAG + 'Entering getVideoReceiveSurface')
        await getFd('CameraSessionVideoStabilization.mp4');
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

        await sleep(100);
        console.log(TAG + 'Exit releaseVideoReceiveSurface')
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


        mCameraNum = mCameraDevicesArray.length;

        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

        mIsVideoStabilizationModeSupportedArray = new Array(mCameraNum); 

        console.info('Exit getCameraSupportDevicesArray');

        return true;
    }

    function createCameraSessionInstance() {
        console.info('Enter createCameraSessionInstance');

        try {
            mCameraSession = mCameraManager.createCaptureSession();
        }
        catch {
            console.info('createCaptureSession FAILED');
        }

        if (isEmpty(mCameraSession)) {
            console.info(TAG + "createCaptureSession FAILED");
            return false;
        }

        mCameraSession.beginConfig();

        console.info('Exit createCameraSessionInstance');

        return true;
    }

    async function releaseCameraSessionInstance() {
        await mCameraSession.release();
    }

    async function createInput(idx:any) {
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

    async function releaseInput() {
        console.info('Enter releaseInput');

        if (!isEmpty(mCameraInput)) {
            await mCameraInput.close();
        }

        console.info('Exit releaseInput');

        return true;
    }

    function createOutput(idx:any) {
        console.info('Enter createOutput');

        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);

        if (!isEmpty(cameraOutputCap)) {
            if (!isEmpty(cameraOutputCap.previewProfiles)) {
                console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);      
                for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                    mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], globalThis.surfaceId);
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
                    mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
                    if (!isEmpty(mPhotoOutput)) {
                        break;
                    }
                }
    
                if (isEmpty(mPhotoOutput)) {
                        console.info(TAG + "createPhotoOutput FAILED");
                }

                console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
            }
            /*
            if (!isEmpty(cameraOutputCap.videoProfiles)) {
                console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length); 
                for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
                    try {
                        mVideoOutput = await mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], mVideoSurface);
                        if (!isEmpty(mVideoOutput)) {
                            break;
                        }
                    }
                    catch {
                        console.info(TAG + "createVideoOutput FAILED");
                    }
                }
    
                if (isEmpty(mVideoOutput)) {
                    console.info(TAG + "createVideoOutput FAILED");
                }
    
                console.info(TAG + "createVideoOutput: " + mVideoOutput);  
            }
            */
        }
        
        console.info('Exit createOutputs');

        return true;
    }

    async function releaseOutput() {
        console.info('Enter releaseOutput');

        if (!isEmpty(mPreviewOutput)) {
            await mPreviewOutput.release();
        }
        
        if (!isEmpty(mPhotoOutput)) {
            await mPhotoOutput.release();
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            await mVideoOutput.stop();
            await mVideoOutput.release();
        }
        */
        console.info('Exit releaseOutput');
        
        return true;
    }

    async function startCameraSession(idx:any) {
        console.info(TAG + "Enter startCameraSession");

        await createInput(idx);
        createOutput(idx);

        await sleep(1);

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
        /*
        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            await mCameraSession.addOutput(mVideoOutput);
        }
        */
        await sleep(1);

        await mCameraSession.commitConfig();
        
        /*
        await mCameraSession.start(async (err) => {
            console.info(TAG + "Entering mCameraSession start callback");
            if (!err) {
                console.info(TAG + "Entering mCameraSession start PASSED ");
            } else {
                console.info(TAG + "Entering mCameraSession start FAILED : " + err.message);
            }
        })
        
        await sleep(100);
        */
        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");

        mCameraSession.beginConfig();
        /*
        mCameraSession.stop(async (err) => {
            console.info(TAG + "Entering mCameraSession stop callback");
            if (!err) {
                console.info(TAG + "Entering mCameraSession stop PASSED ");
            } else {
                console.info(TAG + "Entering mCameraSession stop FAILED : " + err.message);
            }
        })

        await sleep(100);
        */

        if (!isEmpty(mCameraInput)) {
            console.info(TAG + "Start to removeInput input");
            await mCameraSession.removeInput(mCameraInput);
        }

        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to removeOutput mPreviewOutput");
            await mCameraSession.removeOutput(mPreviewOutput);
        }
        
        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to removeOutput mPhotoOutput");
            await mCameraSession.removeOutput(mPhotoOutput);
        }
        /*
        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to removeOutput mVideoOutput");
            await mCameraSession.removeOutput(mVideoOutput);
        }
        */
        await releaseInput();
        await releaseOutput();

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('cameraSessionVideoStabilizationTest', function () {
        console.info(TAG + '----------cameraSessionVideoStabilizationTest--------------')

        beforeAll(async function () {
            sleep(100);
            await getPhotoReceiverSurface();
            await getVideoReceiveSurface();
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            createCameraSessionInstance();

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
            releaseCameraSessionInstance();
            sleep(1000);
            console.info('afterAll case');
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100
        * @tc.name      : Check capture session support video stabilization off mode with promise or not
        * @tc.desc      : Check capture session support video stabilization off mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isVideoStabilizationModeSupported = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.OFF);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100 finish");
                    if (isVideoStabilizationModeSupported != null || isVideoStabilizationModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100 PASSED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100 FAILED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0100 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100
        * @tc.name      : Check capture session set video stabilization off mode with promise
        * @tc.desc      : Check capture session set video stabilization off mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsVideoStabilizationModeSupportedArray[i] == true) {
                        mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.OFF);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 PASSED with VideoStabilizationMode is: " + cameraObj.VideoStabilizationMode.OFF);

                        let vdeoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 finish");
                        if (vdeoStabilizationMode == cameraObj.VideoStabilizationMode.OFF) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 PASSED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 FAILED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 PASSED");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0100 ends here");
                done();     
            }
        })

 
        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200
        * @tc.name      : Check capture session support video stabilization low mode with promise or not
        * @tc.desc      : Check capture session support video stabilization low mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isVideoStabilizationModeSupported = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.LOW);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200 finish");
                    if (isVideoStabilizationModeSupported != null || isVideoStabilizationModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200 PASSED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200 FAILED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0200 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200
        * @tc.name      : Check capture session set video stabilization low mode with promise
        * @tc.desc      : Check capture session set video stabilization low mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsVideoStabilizationModeSupportedArray[i] == true) {
                        mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.LOW);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 PASSED with VideoStabilizationMode is: " + cameraObj.VideoStabilizationMode.LOW);

                        let vdeoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 finish");
                        if (vdeoStabilizationMode == cameraObj.VideoStabilizationMode.LOW) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 PASSED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 FAILED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 PASSED");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0200 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300
        * @tc.name      : Check capture session support video stabilization middle mode with promise or not
        * @tc.desc      : Check capture session support video stabilization middle mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isVideoStabilizationModeSupported = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.MIDDLE);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300 finish");
                    if (isVideoStabilizationModeSupported != null || isVideoStabilizationModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300 PASSED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300 FAILED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0300 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300
        * @tc.name      : Check capture session set video stabilization middle mode with promise
        * @tc.desc      : Check capture session set video stabilization middle mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsVideoStabilizationModeSupportedArray[i] == true) {
                        mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.MIDDLE);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 PASSED with VideoStabilizationMode is: " + cameraObj.VideoStabilizationMode.MIDDLE);

                        let vdeoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 finish");
                        if (vdeoStabilizationMode == cameraObj.VideoStabilizationMode.MIDDLE) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 PASSED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 FAILED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 PASSED");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0300 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400
        * @tc.name      : Check capture session support video stabilization high mode with promise or not
        * @tc.desc      : Check capture session support video stabilization high mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isVideoStabilizationModeSupported = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.HIGH);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400 finish");
                    if (isVideoStabilizationModeSupported != null || isVideoStabilizationModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400 PASSED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400 FAILED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0400 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400
        * @tc.name      : Check capture session set video stabilization high mode with promise
        * @tc.desc      : Check capture session set video stabilization high mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsVideoStabilizationModeSupportedArray[i] == true) {
                        mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.HIGH);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 PASSED with VideoStabilizationMode is: " + cameraObj.VideoStabilizationMode.HIGH);

                        let vdeoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 finish");
                        if (vdeoStabilizationMode == cameraObj.VideoStabilizationMode.HIGH) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 PASSED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 FAILED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 PASSED");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0400 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500
        * @tc.name      : Check capture session support video stabilization auto mode with promise or not
        * @tc.desc      : Check capture session support video stabilization auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isVideoStabilizationModeSupported = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500 finish");
                    if (isVideoStabilizationModeSupported != null || isVideoStabilizationModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500 PASSED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500 FAILED with isVideoStabilizationModeSupported is: " + isVideoStabilizationModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_0500 ends here");
                done();
            }
        })

 
        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500
        * @tc.name      : Check capture session set video stabilization auto mode with promise
        * @tc.desc      : Check capture session set video stabilization auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsVideoStabilizationModeSupportedArray[i] == true) {
                        mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 PASSED with VideoStabilizationMode is: " + cameraObj.VideoStabilizationMode.AUTO);

                        let vdeoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 finish");
                        if (vdeoStabilizationMode == cameraObj.VideoStabilizationMode.AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 PASSED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 FAILED with VideoStabilizationMode is: " + vdeoStabilizationMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 PASSED");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_0500 ends here");
                done();
            }
        })

    })
}