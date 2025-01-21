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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0100
     * @tc.name       : testDeviceManagerQueryDevices001
     * @tc.desc       : verify queryDevice result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerQueryDevices001', 0, function () {
        console.info('----------------------testDeviceManagerQueryDevices001---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0200
     * @tc.name       : testDeviceManagerQueryDevices002
     * @tc.desc       : verify queryDevice no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerQueryDevices002', 0, function () {
        console.info('----------------------testDeviceManagerQueryDevices002---------------------------');
        try {
            var devices = deviceManager.queryDevices();
            expect(devices != null).assertEqual(true);
        } catch (err) {
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0300
     * @tc.name       : testDeviceManagerBindDevices003
     * @tc.desc       : verify bindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDevices003', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDevices003---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0400
     * @tc.name       : testDeviceManagerBindDevices004
     * @tc.desc       : verify bindDevice any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDevices004', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDevices004---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0500
     * @tc.name       : testDeviceManagerBindDeviceDriver005
     * @tc.desc       : verify bindDeviceDriver any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDeviceDriver005', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDeviceDriver005---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0600
     * @tc.name       : testDeviceManagerBindDevices006
     * @tc.desc       : verify bindDevice invalid param count
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDevices006', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDevices006---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0700
     * @tc.name       : testDeviceManagerBindDevices007
     * @tc.desc       : verify bindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDevices007', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDevices007---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0800
     * @tc.name       : testDeviceManagerBindDevices008
     * @tc.desc       : verify bindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDevices008', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDevices008---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_0900
     * @tc.name       : testDeviceManagerBindDevices009
     * @tc.desc       : verify bindDevice promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDevices009', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDevices009---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1000
     * @tc.name       : testDeviceManagerBindDevices010
     * @tc.desc       : verify bindDevice promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerBindDevices010', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDevices010---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1100
     * @tc.name       : testDeviceManagerBindDeviceDriver011
     * @tc.desc       : verify bindDeviceDriver promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testDeviceManagerBindDeviceDriver011', 0, async function (done) {
        console.info('----------------------testDeviceManagerBindDeviceDriver011---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1200
     * @tc.name       : testDeviceManagerUnbindDevices012
     * @tc.desc       : verify unbindDevice any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testDeviceManagerUnbindDevices012', 0, async function (done) {
        console.info('----------------------testDeviceManagerUnbindDevices012---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1300
     * @tc.name       : testDeviceManagerUnbindDevices013
     * @tc.desc       : verify unbindDevice any device
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testDeviceManagerUnbindDevices013', 0, async function (done) {
        console.info('----------------------testDeviceManagerUnbindDevices013---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1400
     * @tc.name       : testDeviceManagerUnbindDevices014
     * @tc.desc       : verify unbindDevice invalid param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testDeviceManagerUnbindDevices014', 0, async function (done) {
        console.info('----------------------testDeviceManagerUnbindDevices014---------------------------');
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
     * @tc.number     : SUB_Driver_Ext_DeviceManagerAPIFunc_1500
     * @tc.name       : testDeviceManagerUnbindDevices015
     * @tc.desc       : verify unbindDevice promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
     it('testDeviceManagerUnbindDevices015', 0, async function (done) {
        console.info('----------------------testDeviceManagerUnbindDevices015---------------------------');
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