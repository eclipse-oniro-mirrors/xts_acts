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

import camera from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';
const TAG = "CameraPreconfigTest: ";

let mCameraManager;
let mCameraDevicesArray;
let mCameraSession;

let mPhotoSurface;
let mCameraNum;

let mCameraInput;
let mPreviewOutput: camera.PreviewOutput | null = null;
let mPhotoOutput: camera.PhotoOutput | null = null;
let mVideoOutput: camera.VideoOutput | null = null;

let receiver;
let context = featureAbility.getContext();
export default function cameraPreconfigTest() {
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

    function getCameraManagerInstance() {
        console.info('Enter getCameraManagerInstance');
        mCameraManager = camera.getCameraManager(context);
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
        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "getSupportedCameras FAILED");
            return false;
        }

        mCameraNum = mCameraDevicesArray.length;
        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
        console.info('Exit getCameraSupportDevicesArray');
        return true;
    }

    function createCameraSessionInstance(sceneMode: camera.SceneMode) {
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

    async function releaseCameraSessionInstance() {
        if (!isEmpty(mCameraSession)) {
            await mCameraSession.release();
            mCameraSession = null;
        }
        mPhotoOutput = null;
        mPreviewOutput = null;
        mVideoOutput = null;
    }

    async function createInput(idx: any) {
        console.info('Enter createInput');
        if (isEmpty(mCameraDevicesArray)) {
            console.info(TAG + "Entering createInputs FAILED with NoCamera");
            return false;
        }
        mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
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

    function createOutput(sceneMode: camera.SceneMode) {
        console.info('Enter createOutput');

        if(sceneMode == camera.SceneMode.NORMAL_VIDEO){
            mVideoOutput = mCameraManager.createVideoOutput(globalThis.surfaceId);
            if (isEmpty(mVideoOutput)) {
                console.info(TAG + "createVideoOutput FAILED");
            }
            console.info(TAG + "createVideoOutput: " + mVideoOutput);
        } else {
            mPreviewOutput = mCameraManager.createPreviewOutput(globalThis.surfaceId);
            if (isEmpty(mPreviewOutput)) {
                console.info(TAG + "createPreviewOutput FAILED");
            }
            console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
        }

        mPhotoOutput = mCameraManager.createPhotoOutput(mPhotoSurface);
        if (isEmpty(mPhotoOutput)) {
            console.info(TAG + "createPhotoOutput FAILED");
        }
        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);

        console.info('Exit createOutputs');
        return true;
    }

    async function releaseOutput() {
        console.info('Enter releaseOutput');

        if (!isEmpty(mPreviewOutput)) {
            await mPreviewOutput.release();
            mPreviewOutput = null;
        }

        if (!isEmpty(mVideoOutput)) {
            await mVideoOutput.release();
            mVideoOutput = null;
        }

        if (!isEmpty(mPhotoOutput)) {
            await mPhotoOutput.release();
            mPhotoOutput = null;
        }

        console.info('Exit releaseOutput');

        return true;
    }

    async function startCameraSession(idx: any, sceneMode: camera.SceneMode, preconfigType: camera.PreconfigType) {
        console.info(TAG + "Enter startCameraSession");

        if (!mCameraSession.canPreconfig(preconfigType)) {
            console.error(TAG + "Check mCameraSession.canPreconfig fail");
            return false;
        }
        mCameraSession.preconfig(preconfigType);
        await createInput(idx);
        createOutput(sceneMode);

        await sleep(1);

        mCameraSession.beginConfig();

        if (!isEmpty(mCameraInput)) {
            console.info(TAG + "Start to addInput");
            mCameraSession.addInput(mCameraInput);
        }

        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            mCameraSession.addOutput(mPreviewOutput);
        }

        if (!isEmpty(mVideoOutput)) {
            console.info(TAG + "Start to addOutput mVideoOutput");
            mCameraSession.addOutput(mVideoOutput);
        }

        if (!isEmpty(mPhotoOutput)) {
            console.info(TAG + "Start to addOutput mPhotoOutput");
            mCameraSession.addOutput(mPhotoOutput);
        }

        await sleep(30);

        await mCameraSession.commitConfig();

        await sleep(50);

        await mCameraSession.start();

        if (!isEmpty(mPreviewOutput)) {
            mPreviewOutput.getActiveProfile();
        }

        if (!isEmpty(mVideoOutput)) {
            mVideoOutput.getActiveProfile();
        }

        if (!isEmpty(mPhotoOutput)) {
            mPhotoOutput.getActiveProfile();
        }

        await sleep(100);
        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");
        mCameraSession.beginConfig();
        await mCameraSession.stop();
        await sleep(100);

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

    describe('CameraPreconfigTest', function () {
        console.info(TAG + '----------CameraPreconfigTest--------------')

        beforeAll(async function () {
            sleep(100);
            await getPhotoReceiverSurface();
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            console.info('beforeAll case');
        })

        beforeEach(async function () {
            await sleep(100);
            console.info('beforeEach case');
            await sleep(100);
        })

        afterEach(async function () {
            console.info('afterEach case');
            await sleep(100);
            await releaseCameraSessionInstance();
        })

        afterAll(async function () {
            await releaseCameraSessionInstance();
            await sleep(1000);
            console.info('afterAll case');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100
        * @tc.name      : Create photo session 
        * @tc.desc      : Create photo session
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
                return;
            }

            let result = createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
            expect(result).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_0100 PASSED");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100
        * @tc.name      : Photo session preconfig
        * @tc.desc      : Photo session preconfig
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
                return;
            }

            let result = createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
            expect(result).assertTrue();
            let selectedPreconfigType: camera.PreconfigType | null = null;
            let types: Array<camera.PreconfigType> = [camera.PreconfigType.PRECONFIG_720P,
            camera.PreconfigType.PRECONFIG_1080P,
            camera.PreconfigType.PRECONFIG_4K,
            camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            ];
            for (let type of types) {
                if (mCameraSession.canPreconfig(type)) {
                    selectedPreconfigType = type;
                    break;
                }
            }
            if (selectedPreconfigType == null || !mCameraSession.canPreconfig(selectedPreconfigType)) {
                console.info(TAG + "CameraSession.canPreconfig return fail, skip preconfig interface check");
                expect(true).assertTrue();
                done();
                return;
            }

            result = await startCameraSession(0, camera.SceneMode.NORMAL_PHOTO, selectedPreconfigType);
            expect(result).assertTrue();

            console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_0100 PASSED");
            done();
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100
        * @tc.name      : Video session preconfig
        * @tc.desc      : Video session preconfig
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
                return;
            }

            let result = createCameraSessionInstance(camera.SceneMode.NORMAL_VIDEO);
            expect(result).assertTrue();
            let selectedPreconfigType: camera.PreconfigType | null = null;
            let types: Array<camera.PreconfigType> = [camera.PreconfigType.PRECONFIG_720P,
            camera.PreconfigType.PRECONFIG_1080P,
            camera.PreconfigType.PRECONFIG_4K,
            camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            ];
            for (let type of types) {
                if (mCameraSession.canPreconfig(type)) {
                    selectedPreconfigType = type;
                    break;
                }
            }
            if (selectedPreconfigType == null || !mCameraSession.canPreconfig(selectedPreconfigType)) {
                console.info(TAG + "CameraSession.canPreconfig return fail, skip preconfig interface check");
                expect(true).assertTrue();
                done();
                return;
            }

            result = await startCameraSession(0, camera.SceneMode.NORMAL_VIDEO, selectedPreconfigType);
            expect(result).assertTrue();

            console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_0100 PASSED");
            done();
        })
    })
}