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
import featureAbility from '@ohos.ability.featureAbility';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import {UiDriver, BY} from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
const TAG = "CameraInputTest: ";

// Define global variables
let mCameraManager;
let mCameraDevicesArray;
let mCameraSession;

let mCameraNum;

let mCameraInput;
let mPreviewOutput;
let context = featureAbility.getContext();
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
export default function CameraInputTest() {
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

     async function getPermission() {
            let permissions = ['ohos.permission.CAMERA',
            'ohos.permission.MICROPHONE',
            'ohos.permission.MEDIA_LOCATION',
            'ohos.permission.READ_MEDIA',
            'ohos.permission.WRITE_MEDIA',
            'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION'];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info("request success" + JSON.stringify(data));
            })
        }
    async function driveFn() {
        console.info(`come in driveFn`);
        let driver = await UiDriver.create();
        console.info(`driver is ${JSON.stringify(driver)}`);
        await sleep(2000);
        console.info(`UiDriver start`);
        let button = await driver.findComponent(BY.text('允许'));
        if(button == null){
            let cmd = "hidumper -s WindowManagerService -a'-a'"
            await delegator.executeShellCommand(cmd);
        }
        while(button){
            console.info(`button is ${JSON.stringify(button)}`);
            await button.click();
            await sleep(1000);
            button = await driver.findComponent(BY.text('允许'));
        }
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
        await sleep(300);
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
    
    function beginCameraSessionConfig() {
        console.info('Enter beginCameraSessionConfig');

        console.info(TAG + "Entering beginConfig start");
        mCameraSession.beginConfig();
        console.info(TAG + "Entering beginConfig end");
        console.info('Exit beginCameraSessionConfig');

        return true;
    }

    async function commitCameraSessionConfig() {
        console.info('Enter commitCameraSessionConfig');

        mCameraSession.commitConfig(async (err) => {
            if (!err) {
                console.info(TAG + "Entering commitConfig PASSED");
            } else {
                console.info(TAG + "Entering commitConfig FAILED : " + err.message);
            }
        })

        await sleep(500);

        console.info('Exit commitCameraSessionConfig');

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

        beginCameraSessionConfig();

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

        sleep(100);

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
        }
        
        console.info('Exit createOutputs');

        return true;
    }

    async function releaseOutput() {
        console.info('Enter releaseOutput');

        if (!isEmpty(mPreviewOutput)) {
            await mPreviewOutput.release();
        }

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
        
        await sleep(1);

        await commitCameraSessionConfig();
        
        console.info(TAG + "Exit startCameraSession");

        return true;
    }

    async function stopCameraSession() {
        console.info(TAG + "Enter stopCameraSession");

        if (!isEmpty(mCameraInput)) {
            console.info(TAG + "Start to removeInput input");
            mCameraSession.removeInput(mCameraInput);
        }

        if (!isEmpty(mPreviewOutput)) {
            console.info(TAG + "Start to removeOutput mPreviewOutput");
            mCameraSession.removeOutput(mPreviewOutput);
        }
        
        await releaseInput();
        await releaseOutput();

        console.info(TAG + "Exit stopCameraSession");

        return true;
    }

    describe('CameraInputTest', function () {
        console.info(TAG + '----------CameraInputTest--------------');
        beforeAll(async function () {
            await getPermission();
            sleep(1000);
            await driveFn();
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
            createCameraSessionInstance();
            console.info('beforeAll case');
        });
        beforeEach(function () {
            sleep(1000);
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
        });
        afterAll(function () {
            releaseCameraSessionInstance();
            console.info('afterAll case');
        });

        /**
             * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100
             * @tc.name      : camera status callback on CameraInput async api for error
             * @tc.desc      : camera status callback on CameraInput async api for error
             * @tc.size      : MEDIUM
             * @tc.type      : Function
             * @tc.level     : Level 0
            */
        it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100--------------");

            if (mCameraNum == 0) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    let nfyFlag = false;

                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 start for camera[" + i + "]");

                    await startCameraSession(i);

                    mCameraInput.on('error', mCameraDevicesArray[i], async (err, data) => {
                        if (!err) {
                            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 callback");
                            if (data != null || data != undefined) {
                                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 PASSED: " + data);
                                nfyFlag = true;
                            } else {
                                expect().assertFail();
                                console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 FAILED with data is empty");
                            }
                        } else {
                            expect().assertFail();
                            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 FAILED: " + err.message);
                        }
                        await sleep(1);
                    })

                    await sleep(300);

                    if (nfyFlag == false) {
                        //expect().assertFail();
                        //console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 FAILED without any nofity!");
                    }

                    await beginCameraSessionConfig();
                    await stopCameraSession();

                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 end for camera[" + i + "]");
                }

                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 ends here");
                done(); 
            }
        });
        
        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100
         * @tc.name      : open/close Camera with cameraInput callback api
         * @tc.desc      : open/close Camera with cameraInput callback api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100', 0, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100--------------");
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 cameraManager == null || undefined");
                expect().assertFail();
            } else {
                let camerasArray = mCameraDevicesArray;
                for (let i = 0; i < camerasArray.length; i++) {
                    let successFlag = false;
                    console.info(TAG + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
                    let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
                    expect(isEmpty(cameraInput)).assertFalse();
                    await cameraInput.open(async (err) => {
                        if (!err) {
                            successFlag = true;
                            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 PASSED open with CameraID :" + camerasArray[i].cameraId);
                        } else {
                            successFlag = false;
                            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 open FAILED: " + err.message);
                        }
                    });
                    await sleep(400);
                    successFlag = false;
                    await cameraInput.close(async (err) => {
                        if (!err) {
                            successFlag = true;
                            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 PASSED close with CameraID :" + camerasArray[i].cameraId);
                        } else {
                            successFlag = false;
                            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 close FAILED: " + err.message);
                        }
                    });
                    await sleep(100);
                    expect(successFlag).assertEqual(true);
            }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 ends here");
            await sleep(1000);
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100
         * @tc.name      : open/close Camera with cameraInput promise api
         * @tc.desc      : open/close Camera with cameraInput promise api
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100', 0, async function (done) {
            let functionTag = "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100";
            console.info(functionTag);
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 cameraManager == null || undefined");
                expect().assertFail();
            } else {
                let camerasArray = mCameraDevicesArray;
                for (let i = 0; i < camerasArray.length; i++) {
                    let successFlag = false;
                    console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 createCameraInput with camera: " + camerasArray[i].cameraId);
                    let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

                    expect(isEmpty(cameraInput)).assertFalse();
                    console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 cameraInput open with camera: " + camerasArray[i].cameraId);
                    await cameraInput.open().then(async () => {
                        successFlag = true;
                        console.info(TAG + functionTag + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 PASSED open with CameraID :" + camerasArray[i].cameraId);
                    }).catch((err) => {
                        successFlag = false;
                        console.info(TAG + functionTag + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 open FAILED: " + err.message);
                    });
                    await sleep(400);
                    successFlag = false;
                    await cameraInput.close().then(async () => {
                        successFlag = true;
                        console.info(TAG + functionTag + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 PASSED close with CameraID :" + camerasArray[i].cameraId);
                    }).catch((err) => {
                        successFlag = false;
                        console.info(TAG + functionTag + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 close FAILED: " + err.message);
                    });
                    await sleep(100);
                    expect(successFlag).assertEqual(true);
                    await sleep(600);
                }
                //await sleep(400 * camerasArray.length);
            }
            console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 ends here");
            done();
        });

    })
}