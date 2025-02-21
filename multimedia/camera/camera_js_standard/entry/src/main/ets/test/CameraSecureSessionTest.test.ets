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
// @ts-nocheck
import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const TAG = "CameraSecureSessionTest: ";

// Define global letiables
let mCameraManager;
let mModeManager;
let mCameraDevicesArray;
let cameraMode;
let mCameraSession;

let mPhotoSurface;
 

// CAMERA-0 letiables
let mCameraNum;

let mCameraInput;
let mPreviewOutput;
let mSecurePreviewOutput;
let receiver;
let secureSeqId;

export default function cameraSecureSessionTest() {

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

    async function getSecurePreviewOutput() {
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

    function getCameraManagerInstance() {
        console.info('Enter getCameraManagerInstance');

        mCameraManager = cameraObj.getCameraManager(null);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }

        console.info('Exit getCameraManagerInstance');

        return true;
    }

    function getModeManagerInstance() {
        console.info('Enter getModeManagerInstance');

        mModeManager = cameraObj.getModeManager(null);
        if (isEmpty(mModeManager)) {
            console.info(TAG + "getModeManager FAILED");
            return false;
        }

        console.info('Exit getModeManagerInstance');

        return true;
    }

    function getCameraSupportDevicesArray() {
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

    function createSecureSessionInstance() {
        console.info('Enter createSecureSessionInstance');

        try {
            mCameraSession = mCameraManager.createSession(12);
        }
        catch {
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

    async function releaseCameraSessionInstance() {
        await mCameraSession.release();
    }

    async function createInput(idx: any) {
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

    async function releaseInput() {
        console.info('Enter releaseInput');

        if (!isEmpty(mCameraInput)) {
            await mCameraInput.close();
        }

        console.info('Exit releaseInput');

        return true;
    }

    async function createOutput(idx: any) {
        console.info('Enter createOutput');

        let cameraOutputCap = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx], 12);

        if (!isEmpty(cameraOutputCap)) {
            if (!isEmpty(cameraOutputCap.previewProfiles)) {
                console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
                for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                    mPreviewOutput = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], globalThis.surfaceId);
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

    async function releaseOutput() {
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

    async function startCameraSession(idx: any) {
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

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");
        await releaseOutput();
        await releaseInput();   
        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    async function startSecureCameraSession() {
        console.info(TAG + "Enter startSecureCameraSession" + cameraObj.SceneMode.SECURE_PHOTO);
        for (let cameraIndex = 0 ; cameraIndex < mCameraNum; cameraIndex++) {
            let cameraMode = mCameraManager.getSupportedSceneModes(mCameraDevicesArray[cameraIndex]);
            console.info(TAG + "cameraModeTmp = " + JSON.stringify(cameraMode));
            if (cameraMode != null && cameraMode.length > 0) {
                for (let modeIndex = 0; modeIndex < cameraMode.length; modeIndex++) {
                    let cameraModeTmp = cameraMode[modeIndex];
                    console.info(TAG + "cameraModeTmp = " + cameraModeTmp);
                    if (cameraModeTmp == cameraObj.SceneMode.SECURE_PHOTO) {
                        console.info(TAG + "Enter startSecureCameraSession %d" + cameraObj.SceneMode.SECURE);
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

    describe('cameraSecureSessionTest', function () {
        console.info(TAG + '----------CameraSecureSessionTest--------------')

        beforeAll(async function () {
            sleep(100);
            getCameraManagerInstance();
            getModeManagerInstance();
            getCameraSupportDevicesArray();
            await getSecurePreviewOutput();
            console.info('Device type = ' + deviceInfo.deviceType);
            secureSeqId = 0;
            console.info('beforeAll case');
        })

        beforeEach(function () {
            sleep(1000);
            console.info('beforeEach case');
        })

        afterEach(async function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            releaseCameraSessionInstance();
            sleep(500);
            console.info('afterAll case');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100
        * @tc.name      : Check open secure cameraid
        * @tc.desc      : Check open secure cameraid
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_OPEN_SECURE_CAMERA_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let cameraIndex = 0 ; cameraIndex < mCameraNum; cameraIndex++) {
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
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100
         * @tc.name      : Check add secure output flag
         * @tc.desc      : Check add secure output flag
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                console.info("SUB_MULTIMEDIA_CAMERA_SESSION_ADD_SECURE_CAMERA_0100 start ");
                for (let cameraIndex = 0 ; cameraIndex < mCameraNum; cameraIndex++) {
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
    })
}