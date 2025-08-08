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
import display from '@ohos.display';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraSessionSystemPressureTest: ";

// Define global letiables
let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.PhotoSession;

// CAMERA-0 letiables
let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let context = getContext();

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

export default function cameraSessionSystemPressureTest() {
    let isEmpty = (data: ESObject) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    let mgetCameraManagerInstance = () => {
        console.info('Enter mgetCameraManagerInstance');
        mCameraManager = cameraObj.getCameraManager(context);
        if (isEmpty(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }
        console.info('Exit mgetCameraManagerInstance');
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
        console.info(idx + 'th CameraInput is: ' + mCameraInput);
        console.info('Exit createInput');
        return true;
    }

    let createOutput = (idx: number) => {
        console.info('Enter createOutput');
        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx], cameraObj.SceneMode.NORMAL_PHOTO);
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
        console.info('Exit createOutputs');
        return true;
    }

    describe('cameraSessionSystemPressureTest', () => {
        console.info(TAG + '----------cameraSessionSystemPressureTest--------------')
        let dr = Driver.create();
        beforeAll(async () => {
            mgetCameraManagerInstance();
            getCameraSupportDevicesArray();
            await ability();
            await sleep(500);
            for (let i = 0; i < permission.length; i++) {
                power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
                await power?.click();
                power = null;
                await sleep(500);
            }
            console.info('beforeAll case');
        })

        beforeEach(() => {
            console.info('beforeEach case');
        })

        afterEach(async () => {
            console.info('afterEach case');
        })

        afterAll(async () => {
            console.info('afterAll case');
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100
         * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100
         * @tc.desc      : Check whether register system pressure callback is successful.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100', Level.LEVEL2, async (done: Function) => {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100--------------");
            if (mCameraNum == 0) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG +
                        "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100 start for camera[" + i + "]");
                    await createInput(i);
                    createOutput(i);
                    try {
                        mCameraSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
                    } catch {
                        console.info('createCaptureSession FAILED');
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.beginConfig();
                    if (isEmpty(mCameraInput)) {
                        console.info(TAG + "cameraInput is null.");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addInput(mCameraInput);
                    if (isEmpty(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addOutput(mPreviewOutput);
                    await mCameraSession.commitConfig();

                    mCameraSession.on('systemPressureLevelChange', (error: BusinessError, pressureState: cameraObj.SystemPressureLevel) => {
                        if (error !== undefined && error.code !== 0) {
                            expect().assertFail();
                        }
                        done();
                    })

                    await mCameraSession.start();
                    await mCameraSession.stop();
                    await mCameraInput.close();
                    await mCameraSession.release();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100 end for camera[" +
                        i + "]");
                }
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_0100 ends here");
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100
         * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100
         * @tc.desc      : Check whether unregister system pressure callback is successful.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100', Level.LEVEL2, async (done: Function) => {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100--------------");
            if (mCameraNum == 0) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG +
                        "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100 start for camera[" + i + "]");
                    await createInput(i);
                    createOutput(i);
                    try {
                        mCameraSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
                    } catch {
                        console.info('createCaptureSession FAILED');
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.beginConfig();
                    if (isEmpty(mCameraInput)) {
                        console.info(TAG + "cameraInput is null.");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addInput(mCameraInput);
                    if (isEmpty(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addOutput(mPreviewOutput);
                    await mCameraSession.commitConfig();

                    mCameraSession.off('systemPressureLevelChange');

                    await mCameraSession.start();
                    await mCameraSession.stop();
                    await mCameraInput.close();
                    await mCameraSession.release();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100 end for camera[" +
                        i + "]");
                }
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_0100 ends here");
                done();
            }
        })
    })
}