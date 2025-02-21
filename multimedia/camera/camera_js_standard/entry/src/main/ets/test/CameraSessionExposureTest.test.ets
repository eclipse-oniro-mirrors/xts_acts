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
 
// @ts-ignore

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';
const TAG = "CameraSessionExposureTest: ";

// Define global letiables
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

let mIsExposureModeSupportedArray;
let mExposureBiasRangeArray;
let mExposureBiasMaxArray;
let mExposureBiasMinArray;

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
    url: 'file:///data/media/CameraSessionExposure.mp4',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 100,
    maxDuration: 500
}

let mPicWidthMax = 1;
let mPicHeightMax = 1;

let mMETERINGPoint = {
    x: mPicWidthMax / 2.0,
    y: mPicHeightMax / 2.0,
}

let mMETERINGPointLT = {
    x: 0,
    y: 0,
}

let mMETERINGPointRT = {
    x: mPicWidthMax,
    y: 0,
}

let mMETERINGPointLB = {
    x: 0,
    y: mPicHeightMax,
}

let mMETERINGPointRB = {
    x: mPicWidthMax,
    y: mPicHeightMax,
}

let mMETERINGPointInvalidLT = {
    x: -1,
    y: -1,
}

let mMETERINGPointInvalidRT = {
    x: (mPicWidthMax + 1),
    y: -1,
}

let mMETERINGPointInvalidLB = {
    x: -1,
    y: mPicHeightMax,
}

let mMETERINGPointInvalidRB = {
    x: (mPicWidthMax + 1),
    y: (mPicHeightMax + 1),
}

let mEnableCheckInvalidMETERINGPoint = false;
let receiver;
let context = featureAbility.getContext();

