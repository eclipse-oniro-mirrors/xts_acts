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
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

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

const TAG = "CameraErrorCodeUsecaseTest: ";
let mCameraManager;
let cameraOutputCap;
let mCameraDevicesArray;
let mCameraSession;
let mCameraNum;
let mCameraInput;
let mPreviewOutput;
let mPhotoSurface;
let mPhotoOutput;
let videoOutput;
let videoRecorder;
let videoSurfaceId;
let fdPath;
let fileAsset;
let fdNumber;
let metadataOutput;
let mMetadataObjectTypeArray;
let receiver;
let context = featureAbility.getContext();

export default function CameraErrorCodeUsecaseTest() {
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
        console.info(TAG + 'Enter getCameraManagerInstance');
        mCameraManager = cameraObj.getCameraManager(context);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }
        console.info(TAG + 'Exit getCameraManagerInstance');
        return true;
    }

    function getCameraSupportDevicesArray() {
        console.info(TAG + 'Enter getCameraSupportDevicesArray');
        mCameraDevicesArray = mCameraManager.getSupportedCameras();
        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "getSupportedCameras FAILED");
            return false;
        }
        mCameraNum = mCameraDevicesArray.length;
        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
        console.info(TAG + 'Exit getCameraSupportDevicesArray');
        return true;
    }

    async function createInput(idx: any) {
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

    async function releaseInput() {
        console.info(TAG + 'Enter releaseInput');

        if (!isEmpty(mCameraInput)) {
            await mCameraInput.close();
            mCameraInput = null;
        }

        console.info(TAG + 'Exit releaseInput');

        return true;
    }

    function beginCameraSessionConfig() {
        console.info(TAG + 'Enter beginCameraSessionConfig');
        mCameraSession.beginConfig();
        console.info(TAG + 'Exit beginCameraSessionConfig');
        return true;
    }

    async function commitCameraSessionConfig() {
        console.info(TAG + 'Enter commitCameraSessionConfig');
        await mCameraSession.commitConfig();
        sleep(500);
        console.info(TAG + 'Exit commitCameraSessionConfig');
        return true;
    }

    function createCameraSessionInstance() {
        console.info(TAG + 'Enter createCameraSessionInstance');
        try {
            mCameraSession = mCameraManager.createCaptureSession();
        }
        catch {
            console.info(TAG + 'createCaptureSession FAILED');
        }
        if (isEmpty(mCameraSession)) {
            console.info(TAG + "createCaptureSession FAILED");
            return false;
        }
        beginCameraSessionConfig();
        console.info(TAG + 'Exit createCameraSessionInstance');
        return true;
    }

     async function releaseCameraSessionInstance() {
        await mCameraSession.release();
        mCameraSession = null;
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
            fileAsset = await fetchFileResult.getAllObject();
            fdNumber = await fileAsset[0].open('Rw');
            fdPath = "fd://" + fdNumber.toString();
        }
    }

    async function closeFd() {
        if (fileAsset != null) {
            await fileAsset[0].close(fdNumber).then(() => {
                console.info('[mediaLibrary] case close fd success');
            }).catch((err) => {
                console.info('[mediaLibrary] case close fd failed');
            });
        } else {
            console.info('[mediaLibrary] case fileAsset is null');
        }
    }

    async function getvideosurface() {
        await getFd('ErrorCodeCameraOutput.mp4');
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
                console.info(TAG + 'createVideoRecorder FAILED')
            }
        })
    }

    async function releaseVideoReceiveSurface() {
        console.log(TAG + 'Entering releaseVideoReceiveSurface')
        await videoRecorder.release()
        videoRecorder = null
        await closeFd();
        console.log(TAG + 'Exit releaseVideoReceiveSurface')
    }

    function createOutput(idx: any) {
        console.info(TAG + 'Enter createOutput');
        cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);
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

    describe('CameraErrorCodeUsecaseTest', function () {
        console.info(TAG + '----------CameraErrorCodeUsecaseTest--------------');
        beforeAll(async function () {
            await getPhotoReceiverSurface();
            await getvideosurface();
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            console.info(TAG + 'beforeAll case');
        })

        beforeEach(function () {
            sleep(1000);
            console.info('beforeEach case');
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (!isEmpty(mCameraInput)) {
                await releaseInput();
            }
            if (!isEmpty(mCameraSession)) {
                await releaseCameraSessionInstance();
            }
        })

        afterAll(async function () {
            await releaseVideoReceiveSurface();
            sleep(1000);
            console.info('afterAll case');
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100
         * @tc.name      : createCameraInput api
         * @tc.desc      : createCameraInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let camerainput = mCameraManager.createCameraInput();
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200
         * @tc.name      : createCameraInput api
         * @tc.desc      : createCameraInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let camerainput = mCameraManager.createCameraInput("cameraInput");
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300
         * @tc.name      : createCameraInput api
         * @tc.desc      : createCameraInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let camerainput = mCameraManager.createCameraInput(null, "cameraInput");
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400
         * @tc.name      : createCameraInput api
         * @tc.desc      : createCameraInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let camerainput = mCameraManager.createCameraInput(null);
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100
         * @tc.name      : createPreviewOutput api
         * @tc.desc      : createPreviewOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let previewoutput = mCameraManager.createPreviewOutput(null);
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200
         * @tc.name      : createPreviewOutput api
         * @tc.desc      : createPreviewOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let previewoutput = mCameraManager.createPreviewOutput(null, "createoutput");
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100
         * @tc.name      : createPhotoOutput api
         * @tc.desc      : createPhotoOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let photooutput = mCameraManager.createPhotoOutput(null, "createoutput");
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200
         * @tc.name      : createPhotoOutput api
         * @tc.desc      : createPhotoOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let photooutput = mCameraManager.createPhotoOutput(null);
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100
         * @tc.name      : createVideoOutput api
         * @tc.desc      : createVideoOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let videooutput = mCameraManager.createVideoOutput(null);
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200
         * @tc.name      : createVideoOutput api
         * @tc.desc      : createVideoOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let videooutput = mCameraManager.createVideoOutput(null, "createoutput");
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100
         * @tc.name      : createMetadataOutput api
         * @tc.desc      : createMetadataOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let videooutput = mCameraManager.createMetadataOutput(null);
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200
         * @tc.name      : createMetadataOutput api
         * @tc.desc      : createMetadataOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200 cameraManager == null || undefined")
                expect().assertFail();
                done();
            } else {
                try {
                    let metadataoutput = mCameraManager.createMetadataOutput();
                } catch (error) {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + error.code);
                    expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    expect(true).assertTrue();
                }
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100
         * @tc.name      : addInput api
         * @tc.desc      : addInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.addInput(null);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200
         * @tc.name      : addInput api
         * @tc.desc      : addInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.addInput();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100
         * @tc.name      : removeInput api
         * @tc.desc      : removeInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.removeInput();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200
         * @tc.name      : removeInput api
         * @tc.desc      : removeInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.removeInput(null);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100
         * @tc.name      : addOutput api
         * @tc.desc      : addOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.addOutput();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200
         * @tc.name      : addOutput api
         * @tc.desc      : addOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.addOutput(null);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100
         * @tc.name      : removeOutput api
         * @tc.desc      : removeOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.removeOutput();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200
         * @tc.name      : removeOutput api
         * @tc.desc      : removeOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200--------------");
            createCameraSessionInstance();
            try {
                mCameraSession.removeOutput(null);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200
         * @tc.name      : photoOutput capture api
         * @tc.desc      : photoOutput capture api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            mPhotoOutput.capture({}, async (err) => {
                if (!err) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200 success");
                    done();
                } else {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                    done();
                }
                
            })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400
         * @tc.name      : photoOutput capture api
         * @tc.desc      : photoOutput capture api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                await mPhotoOutput.capture({});
            } catch (err) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400 FAILED");
                console.info(TAG + "ERRORCODE: " + err.code);
                expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100
         * @tc.name      : commitConfig api
         * @tc.desc      : commitConfig api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100--------------");
            await createInput(0);
            mCameraSession = mCameraManager.createCaptureSession();
            mCameraSession.commitConfig(async (err) => {
                if (!err) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100 success");
                } else {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    expect(err.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200
         * @tc.name      : commitConfig api
         * @tc.desc      : commitConfig api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200--------------");
            await createInput(0);
            mCameraSession = mCameraManager.createCaptureSession();
            await mCameraSession.commitConfig().then((result) => {
                console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200 success :' + result);
            }).catch((err) => {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + err.code);
                expect(err.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                expect(true).assertTrue();
            });
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300
         * @tc.name      : addInput api
         * @tc.desc      : addInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300--------------");
            await createInput(0);
            mCameraSession = mCameraManager.createCaptureSession();
            try {
                mCameraSession.addInput(mCameraInput);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300
         * @tc.name      : removeInput api
         * @tc.desc      : removeInput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300--------------");
            await createInput(0);
            mCameraSession = mCameraManager.createCaptureSession();
            try {
                mCameraSession.removeInput(mCameraInput);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300
         * @tc.name      : addOutput api
         * @tc.desc      : addOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300--------------");
            await createInput(0);
            mCameraSession = mCameraManager.createCaptureSession();
            createOutput(0);
            try {
                mCameraSession.addOutput(mPreviewOutput);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300
         * @tc.name      : removeOutput api
         * @tc.desc      : removeOutput api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300--------------");
            await createInput(0);
            mCameraSession = mCameraManager.createCaptureSession();
            createOutput(0);
            try {
                mCameraSession.removeOutput(mPreviewOutput);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100
         * @tc.name      : capturesession start api
         * @tc.desc      : capturesession start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            mCameraSession.start().then((result) => {
                console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100 success :' + result);
            }).catch((err) => {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + err.code);
                console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " + cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
                expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            });
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200
         * @tc.name      : capturesession start api
         * @tc.desc      : capturesession start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            mCameraSession.start(async (err) => {
                if (!err) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200 success");
                } else {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " + cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
                    expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                }
            })
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100
         * @tc.name      : capturesession hasFlash api
         * @tc.desc      : capturesession hasFlash api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let isFlash = mCameraSession.hasFlash();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " + cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100
         * @tc.name      : capturesession isFlashModeSupported api
         * @tc.desc      : capturesession isFlashModeSupported api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let isFlashmodesupported = mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100
         * @tc.name      : capturesession getFlashMode api
         * @tc.desc      : capturesession getFlashMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let flashmode = mCameraSession.getFlashMode();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100
         * @tc.name      : capturesession setFlashMode api
         * @tc.desc      : capturesession setFlashMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200
         * @tc.name      : capturesession setFlashMode api
         * @tc.desc      : capturesession setFlashMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                mCameraSession.setFlashMode(5);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100
         * @tc.name      : capturesession isExposureModeSupported api
         * @tc.desc      : capturesession isExposureModeSupported api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let issupported = mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100
         * @tc.name      : capturesession getExposureMode api
         * @tc.desc      : capturesession getExposureMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let exposure = mCameraSession.getExposureMode();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100
         * @tc.name      : capturesession setExposureMode api
         * @tc.desc      : capturesession setExposureMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200
         * @tc.name      : capturesession setExposureMode api
         * @tc.desc      : capturesession setExposureMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                mCameraSession.setExposureMode(5);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100
         * @tc.name      : capturesession getMeteringPoint api
         * @tc.desc      : capturesession getMeteringPoint api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let point = mCameraSession.getMeteringPoint();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100
         * @tc.name      : capturesession setMeteringPoint api
         * @tc.desc      : capturesession setMeteringPoint api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                mCameraSession.setMeteringPoint({ x: 1, y: 1 });
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200
         * @tc.name      : capturesession setMeteringPoint api
         * @tc.desc      : capturesession setMeteringPoint api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                mCameraSession.setMeteringPoint({ x: -1, y: -1 });
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100
         * @tc.name      : capturesession getExposureBiasRange api
         * @tc.desc      : capturesession getExposureBiasRange api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let range = mCameraSession.getExposureBiasRange();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100
         * @tc.name      : capturesession setExposureBias api
         * @tc.desc      : capturesession setExposureBias api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let range = mCameraSession.getExposureBiasRange();
                mCameraSession.setExposureBias(range[0]);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200
         * @tc.name      : capturesession setExposureBias api
         * @tc.desc      : capturesession setExposureBias api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                let range = mCameraSession.getExposureBiasRange();
                mCameraSession.setExposureBias(-101);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100
         * @tc.name      : capturesession getExposureValue api
         * @tc.desc      : capturesession getExposureValue api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let value = mCameraSession.getExposureValue();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100
         * @tc.name      : capturesession isFocusModeSupported api
         * @tc.desc      : capturesession isFocusModeSupported api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let issupported = mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100
         * @tc.name      : capturesession getFocusMode api
         * @tc.desc      : capturesession getFocusMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let focusmode = mCameraSession.getFocusMode();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100
         * @tc.name      : capturesession setFocusMode api
         * @tc.desc      : capturesession setFocusMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200
         * @tc.name      : capturesession setFocusMode api
         * @tc.desc      : capturesession setFocusMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                mCameraSession.setFocusMode(5);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100
         * @tc.name      : capturesession setFocusPoint api
         * @tc.desc      : capturesession setFocusPoint api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                mCameraSession.setFocusPoint({ x: 1, y: 1 });
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200
         * @tc.name      : capturesession setFocusPoint api
         * @tc.desc      : capturesession setFocusPoint api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                mCameraSession.setFocusPoint({ x: -1, y: -1 });
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100
         * @tc.name      : capturesession getFocusPoint api
         * @tc.desc      : capturesession getFocusPoint api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100--------------");
            if (mCameraSession) {
                mCameraSession.release();
                mCameraSession = null;
            }
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let point = mCameraSession.getFocusPoint();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100
         * @tc.name      : capturesession getFocalLength api
         * @tc.desc      : capturesession getFocalLength api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let length = mCameraSession.getFocalLength();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100
         * @tc.name      : capturesession getZoomRatioRange api
         * @tc.desc      : capturesession getZoomRatioRange api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let zoomratiorange = mCameraSession.getZoomRatioRange();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100
         * @tc.name      : capturesession getZoomRatio api
         * @tc.desc      : capturesession getZoomRatio api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let zoomratio = mCameraSession.getZoomRatio();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100
         * @tc.name      : capturesession setZoomRatio api
         * @tc.desc      : capturesession setZoomRatio api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let zoomratiorange = mCameraSession.getZoomRatioRange();
                mCameraSession.setZoomRatio(zoomratiorange[0]);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200
         * @tc.name      : capturesession setZoomRatio api
         * @tc.desc      : capturesession setZoomRatio api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                let zoomratiorange = mCameraSession.getZoomRatioRange();
                mCameraSession.setZoomRatio(-101);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100
         * @tc.name      : capturesession isVideoStabilizationModeSupported api
         * @tc.desc      : capturesession isVideoStabilizationModeSupported api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let isVSMS = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.LOW);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100
         * @tc.name      : capturesession getActiveVideoStabilizationMode api
         * @tc.desc      : capturesession getActiveVideoStabilizationMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                let avstmode = mCameraSession.getActiveVideoStabilizationMode();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100
         * @tc.name      : capturesession setVideoStabilizationMode api
         * @tc.desc      : capturesession setVideoStabilizationMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            try {
                mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.LOW);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                expect(true).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200
         * @tc.name      : capturesession setVideoStabilizationMode api
         * @tc.desc      : capturesession setVideoStabilizationMode api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            await mCameraSession.start();
            try {
                mCameraSession.setVideoStabilizationMode(5);
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            };
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100
         * @tc.name      : PreviewOutput  start api
         * @tc.desc      : PreviewOutput  start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            mPreviewOutput.start(async (err) => {
                if (!err) {
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100 success");
                } else {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200
         * @tc.name      : PreviewOutput  start api
         * @tc.desc      : PreviewOutput  start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);

            await mPreviewOutput.start().then((result) => {
                console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200 success :' + result);
            }).catch((err) => {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200 FAILED");
                console.info(TAG + "ERRORCODE: " + err.code);
                expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            });
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100
         * @tc.name      : videooutput  start api
         * @tc.desc      : videooutput  start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            if (!isEmpty(cameraOutputCap.videoProfiles)) {
                for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
                    videoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], videoSurfaceId);
                    if (!isEmpty(videoOutput)) {
                        break;
                    }
                }
            }
            mCameraSession.addOutput(mPreviewOutput);
            if (!isEmpty(videoOutput)) {
                mCameraSession.addOutput(videoOutput);
                videoOutput.start(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100 success");
                    } else {
                        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100 FAILED");
                        console.info(TAG + "ERRORCODE: " + err.code);
                        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                        expect(true).assertTrue();
                    }
                })
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200
         * @tc.name      : videooutput  start api
         * @tc.desc      : videooutput  start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            if (!isEmpty(cameraOutputCap.videoProfiles)) {
                for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
                    videoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], videoSurfaceId);
                    if (!isEmpty(videoOutput)) {
                        break;
                    }
                }
            }
            if (!isEmpty(videoOutput)) {
                mCameraSession.addOutput(videoOutput);
                await videoOutput.start().then((result) => {
                    console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200 success :' + result);
                }).catch((err) => {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                });
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100
         * @tc.name      : MetadataOutput start api
         * @tc.desc      : MetadataOutput start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            if (isEmpty(metadataOutput)) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100 metadataOutput IS NULL");
            } else {
                mCameraSession.addOutput(metadataOutput);
                metadataOutput.start(async (err) => {
                    if (!err) {
                        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100 success");
                    } else {
                        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100 FAILED");
                        console.info(TAG + "ERRORCODE: " + err.code);
                        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                        expect(true).assertTrue();
                    }
                })
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200
         * @tc.name      : metadataOutput  start api
         * @tc.desc      : metadataOutput  start api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            if (isEmpty(metadataOutput)) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200 metadataOutput IS NULL");
            } else {
                mCameraSession.addOutput(metadataOutput);
                await metadataOutput.start().then((result) => {
                    console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200 success :' + result);
                }).catch((err) => {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                    expect(true).assertTrue();
                });
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500
         * @tc.name      : photoOutput capture api
         * @tc.desc      : photoOutput capture api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            try {
                await mPhotoOutput.capture();
            } catch (err) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500 FAILED");
                console.info(TAG + "ERRORCODE: " + err.code);
                expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600
         * @tc.name      : photoOutput capture api
         * @tc.desc      : photoOutput capture api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            mPhotoOutput.capture(async (err) => {
                if (!err) {
                    expect(true).assertTrue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600 success");
                } else {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
                }
                done();
            })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700
         * @tc.name      : photoOutput capture api
         * @tc.desc      : photoOutput capture api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            mPhotoOutput.capture(captureSetting, async (err) => {
                if (!err) {
                    expect(true).assertTrue();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700 success");
                } else {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                    expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
                }
                done();
            })
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800
         * @tc.name      : photoOutput capture api
         * @tc.desc      : photoOutput capture api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800--------------");
            await createInput(0);
            createCameraSessionInstance();
            mCameraSession.addInput(mCameraInput);
            createOutput(0);
            mCameraSession.addOutput(mPreviewOutput);
            mCameraSession.addOutput(mPhotoOutput);
            await commitCameraSessionConfig();
            try {
                await mPhotoOutput.capture(captureSetting);
            } catch (err) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800 FAILED");
                console.info(TAG + "ERRORCODE: " + err.code);
                expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100
         * @tc.name      : capturesession beginConfig api
         * @tc.desc      : capturesession beginConfig api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100--------------");
            await createInput(0);
            mCameraSession = mCameraManager.createCaptureSession();
            mCameraSession.beginConfig();
            try {
                mCameraSession.beginConfig();
            } catch (error) {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100 FAILED");
                console.info(TAG + "ERRORCODE: " + error.code);
                expect(error.code == cameraObj.CameraErrorCode.SESSION_CONFIG_LOCKED).assertTrue();
                expect(true).assertTrue();
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100
         * @tc.name      : CameraInput  open api
         * @tc.desc      : CameraInput  open api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100--------------");
            mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
            if (!isEmpty(mCameraInput)) {
                mCameraInput.on('error', mCameraDevicesArray[0], (error) => {
                    console.log(`SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100 Camera input error code: ${error.code}`);
                    expect(error.code == cameraObj.CameraErrorCode.DEVICE_PREEMPTED).assertTrue();
                });
                mCameraInput.open(async (err) => {
                    console.info(TAG + "Entering mCameraInput open callback");
                    if (!err) {
                        console.info(TAG + "Entering mCameraInput open PASSED ");
                    } else {
                        console.info(TAG + "Entering mCameraInput open FAILED : " + err.message);
                    }
                })
                mCameraInput.open(async (err) => {
                    console.info(TAG + "Entering mCameraInput open callback");
                    if (!err) {
                        console.info(TAG + "Entering mCameraInput open PASSED ");
                    } else {
                        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100 FAILED");
                        console.info(TAG + "ERRORCODE: " + err.code);
                    }
                })
            } else {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0100 createCameraInput FAILED");
            }
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200
         * @tc.name      : CameraInput  open api
         * @tc.desc      : CameraInput  open api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200--------------");
            mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
            if (!isEmpty(mCameraInput)) {
                mCameraInput.on('error', mCameraDevicesArray[0], (error) => {
                    console.log(`SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200 Camera input error code: ${error.code}`);
                    expect(error.code == cameraObj.CameraErrorCode.DEVICE_PREEMPTED).assertTrue();
                });
                await mCameraInput.open().then((result) => {
                    console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200 success :' + result);
                }).catch((err) => {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                });
                await mCameraInput.open().then((result) => {
                    console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200 success :' + result);
                }).catch((err) => {
                    console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200 FAILED");
                    console.info(TAG + "ERRORCODE: " + err.code);
                });
            } else {
                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAMERAINPUT_OPEN_CONFLICT_0200 createCameraInput FAILED");
            }
            done();
        })
    })
}