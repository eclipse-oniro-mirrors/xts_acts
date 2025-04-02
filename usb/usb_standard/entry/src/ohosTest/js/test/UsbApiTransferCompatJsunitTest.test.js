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
import EventConstants from './EventConstants.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


export default function UsbApiTransferCompatJsunitTest() {
describe('UsbApiTransferCompatJsunitTest', function () {

    const TAG = "[UsbApiTransferCompatJsunitTest]";
    const PARAM_NULLSTRING = "";
    const PARAM_ERRCODE = 401;
    let gDeviceList;
    let devices;
    let testParam;
    let gPipe;
    let tmpPipe = {
        busNum: null,
        devAddress: null
    };
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
        console.log(TAG, '*************Usb Unit UsbApiTransferCompatJsunitTest Begin*************');
        const Version = usbManager.getVersion();
        console.info(TAG, 'usb unit begin test getversion :' + Version);

        // version > 17  host currentMode = 2 device currentMode = 1
        gDeviceList = usbManager.getDevices();
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
            devices = gDeviceList[0];
            tmpPipe.busNum = devices.busNum;
            tmpPipe.devAddress = devices.devAddress;
            console.info(TAG, 'beforeAll usb unit connectDevice gPipe ret : ' + JSON.stringify(gPipe));
        }
    })

    beforeEach(function () {
        console.info(TAG, 'beforeEach: *************Usb Unit Test CaseEx*************');
        gDeviceList = usbManager.getDevices();
        if (isDeviceConnected) {
            devices = gDeviceList[0];
            console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
            gPipe = usbManager.connectDevice(devices);
            console.info(TAG, 'beforeEach return gPipe : ' + JSON.stringify(gPipe));
            testParam = getTransferTestParam();
            console.info(TAG, 'beforeEach return testParam : ' + JSON.stringify(testParam));
        }
        
    })

    afterEach(function () {
        console.info(TAG, 'afterEach: *************Usb Unit Test CaseEx*************');
        devices = null;
        testParam = null;
        gPipe = null;
        console.info(TAG, 'afterEach return devices : ' + JSON.stringify(devices));
        console.info(TAG, 'afterEach return testParam : ' + JSON.stringify(testParam));
        console.info(TAG, 'afterEach return gPipe : ' + JSON.stringify(gPipe));
    })

    afterAll(function () {
        console.log(TAG, '*************Usb Unit UsbApiTransferCompatJsunitTest End*************');
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

    function findInitPoint(testParam, j) {
        var bfind = false;
        for (var k = 0; k < testParam.config.interfaces[j].endpoints.length; k++) {
            var endpoint = testParam.config.interfaces[j].endpoints[k];
            if (endpoint.type == EventConstants.USB_ENDPOINT_XFER_BULK) {
                bfind = true
                if (endpoint.direction == usbManager.USB_REQUEST_DIR_TO_DEVICE) {
                    testParam.maxOutSize = endpoint.maxPacketSize;
                    testParam.outEndpoint = endpoint;
                } else if (endpoint.direction == usbManager.USB_REQUEST_DIR_FROM_DEVICE) {
                    testParam.maxInSize = endpoint.maxPacketSize;
                    testParam.inEndpoint = endpoint;
                }
            }
        }
        if (bfind) {
            testParam.interface = testParam.config.interfaces[j];
            return bfind;
        }
        return false;
    }
    
    function getFlag(testParam, j) {
        if (testParam.config.interfaces[j].endpoints.length == 0) {
            return false;
        }
    
        if (testParam.config.interfaces[j].clazz != 10 ||
            testParam.config.interfaces[j].subClass != 0 ||
            testParam.config.interfaces[j].protocol != 2) {
            return false;
        }
        return true;
    }
    
    function initPoint(testParam) {
        for (var j = 0; j < testParam.config.interfaces.length; j++) {
            if (getFlag(testParam, j) == true) {
                if (findInitPoint(testParam, j) == true) {
                    break
                }
            }
        }
    }
    
    // Prefabrication transmission related parameters
    function getTransferTestParam() {
        testParam = {
            config: null,
            device: null,
            pip: null,
            inEndpoint: null,
            interface: null,
            outEndpoint: null,
            usbRequest: null,
            sendData: '',
            isClaimed: 0,
            maxInSize: 1024,
            maxOutSize: 1024
        }
    
        console.info(TAG, 'usb case gDeviceList.length: ' + gDeviceList.length);
        for (var i = 0; i < gDeviceList.length; i++) {
            testParam.device = gDeviceList[i];
            testParam.config = testParam.device.configs[0];
            testParam.pip = gPipe;
            initPoint(testParam);
        }
        return testParam;
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

    function toClaimInterface(testCaseName, pip, tInterface) {
        let ret = usbManager.claimInterface(pip, tInterface, true);
        console.info(TAG, `usb ${testCaseName} claimInterface ret: ${ret}`);
        expect(ret).assertEqual(0);
    }

    function toReleaseInterface(testCaseName) {
        gDeviceList = usbManager.getDevices();
        testParam = getTransferTestParam();
        let ret = usbManager.releaseInterface(tmpPipe, testParam.interface);
        console.info(TAG, `usb ${testCaseName} releaseInterface ret: ${ret}`);
        expect(ret).assertEqual(0);
    }

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1000
     * @tc.name     : testBulkTransferCompat001
     * @tc.desc     : Negative test: send data, pipe busNum +1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat001', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat001', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.pip.busNum = testParam.pip.busNum + 1000;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.pip.busNum, '] bulkTransfer send ret: ' + data);
        expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat001 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat001');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1100
     * @tc.name     : testBulkTransferCompat002
     * @tc.desc     : Negative test: send data, pipe devAddress +1000
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat002', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat002 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat002', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.pip.devAddress = testParam.pip.devAddress + 1000;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.pip.devAddress, '] bulkTransfer send ret: ' + data);
            expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat002 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat002');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1200
     * @tc.name     : testBulkTransferCompat003
     * @tc.desc     : Negative test: send data, pipe busNum -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat003', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat003 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat003', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.pip.busNum = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.pip.busNum, '] bulkTransfer send ret: ' + data);
            expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat003 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat003');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1300
     * @tc.name     : testBulkTransferCompat004
     * @tc.desc     : Negative test: send data, pipe devAddress -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat004', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat004 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat004', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.pip.devAddress = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.pip.devAddress, '] bulkTransfer send ret: ' + data);
            expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat004 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat004');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1400
     * @tc.name     : testBulkTransferCompat005
     * @tc.desc     : Negative test: send data, endpoint address +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat005', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat005 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat005', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.address = testParam.outEndpoint.address + 10;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.address, '] bulkTransfer send ret: ' + data);
            expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat005 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat005');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1500
     * @tc.name     : testBulkTransferCompat006
     * @tc.desc     : Negative test: send data, endpoint number +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat006', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat006 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat006', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.number = testParam.outEndpoint.number + 10;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.number, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat006 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat006');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1600
     * @tc.name     : testBulkTransferCompat007
     * @tc.desc     : Negative test: send data, endpoint type +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat007', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat007 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat007', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.type = testParam.outEndpoint.type + 10;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.type, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat007 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat007');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1700
     * @tc.name     : testBulkTransferCompat008
     * @tc.desc     : Negative test: send data, endpoint address -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat008', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat008 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat008', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.address = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.address, '] bulkTransfer send ret: ' + data);
            expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat008 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat008');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1800
     * @tc.name     : testBulkTransferCompat009
     * @tc.desc     : Negative test: send data, endpoint number -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat009', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat009 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat009', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.number = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.number, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat009 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat009');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_1900
     * @tc.name     : testBulkTransferCompat010
     * @tc.desc     : Negative test: send data, endpoint type -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat010', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat010 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat010', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.type = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.type, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat010 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat010');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2000
     * @tc.name     : testBulkTransferCompat011
     * @tc.desc     : Negative test: send data, endpoint attributes +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat011', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat011 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat011', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.attributes = testParam.outEndpoint.attributes + 10;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.attributes, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat011 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat011');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2100
     * @tc.name     : testBulkTransferCompat012
     * @tc.desc     : Negative test: send data, endpoint attributes -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat012', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat012 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat012', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.attributes = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.attributes, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat012 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat012');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2200
     * @tc.name     : testBulkTransferCompat013
     * @tc.desc     : Negative test: send data, endpoint interval +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat013', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat013 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat013', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.interval = testParam.outEndpoint.interval + 10;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.interval, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat013 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat013');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2300
     * @tc.name     : testBulkTransferCompat014
     * @tc.desc     : Negative test: send data, endpoint interval -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat014', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat014 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat014', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.interval = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.interval, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat014 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat014');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2400
     * @tc.name     : testBulkTransferCompat015
     * @tc.desc     : Negative test: send data, endpoint maxPacketSize +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat015', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat015 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat015', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.maxPacketSize = testParam.outEndpoint.maxPacketSize + 10;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.maxPacketSize, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat015 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat015');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2500
     * @tc.name     : testBulkTransferCompat016
     * @tc.desc     : Negative test: send data, endpoint maxPacketSize -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat016', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat016 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat016', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.maxPacketSize = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.maxPacketSize, '] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat016 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat016');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2600
     * @tc.name     : testBulkTransferCompat017
     * @tc.desc     : Negative test: send data, endpoint direction +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat017', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat017 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat017', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.direction = testParam.outEndpoint.direction + 10;
        try {
            await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
                console.info(TAG, 'usb [', testParam.outEndpoint.direction, '] bulkTransfer send ret: ' + data);
                expect(data !== null).assertFalse();
            })
        } catch (err) {
            console.info(TAG, 'usb testBulkTransferCompat017 send error : ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
        toReleaseInterface('testBulkTransferCompat017');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2700
     * @tc.name     : testBulkTransferCompat018
     * @tc.desc     : Negative test: send data, endpoint direction -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat018', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat018 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat018', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.direction = -1;
        try {
            await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
                console.info(TAG, 'usb [', testParam.outEndpoint.direction, '] bulkTransfer send ret: ' + data);
                expect(data !== null).assertFalse();
            })
        } catch (err) {
            console.info(TAG, 'usb testBulkTransferCompat018 send error : ', err.code, ', message: ', err.message);
            expect(err.code).assertEqual(PARAM_ERRCODE);
        }
        toReleaseInterface('testBulkTransferCompat018');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2800
     * @tc.name     : testBulkTransferCompat019
     * @tc.desc     : Negative test: send data, endpoint interfaceId +10
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat019', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat019 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat019', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.interfaceId = testParam.outEndpoint.interfaceId + 10;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.interfaceId, '] bulkTransfer send ret: ' + data);
            expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat019 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat019');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_2900
     * @tc.name     : testBulkTransferCompat020
     * @tc.desc     : Negative test: send data, endpoint interfaceId -1
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat020', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat020 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat020', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        testParam.outEndpoint.interfaceId = -1;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
            console.info(TAG, 'usb [', testParam.outEndpoint.interfaceId, '] bulkTransfer send ret: ' + data);
            expect(data).assertEqual(-1);
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat020 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat020');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_3000
     * @tc.name     : testBulkTransferCompat021
     * @tc.desc     : Negative test: send data, timeout is ""
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat021', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat021 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat021', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        let timeout = PARAM_NULLSTRING;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, timeout).then(data => {
            console.info(TAG, 'usb [timeout:""] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat021 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat021');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_3100
     * @tc.name     : testBulkTransferCompat022
     * @tc.desc     : Negative test: Enter five parameters
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testBulkTransferCompat022', 0, async function () {
        console.info(TAG, 'usb testBulkTransferCompat022 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        toClaimInterface('testBulkTransferCompat022', testParam.pip, testParam.interface);
        testParam.sendData = 'send time 13213213 wzy 03';
        let tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
        let timeout = 5000;
        await usbManager.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, timeout,
                testParam.pip).then(data => {
            console.info(TAG, 'usb [timeout:""] bulkTransfer send ret: ' + data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testBulkTransferCompat022 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
        toReleaseInterface('testBulkTransferCompat022');
    })

    /**
     * @tc.number   : SUB_USB_HostManager_JS_TranCompatibility_3200
     * @tc.name     : testUsbControlTransferCompat001
     * @tc.desc     : Negative test: Enter four parameters
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
     it('testUsbControlTransferCompat001', 0, async function () {
        console.info(TAG, 'usb testUsbControlTransferCompat001 begin');
        if (!isDeviceConnected) {
            expect(isDeviceConnected).assertFalse();
            return
        }

        if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
            expect(testParam.inEndpoint == null).assertFalse();
            expect(testParam.interface == null).assertFalse();
            expect(testParam.outEndpoint == null).assertFalse();
            return
        }

        let requestparam = getControlTransferParam(0x80, 0x60, (0x01 << 8 | 0), 0, 18);
        let timeout = 5000;

        await usbManager.usbControlTransfer(testParam.pip, requestparam, timeout, testParam.pip).then(data => {
            console.info(TAG, 'usb [Enter four parameters] usbControlTransfer data: ' + data);
            console.info(TAG, 'usb [Enter four parameters] usbControlTransfer buffer data: ' + requestparam.data);
            expect(data >= 0).assertTrue();
        }).catch (error => {
            console.info(TAG, 'usb testUsbControlTransferCompat001 send error : ' + JSON.stringify(error));
            expect(error !== null).assertFalse();
        });
    })

})
}