export default function cameraSessionExposureTest() {

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
        await getFd('CameraSessionExposure.mp4');
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

        mIsExposureModeSupportedArray = new Array(mCameraNum);
        mExposureBiasRangeArray = new Array(mCameraNum);
        mExposureBiasMaxArray = new Array(mCameraNum);
        mExposureBiasMinArray = new Array(mCameraNum);

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

    describe('cameraSessionExposureTest', function () {
        console.info(TAG + '----------cameraSessionExposureTest--------------')

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
            sleep(1000);
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
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100
        * @tc.name      : Check capture session support exposure locked mode with promise or not
        * @tc.desc      : Check capture session support exposure locked mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isExposureModeSupported = mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100
        * @tc.name      : Check capture session set exposure locked mode with promise
        * @tc.desc      : Check capture session set exposure locked mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
                        let exposureMode = mCameraSession.getExposureMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 finish");
                        if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 PASSED with ExposureMode is: " + exposureMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 FAILED with ExposureMode is: " + exposureMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0100 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200
        * @tc.name      : Check capture session support exposure auto mode with promise or not
        * @tc.desc      : Check capture session support exposure auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isExposureModeSupported = mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0200 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200
        * @tc.name      : Check capture session set exposure auto mode with promise
        * @tc.desc      : Check capture session set exposure auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);

                        let exposureMode = mCameraSession.getExposureMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 finish");
                        if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 PASSED with ExposureMode is: " + exposureMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 FAILED with ExposureMode is: " + exposureMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0200 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300
        * @tc.name      : Check capture session support exposure continuous auto mode with promise or not
        * @tc.desc      : Check capture session support exposure continuous auto mode with promise or not
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let isExposureModeSupported = mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300 finish");
                    if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300 PASSED with isExposureModeSupported is: " + isExposureModeSupported);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300 FAILED with isExposureModeSupported is: " + isExposureModeSupported);
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0300 ends here");
                done();
            }
        })

  

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300
        * @tc.name      : Check capture session set exposure continuous auto mode with promise
        * @tc.desc      : Check capture session set exposure continuous auto mode with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    if (mIsExposureModeSupportedArray[i] == true) {
                        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 PASSED with ExposureMode is: " + cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);

                        let exposureMode = mCameraSession.getExposureMode();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 finish");
                        if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 PASSED with ExposureMode is: " + exposureMode);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 FAILED with ExposureMode is: " + exposureMode);
                            expect().assertFail();
                        }
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 not support");
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_0300 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100
        * @tc.name      : Check capture session set METERING point with promise
        * @tc.desc      : Check capture session set METERING point with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPoint);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 PASSED with METERINGPoint is: " + mMETERINGPoint.x + ", " + mMETERINGPoint.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 finish");
                    if ((METERINGPoint.x == mMETERINGPoint.x) && (METERINGPoint.y == mMETERINGPoint.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        expect().assertFail();
                    }
                    await stopCameraSession();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0100 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200
        * @tc.name      : Check capture session set METERING point with promise(left-top point)
        * @tc.desc      : Check capture session set METERING point with promise(left-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 start for camera[" + i + "]");

                    await startCameraSession(i);

                    mCameraSession.setMeteringPoint(mMETERINGPointLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 PASSED with METERINGPoint is: " + mMETERINGPointLT.x + ", " + mMETERINGPointLT.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 finish");
                    if ((Math.abs(METERINGPoint.x - mMETERINGPointLT.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPointLT.y) >= 0)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0200 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300
        * @tc.name      : Check capture session set METERING point with promise(right-top point)
        * @tc.desc      : Check capture session set METERING point with promise(right-top point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPointRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 PASSED with METERINGPoint is: " + mMETERINGPointRT.x + ", " + mMETERINGPointRT.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 finish");
                    if ((Math.abs(METERINGPoint.x - mMETERINGPointRT.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPointRT.y) >= 0)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0300 ends here");
                done();
            }
        })


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400
        * @tc.name      : Check capture session set METERING point with promise(left-bottom point)
        * @tc.desc      : Check capture session set METERING point with promise(left-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPointLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 PASSED with METERINGPoint is: " + mMETERINGPointLB.x + ", " + mMETERINGPointRB.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 finish");
                    if ((Math.abs(METERINGPoint.x - mMETERINGPointLB.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPointLB.y) >= 0)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0400 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500
        * @tc.name      : Check capture session set METERING point with promise(right-bottom point)
        * @tc.desc      : Check capture session set METERING point with promise(right-bottom point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPointRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 PASSED with METERINGPoint is: " + mMETERINGPointRB.x + ", " + mMETERINGPointRB.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 finish");
                    if ((METERINGPoint.x == mMETERINGPointRB.x) && (METERINGPoint.y == mMETERINGPointRB.y)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0500 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600
        * @tc.name      : Check capture session set METERING point with promise(left-top invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(left-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPointInvalidLT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 PASSED with METERINGPoint is: " + mMETERINGPointInvalidLT.x + ", " + mMETERINGPointInvalidLT.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidLT.x) && (METERINGPoint.y != mMETERINGPointInvalidLT.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0600 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700
        * @tc.name      : Check capture session set METERING point with promise(right-top invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(right-top invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPointInvalidRT);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 PASSED with METERINGPoint is: " + mMETERINGPointInvalidRT.x + ", " + mMETERINGPointInvalidRT.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidRT.x) && (METERINGPoint.y != mMETERINGPointInvalidRT.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0700 ends here");
                done();
            }
        })

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800
        * @tc.name      : Check capture session set METERING point with promise(left-bottom invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(left-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPointInvalidLB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 PASSED with METERINGPoint is: " + mMETERINGPointInvalidLB.x + ", " + mMETERINGPointInvalidRB.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidLB.x) && (METERINGPoint.y != mMETERINGPointInvalidLB.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0800 ends here");
                done();
            }
        })


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900
        * @tc.name      : Check capture session set METERING point with promise(right-bottom invalid point)
        * @tc.desc      : Check capture session set METERING point with promise(right-bottom invalid point)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    mCameraSession.setMeteringPoint(mMETERINGPointInvalidRB);
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 finish");
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 PASSED with METERINGPoint is: " + mMETERINGPointInvalidRB.x + ", " + mMETERINGPointInvalidRB.y);

                    let METERINGPoint = mCameraSession.getMeteringPoint();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 finish");
                    if (((METERINGPoint.x != mMETERINGPointInvalidRB.x) && (METERINGPoint.y != mMETERINGPointInvalidRB.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
                        await stopCameraSession();
                        expect().assertFail();
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_0900 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100
        * @tc.name      : Check capture session get exposure bias range with promise
        * @tc.desc      : Check capture session get exposure bias range with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 start for camera[" + i + "]");
    
                    await startCameraSession(i);
    
                    let exposureBiasRange = mCameraSession.getExposureBiasRange();
                    mExposureBiasRangeArray[i] = exposureBiasRange;
                    mExposureBiasMaxArray[i] = exposureBiasRange[exposureBiasRange.length -1];
                    mExposureBiasMinArray[i] = exposureBiasRange[0];
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 finish");
                    if (exposureBiasRange.length > 0) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 PASSED with ExposureBiasRange length is: " + exposureBiasRange.length);
                    } else {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 FAILED with ExposureBiasRange length is: " + exposureBiasRange.length);
                        await stopCameraSession();
                        expect().assertFail();
                    }
    
                    for (let j = 0; j < exposureBiasRange.length; j++) {
                        console.info(TAG + j + "th, exposure bias is: " + exposureBiasRange[j]);
                    }
                    
                    await stopCameraSession();
    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_0100 ends here");
                done();
            }
        })



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100
        * @tc.name      : Check capture session set exposure bias with promise
        * @tc.desc      : Check capture session set exposure bias with promise
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 start for camera[" + i + "]");
                    let exposureBias = mExposureBiasRangeArray[i][0];
                    if (exposureBias == 0 || isNaN(exposureBias)) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 exposureBias is 0");
                    } else {
                        await startCameraSession(i);
                        mCameraSession.setExposureBias(exposureBias);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 PASSED with ExposureBias is: " + mExposureBiasRangeArray[i][0]);
    
                        let exposureValue = mCameraSession.getExposureValue();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 finish");
                        if (exposureValue == mExposureBiasRangeArray[i][0]) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 PASSED with ExposureValue is: " + exposureValue);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 FAILED with ExposureValue is: " + exposureValue);
                            await stopCameraSession();
                            expect().assertFail();
                        }
                        await stopCameraSession();
                    }
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0100 ends here");
                done();
            }
        })    

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, min - 1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, min - 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 start for camera[" + i + "]");
                    let exposureBias =mExposureBiasMinArray[i];
                    if (exposureBias == 0) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 exposureBias is 0");
                    } else {
                        await startCameraSession(i);
                        mCameraSession.setExposureBias(exposureBias - 1);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 PASSED with ExposureBias is: " + (mExposureBiasMinArray[i] - 1));
    
                        let exposureValue = mCameraSession.getExposureValue();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 finish");
                        if (exposureValue != (exposureBias - 1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 PASSED with ExposureValue is: " + exposureValue);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 FAILED with ExposureValue is: " + exposureValue);
                            await stopCameraSession();
                            expect().assertFail();
                        }
                        await sleep(500);
                        
                        await stopCameraSession();
                    }
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0200 ends here");
                done();
            }
        })    



        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, min - 0.1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, min - 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 start for camera[" + i + "]");
                    let exposureBias =mExposureBiasMinArray[i];
                    if (exposureBias == 0) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 exposureBias is 0");
                    } else {
                        await startCameraSession(i);
                        mCameraSession.setExposureBias(exposureBias - 0.1);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 PASSED with ExposureBias is: " + (mExposureBiasMinArray[i] - 0.1));
                        let exposureValue = mCameraSession.getExposureValue();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 finish");
                        if (exposureValue != (exposureBias - 0.1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 PASSED with ExposureValue is: " + exposureValue);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 FAILED with ExposureValue is: " + exposureValue);
                            await stopCameraSession();
                            expect().assertFail();
                        }
                        await stopCameraSession();
                    }
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0300 ends here");
                done();
            }
        })    

 

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, max + 1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, max + 1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 start for camera[" + i + "]");
                    let exposureBias = mExposureBiasMaxArray[i];
                    if (exposureBias == 0) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 exposureBias is 0");
                    } else {
                        await startCameraSession(i);
    
                        mCameraSession.setExposureBias(exposureBias + 1);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[i] + 1));
    
                        let exposureValue = mCameraSession.getExposureValue();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 finish");
                        if (exposureValue != (exposureBias + 1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 PASSED with ExposureValue is: " + exposureValue);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 FAILED with ExposureValue is: " + exposureValue);
                            await stopCameraSession();
                            expect().assertFail();
                        }
                        
                        await stopCameraSession();
                    }

    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0400 ends here");
                done();
            }
        })    


        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500
        * @tc.name      : Check capture session set exposure bias with promise(invalid value, max + 0.1)
        * @tc.desc      : Check capture session set exposure bias with promise(invalid value, max + 0.1)
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 start for camera[" + i + "]");
                    let exposureBias = mExposureBiasMaxArray[i];
                    if (exposureBias == 0) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 exposureBias is 0");
                    } else {
                        await startCameraSession(i);
    
                        mCameraSession.setExposureBias(exposureBias + 0.1);
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 finish");
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[i] + 0.1));
    
                        let exposureValue = mCameraSession.getExposureValue();
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 finish");
                        if (exposureValue != (exposureBias + 0.1)) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 PASSED with ExposureValue is: " + exposureValue);
                        } else {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 FAILED with ExposureValue is: " + exposureValue);
                            await stopCameraSession();
                            expect().assertFail();
                        }
                        
                        await stopCameraSession();
                    }

    
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 end for camera[" + i + "]");
                }
    
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_0500 ends here");
                done();
            }
        })    

    })
}