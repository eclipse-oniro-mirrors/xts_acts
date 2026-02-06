/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import usbManager from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';


export default function UsbApiParamErrJsunitTest() {
describe('UsbApiParamErrJsunitTest', function () {

    const TAG = "[UsbApiParamErrJsunitTest]";
    const PARAM_NULL = null;
    const PARAM_UNDEFINED = undefined;
    const PARAM_NULLSTRING = "";
    const PARAM_NUMBERTYPE = 123;
    
    let gDeviceList;
    let devices;
    let gPipe = {
        busNum: null,
        devAddress: null
    };
    let requestparam;
    let isDeviceConnected;
    function deviceConnected() {
        if (gDeviceList.length > 0) {
            console.info(TAG, "Test USB device is connected");
            return true;
        }
        console.info(TAG, "Test USB device is not connected");
        return false;
    }

    beforeAll(async function () {
        console.log(TAG, '*************Usb Unit UsbApiParamErrJsunitTest Begin*************');
        const Version = usbManager.getVersion();
        console.info(TAG, 'usb unit begin test getversion :' + Version);

        // version > 17  host currentMode = 2 device currentMode = 1
        gDeviceList = usbManager.getDevices();
        console.info(TAG, 'usb unit begin test getDevices **********', JSON.stringify(gDeviceList));
        isDeviceConnected = deviceConnected();
        if (isDeviceConnected) {
            let hasRight = usbManager.hasRight(gDeviceList[0].name);
            if (!hasRight) {
                console.info(TAG, `beforeAll: usb requestRight start`);
                await getPermission();
                CheckEmptyUtils.sleep(1000);
                await driveFn();
                CheckEmptyUtils.sleep(1000);
            }

            requestparam = getControlTransferParam(0x80, 0x06, (0x01 << 8 | 0), 0, 18);
        }
    })

    beforeEach(function () {
        console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
        gDeviceList = usbManager.getDevices();
        if (isDeviceConnected) {
            devices = gDeviceList[0];
            console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(gPipe));
        }
    })

    afterEach(function () {
        console.info(TAG, 'afterEach: *************Usb Unit Test CaseEx*************');
        devices = null;
        console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
    })

    afterAll(function () {
        console.log(TAG, '*************Usb Unit UsbApiParamErrJsunitTest End*************');
    })

    async function driveFn() {
        console.info('**************driveFn**************');
        try {
            let driver = await UiDriver.create();
            console.info(TAG, ` come in driveFn`);
            console.info(TAG, `driver is ${JSON.stringify(driver)}`);
            CheckEmptyUtils.sleep(1000);
            let button = await driver.findComponent(BY.text('允许'));
            console.info(TAG, `button is ${JSON.stringify(button)}`);
            CheckEmptyUtils.sleep(1000);
            await button.click();
        } catch (err) {
            console.info(TAG, 'err is ' + err);
            return;
        }
    }

    async function getPermission() {
        console.info('**************getPermission**************');
        try {
            usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
                console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
            })
        } catch (err) {
            console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
            return
        }
    }

    function getControlTransferParam(iReqType, iReq, iValue, iIndex, iLength) {
        let tmpUint8Array = new Uint8Array(512);

        let requestparam = {
            bmRequestType: iReqType,
            bRequest: iReq,
            wValue: iValue,
            wIndex: iIndex,
            wLength: iLength,
            data: tmpUint8Array
        }
        return requestparam;
    }

    function getPipe(testCaseName) {
        gPipe = usbManager.connectDevice(devices);
        console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
        expect(gPipe !== null).assertTrue();
    }

    function toReleaseInterface(testCaseName, tInterface) {
        let ret = usbManager.releaseInterface(gPipe, tInterface);
        console.info(TAG, `usb ${testCaseName} releaseInterface ret: ${ret}`);
        expect(ret).assertEqual(0);
    }

    function toClosePipe(testCaseName) {
        let isPipClose = usbManager.closePipe(gPipe);
        console.info(TAG, `usb ${testCaseName} closePipe ret: ${isPipClose}`);
        expect(isPipClose).assertEqual(0);
    }

    /**
     * @tc.name   testGetDevicesParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0100
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDevicesParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetDevicesParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gDeviceList = usbManager.getDevices(PARAM_NULL);
            console.info(TAG, 'usb case getDevices ret length: ' + gDeviceList.length);
            expect(gDeviceList === null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testGetDevicesParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetDevicesParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0200
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDevicesParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetDevicesParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gDeviceList = usbManager.getDevices(PARAM_UNDEFINED);
            console.info(TAG, 'usb case getDevices ret length: ' + gDeviceList.length);
            expect(gDeviceList === null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testGetDevicesParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetDevicesParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0300
     * @tc.desc   Negative test: Param is null string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDevicesParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetDevicesParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gDeviceList = usbManager.getDevices(PARAM_NULLSTRING);
            console.info(TAG, 'usb case getDevices ret length: ' + gDeviceList.length);
            expect(gDeviceList === null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testGetDevicesParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testHasRightParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0400
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testHasRightParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let isHasRight = usbManager.hasRight(PARAM_NULL);
            console.info(TAG, 'usb case hasRight ret : ' + isHasRight);
            expect(isHasRight === null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testHasRightParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testHasRightParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0500
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testHasRightParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let isHasRight = usbManager.hasRight(PARAM_UNDEFINED);
            console.info(TAG, 'usb case hasRight ret : ' + isHasRight);
            expect(isHasRight === null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testHasRightParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    

    /**
     * @tc.name   testRequestRightParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0600
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
        console.info(TAG, 'usb testRequestRightParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let isHasRight = await usbManager.requestRight(PARAM_NULL);
            console.info(TAG, 'usb case requestRight ret : ' + isHasRight);
            expect(isHasRight !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testRequestRightParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testRequestRightParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0700
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
        console.info(TAG, 'usb testRequestRightParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let isHasRight = await usbManager.requestRight(PARAM_UNDEFINED);
            console.info(TAG, 'usb case requestRight ret : ' + isHasRight);
            expect(isHasRight !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testRequestRightParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testRequestRightParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0800
     * @tc.desc   Negative test: Enter two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
        console.info(TAG, 'usb testRequestRightParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            for (var i = 0; i < gDeviceList.length; i++) {
                let deviceName = gDeviceList[i].name;
                let isHasRight = await usbManager.requestRight(deviceName, deviceName);
                console.info(TAG, 'usb [', deviceName, '] requestRight ret : ' + isHasRight);
                expect(isHasRight).assertTrue();
            }
        } catch (err) {
            console.info(TAG, 'testRequestRightParamErr003 catch err : ', err);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.name   testRemoveRightParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0900
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveRightParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testRemoveRightParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let remRight = usbManager.removeRight(PARAM_NULL);
            console.info(TAG, 'usb case removeRight ret : ' + remRight);
            expect(remRight !== true).assertTrue();
        } catch (err) {
            console.info(TAG, 'testRemoveRightParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testRemoveRightParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1000
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveRightParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testRemoveRightParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let remRight = usbManager.removeRight(PARAM_UNDEFINED);
            console.info(TAG, 'usb case removeRight ret : ' + remRight);
            expect(remRight !== true).assertTrue();
        } catch (err) {
            console.info(TAG, 'testRemoveRightParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testRemoveRightParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1100
     * @tc.desc   Negative test: Enter two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveRightParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
        console.info(TAG, 'usb testRemoveRightParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            for (var i = 0; i < gDeviceList.length; i++) {
                let deviceName = gDeviceList[i].name;
                let remRight = usbManager.removeRight(deviceName, deviceName);
                console.info(TAG, 'usb [', deviceName, '] removeRight ret : ' + remRight);
                expect(remRight).assertTrue();
            }
        } catch (err) {
            console.info(TAG, 'testRemoveRightParamErr003 catch err : ', err);
            expect(err !== null).assertFalse();
        }
        await getPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
    })

    /**
     * @tc.name   testConnectDeviceParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1200
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.connectDevice(PARAM_NULL);
            console.info(TAG, 'usb case connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1300
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.connectDevice(PARAM_UNDEFINED);
            console.info(TAG, 'usb case connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1400
     * @tc.desc   Negative test: Param is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.connectDevice(PARAM_NULLSTRING);
            console.info(TAG, 'usb case connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1500
     * @tc.desc   Negative test: Enter two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe = usbManager.connectDevice(devices, devices);
            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(gPipe));
            expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr004 catch err : ', err);
            expect(err !== null).assertFalse();
        }
        toClosePipe('testConnectDeviceParamErr004');
    })

    /**
     * @tc.name   testConnectDeviceParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1600
     * @tc.desc   Negative test: devices name is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.name = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1700
     * @tc.desc   Negative test: devices name is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.name = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1800
     * @tc.desc   Negative test: devices name is number 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.name = PARAM_NUMBERTYPE;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [', devices.name, '] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1900
     * @tc.desc   Negative test: devices busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.busNum = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [busNum:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2000
     * @tc.desc   Negative test: devices busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.busNum = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [busNum:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2100
     * @tc.desc   Negative test: devices busNum null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.busNum = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [busNum:null string] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr011
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2200
     * @tc.desc   Negative test: devices devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.devAddress = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [devAddress:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr011 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr012
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2300
     * @tc.desc   Negative test: devices devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.devAddress = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [devAddress:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr012 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr013
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2400
     * @tc.desc   Negative test: devices devAddress is null string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.devAddress = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [devAddress:null string] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr013 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr014
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2500
     * @tc.desc   Negative test: devices serial is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.serial = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [serial:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr014 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr015
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2600
     * @tc.desc   Negative test: devices serial is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.serial = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [serial:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr015 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr016
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2700
     * @tc.desc   Negative test: devices serial is number 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.serial = PARAM_NUMBERTYPE;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [serial:123] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr016 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr017
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2800
     * @tc.desc   Negative test: devices manufacturerName is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.manufacturerName = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [manufacturerName:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr017 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr018
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2900
     * @tc.desc   Negative test: devices manufacturerName is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.manufacturerName = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [manufacturerName:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr018 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr019
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3000
     * @tc.desc   Negative test: devices manufacturerName is number 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.manufacturerName = PARAM_NUMBERTYPE;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [manufacturerName:123] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr019 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr020
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3100
     * @tc.desc   Negative test: devices productName is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.productName = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [productName:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr020 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr021
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3200
     * @tc.desc   Negative test: devices productName is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.productName = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [productName:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr021 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr022
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3300
     * @tc.desc   Negative test: devices productName is number 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.productName = PARAM_NUMBERTYPE;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [productName:123] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr022 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr023
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3400
     * @tc.desc   Negative test: devices version is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.version = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [version:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr023 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr024
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3500
     * @tc.desc   Negative test: devices version is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.version = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [version:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr024 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr025
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3600
     * @tc.desc   Negative test: devices vendorId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.vendorId = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [vendorId:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr025 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr026
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3700
     * @tc.desc   Negative test: devices vendorId is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.vendorId = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [vendorId:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr027
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3800
     * @tc.desc   Negative test: devices vendorId is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.vendorId = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [vendorId:""] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr028
     * @tc.number SUB_USB_HostManager_JS_ParamErr_3900
     * @tc.desc   Negative test: devices productId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr028 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.productId = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [productId:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr028 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr029
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4000
     * @tc.desc   Negative test: devices productId is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr029 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.productId = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [productId:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr029 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr030
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4100
     * @tc.desc   Negative test: devices productId is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr030 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.productId = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [productId:" "] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr030 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr031
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4200
     * @tc.desc   Negative test: devices clazz is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr031 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.clazz = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [clazz:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr031 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr032
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4300
     * @tc.desc   Negative test: devices clazz is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr032 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.clazz = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [clazz:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr032 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr033
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4400
     * @tc.desc   Negative test: devices clazz is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr033 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.clazz = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [clazz:""] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr033 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr034
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4500
     * @tc.desc   Negative test: devices subClass is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr034 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.subClass = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [subClass:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr034 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr035
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4600
     * @tc.desc   Negative test: devices subClass is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr035 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.subClass = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [subClass:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr035 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr036
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4700
     * @tc.desc   Negative test: devices subClass is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr036 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.subClass = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [subClass:""] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr036 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr037
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4800
     * @tc.desc   Negative test: devices protocol is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr037 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.protocol = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [protocol:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr037 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr038
     * @tc.number SUB_USB_HostManager_JS_ParamErr_4900
     * @tc.desc   Negative test: devices protocol is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr038 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.protocol = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [protocol:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr038 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr039
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5000
     * @tc.desc   Negative test: devices protocol is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr039 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.protocol = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [protocol:""] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr039 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr040
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5100
     * @tc.desc   Negative test: devices configs is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr040 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.configs = PARAM_NULL;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [configs:null] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr040 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr041
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5200
     * @tc.desc   Negative test: devices configs is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr041 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.configs = PARAM_UNDEFINED;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [configs:undefined] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr041 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr042
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5300
     * @tc.desc   Negative test: devices configs is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr042 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.configs = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [configs:""] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr042 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testConnectDeviceParamErr043
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5400
     * @tc.desc   Negative test: devices configs is number 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceParamErr043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testConnectDeviceParamErr043 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            devices.configs = PARAM_NULLSTRING;
            let ret = usbManager.connectDevice(devices);
            console.info(TAG, 'usb [configs:123] connectDevice ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testConnectDeviceParamErr043 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5500
     * @tc.desc   Negative test: Enter two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testClosePipeParamErr001');
        try {
            let ret = usbManager.closePipe(gPipe, gPipe);
            console.info(TAG, 'usb Enter two parameters closePipe ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr001 catch err : ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
    })

    /**
     * @tc.name   testClosePipeParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5600
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [busNum:null] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5700
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [busNum:undefined] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5800
     * @tc.desc   Negative test: pipe busNum is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [busNum:""] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_5900
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULL;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [devAddress:null] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6000
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_UNDEFINED;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [devAddress:undefined] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6100
     * @tc.desc   Negative test: devices devAddress is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULLSTRING;
            let ret = usbManager.closePipe(gPipe);
            console.info(TAG, 'usb [devAddress:""] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6200
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.closePipe(PARAM_NULL);
            console.info(TAG, 'usb [param:null] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6300
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.closePipe(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClosePipeParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6400
     * @tc.desc   Negative test: Param is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipeParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClosePipeParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.closePipe(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] closePipe ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClosePipeParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6500
     * @tc.desc   Negative test: Enter two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testGetRawDescriptorParamErr001');
        try {
            let ret = usbManager.getRawDescriptor(gPipe, gPipe);
            console.info(TAG, 'usb Enter two parameters getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret.length >= 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
        toClosePipe('testGetRawDescriptorParamErr001');
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6600
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.getRawDescriptor(PARAM_NULL);
            console.info(TAG, 'usb [param:null] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6700
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.getRawDescriptor(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6800
     * @tc.desc   Negative test: Param is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.getRawDescriptor(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_6900
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [busNum:null] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7000
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [busNum:undefined] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7100
     * @tc.desc   Negative test: pipe busNum is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [busNum:""] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7200
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULL;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [devAddress:null] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7300
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_UNDEFINED;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [devAddress:undefined] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetRawDescriptorParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7400
     * @tc.desc   Negative test: devices devAddress is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptorParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetRawDescriptorParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULLSTRING;
            let ret = usbManager.getRawDescriptor(gPipe);
            console.info(TAG, 'usb [devAddress:""] getRawDescriptor ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetRawDescriptorParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7500
     * @tc.desc   Negative test: Enter two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testGetRawDescriptorParamErr001');
        try {
            let ret = usbManager.getFileDescriptor(gPipe, gPipe);
            console.info(TAG, 'usb Enter two parameters getFileDescriptor ret : ', ret);
            expect(ret >= 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr001 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
        toClosePipe('testGetRawDescriptorParamErr001');
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7600
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.getFileDescriptor(PARAM_NULL);
            console.info(TAG, 'usb [param:null] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr002 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7700
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.getFileDescriptor(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr003 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7800
     * @tc.desc   Negative test: Param is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.getFileDescriptor(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr004 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_7900
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [busNum:null] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr005 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8000
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [busNum:undefined] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr006 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8100
     * @tc.desc   Negative test: pipe busNum is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [busNum:""] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr007 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8200
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULL;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [devAddress:null] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8300
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_UNDEFINED;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [devAddress:undefined] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr009 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testGetFileDescriptorParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8400
     * @tc.desc   Negative test: devices devAddress is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptorParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testGetFileDescriptorParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULLSTRING;
            let ret = usbManager.getFileDescriptor(gPipe);
            console.info(TAG, 'usb [devAddress:""] getFileDescriptor ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testGetFileDescriptorParamErr010 catch err code: ',
                err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8500
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.claimInterface(PARAM_NULL);
            console.info(TAG, 'usb [param:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8600
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.claimInterface(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8700
     * @tc.desc   Negative test: Param is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.claimInterface(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8800
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [busNum:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_8900
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [busNum:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9000
     * @tc.desc   Negative test: pipe busNum is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [busNum:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9100
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULL;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [devAddress:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9200
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_UNDEFINED;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [devAddress:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9300
     * @tc.desc   Negative test: pipe devAddress is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.devAddress = PARAM_NULLSTRING;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [devAddress:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9400
     * @tc.desc   Negative test: interfaces id is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_NULL;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.id:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr011
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9500
     * @tc.desc   Negative test: interfaces id is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_UNDEFINED;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.id:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr011 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr012
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9600
     * @tc.desc   Negative test: interfaces id is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_NULLSTRING;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.id:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr012 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr013
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9700
     * @tc.desc   Negative test: interfaces protocol is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_NULL;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.protocol:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr013 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr014
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9800
     * @tc.desc   Negative test: interfaces protocol is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_UNDEFINED;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.protocol:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr014 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr015
     * @tc.number SUB_USB_HostManager_JS_ParamErr_9900
     * @tc.desc   Negative test: interfaces protocol is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_NULLSTRING;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.protocol:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr015 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr016
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0110
     * @tc.desc   Negative test: interfaces clazz is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_NULL;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.clazz:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr016 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr017
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0120
     * @tc.desc   Negative test: interfaces clazz is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_UNDEFINED;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.clazz:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr017 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr018
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0130
     * @tc.desc   Negative test: interfaces clazz is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_NULLSTRING;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.clazz:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr018 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr019
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0140
     * @tc.desc   Negative test: interfaces name is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_NULL;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.name:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr019 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr020
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0150
     * @tc.desc   Negative test: interfaces name is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_UNDEFINED;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.name:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr020 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr021
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0160
     * @tc.desc   Negative test: interfaces name is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_NUMBERTYPE;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.name:number_123] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr021 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr022
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0170
     * @tc.desc   Negative test: interfaces subClass is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_NULL;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.subClass:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr022 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr023
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0180
     * @tc.desc   Negative test: interfaces subClass is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_UNDEFINED;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.subClass:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr023 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr024
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0190
     * @tc.desc   Negative test: interfaces subClass is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_NULLSTRING;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.subClass:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr024 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr025
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0210
     * @tc.desc   Negative test: interfaces alternateSetting is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_NULL;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.alternateSetting:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr025 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr026
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0220
     * @tc.desc   Negative test: interfaces alternateSetting is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_UNDEFINED;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.alternateSetting:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr027
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0230
     * @tc.desc   Negative test: interfaces alternateSetting is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_NULLSTRING;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.alternateSetting:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr028
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0240
     * @tc.desc   Negative test: interfaces endpoints is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr028 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_NULL;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.endpoints:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr028 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr029
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0250
     * @tc.desc   Negative test: interfaces endpoints is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr029 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_UNDEFINED;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.endpoints:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr029 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr030
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0260
     * @tc.desc   Negative test: interfaces endpoints is null string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr030 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_NULLSTRING;
            let ret = usbManager.claimInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interfaces.endpoints:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr030 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr031
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0270
     * @tc.desc   Negative test: Enter four parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr031 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testClaimInterfaceParamErr031');
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let ret = usbManager.claimInterface(gPipe, tmpInterface, true, gPipe);
            console.info(TAG, 'usb [Enter four param] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr031 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface('testClaimInterfaceParamErr031', tmpInterface);
        toClosePipe('testClaimInterfaceParamErr031');
    })

    /**
     * @tc.name   testClaimInterfaceParamErr032
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0280
     * @tc.desc   Negative test: iface is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr032 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.claimInterface(gPipe, PARAM_NULL);
            console.info(TAG, 'usb [iface:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr032 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr033
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0290
     * @tc.desc   Negative test: iface is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr033 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.claimInterface(gPipe, PARAM_UNDEFINED);
            console.info(TAG, 'usb [iface:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr033 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr034
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0310
     * @tc.desc   Negative test: iface is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr034 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.claimInterface(gPipe, PARAM_NULLSTRING);
            console.info(TAG, 'usb [iface:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr034 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr035
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0320
     * @tc.desc   Negative test: pipe is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr035 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(PARAM_NULL, tmpInterface);
            console.info(TAG, 'usb [iface:null] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr035 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr036
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0330
     * @tc.desc   Negative test: pipe is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr036 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(PARAM_UNDEFINED, tmpInterface);
            console.info(TAG, 'usb [iface:undefined] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr036 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testClaimInterfaceParamErr037
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0340
     * @tc.desc   Negative test: pipe is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterfaceParamErr037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr037 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.claimInterface(PARAM_NULLSTRING, tmpInterface);
            console.info(TAG, 'usb [iface:""] claimInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr037 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

     /**
      * @tc.name   testClaimInterfaceParamErr038
      * @tc.number SUB_USB_HostManager_JS_ParamErr_0350
      * @tc.desc   Negative test: force is null string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('testClaimInterfaceParamErr038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testClaimInterfaceParamErr038 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testClaimInterfaceParamErr038');
        let tmpInterface = devices.configs[0].interfaces[0];
        try {
            let ret = usbManager.claimInterface(gPipe, tmpInterface, PARAM_NULLSTRING);
            console.info(TAG, 'usb [force:""] claimInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testClaimInterfaceParamErr038 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface('testClaimInterfaceParamErr038', tmpInterface);
        toClosePipe('testClaimInterfaceParamErr038');
    })

    /**
     * @tc.name   testSetConfigurationParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0360
     * @tc.desc   Negative test: Enter two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testSetConfigurationParamErr001');
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            let ret = usbManager.setConfiguration(gPipe, tmpConfig, gPipe);
            console.info(TAG, 'usb [Enter two parameters] setConfiguration ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
        toClosePipe('testSetConfigurationParamErr001');
    })

    /**
     * @tc.name   testSetConfigurationParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0370
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.setConfiguration(PARAM_NULL);
            console.info(TAG, 'usb [param:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0380
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.setConfiguration(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0390
     * @tc.desc   Negative test: Param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.setConfiguration(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0410
     * @tc.desc   Negative test: pipe is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpConfig = devices.configs[0];
            let ret = usbManager.setConfiguration(PARAM_NULL, tmpConfig);
            console.info(TAG, 'usb [pipe:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0420
     * @tc.desc   Negative test: pipe is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpConfig = devices.configs[0];
            let ret = usbManager.setConfiguration(PARAM_UNDEFINED, tmpConfig);
            console.info(TAG, 'usb [pipe:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0430
     * @tc.desc   Negative test: pipe is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpConfig = devices.configs[0];
            let ret = usbManager.setConfiguration(PARAM_NULLSTRING, tmpConfig);
            console.info(TAG, 'usb [pipe:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0440
     * @tc.desc   Negative test: config is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.setConfiguration(gPipe, PARAM_NULL);
            console.info(TAG, 'usb [config:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0450
     * @tc.desc   Negative test: config is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.setConfiguration(gPipe, PARAM_UNDEFINED);
            console.info(TAG, 'usb [config:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0460
     * @tc.desc   Negative test: config is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.setConfiguration(gPipe, PARAM_NULLSTRING);
            console.info(TAG, 'usb [config:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr011
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0470
     * @tc.desc   Negative test: config id is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.id = PARAM_NULL;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.id:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr011 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr012
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0480
     * @tc.desc   Negative test: config id is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.id = PARAM_UNDEFINED;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.id:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr012 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr013
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0490
     * @tc.desc   Negative test: config id is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.id = PARAM_NULLSTRING;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.id:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr013 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr014
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0510
     * @tc.desc   Negative test: config attributes is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.attributes = PARAM_NULL;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.attributes:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr014 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr015
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0520
     * @tc.desc   Negative test: config attributes is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.attributes = PARAM_UNDEFINED;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.attributes:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr015 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr016
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0530
     * @tc.desc   Negative test: config attributes is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.attributes = PARAM_NULLSTRING;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.attributes:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr016 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr017
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0540
     * @tc.desc   Negative test: config maxPower is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.maxPower = PARAM_NULL;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.maxPower:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr017 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr018
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0550
     * @tc.desc   Negative test: config maxPower is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.maxPower = PARAM_UNDEFINED;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.maxPower:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr018 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr019
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0560
     * @tc.desc   Negative test: config maxPower is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.maxPower = PARAM_NULLSTRING;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.maxPower:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr019 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr020
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0570
     * @tc.desc   Negative test: config name is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.name = PARAM_NULL;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.name:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr020 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr021
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0580
     * @tc.desc   Negative test: config name is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.name = PARAM_UNDEFINED;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.name:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr021 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr022
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0590
     * @tc.desc   Negative test: config name is 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.name = PARAM_NUMBERTYPE;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.name:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr022 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr023
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0610
     * @tc.desc   Negative test: config isRemoteWakeup is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isRemoteWakeup = PARAM_NULL;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isRemoteWakeup:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr023 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr024
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0620
     * @tc.desc   Negative test: config isRemoteWakeup is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isRemoteWakeup = PARAM_UNDEFINED;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isRemoteWakeup:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr024 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr025
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0630
     * @tc.desc   Negative test: config isRemoteWakeup is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isRemoteWakeup = PARAM_NULLSTRING;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isRemoteWakeup:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr025 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr026
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0640
     * @tc.desc   Negative test: config isSelfPowered is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isSelfPowered = PARAM_NULL;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isSelfPowered:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr027
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0650
     * @tc.desc   Negative test: config isSelfPowered is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isSelfPowered = PARAM_UNDEFINED;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isSelfPowered:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr028
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0660
     * @tc.desc   Negative test: config isSelfPowered is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr028 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isSelfPowered = PARAM_NULLSTRING;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isSelfPowered:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr028 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr029
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0670
     * @tc.desc   Negative test: config interfaces is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr029 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.interfaces = PARAM_NULL;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.interfaces:null] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr029 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr030
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0680
     * @tc.desc   Negative test: config interfaces is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr030 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.interfaces = PARAM_UNDEFINED;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.interfaces:undefined] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr030 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr031
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0690
     * @tc.desc   Negative test: config interfaces is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr031 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.interfaces = PARAM_NULLSTRING;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.interfaces:""] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr031 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr032
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0710
     * @tc.desc   Negative test: config isRemoteWakeup is 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr032 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isRemoteWakeup = PARAM_NUMBERTYPE;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isRemoteWakeup:123] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr032 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr033
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0720
     * @tc.desc   Negative test: config isSelfPowered is 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr033 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.isSelfPowered = PARAM_NUMBERTYPE;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.isSelfPowered:123] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr033 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetConfigurationParamErr034
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0730
     * @tc.desc   Negative test: config interfaces is 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfigurationParamErr034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetConfigurationParamErr034 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpConfig = devices.configs[0];
            tmpConfig.interfaces = PARAM_NUMBERTYPE;
            let ret = usbManager.setConfiguration(gPipe, tmpConfig);
            console.info(TAG, 'usb [config.interfaces:123] setConfiguration ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetConfigurationParamErr034 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0740
     * @tc.desc   Negative test: Enter three parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testSetInterfaceParamErr001');
        let tmpInterface = devices.configs[0].interfaces[0];
        let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
        expect(isClaim).assertEqual(0);
        try {
            let ret = usbManager.setInterface(gPipe, tmpInterface, gPipe);
            console.info(TAG, 'usb [Enter three parameters] setInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
        toReleaseInterface('testSetInterfaceParamErr001', tmpInterface);
        toClosePipe('testSetInterfaceParamErr001');
    })

    /**
     * @tc.name   testSetInterfaceParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0750
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.setInterface(PARAM_NULL);
            console.info(TAG, 'usb [param:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0760
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.setInterface(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0770
     * @tc.desc   Negative test: Param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.setInterface(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0780
     * @tc.desc   Negative test: pipe is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(PARAM_NULL, tmpInterface);
            console.info(TAG, 'usb [pipe:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0790
     * @tc.desc   Negative test: pipe is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(PARAM_UNDEFINED, tmpInterface);
            console.info(TAG, 'usb [pipe:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0810
     * @tc.desc   Negative test: pipe is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(PARAM_NULLSTRING, tmpInterface);
            console.info(TAG, 'usb [pipe:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0820
     * @tc.desc   Negative test: iface is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.setInterface(gPipe, PARAM_NULL);
            console.info(TAG, 'usb [iface:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0830
     * @tc.desc   Negative test: iface is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.setInterface(gPipe, PARAM_UNDEFINED);
            console.info(TAG, 'usb [iface:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0840
     * @tc.desc   Negative test: iface is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.setInterface(gPipe, PARAM_NULLSTRING);
            console.info(TAG, 'usb [iface:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr011
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0850
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [gPipe.busNum:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr011 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr012
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0860
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [gPipe.busNum:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr012 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr013
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0870
     * @tc.desc   Negative test: pipe busNum is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [gPipe.busNum:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr013 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr014
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0880
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULL;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [gPipe.devAddress:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr014 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr015
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0890
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_UNDEFINED;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [gPipe.devAddress:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr015 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr016
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0910
     * @tc.desc   Negative test: pipe devAddress is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULLSTRING;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [gPipe.devAddress:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr016 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr017
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0920
     * @tc.desc   Negative test: interface id is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_NULL;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.id:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr017 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr018
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0930
     * @tc.desc   Negative test: interface id is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_UNDEFINED;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.id:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr018 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr019
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0940
     * @tc.desc   Negative test: interface id is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_NULLSTRING;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.id:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr019 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr020
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0950
     * @tc.desc   Negative test: interface protocol is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_NULL;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.protocol:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr020 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr021
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0960
     * @tc.desc   Negative test: interface protocol is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_UNDEFINED;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.protocol:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr021 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr022
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0970
     * @tc.desc   Negative test: interface protocol is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_NULLSTRING;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.protocol:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr022 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr023
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0980
     * @tc.desc   Negative test: interface clazz is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_NULL;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.clazz:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr023 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr024
     * @tc.number SUB_USB_HostManager_JS_ParamErr_0990
     * @tc.desc   Negative test: interface clazz is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_UNDEFINED;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.clazz:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr024 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr025
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1010
     * @tc.desc   Negative test: interface clazz is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_NULLSTRING;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.clazz:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr025 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr026
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1020
     * @tc.desc   Negative test: interface subClass is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_NULL;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.subClass:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr027
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1030
     * @tc.desc   Negative test: interface subClass is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_UNDEFINED;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.subClass:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr028
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1040
     * @tc.desc   Negative test: interface subClass is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr028 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_NULLSTRING;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.subClass:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr028 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr029
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1050
     * @tc.desc   Negative test: interface alternateSetting is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr029 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_NULL;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.alternateSetting:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr029 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr030
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1060
     * @tc.desc   Negative test: interface alternateSetting is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr030 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_UNDEFINED;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.alternateSetting:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr030 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr031
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1070
     * @tc.desc   Negative test: interface alternateSetting is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr031 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_NULLSTRING;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.alternateSetting:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr031 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr032
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1080
     * @tc.desc   Negative test: interface name is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr032 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_NULL;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.name:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr032 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr033
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1090
     * @tc.desc   Negative test: interface name is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr033 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_UNDEFINED;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.name:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr033 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr034
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1110
     * @tc.desc   Negative test: interface name is 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr034 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_NUMBERTYPE;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.name:123] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr034 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr035
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1120
     * @tc.desc   Negative test: interface endpoints is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr035 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_NULL;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.endpoints:null] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr035 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr036
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1130
     * @tc.desc   Negative test: interface endpoints is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr036 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_UNDEFINED;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.endpoints:undefined] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr036 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testSetInterfaceParamErr037
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1140
     * @tc.desc   Negative test: interface endpoints is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterfaceParamErr037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testSetInterfaceParamErr037 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_NULLSTRING;
            let ret = usbManager.setInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.endpoints:""] setInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testSetInterfaceParamErr037 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1150
     * @tc.desc   Negative test: Enter three parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        getPipe('testReleaseInterfaceParamErr001');
        let tmpInterface = devices.configs[0].interfaces[0];
        let isClaim = usbManager.claimInterface(gPipe, tmpInterface, true);
        expect(isClaim).assertEqual(0);
        try {
            let ret = usbManager.releaseInterface(gPipe, tmpInterface, gPipe);
            console.info(TAG, 'usb [Enter three parameters] releaseInterface ret : ', ret);
            expect(ret).assertEqual(0);
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err !== null).assertFalse();
        }
        toClosePipe('testReleaseInterfaceParamErr001');
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1160
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.releaseInterface(PARAM_NULL);
            console.info(TAG, 'usb [param:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1170
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.releaseInterface(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1180
     * @tc.desc   Negative test: Param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.releaseInterface(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1190
     * @tc.desc   Negative test: pipe is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(PARAM_NULL, tmpInterface);
            console.info(TAG, 'usb [pipe:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1210
     * @tc.desc   Negative test: pipe is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(PARAM_UNDEFINED, tmpInterface);
            console.info(TAG, 'usb [pipe:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1220
     * @tc.desc   Negative test: pipe is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(PARAM_NULLSTRING, tmpInterface);
            console.info(TAG, 'usb [pipe:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1230
     * @tc.desc   Negative test: interface is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.releaseInterface(gPipe, PARAM_NULL);
            console.info(TAG, 'usb [interface:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1240
     * @tc.desc   Negative test: interface is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.releaseInterface(gPipe, PARAM_UNDEFINED);
            console.info(TAG, 'usb [interface:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1250
     * @tc.desc   Negative test: interface is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let ret = usbManager.releaseInterface(gPipe, PARAM_NULLSTRING);
            console.info(TAG, 'usb [interface:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr011
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1260
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [busNum:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr011 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr012
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1270
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [busNum:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr012 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr013
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1280
     * @tc.desc   Negative test: pipe busNum is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [busNum:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr013 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr014
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1290
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULL;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [devAddress:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr014 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr015
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1310
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_UNDEFINED;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [devAddress:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr015 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr016
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1320
     * @tc.desc   Negative test: pipe devAddress is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULLSTRING;
            let tmpInterface = devices.configs[0].interfaces[0];
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [devAddress:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr016 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr017
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1330
     * @tc.desc   Negative test: interface id is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_NULL;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.id:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr017 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr018
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1340
     * @tc.desc   Negative test: interface id is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_UNDEFINED;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.id:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr018 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr019
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1350
     * @tc.desc   Negative test: interface id is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.id = PARAM_NULLSTRING;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.id:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr019 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr020
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1360
     * @tc.desc   Negative test: interface name is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_NULL;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.name:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr020 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr021
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1370
     * @tc.desc   Negative test: interface name is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_UNDEFINED;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.name:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr021 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr022
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1380
     * @tc.desc   Negative test: interface name is 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.name = PARAM_NUMBERTYPE;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [name:123] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr022 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr023
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1390
     * @tc.desc   Negative test: interface protocol is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_NULL;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.protocol:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr023 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr024
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1410
     * @tc.desc   Negative test: interface protocol is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_UNDEFINED;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.protocol:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr024 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr025
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1420
     * @tc.desc   Negative test: interface protocol is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.protocol = PARAM_NULLSTRING;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.protocol:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr025 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr026
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1430
     * @tc.desc   Negative test: interface clazz is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_NULL;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.clazz:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr027
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1440
     * @tc.desc   Negative test: interface clazz is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_UNDEFINED;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.clazz:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr028
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1450
     * @tc.desc   Negative test: interface clazz is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr028 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.clazz = PARAM_NULLSTRING;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.clazz:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr028 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr029
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1460
     * @tc.desc   Negative test: interface subClass is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr029 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_NULL;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.subClass:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr029 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr030
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1470
     * @tc.desc   Negative test: interface subClass is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr030 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_UNDEFINED;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.subClass:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr030 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr031
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1480
     * @tc.desc   Negative test: interface subClass is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr031 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.subClass = PARAM_NULLSTRING;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.subClass:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr031 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr032
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1490
     * @tc.desc   Negative test: interface alternateSetting is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr032 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_NULL;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.alternateSetting:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr032 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr033
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1510
     * @tc.desc   Negative test: interface alternateSetting is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr033 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_UNDEFINED;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.alternateSetting:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr033 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr034
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1520
     * @tc.desc   Negative test: interface alternateSetting is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr034 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.alternateSetting = PARAM_NULLSTRING;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.alternateSetting:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr034 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr035
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1530
     * @tc.desc   Negative test: interface endpoints is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr035 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_NULL;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.endpoints:null] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr035 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr036
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1540
     * @tc.desc   Negative test: interface endpoints is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr036 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_UNDEFINED;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.endpoints:undefined] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr036 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testReleaseInterfaceParamErr037
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1550
     * @tc.desc   Negative test: interface endpoints is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterfaceParamErr037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testReleaseInterfaceParamErr037 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpInterface = devices.configs[0].interfaces[0];
            tmpInterface.endpoints = PARAM_NULLSTRING;
            let ret = usbManager.releaseInterface(gPipe, tmpInterface);
            console.info(TAG, 'usb [interface.endpoints:""] releaseInterface ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testReleaseInterfaceParamErr037 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1560
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.bulkTransfer(PARAM_NULL);
            console.info(TAG, 'usb [param:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1570
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.bulkTransfer(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1580
     * @tc.desc   Negative test: Param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.bulkTransfer(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1590
     * @tc.desc   Negative test: pipe is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(PARAM_NULL, tmpInterface, buffer);
            console.info(TAG, 'usb [pipe:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1610
     * @tc.desc   Negative test: pipe is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(PARAM_UNDEFINED, tmpInterface, buffer);
            console.info(TAG, 'usb [pipe:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1620
     * @tc.desc   Negative test: pipe is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpInterface = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(PARAM_NULLSTRING, tmpInterface, buffer);
            console.info(TAG, 'usb [pipe:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1630
     * @tc.desc   Negative test: endpoint is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, PARAM_NULL, buffer);
            console.info(TAG, 'usb [endpoint:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1640
     * @tc.desc   Negative test: endpoint is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, PARAM_UNDEFINED, buffer);
            console.info(TAG, 'usb [endpoint:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1650
     * @tc.desc   Negative test: endpoint is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, PARAM_NULLSTRING, buffer);
            console.info(TAG, 'usb [endpoint:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1660
     * @tc.desc   Negative test: buffer is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, PARAM_NULL);
            console.info(TAG, 'usb [buffer:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr011
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1670
     * @tc.desc   Negative test: buffer is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, PARAM_UNDEFINED);
            console.info(TAG, 'usb [buffer:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr011 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr012
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1680
     * @tc.desc   Negative test: buffer is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, PARAM_NULLSTRING);
            console.info(TAG, 'usb [buffer:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr012 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr013
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1690
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [busNum:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr013 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr014
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1710
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [busNum:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr014 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr015
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1720
     * @tc.desc   Negative test: pipe busNum is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [busNum:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr015 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr016
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1730
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULL;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [devAddress:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr016 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr017
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1740
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_UNDEFINED;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [devAddress:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr017 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr018
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1750
     * @tc.desc   Negative test: pipe devAddress is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULLSTRING;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [devAddress:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr018 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr019
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1760
     * @tc.desc   Negative test: endpoint address is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.address = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.address:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr019 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr020
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1770
     * @tc.desc   Negative test: endpoint address is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.address = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.address:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr020 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr021
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1780
     * @tc.desc   Negative test: endpoint address is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.address = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.address:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr021 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr022
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1790
     * @tc.desc   Negative test: endpoint number is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.number = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.number:null] bulkTransfer ret : ', JSON.stringify(ret));
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr022 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr023
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1810
     * @tc.desc   Negative test: endpoint number is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.number = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.number:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr023 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr024
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1820
     * @tc.desc   Negative test: endpoint number is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.number = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.number:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr024 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr025
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1830
     * @tc.desc   Negative test: endpoint type is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.type = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.type:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr025 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr026
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1840
     * @tc.desc   Negative test: endpoint type is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.type = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.type:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr027
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1850
     * @tc.desc   Negative test: endpoint type is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.type = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.type:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr028
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1860
     * @tc.desc   Negative test: endpoint attributes is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr028 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.attributes = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.attributes:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr028 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr029
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1870
     * @tc.desc   Negative test: endpoint attributes is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr029 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.attributes = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.attributes:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr029 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr030
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1880
     * @tc.desc   Negative test: endpoint attributes is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr030 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.attributes = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.attributes:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr030 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr031
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1890
     * @tc.desc   Negative test: endpoint interval is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr031 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.interval = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.interval:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr031 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr032
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1910
     * @tc.desc   Negative test: endpoint interval is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr032 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.interval = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.interval:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr032 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr033
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1920
     * @tc.desc   Negative test: endpoint interval is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr033 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.interval = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.interval:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr033 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr034
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1930
     * @tc.desc   Negative test: endpoint maxPacketSize is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr034 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.maxPacketSize = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.maxPacketSize:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr034 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr035
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1940
     * @tc.desc   Negative test: endpoint maxPacketSize is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr035 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.maxPacketSize = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.maxPacketSize:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr035 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr036
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1950
     * @tc.desc   Negative test: endpoint maxPacketSize is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr036 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.maxPacketSize = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.maxPacketSize:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr036 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr037
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1960
     * @tc.desc   Negative test: endpoint direction is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr037 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.direction = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.direction:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr037 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr038
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1970
     * @tc.desc   Negative test: endpoint direction is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr038 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.direction = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.direction:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr038 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr039
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1980
     * @tc.desc   Negative test: endpoint direction is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr039 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.direction = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.direction:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr039 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr040
     * @tc.number SUB_USB_HostManager_JS_ParamErr_1990
     * @tc.desc   Negative test: endpoint interfaceId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr040 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.interfaceId = PARAM_NULL;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.interfaceId:null] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr040 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr041
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2010
     * @tc.desc   Negative test: endpoint interfaceId is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr041 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.interfaceId = PARAM_UNDEFINED;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.interfaceId:undefined] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr041 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testBulkTransferParamErr042
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2020
     * @tc.desc   Negative test: endpoint interfaceId is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransferParamErr042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testBulkTransferParamErr042 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpEndpoints = devices.configs[0].interfaces[0].endpoints[0];
            let buffer =  new Uint8Array(128);
            tmpEndpoints.interfaceId = PARAM_NULLSTRING;
            let ret = usbManager.bulkTransfer(gPipe, tmpEndpoints, buffer);
            console.info(TAG, 'usb [endpoint.interfaceId:""] bulkTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testBulkTransferParamErr042 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr001
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2030
     * @tc.desc   Negative test: Param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.usbControlTransfer(PARAM_NULL);
            console.info(TAG, 'usb [param:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr001 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr002
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2040
     * @tc.desc   Negative test: Param is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.usbControlTransfer(PARAM_UNDEFINED);
            console.info(TAG, 'usb [param:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr002 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr003
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2050
     * @tc.desc   Negative test: Param is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let ret = usbManager.usbControlTransfer(PARAM_NULLSTRING);
            console.info(TAG, 'usb [param:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr003 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr004
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2060
     * @tc.desc   Negative test: pipe is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(PARAM_NULL, requestparam, timeout);
            console.info(TAG, 'usb [pipe:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr004 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr005
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2070
     * @tc.desc   Negative test: pipe is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(PARAM_UNDEFINED, requestparam, timeout);
            console.info(TAG, 'usb [pipe:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr005 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr006
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2080
     * @tc.desc   Negative test: pipe is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(PARAM_NULLSTRING, requestparam, timeout);
            console.info(TAG, 'usb [pipe:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr006 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr007
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2090
     * @tc.desc   Negative test: requestparam is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, PARAM_NULL, timeout);
            console.info(TAG, 'usb [requestparam:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr007 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr008
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2110
     * @tc.desc   Negative test: requestparam is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, PARAM_UNDEFINED, timeout);
            console.info(TAG, 'usb [requestparam:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr008 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr009
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2120
     * @tc.desc   Negative test: requestparam is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, PARAM_NULLSTRING, timeout);
            console.info(TAG, 'usb [requestparam:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr009 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr010
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2130
     * @tc.desc   Negative test: pipe busNum is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULL;
            gPipe.devAddress = devices.devAddress;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, requestparam, timeout);
            console.info(TAG, 'usb [busNum:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr010 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr011
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2140
     * @tc.desc   Negative test: pipe busNum is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_UNDEFINED;
            gPipe.devAddress = devices.devAddress;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, requestparam, timeout);
            console.info(TAG, 'usb [busNum:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr011 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr012
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2150
     * @tc.desc   Negative test: pipe busNum is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = PARAM_NULLSTRING;
            gPipe.devAddress = devices.devAddress;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, requestparam, timeout);
            console.info(TAG, 'usb [busNum:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr012 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr013
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2160
     * @tc.desc   Negative test: pipe devAddress is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULL;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, requestparam, timeout);
            console.info(TAG, 'usb [devAddress:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr013 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr014
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2170
     * @tc.desc   Negative test: pipe devAddress is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_UNDEFINED;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, requestparam, timeout);
            console.info(TAG, 'usb [devAddress:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr014 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr015
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2180
     * @tc.desc   Negative test: pipe devAddress is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = PARAM_NULLSTRING;
            let timeout = 5000;
            let ret = usbManager.usbControlTransfer(gPipe, requestparam, timeout);
            console.info(TAG, 'usb [devAddress:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr015 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr016
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2190
     * @tc.desc   Negative test: requestparam bmRequestType is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(PARAM_NULL, 0x06, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.bmRequestType:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr016 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr017
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2210
     * @tc.desc   Negative test: requestparam bmRequestType is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(PARAM_UNDEFINED, 0x06, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.bmRequestType:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr017 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr018
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2220
     * @tc.desc   Negative test: requestparam bmRequestType is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(PARAM_NULLSTRING, 0x06, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.bmRequestType:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr018 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr019
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2230
     * @tc.desc   Negative test: requestparam bRequest is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, PARAM_NULL, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.bRequest:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr019 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr020
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2240
     * @tc.desc   Negative test: requestparam bRequest is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, PARAM_UNDEFINED, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.bRequest:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr020 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr021
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2250
     * @tc.desc   Negative test: requestparam bRequest is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, PARAM_NULLSTRING, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.bRequest:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr021 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr022
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2260
     * @tc.desc   Negative test: requestparam wValue is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, PARAM_NULL, 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wValue:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr022 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr023
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2270
     * @tc.desc   Negative test: requestparam wValue is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr023 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, PARAM_UNDEFINED, 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wValue:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr023 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr024
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2280
     * @tc.desc   Negative test: requestparam wValue is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr024 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, PARAM_NULLSTRING, 0, 18);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wValue:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr024 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr025
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2290
     * @tc.desc   Negative test: requestparam wIndex is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr025 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), PARAM_NULL, 0);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wIndex:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr025 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr026
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2310
     * @tc.desc   Negative test: requestparam wIndex is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr026 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), PARAM_UNDEFINED, 0);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wIndex:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr026 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr027
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2320
     * @tc.desc   Negative test: requestparam wIndex is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr027 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), PARAM_NULLSTRING, 0);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wIndex:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr027 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr028
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2330
     * @tc.desc   Negative test: requestparam wLength is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr028 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), 0, PARAM_NULL);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wLength:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr028 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr029
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2340
     * @tc.desc   Negative test: requestparam wLength is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr029 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), 0, PARAM_UNDEFINED);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wLength:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr029 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr030
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2350
     * @tc.desc   Negative test: requestparam wLength is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr030 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), 0, PARAM_NULLSTRING);
            let timeout = 5000;

            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.wLength:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr030 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr031
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2360
     * @tc.desc   Negative test: requestparam data is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr031 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            tmpRequestparam.data = PARAM_NULL;
            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.data:null] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr031 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr032
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2370
     * @tc.desc   Negative test: requestparam data is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr032 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            tmpRequestparam.data = PARAM_UNDEFINED;
            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.data:undefined] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr032 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

    /**
     * @tc.name   testUsbControlTransferParamErr033
     * @tc.number SUB_USB_HostManager_JS_ParamErr_2380
     * @tc.desc   Negative test: requestparam data is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferParamErr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
        console.info(TAG, 'usb testUsbControlTransferParamErr033 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }
        try {
            gPipe.busNum = devices.busNum;
            gPipe.devAddress = devices.devAddress;
            let tmpRequestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), 0, 18);
            let timeout = 5000;

            tmpRequestparam.data = PARAM_NULLSTRING;
            let ret = usbManager.usbControlTransfer(gPipe, tmpRequestparam, timeout);
            console.info(TAG, 'usb [requestparam.data:""] usbControlTransfer ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testUsbControlTransferParamErr033 catch err code: ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(401);
        }
    })

})
}
