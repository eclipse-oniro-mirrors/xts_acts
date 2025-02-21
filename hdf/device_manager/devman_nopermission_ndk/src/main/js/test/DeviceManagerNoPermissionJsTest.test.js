/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import usbManager from '@ohos.usbManager'
import deviceManager from '@ohos.driver.deviceManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

export default function DeviceManagerNoPermissionJsTest(){
describe("NoPermissionJsTest", function () {
    const TAG = "[NoPermissionJsTest]";
    const PERMISSION_DENIED_CODE = 201;
    const TEST_DEVICE_ID = 0;
    const TEST_DRIVER_UID = 'testDriverUid'
    const TEST_FUNCTION = (data) => {
        expect(data === null).assertTrue();
        console.info("Test function is called");
    };

    let deviceNum = 0;
    const isDeviceConnected = done => {
        if (deviceNum > 0) {
            console.info("Test USB device is connected");
            return true;
        }
        console.info("Test USB device is not connected");
        expect(true).assertTrue();
        if (typeof(done) === 'function') {
            done();
        }
        return false;
    }

    beforeAll(function () {
        console.info('beforeAll called');
        try {
            const devicesList = usbManager.getDevices();
            if (Array.isArray(devicesList)) {
                deviceNum = devicesList.length;
            }
        } catch (err) {
            console.error(TAG, `getDevices failed, message is ${err.message}`);
        }
    })

    afterAll(function () {
        console.info('afterAll called');
    })

    beforeEach(function () {
        console.info('beforeEach called');
    })

    afterEach(function () {
        console.info('afterEach called');
    })

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0100
     * @tc.name       : testNoPermissionQueryDevices001
     * @tc.desc       : verify permission of queryDevices
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionQueryDevices001', 0, done => {
        console.info('----------------------testNoPermissionQueryDevices001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            let devices = deviceManager.queryDevices(deviceManager.BusType.USB);
            expect(devices === null).assertTrue();
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionQueryDevices001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0200
     * @tc.name       : testNoPermissionBindDevice001
     * @tc.desc       : verify permission of bindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionBindDevice001', 0, done => {
        console.info('----------------------testNoPermissionBindDevice001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.bindDevice(TEST_DEVICE_ID, TEST_FUNCTION, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionBindDevice001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0300
     * @tc.name       : testNoPermissionBindDevice002
     * @tc.desc       : verify permission of bindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionBindDevice002', 0, async done => {
        console.info('----------------------testNoPermissionBindDevice002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.bindDevice(TEST_DEVICE_ID, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionBindDevice002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0400
     * @tc.name       : testNoPermissionBindDeviceDriver001
     * @tc.desc       : verify permission of bindDeviceDriver
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionBindDeviceDriver001', 0, done => {
        console.info('----------------------testNoPermissionBindDeviceDriver001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.bindDeviceDriver(TEST_DEVICE_ID, TEST_FUNCTION, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionBindDeviceDriver001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0500
     * @tc.name       : testNoPermissionBindDeviceDriver002
     * @tc.desc       : verify permission of bindDeviceDriver
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionBindDeviceDriver002', 0, async done => {
        console.info('----------------------testNoPermissionBindDeviceDriver002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.bindDeviceDriver(TEST_DEVICE_ID, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionBindDeviceDriver002 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0600
     * @tc.name       : testNoPermissionUnbindDevice001
     * @tc.desc       : verify permission of unbindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionUnbindDevice001', 0, done => {
        console.info('----------------------testNoPermissionUnbindDevice001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            deviceManager.unbindDevice(TEST_DEVICE_ID, TEST_FUNCTION);
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionUnbindDevice001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0700
     * @tc.name       : testNoPermissionUnbindDevice002
     * @tc.desc       : verify permission of unbindDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionUnbindDevice002', 0, async done => {
        console.info('----------------------testNoPermissionUnbindDevice002---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            await deviceManager.unbindDevice(TEST_DEVICE_ID).then(data => {
                expect(data === null).assertTrue();
            })
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionUnbindDevice002 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0800
     * @tc.name       : testNoPermissionQueryDeviceInfo001
     * @tc.desc       : verify permission of queryDeviceInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionQueryDeviceInfo001', 0, done => {
        console.info('----------------------testNoPermissionQueryDeviceInfo001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            let deviceInfos = deviceManager.queryDeviceInfo(TEST_DEVICE_ID);
            expect(deviceInfos === null).assertTrue();
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionQueryDeviceInfo001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

    /*
     * @tc.number     : SUB_Driver_Ext_DevManNoPermission_0900
     * @tc.name       : testNoPermissionQueryDriverInfo001
     * @tc.desc       : verify permission of queryDeviceInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNoPermissionQueryDriverInfo001', 0, done => {
        console.info('----------------------testNoPermissionQueryDriverInfo001---------------------------');
        if (!isDeviceConnected(done)) {
            return;
        }
        try {
            let driverInfos = deviceManager.queryDriverInfo(TEST_DRIVER_UID);
            expect(driverInfos === null).assertTrue();
            done();
        } catch (err) {
            console.info(TAG, 'testNoPermissionQueryDriverInfo001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
        }
    });

})
}
