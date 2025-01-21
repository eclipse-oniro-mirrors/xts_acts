/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import audio from '@ohos.multimedia.audio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

describe('audioEventManagement', function () {
    let TagFrmwk = "AudioFrameworkTest";
    console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
    let audioManager = null;
    let deviceRoleValue = null;
    let deviceTypeValue = null;
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    function getAudioManager() {
        audioManager = audio.getAudioManager();
        if (audioManager != null) {
            console.info(`${TagFrmwk}: getAudioManger : PASS`);
        }
        else {
            console.info(`${TagFrmwk}: getAudioManger : FAIL`);
        }
    }
    function displayDeviceProp(value, index, array) {
        let devRoleName;
        let devTypeName;
        if (value.deviceRole == 1) {
            devRoleName = 'INPUT_DEVICE';
        }
        else if (value.deviceRole == 2) {
            devRoleName = 'OUTPUT_DEVICE ';
        }
        else {
            devRoleName = 'ERROR : UNKNOWN : ' + value.deviceRole;
        }

        if (value.deviceType == 1) {
            devTypeName = 'EARPIECE';
        }
        else if (value.deviceType == 2) {
            devTypeName = 'SPEAKER';
        }
        else if (value.deviceType == 3) {
            devTypeName = 'WIRED_HEADSET';
        }
        else if (value.deviceType == 8) {
            devTypeName = 'BLUETOOTH_A2DP';
        }
        else if (value.deviceType == 15) {
            devTypeName = 'MIC';
        }
        else {
            devTypeName = 'ERROR : UNKNOWN :' + value.deviceType;
        }

        console.info(`${TagFrmwk}: device role: ${devRoleName}`);
        deviceRoleValue = value.deviceRole;
        console.info(`${TagFrmwk}: device type: ${devTypeName}`);
        deviceTypeValue = value.deviceType;

    }

    beforeAll(async function () {
        console.info(`${TagFrmwk}: beforeAll: Prerequisites at the test suite level`);
        await getAudioManager();
    })

    beforeEach(function () {
        console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
    })

    afterEach(async function () {
        console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
        await sleep(1000);
    })

    afterAll(function () {
        console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);

    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0100
     *@tc.name      : getDevices - Output device - Promise - ENAME
     *@tc.desc      : getDevices - Output device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0100', 0, async function (done) {
        const PROMISE = audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
        PROMISE.then(function (value) {

            console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);
            if (deviceTypeValue != null && deviceRoleValue != null) {
                console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                expect(true).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                expect(false).assertTrue();
            }
        });
        await PROMISE;
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_OUTPUT_ENUM_0100
     *@tc.name      : getDevices - Output device - Promise - ENAME -
     *@tc.desc      : getDevices - Output device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_OUTPUT_ENUM_0100', 0, async function (done) {
        const PROMISE = audioManager.getDevices(1)
        PROMISE.then(function (value) {
            console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);
            if (deviceTypeValue != null && deviceRoleValue != null) {
                console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                expect(true).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                expect(false).assertTrue();
            }
        });
        await PROMISE;
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_INPUT_0100
     *@tc.name      : getDevices - Input device - Promise - ENAME
     *@tc.desc      : getDevices - Input device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_INPUT_0100', 0, async function (done) {
        const PROMISE = audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG);
        PROMISE.then(function (value) {
            console.info(`${TagFrmwk}: Promise: getDevices INPUT_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);
            if (deviceTypeValue != null && deviceRoleValue != null) {
                console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS`);
                expect(true).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL`);
                expect(false).assertTrue();
            }
        });
        await PROMISE;
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_INTPUT_ENUM_0100
     *@tc.name      : getDevices - Input device - Promise - ENAME
     *@tc.desc      : getDevices - Input device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_INTPUT_ENUM_0100', 0, async function (done) {
        const PROMISE = audioManager.getDevices(2);
        PROMISE.then(function (value) {
            console.info(`${TagFrmwk}: Promise: getDevices INPUT_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);

            if (deviceTypeValue != null && deviceRoleValue != null) {
                console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS`);
                expect(true).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL`);
                expect(false).assertTrue();
            }
        });
        await PROMISE;
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_ALL_0100
     *@tc.name      : getDevices - ALL device - Promise - ENAME
     *@tc.desc      : getDevices - ALL device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_ALL_0100', 0, async function (done) {
        const PROMISE = audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG);
        PROMISE.then(function (value) {
            console.info(`${TagFrmwk}: Promise: getDevices ALL_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);

            if (deviceTypeValue != null && deviceRoleValue != null) {
                console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  PASS`);
                expect(true).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL`);
                expect(false).assertTrue();
            }
        });
        await PROMISE;
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_ALL_ENUM_0100
     *@tc.name      : getDevices - ALL device - Promise - ENAME
     *@tc.desc      : getDevices - ALL device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_PR_GETDEVICES_ALL_ENUM_0100', 0, async function (done) {
        const PROMISE = audioManager.getDevices(3);
        PROMISE.then(function (value) {
            console.info(`${TagFrmwk}: Promise: getDevices ALL_DEVICES_FLAG`);
            value.forEach(displayDeviceProp);

            if (deviceTypeValue != null && deviceRoleValue != null) {
                console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  PASS`);
                expect(true).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL`);
                expect(false).assertTrue();
            }
        });
        await PROMISE;
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_OUTPUT_0100
     *@tc.name      : getDevices - Output device - Callback - ENAME
     *@tc.desc      : getDevices - Output device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_OUTPUT_0100', 0, function (done) {
        audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (err, value) => {
            console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
            if (err) {
                console.error(`${TagFrmwk}: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (deviceTypeValue != null && deviceRoleValue != null) {
                    console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_OUTPUT_ENUM_0100
     *@tc.name      : getDevices - Output device - Callback - ENAME
     *@tc.desc      : getDevices - Output device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_OUTPUT_ENUM_0100', 2, function (done) {
        audioManager.getDevices(1, (err, value) => {
            console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
            if (err) {
                console.error(`${TagFrmwk}: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (deviceTypeValue != null && deviceRoleValue != null) {
                    console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_INPUT_0100
     *@tc.name      : getDevices - Input device - Callback - ENAME
     *@tc.desc      : getDevices - Input device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_INPUT_0100', 0, function (done) {
        audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG, (err, value) => {
            console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
            if (err) {
                console.error(`${TagFrmwk}: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);

                if (deviceTypeValue != null && deviceRoleValue != null) {
                    console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_INPUT_ENUM_0100
     *@tc.name      : getDevices - Input device - Callback - ENAME
     *@tc.desc      : getDevices - Input device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_INPUT_ENUM_0100', 0, function (done) {
        audioManager.getDevices(2, (err, value) => {
            console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
            if (err) {
                console.error(`${TagFrmwk}: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);

                if (deviceTypeValue != null && deviceRoleValue != null) {
                    console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_ALL_0100
     *@tc.name      : getDevices - ALL device - Callback - ENAME
     *@tc.desc      : getDevices - ALL device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_ALL_0100', 0, function (done) {
        audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err, value) => {
            console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
            if (err) {
                console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (deviceTypeValue != null && deviceRoleValue != null) {
                    console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_ALL_ENUM_0100
     *@tc.name      : getDevices - ALL device - Callback - ENAME
     *@tc.desc      : getDevices - ALL device
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_CB_GETDEVICES_ALL_ENUM_0100', 2, function (done) {
        audioManager.getDevices(3, (err, value) => {
            console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
            if (err) {
                console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
                value.forEach(displayDeviceProp);
                if (deviceTypeValue != null && deviceRoleValue != null) {
                    console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_DEACTIVATE_0100
     *@tc.name      : setDeviceActive - SPEAKER - deactivate - Promise
     *@tc.desc      : Deactivate speaker - Promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_DEACTIVATE_0100', 2, async function (done) {
        await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, false).then(function () {
            // Setting device active ENUM 2 = SPEAKER
            console.info(`${TagFrmwk}: Device Test: Promise : setDeviceActive : SPEAKER: Deactivate`);
            audioManager.isDeviceActive(audio.ActiveDeviceType.SPEAKER).then(function (value) {
                if (value == false) {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : PASS : ${value}`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : FAIL : ${value}`);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : FAIL : Error : ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_DEACTIVATE_ENUM_0100
     *@tc.name      : setDeviceActive - SPEAKER - deactivate - Promise
     *@tc.desc      : Deactivate speaker - Promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_DEACTIVATE_ENUM_0100', 2, async function (done) {
        await audioManager.setDeviceActive(2, true).then(function () {
            console.info(`${TagFrmwk}: Device Test: Promise : setDeviceActive : SPEAKER: Active`);
        });
        await audioManager.setDeviceActive(2, false).then(function () {
            // Setting device active ENUM 2 = SPEAKER
            console.info(`${TagFrmwk}: Device Test: Promise : setDeviceActive : SPEAKER: Deactivate`);
            audioManager.isDeviceActive(2).then(function (value) {
                if (value == false) {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : PASS : ${value}`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : FAIL : ${value}`);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : FAIL : Error : ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_ACTIVATE_0100
     *@tc.name      : setDeviceActive - SPEAKER - Activate - Promise
     *@tc.desc      : Activate speaker - Promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_ACTIVATE_0100', 2, async function (done) {
        await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true).then(function () {
            console.info(`${TagFrmwk}: Device Test: Promise : setDeviceActive : SPEAKER: Activate`);
            audioManager.isDeviceActive(audio.ActiveDeviceType.SPEAKER).then(function (value) {
                if (value == true) {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS : ${value}`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL : ${value}`);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL :Error : ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_ACTIVATE_ENUM_0100
     *@tc.name      : setDeviceActive - SPEAKER - Activate - Promise
     *@tc.desc      : Activate speaker - Promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_PR_ACTIVATE_ENUM_0100', 2, async function (done) {
        await audioManager.setDeviceActive(2, true).then(function () {
            console.info(`${TagFrmwk}: Device Test: Promise : setDeviceActive : SPEAKER: Activate`);
            audioManager.isDeviceActive(2).then(function (value) {
                if (value == true) {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS : ${value}`);
                    expect(true).assertTrue();
                }
                else {
                    console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL : ${value}`);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL :Error : ${err.message}`);
            expect(false).assertTrue();
        });
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_DEACTIVATE_0100
     *@tc.name      : setDeviceActive - SPEAKER - deactivate - Callback
     *@tc.desc      : Deactivate speaker - Callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_DEACTIVATE_0100', 2, function (done) {
        audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, false, (err) => {
            if (err) {
                console.error(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
                audioManager.isDeviceActive(audio.ActiveDeviceType.SPEAKER, (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == false) {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS : ${value}`);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : FAIL : ${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_DEACTIVATE_ENUM_0100
     *@tc.name      : setDeviceActive - SPEAKER - deactivate - Callback
     *@tc.desc      : Deactivate speaker - Callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_DEACTIVATE_ENUM_0100', 2, async function (done) {
        await audioManager.setDeviceActive(2, true).then(function () {
            console.info(`${TagFrmwk}: Device Test: Promise : setDeviceActive : SPEAKER : Active`);
        });
        audioManager.setDeviceActive(2, false, (err) => {
            if (err) {
                console.error(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
                audioManager.isDeviceActive(2, (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == false) {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS : ${value}`);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : FAIL : ${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })


    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_ACTIVATE_0100
     *@tc.name      : setDeviceActive - SPEAKER - activate - Callback
     *@tc.desc      : Activate speaker - Callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_ACTIVATE_0100', 2, function (done) {
        audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true, (err) => {
            if (err) {
                console.error(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
                audioManager.isDeviceActive(audio.ActiveDeviceType.SPEAKER, (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == true) {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : PASS : ${value}`);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : FAIL : ${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_ACTIVATE_ENUM_0100
     *@tc.name      : setDeviceActive - SPEAKER - activate - Callback
     *@tc.desc      : Activate speaker - Callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIO_MANAGER_SETDEVICEACTIVE_CB_ACTIVATE_ENUM_0100  ', 2, function (done) {
        audioManager.setDeviceActive(2, true, (err) => {
            if (err) {
                console.error(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
                audioManager.isDeviceActive(2, (err, value) => {
                    if (err) {
                        console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == true) {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : PASS : ${value}`);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : FAIL : ${value}`);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_0100
     *@tc.name      : DeviceChangeType - CONNECT  
     *@tc.desc      : DeviceChangeType - CONNECT  
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_0100', 2, async function (done) {
        expect(audio.DeviceChangeType.CONNECT).assertEqual(0);
        await sleep(50);
        done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_0200
     *@tc.name      : DeviceChangeType - DISCONNECT   
     *@tc.desc      : DeviceChangeType - DISCONNECT   
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_0200', 2, async function (done) {
        expect(audio.DeviceChangeType.DISCONNECT).assertEqual(1);
        await sleep(50);
        done();
    })
})