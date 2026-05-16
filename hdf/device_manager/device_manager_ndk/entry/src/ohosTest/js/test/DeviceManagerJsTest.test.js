/*
 * Copyright (C) 2023-2026 Huawei Device Co., Ltd.
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

export default function DeviceManagerJsTest(){
describe("DeviceManagerJsTest", function () {
    var deviceId = null;

    let deviceList;
    let isDeviceConnected;
    let qDeviceList;
    const PARAM_NULL = null;
    const TAG = '[DeviceManagerJsTest]';

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
     * @tc.name   testQueryDevices001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0100
     * @tc.desc   verify queryDevice result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueryDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        console.info(TAG, '----------------------testQueryDevices001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices(deviceManager.BusType.USB);
            console.info(TAG, 'Test case testQueryDevices001 devices :' + JSON.stringify(devices));
            expect(devices != null).assertEqual(true);
            expect(devices[0] != null).assertEqual(true);
            expect(devices[0].deviceId != null).assertEqual(true);
            expect(devices[0].description != null).assertEqual(true);
            expect(devices[0].vendorId != null).assertEqual(true);
            expect(devices[0].productId != null).assertEqual(true);
            expect(devices[0].busType != null).assertEqual(true);
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices001 catch err :' + err);
            expect().assertFail();
        }
    })

    /**
     * @tc.name   testQueryDevices002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0200
     * @tc.desc   verify queryDevice no param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryDevices002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevices002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices();
            console.info(TAG, 'Test case testQueryDevices002 ret : ', JSON.stringify(devices));
            expect(devices != null).assertTrue();
            expect(devices[0].deviceId != null).assertTrue();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices002 catch err : ', err);
            expect().assertFail();
        }
    })

    /**
     * @tc.name   testQueryDevices004
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2000
     * @tc.desc   verify queryDevice param is 12345
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryDevices004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevices004---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices(12345);
            console.info(TAG, 'Test case testQueryDevices004 ret : ', JSON.stringify(devices));
            expect(devices.length == 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices004 catch err : ', err);
            expect().assertFail();
        }
    })

    /**
     * @tc.name   testQueryDevices005
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2100
     * @tc.desc   verify queryDevice errcode 22900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryDevices005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevices005---------------------------');
        if (isDeviceConnected) {
            expect(isDeviceConnected).assertTrue();
            return
        }
        try {
            let devices = deviceManager.queryDevices();
            console.info(TAG, 'Test case testQueryDevices005 ret : ', JSON.stringify(devices));
            expect().assertFail();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevices005 catch err : ', err);
            expect(err.code).assertEqual(22900001);
        }
    })

    /**
     * @tc.name   testQueryDevicesNull
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2200
     * @tc.desc   verify queryDevice null param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryDevicesNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevicesNull---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices(null);
            console.info(TAG, 'Test case testQueryDevicesNull ret : ', JSON.stringify(devices));
            expect(devices != null).assertTrue();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevicesNull catch err : ', err);
            expect().assertFail();
        }
    })

    /**
     * @tc.name   testQueryDevicesUndefined
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2300
     * @tc.desc   verify queryDevice undefined param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueryDevicesUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, '----------------------testQueryDevicesUndefined---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let devices = deviceManager.queryDevices(undefined);
            console.info(TAG, 'Test case testQueryDevicesUndefined ret : ', JSON.stringify(devices));
            expect(devices != null).assertTrue();
        } catch (err) {
            console.info(TAG, 'Test case testQueryDevicesUndefined catch err : ', err);
            expect().assertFail();
        }
    })
    /**
     * @tc.name   testBindDevicesCallBack001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0300
     * @tc.desc   verify bindDevice invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesCallBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesCallBack001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice('fakeid', (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack001 ret : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack001 ret : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesCallBack001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesCallBack002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0400
     * @tc.desc   verify bindDevice any device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesCallBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesCallBack002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesCallBack002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesCallBack002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesNull001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2400
     * @tc.desc   verify bindDevice  param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesNull001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(null, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesNull001 ret : ', error,', data ', data);
                expect().assertFail();
                done();
            }, null);
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesNull001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesUndefined001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2500
     * @tc.desc   verify bindDevice  param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('testBindDevicesUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesNull001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(undefined, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesNull001 ret : ', error,', data ', data);
                expect().assertFail();
                done();
            }, undefined);
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesNull001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverCallBack001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0500
     * @tc.desc   verify bindDeviceDriver any device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBindDeviceDriverCallBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverCallBack001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(12345, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverCallBack001 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverCallBack002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1700
     * @tc.desc   verify bindDeviceDriver param is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDeviceDriverCallBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverCallBack002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver('fakeid', (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverCallBack001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverCallBack002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverNull001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2600
     * @tc.desc   verify bindDeviceDriver param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDeviceDriverNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverNull001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(null, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverNull001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, null);
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverNull001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverUndefined001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2700
     * @tc.desc   verify bindDeviceDriver param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDeviceDriverUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverUndefined001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(undefined, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverUndefined001 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }, undefined);
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverUndefined001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesPromise001
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0600
     * @tc.desc   verify bindDevice invalid param count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBindDevicesPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice();
            console.info(TAG, 'Test case testBindDevicesPromise001 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesPromise002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0700
     * @tc.desc   verify bindDevice invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345);
            console.info(TAG, 'Test case testBindDevicesPromise002 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesPromise003
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0800
     * @tc.desc   verify bindDevice invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesPromise003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise003---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345, 23456);
            console.info(TAG, 'Test case testBindDevicesPromise003 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise003 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesPromise004
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_0900
     * @tc.desc   verify bindDevice promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesPromise004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise004---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice('fakeid', (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDevicesPromise004 then fail', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise004 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesPromise005
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1000
     * @tc.desc   verify bindDevice promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesPromise005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesPromise005---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(12345, (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDevicesPromise005 then fail', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesPromise005 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesNull002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2800
     * @tc.desc   verify bindDevice null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesNull002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(null, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesNull002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesNull002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDevicesUndefined002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_2900
     * @tc.desc   verify bindDevice  param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDevicesUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDevicesUndefined002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDevice(undefined, (error, data) => {
                console.info(TAG, 'Test case testBindDevicesUndefined002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDevicesUndefined002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

     /**
      * @tc.name   testBindDeviceDriverPromise001
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1100
      * @tc.desc   verify bindDeviceDriver promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('testBindDeviceDriverPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverPromise001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(qDeviceList[0].deviceId, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise001 data', data);
                expect(data != null).assertTrue();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise001 then data', data);
                let remoteDeviceDriver = data;
                expect(remoteDeviceDriver.deviceId != null).assertTrue();
                expect(remoteDeviceDriver.remote != null).assertTrue();
                done();
            }, error => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise001 then error', error);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverPromise001 catch error : ', error);
            console.info(TAG, 'Test case fail, There is no driver for the corresponding device');
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverPromise002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1800
     * @tc.desc   verify bindDeviceDriver promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDeviceDriverPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverPromise002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(12345, (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise002 then fail', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverPromise002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverPromise003
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1900
     * @tc.desc   verify bindDeviceDriver promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDeviceDriverPromise003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverPromise003---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver('fakeid', (error, data) => {
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverPromise003 then fail: ', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverPromise003 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverNull002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3000
     * @tc.desc   verify bindDeviceDriver param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDeviceDriverNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverNull002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(null, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverNull002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverNull002 then fail: ', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverNull002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testBindDeviceDriverUndefined002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3100
     * @tc.desc   verify bindDeviceDriver param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBindDeviceDriverUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testBindDeviceDriverUndefined002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.bindDeviceDriver(undefined, (error, data) => {
                console.info(TAG, 'Test case testBindDeviceDriverUndefined002 error : ', error,', data ', data);
                expect().assertFail();
                done();
            }).then(data => {
                console.info(TAG, 'Test case testBindDeviceDriverUndefined002 then fail: ', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testBindDeviceDriverUndefined002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

     /**
      * @tc.name   testUnbindDevicesCallBack001
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1200
      * @tc.desc   verify unbindDevice any device
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('testUnbindDevicesCallBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesCallBack001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice('fakeid', (error, data) => {
                console.info(TAG, 'Test case testUnbindDevicesCallBack001 error : ', error, ',data : ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesCallBack001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
      * @tc.name   testUnbindDevicesNull001
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3200
      * @tc.desc   verify unbindDevice null device
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testUnbindDevicesNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesNull001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(null, (error, data) => {
                console.info(TAG, 'Test case testUnbindDevicesNull001 error : ', error, ',data : ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesNull001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
      * @tc.name   testUnbindDevicesUndefined001
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3300
      * @tc.desc   verify unbindDevice undefined device
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testUnbindDevicesUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesUndefined001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(undefined, (error, data) => {
                console.info(TAG, 'Test case testUnbindDevicesUndefined001 error : ', error, ',data : ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesUndefined001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
     * @tc.name   testUnbindDevicesCallBack002
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1300
     * @tc.desc   verify unbindDevice any device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnbindDevicesCallBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesCallBack002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(12345, (error, data) => {
                console.info(TAG, 'Test case testUnbindDevicesCallBack002 error : ', error, ',data : ', data);
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesCallBack002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })

     /**
      * @tc.name   testUnbindDevicesPromise001
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1400
      * @tc.desc   verify unbindDevice invalid param
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('testUnbindDevicesPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesPromise001---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice();
            console.info(TAG, 'Test case testUnbindDevicesPromise001 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesPromise001 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
      * @tc.name   testUnbindDevicesNull002
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3400
      * @tc.desc   verify unbindDevice null device
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testUnbindDevicesNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesNull002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(null);
            console.info(TAG, 'Test case testUnbindDevicesNull002 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesNull002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

    /**
      * @tc.name   testUnbindDevicesUndefined002
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3500
      * @tc.desc   verify unbindDevice undefined device
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testUnbindDevicesUndefined002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesUndefined002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(undefined);
            console.info(TAG, 'Test case testUnbindDevicesUndefined002 fail');
            expect().assertFail();
            done();
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesUndefined002 catch error : ', error);
            expect(error.code).assertEqual(401);
            done();
        }
    })

     /**
      * @tc.name   testUnbindDevicesPromise002
      * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_1500
      * @tc.desc   verify unbindDevice promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('testUnbindDevicesPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG, '----------------------testUnbindDevicesPromise002---------------------------');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            done();
            return
        }
        try {
            deviceManager.unbindDevice(12345).then(data => {
                console.info(TAG, 'Test case testUnbindDevicesPromise002 data : ', data);
                expect().assertFail();
                done();
            }, error => {
                expect().assertFail();
                done();
            });
        } catch (error) {
            console.info(TAG, 'Test case testUnbindDevicesPromise002 catch error : ', error);
            expect(error.code).assertEqual(22900001);
            done();
        }
    })


    /**
     * @tc.name   DeviceManager_bindDriverWithDeviceId_001
     * @tc.number SUB_Driver_Ext_Mchanism_0100
     * @tc.desc   verify bindDriverWithDeviceId invalid param count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_bindDriverWithDeviceId_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_bindDriverWithDeviceId_001---------------------------');
        try {
            deviceManager.bindDriverWithDeviceId();
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_bindDriverWithDeviceId_002
     * @tc.number SUB_Driver_Ext_Mchanism_0200
     * @tc.desc   verify bindDriverWithDeviceId invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_bindDriverWithDeviceId_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_bindDriverWithDeviceId_002---------------------------');
        try {
            deviceManager.bindDriverWithDeviceId(12345);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_bindDriverWithDeviceId_003
     * @tc.number SUB_Driver_Ext_Mchanism_0300
     * @tc.desc   verify bindDriverWithDeviceId invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_bindDriverWithDeviceId_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_bindDriverWithDeviceId_003---------------------------');
        try {
            deviceManager.bindDriverWithDeviceId(12345, 23456);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_bindDriverWithDeviceId_004
     * @tc.number SUB_Driver_Ext_Mchanism_0400
     * @tc.desc   verify bindDriverWithDeviceId promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_bindDriverWithDeviceId_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_bindDriverWithDeviceId_004---------------------------');
        try {
            deviceManager.bindDriverWithDeviceId('fakeid', (error, data) => {
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

    /**
     * @tc.name   DeviceManager_bindDriverWithDeviceId_005
     * @tc.number SUB_Driver_Ext_Mchanism_0500
     * @tc.desc   verify bindDriverWithDeviceId promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_bindDriverWithDeviceId_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_bindDriverWithDeviceId_005---------------------------');
        try {
            deviceManager.bindDriverWithDeviceId(12345, (error, data) => {
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
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE_NEW);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_bindDriverWithDeviceIdNull
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3600
     * @tc.desc   verify bindDriverWithDeviceId param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_bindDriverWithDeviceIdNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_bindDriverWithDeviceIdNull---------------------------');
        try {
            deviceManager.bindDriverWithDeviceId(null, (error, data) => {
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

    /**
     * @tc.name   DeviceManager_bindDriverWithDeviceIdUndefined
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3700
     * @tc.desc   verify bindDriverWithDeviceId param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it("DeviceManager_bindDriverWithDeviceIdUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_bindDriverWithDeviceIdUndefined---------------------------');
        try {
            deviceManager.bindDriverWithDeviceId(undefined, (error, data) => {
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

    /**
     * @tc.name   DeviceManager_unbindDriverWithDeviceId_001
     * @tc.number SUB_Driver_Ext_Mchanism_0600
     * @tc.desc   verify unbindDriverWithDeviceId invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_unbindDriverWithDeviceId_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_unbindDriverWithDeviceId_001---------------------------');
        try {
            deviceManager.unbindDriverWithDeviceId();
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_unbindDriverWithDeviceId_002
     * @tc.number SUB_Driver_Ext_Mchanism_0700
     * @tc.desc   verify unbindDriverWithDeviceId promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_unbindDriverWithDeviceId_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_unbindDriverWithDeviceId_002---------------------------');
        try {
            deviceManager.unbindDriverWithDeviceId(12345).then(data => {
                expect(false).assertTrue();
                done();
            }, error => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE_NEW);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_unbindDriverWithDeviceId_003
     * @tc.number SUB_Driver_Ext_Mchanism_0800
     * @tc.desc   verify unbindDriverWithDeviceId promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_unbindDriverWithDeviceId_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_unbindDriverWithDeviceId_003---------------------------');
        try {
            if (deviceId == null) {
                console.log('Device ID has not been set.');
                expect(true).assertTrue();
                done();
                return;
            }
            deviceManager.unbindDriverWithDeviceId(deviceId).then(data => {
                expect(false).assertTrue();
                done();
            }, error => {
                expect(false).assertTrue();
                done();
            });
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(SERVICE_NOT_BOUND);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_unbindDriverWithDeviceIdNull
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3800
     * @tc.desc   verify unbindDriverWithDeviceId null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("DeviceManager_unbindDriverWithDeviceIdNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_unbindDriverWithDeviceIdNull---------------------------');
        try {
            deviceManager.unbindDriverWithDeviceId(null);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   DeviceManager_unbindDriverWithDeviceIdUndefined
     * @tc.number SUB_Driver_Ext_DeviceManagerAPIFunc_3900
     * @tc.desc   verify unbindDriverWithDeviceId undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it("DeviceManager_unbindDriverWithDeviceIdUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info(TAG, '----------------------DeviceManager_unbindDriverWithDeviceIdUndefined---------------------------');
        try {
            deviceManager.unbindDriverWithDeviceId(undefined);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })
})
}
