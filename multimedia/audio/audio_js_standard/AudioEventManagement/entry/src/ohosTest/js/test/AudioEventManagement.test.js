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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function audioEventManagement() {
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
}