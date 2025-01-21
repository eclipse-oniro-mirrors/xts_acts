/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function DeviceManagerJsTest(){
describe("DeviceManagerJsTest", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual("number");
    }

    function callback2() {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual("number");
    }

    beforeAll(function() {
        console.info('beforeAll called')
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

    /*
     * @tc.name:DeviceManager_queryDevices_001
     * @tc.desc:verify queryDevice result
     * @tc.type: FUNC
     */
    it("DeviceManager_queryDevices_001", 0, function () {
        console.info('----------------------DeviceManager_queryDevices_001---------------------------');
        try {
            var devices = deviceManager.queryDevices(deviceManager.BusType.USB);
            expect(devices != null).assertEqual(true);
            expect(devices[0] != null).assertEqual(true);
            expect(devices[0].vendorId != null).assertEqual(true);
            expect(devices[0].productId != null).assertEqual(true);
        } catch (err) {
            console.info('Test case queryDevices_001 err code :' + err.code);
            expect(err != null).assertFalse();
        }
    })

    /*
     * @tc.name:DeviceManager_queryDevices_002
     * @tc.desc:verify queryDevice no param result
     * @tc.type: FUNC
     */
    it("DeviceManager_queryDevices_002", 0, function () {
        console.info('----------------------DeviceManager_queryDevices_002---------------------------');
        try {
            var devices = deviceManager.queryDevices();
            expect(devices != null).assertEqual(true);
        } catch (err) {
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

    /*
     * @tc.name:DeviceManager_bindDevices_003
     * @tc.desc:verify bindDevice invalid param
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDevices_003", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDevices_003---------------------------');
        try {
            deviceManager.bindDevice('fakeid', (error, data) => {
                expect(false).assertTrue();
                done();
            }, (error, data) => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_bindDevices_004
     * @tc.desc:verify bindDevice any device
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDevices_004", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDevices_004---------------------------');
        try {
            deviceManager.bindDevice(12345, (error, data) => {
                expect(false).assertTrue();
                done();
            }, (error, data) => {
                expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_bindDeviceDriver_005
     * @tc.desc:verify bindDeviceDriver any device
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDeviceDriver_005", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDeviceDriver_005---------------------------');
        try {
            deviceManager.bindDeviceDriver(12345, (error, data) => {
                expect(false).assertTrue();
                done();
            }, (error, data) => {
                expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_bindDevices_006
     * @tc.desc:verify bindDevice invalid param count
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDevices_006", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDevices_006---------------------------');
        try {
            deviceManager.bindDevice();
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_bindDevices_007
     * @tc.desc:verify bindDevice invalid param
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDevices_007", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDevices_007---------------------------');
        try {
            deviceManager.bindDevice(12345);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_bindDevices_008
     * @tc.desc:verify bindDevice invalid param
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDevices_008", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDevices_008---------------------------');
        try {
            deviceManager.bindDevice(12345, 23456);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_bindDevices_009
     * @tc.desc:verify bindDevice promise
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDevices_009", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDevices_009---------------------------');
        try {
            deviceManager.bindDevice('fakeid', (error, data) => {
                expect(false).assertTrue();
                done();
            }).then(data => {
                expect(false).assertTrue();
                done();
            }, error => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_bindDevices_010
     * @tc.desc:verify bindDevice promise
     * @tc.type: FUNC
     */
    it("DeviceManager_bindDevices_010", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDevices_010---------------------------');
        try {
            deviceManager.bindDevice(12345, (error, data) => {
                expect(false).assertTrue();
                done();
            }).then(data => {
                expect(false).assertTrue();
                done();
            }, error => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
            done();
        }
    })

     /*
     * @tc.name:DeviceManager_bindDeviceDriver_011
     * @tc.desc:verify bindDeviceDriver promise
     * @tc.type: FUNC
     */
     it("DeviceManager_bindDeviceDriver_011", 0, async function (done) {
        console.info('----------------------DeviceManager_bindDeviceDriver_011---------------------------');
        try {
            deviceManager.bindDeviceDriver(12345, (error, data) => {
                expect(data != null).assertTrue();
                let remoteDeviceDriver = data;
                expect(remoteDeviceDriver.deviceId != null).assertTrue();
                expect(remoteDeviceDriver.remote != null).assertTrue();
                done();
            }).then(data => {
                expect(false).assertTrue();
                done();
            }, error => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
            done();
        }
    })

     /*
     * @tc.name:DeviceManager_unbindDevices_012
     * @tc.desc:verify unbindDevice any device
     * @tc.type: FUNC
     */
     it("DeviceManager_unbindDevices_012", 0, async function (done) {
        console.info('----------------------DeviceManager_unbindDevices_012---------------------------');
        try {
            deviceManager.unbindDevice('fakeid', (error, data) => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /*
     * @tc.name:DeviceManager_unbindDevices_013
     * @tc.desc:verify unbindDevice any device
     * @tc.type: FUNC
     */
    it("DeviceManager_unbindDevices_013", 0, async function (done) {
        console.info('----------------------DeviceManager_unbindDevices_013---------------------------');
        try {
            deviceManager.unbindDevice(12345, (error, data) => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
            done();
        }
    })

     /*
     * @tc.name:DeviceManager_unbindDevices_014
     * @tc.desc:verify unbindDevice invalid param
     * @tc.type: FUNC
     */
     it("DeviceManager_unbindDevices_014", 0, async function (done) {
        console.info('----------------------DeviceManager_unbindDevices_014---------------------------');
        try {
            deviceManager.unbindDevice();
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

     /*
     * @tc.name:DeviceManager_unbindDevices_015
     * @tc.desc:verify unbindDevice promise
     * @tc.type: FUNC
     */
     it("DeviceManager_unbindDevices_015", 0, async function (done) {
        console.info('----------------------DeviceManager_unbindDevices_015---------------------------');
        try {
            deviceManager.unbindDevice(12345).then(data => {
                expect(false).assertTrue();
                done();
            }, error => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
            done();
        }
    })
})
}