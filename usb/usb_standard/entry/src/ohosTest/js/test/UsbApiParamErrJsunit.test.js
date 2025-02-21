/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


export default function UsbApiParamErrJsunitTest() {
describe('UsbApiParamErrJsunitTest', function () {

    const TAG = "[UsbApiParamErrJsunitTest]";
    const PARAM_NULL = null;
    const PARAM_UNDEFINED = undefined;
    const PARAM_NULLSTRING = "";
    const PARAM_NUMBERTYPE = 123;
    const PARAM_ERRCODE = 401;
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
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_8500
     * @tc.name     : testClaimInterfaceParamErr001
     * @tc.desc     : Negative test: Param is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr001', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_8600
     * @tc.name     : testClaimInterfaceParamErr002
     * @tc.desc     : Negative test: Param is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr002', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_8700
     * @tc.name     : testClaimInterfaceParamErr003
     * @tc.desc     : Negative test: Param is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr003', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_8800
     * @tc.name     : testClaimInterfaceParamErr004
     * @tc.desc     : Negative test: pipe busNum is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr004', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_8900
     * @tc.name     : testClaimInterfaceParamErr005
     * @tc.desc     : Negative test: pipe busNum is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr005', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9000
     * @tc.name     : testClaimInterfaceParamErr006
     * @tc.desc     : Negative test: pipe busNum is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr006', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9100
     * @tc.name     : testClaimInterfaceParamErr007
     * @tc.desc     : Negative test: pipe devAddress is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr007', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9200
     * @tc.name     : testClaimInterfaceParamErr008
     * @tc.desc     : Negative test: pipe devAddress is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr008', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9300
     * @tc.name     : testClaimInterfaceParamErr009
     * @tc.desc     : Negative test: pipe devAddress is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr009', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9400
     * @tc.name     : testClaimInterfaceParamErr010
     * @tc.desc     : Negative test: interfaces id is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr010', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9500
     * @tc.name     : testClaimInterfaceParamErr011
     * @tc.desc     : Negative test: interfaces id is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr011', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9600
     * @tc.name     : testClaimInterfaceParamErr012
     * @tc.desc     : Negative test: interfaces id is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr012', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9700
     * @tc.name     : testClaimInterfaceParamErr013
     * @tc.desc     : Negative test: interfaces protocol is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr013', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9800
     * @tc.name     : testClaimInterfaceParamErr014
     * @tc.desc     : Negative test: interfaces protocol is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr014', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_9900
     * @tc.name     : testClaimInterfaceParamErr015
     * @tc.desc     : Negative test: interfaces protocol is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr015', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0110
     * @tc.name     : testClaimInterfaceParamErr016
     * @tc.desc     : Negative test: interfaces clazz is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr016', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0120
     * @tc.name     : testClaimInterfaceParamErr017
     * @tc.desc     : Negative test: interfaces clazz is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr017', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0130
     * @tc.name     : testClaimInterfaceParamErr018
     * @tc.desc     : Negative test: interfaces clazz is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr018', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0140
     * @tc.name     : testClaimInterfaceParamErr019
     * @tc.desc     : Negative test: interfaces name is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr019', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0150
     * @tc.name     : testClaimInterfaceParamErr020
     * @tc.desc     : Negative test: interfaces name is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr020', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0160
     * @tc.name     : testClaimInterfaceParamErr021
     * @tc.desc     : Negative test: interfaces name is number
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr021', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0170
     * @tc.name     : testClaimInterfaceParamErr022
     * @tc.desc     : Negative test: interfaces subClass is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr022', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0180
     * @tc.name     : testClaimInterfaceParamErr023
     * @tc.desc     : Negative test: interfaces subClass is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr023', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0190
     * @tc.name     : testClaimInterfaceParamErr024
     * @tc.desc     : Negative test: interfaces subClass is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr024', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0210
     * @tc.name     : testClaimInterfaceParamErr025
     * @tc.desc     : Negative test: interfaces alternateSetting is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr025', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0220
     * @tc.name     : testClaimInterfaceParamErr026
     * @tc.desc     : Negative test: interfaces alternateSetting is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr026', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0230
     * @tc.name     : testClaimInterfaceParamErr027
     * @tc.desc     : Negative test: interfaces alternateSetting is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr027', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0240
     * @tc.name     : testClaimInterfaceParamErr028
     * @tc.desc     : Negative test: interfaces endpoints is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr028', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0250
     * @tc.name     : testClaimInterfaceParamErr029
     * @tc.desc     : Negative test: interfaces endpoints is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr029', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0260
     * @tc.name     : testClaimInterfaceParamErr030
     * @tc.desc     : Negative test: interfaces endpoints is null string ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr030', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0280
     * @tc.name     : testClaimInterfaceParamErr032
     * @tc.desc     : Negative test: iface is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr032', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0290
     * @tc.name     : testClaimInterfaceParamErr033
     * @tc.desc     : Negative test: iface is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr033', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0310
     * @tc.name     : testClaimInterfaceParamErr034
     * @tc.desc     : Negative test: iface is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr034', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0320
     * @tc.name     : testClaimInterfaceParamErr035
     * @tc.desc     : Negative test: pipe is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr035', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0330
     * @tc.name     : testClaimInterfaceParamErr036
     * @tc.desc     : Negative test: pipe is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr036', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0340
     * @tc.name     : testClaimInterfaceParamErr037
     * @tc.desc     : Negative test: pipe is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClaimInterfaceParamErr037', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_0350
     * @tc.name     : testClaimInterfaceParamErr038
     * @tc.desc     : Negative test: force is null string
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
     it('testClaimInterfaceParamErr038', 0, function () {
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
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_1990
     * @tc.name     : testBulkTransferParamErr040
     * @tc.desc     : Negative test: endpoint interfaceId is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferParamErr040', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2010
     * @tc.name     : testBulkTransferParamErr041
     * @tc.desc     : Negative test: endpoint interfaceId is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferParamErr041', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2020
     * @tc.name     : testBulkTransferParamErr042
     * @tc.desc     : Negative test: endpoint interfaceId is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferParamErr042', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2030
     * @tc.name     : testUsbControlTransferParamErr001
     * @tc.desc     : Negative test: Param is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr001', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2040
     * @tc.name     : testUsbControlTransferParamErr002
     * @tc.desc     : Negative test: Param is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr002', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2050
     * @tc.name     : testUsbControlTransferParamErr003
     * @tc.desc     : Negative test: Param is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr003', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2060
     * @tc.name     : testUsbControlTransferParamErr004
     * @tc.desc     : Negative test: pipe is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr004', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2070
     * @tc.name     : testUsbControlTransferParamErr005
     * @tc.desc     : Negative test: pipe is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr005', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2080
     * @tc.name     : testUsbControlTransferParamErr006
     * @tc.desc     : Negative test: pipe is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr006', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2090
     * @tc.name     : testUsbControlTransferParamErr007
     * @tc.desc     : Negative test: requestparam is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr007', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2110
     * @tc.name     : testUsbControlTransferParamErr008
     * @tc.desc     : Negative test: requestparam is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr008', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2120
     * @tc.name     : testUsbControlTransferParamErr009
     * @tc.desc     : Negative test: requestparam is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr009', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2130
     * @tc.name     : testUsbControlTransferParamErr010
     * @tc.desc     : Negative test: pipe busNum is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr010', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2140
     * @tc.name     : testUsbControlTransferParamErr011
     * @tc.desc     : Negative test: pipe busNum is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr011', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2150
     * @tc.name     : testUsbControlTransferParamErr012
     * @tc.desc     : Negative test: pipe busNum is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr012', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2160
     * @tc.name     : testUsbControlTransferParamErr013
     * @tc.desc     : Negative test: pipe devAddress is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr013', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2170
     * @tc.name     : testUsbControlTransferParamErr014
     * @tc.desc     : Negative test: pipe devAddress is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr014', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2180
     * @tc.name     : testUsbControlTransferParamErr015
     * @tc.desc     : Negative test: pipe devAddress is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr015', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2190
     * @tc.name     : testUsbControlTransferParamErr016
     * @tc.desc     : Negative test: requestparam bmRequestType is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr016', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2210
     * @tc.name     : testUsbControlTransferParamErr017
     * @tc.desc     : Negative test: requestparam bmRequestType is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr017', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2220
     * @tc.name     : testUsbControlTransferParamErr018
     * @tc.desc     : Negative test: requestparam bmRequestType is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr018', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2230
     * @tc.name     : testUsbControlTransferParamErr019
     * @tc.desc     : Negative test: requestparam bRequest is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr019', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2240
     * @tc.name     : testUsbControlTransferParamErr020
     * @tc.desc     : Negative test: requestparam bRequest is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr020', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2250
     * @tc.name     : testUsbControlTransferParamErr021
     * @tc.desc     : Negative test: requestparam bRequest is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr021', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2260
     * @tc.name     : testUsbControlTransferParamErr022
     * @tc.desc     : Negative test: requestparam wValue is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr022', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2270
     * @tc.name     : testUsbControlTransferParamErr023
     * @tc.desc     : Negative test: requestparam wValue is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr023', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2280
     * @tc.name     : testUsbControlTransferParamErr024
     * @tc.desc     : Negative test: requestparam wValue is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr024', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2290
     * @tc.name     : testUsbControlTransferParamErr025
     * @tc.desc     : Negative test: requestparam wIndex is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr025', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2310
     * @tc.name     : testUsbControlTransferParamErr026
     * @tc.desc     : Negative test: requestparam wIndex is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr026', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2320
     * @tc.name     : testUsbControlTransferParamErr027
     * @tc.desc     : Negative test: requestparam wIndex is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr027', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2330
     * @tc.name     : testUsbControlTransferParamErr028
     * @tc.desc     : Negative test: requestparam wLength is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr028', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2340
     * @tc.name     : testUsbControlTransferParamErr029
     * @tc.desc     : Negative test: requestparam wLength is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr029', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2350
     * @tc.name     : testUsbControlTransferParamErr030
     * @tc.desc     : Negative test: requestparam wLength is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr030', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2360
     * @tc.name     : testUsbControlTransferParamErr031
     * @tc.desc     : Negative test: requestparam data is null
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr031', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2370
     * @tc.name     : testUsbControlTransferParamErr032
     * @tc.desc     : Negative test: requestparam data is undefined
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr032', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_ParamErr_2380
     * @tc.name     : testUsbControlTransferParamErr033
     * @tc.desc     : Negative test: requestparam data is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testUsbControlTransferParamErr033', 0, function () {
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
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
    })

})
}
