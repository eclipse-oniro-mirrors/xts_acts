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

import deviceManager from '@ohos.driver.deviceManager'
import usbManager from '@ohos.usbManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function DeviceManagerCanIUseTest(){
describe("DeviceManagerCanIUseTest", function () {
    var deviceId = null;

    let deviceList;
    let isDeviceConnected;
    let qDeviceList;
    const PARAM_NULL = null;
    const TAG = '[DeviceManagerCanIUseTest]';

    function deviceConnected() {
        if (deviceList.length > 0) {
            console.info(TAG, "Test USB device is connected");
            return true;
        }
        console.info(TAG, "Test USB device is not connected");
        return false;
    }

    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual("number");
    }

    function callback2() {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual("number");
    }

    beforeAll(function() {
        console.info('beforeAll called');
        try {
            deviceList = usbManager.getDevices();
            console.info(TAG, 'beforeAll getDevices ', JSON.stringify(deviceList));
        } catch (err) {
            console.info(TAG, 'beforeAll getDevices failed, catch error is : ' + err);
        }
        isDeviceConnected = deviceConnected();
        if (isDeviceConnected) {
            try {
                qDeviceList = deviceManager.queryDevices(deviceManager.BusType.USB);
                console.info(TAG, 'beforeAll queryDevices ', JSON.stringify(qDeviceList));
            } catch(err) {
                console.info(TAG, 'beforeAll queryDevices failed, catch error is : ' + err);
            }
        }
        try {
            var devices = deviceManager.queryDevices(deviceManager.BusType.USB);
            if (devices != null && devices.length > 0 && devices[0] != null) {
                deviceId = BigInt(devices[0].deviceId);
                console.log('Device ID:', deviceId.toString());
            } else {
                console.log('No devices found.');
            }
        } catch (err) {
            console.error('Error occurred:', err);
        }

        if (deviceId == null) {
            console.log('Device ID has not been set.');
        }
        console.info('beforeAll called end');

    })

    afterAll(function() {
        console.info('afterAll called')
    })

    beforeEach(function() {
        console.info('beforeEach called')
    })

    afterEach(function() {
        console.info('afterEach called')
    })
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 22900001
    const SERVICE_EXCEPTION_CODE_NEW = 26300001
    const SERVICE_NOT_BOUND = 26300003

    /**
     * @tc.name   testDeviceManagerCanIUsek001
     * @tc.number SUB_Driver_Ext_DeviceManagerCanIUse_0100
     * @tc.desc   verify DeviceManagerCanIUse any device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeviceManagerCanIUsek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
        console.info(TAG, '----------------------testDeviceManagerCanIUsek001---------------------------');
        let flag = canIUse("SystemCapability.Driver.ExternalDevice");
        expect(flag).assertEqual(false);
    })
})
}
