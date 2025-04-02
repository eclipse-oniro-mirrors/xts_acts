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

import usbMan from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';


export default function UsbAccessoryJsTest() {
describe("UsbAccessoryJsTest", function () {

    const TAG = '[UsbAccessoryJsTest]';
    const SERVICE_EXCEPTION_CODE = 14400005;
    const ACCESSORY_NOT_REOPEN = 14401003;
    const COMMON_SERVICE_EXCEPTION = 14400004;
    const COMMON_HAS_NO_RIGHT = 14400001;
    const ACCESSORY_TARGET_NOT_MATCHED = 14401001;
    const PARAM_TYPE_ERROR = 401;

    let accList;
    let isDevAccessoryFunc;

    function devAccessoryFunc() {
        if (accList.length > 0) {
            console.info(TAG, "This USB device is accessory function");
            return true;
        }
        console.info(TAG, "This USB device is accessory function");
        return false;
    }

    beforeAll(function() {
        console.info(TAG, 'beforeAll called');
        try {
            accList = usbMan.getAccessoryList();
            console.info(TAG, 'beforeAll ret : ', JSON.stringify(accList));
        } catch (err) {
            console.info(TAG, 'beforeAll err : ', err);
        }
        isDevAccessoryFunc = devAccessoryFunc();
    })

    afterAll(function() {
        console.info(TAG, 'afterAll called');
    })

    beforeEach(function() {
        console.info(TAG, 'beforeEach called');
    })

    afterEach(function() {
        console.info(TAG, 'afterEach called');
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
            return
        }
    }
    
    async function getAccPermission() {
        console.info('**************getAccPermission**************');
        try {
            usbMan.requestAccessoryRight(accList[0]).then(hasAccRight => {
                console.info(TAG, `usb requestAccessoryRight success, hasAccRight: ${hasAccRight}`);
            })
        } catch (err) {
            console.info(TAG, `usb getPermission to requestAccessoryRight hasAccRight fail: `, err);
            return
        }
    }
    
    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0100
     * @tc.name       : testGetAccessoryList001
     * @tc.desc       : erify getAccessoryList result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testGetAccessoryList001", 0, () => {
        console.info(TAG, '----------------------testGetAccessoryList001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            accList = usbMan.getAccessoryList();
            console.info(TAG, 'testGetAccessoryList001 ret : ', JSON.stringify(accList));
            expect(accList != null).assertEqual(true);
            expect(accList.length == 1).assertEqual(true);
            expect(typeof(accList[0].manufacturer)).assertEqual('string');
            expect(typeof(accList[0].product)).assertEqual('string');
            expect(typeof(accList[0].description)).assertEqual('string');
            expect(typeof(accList[0].version)).assertEqual('string');
            expect(typeof(accList[0].serialNumber)).assertEqual('string');
        } catch (err) {
            console.info(TAG, 'testGetAccessoryList001 err : ', err);
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0200
     * @tc.name       : testRequestAccessoryRight001
     * @tc.desc       : verify requestAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testRequestAccessoryRight001", 0, async () => {
        console.info(TAG, '----------------------testRequestAccessoryRight001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            await usbMan.requestAccessoryRight(access).then(data => {
                console.info(TAG, 'testRequestAccessoryRight001 ret : ', JSON.stringify(data));
                expect(data !== null).assertFalse();
            });
        } catch (err) {
            console.info(TAG, 'testRequestAccessoryRight001 err : ', err);
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0300
     * @tc.name       : testRequestAccessoryRight002
     * @tc.desc       : verify requestAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testRequestAccessoryRight002", 0, async () => {
        console.info(TAG, '----------------------testRequestAccessoryRight002---------------------------');
        try {
            await usbMan.requestAccessoryRight(accList[0]).then(data => {
                console.info(TAG, 'testRequestAccessoryRight002 ret : ', JSON.stringify(data));
                expect(data).assertTrue();
            });
            await driveFn();
            CheckEmptyUtils.sleep(1000);
            usbMan.cancelAccessoryRight(accList[0]);
        } catch (err) {
            console.info(TAG, 'testRequestAccessoryRight002 err : ', err);
            expect(isDevAccessoryFunc).assertFalse();
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
            } else {
                expect(err.code).assertEqual(ACCESSORY_TARGET_NOT_MATCHED);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0400
     * @tc.name       : testHasAccessoryRight001
     * @tc.desc       : erify hasAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testHasAccessoryRight001", 0, () => {
        console.info(TAG, '----------------------testHasAccessoryRight001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = { manufacturer: "accessoryTest" };
            let ret = usbMan.hasAccessoryRight(access);
            console.info(TAG, 'testHasAccessoryRight001 ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasAccessoryRight001 err : ', err);
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0500
     * @tc.name       : testHasAccessoryRight002
     * @tc.desc       : verify hasAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testHasAccessoryRight002", 0, () => {
        console.info(TAG, '----------------------testHasAccessoryRight002---------------------------');
        try {
            let ret = usbMan.hasAccessoryRight(accList[0]);
            console.info(TAG, 'testHasAccessoryRight002 ret : ', ret);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasAccessoryRight002 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
            } else {
                expect(err.code).assertEqual(ACCESSORY_TARGET_NOT_MATCHED);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0600
     * @tc.name       : testHasAccessoryRight003
     * @tc.desc       : verify hasAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testHasAccessoryRight003", 0, async () => {
        console.info(TAG, '----------------------testHasAccessoryRight003---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            let ret = usbMan.hasAccessoryRight(accList[0]);
            console.info(TAG, 'testHasAccessoryRight003 ret : ', ret);
            expect(ret).assertTrue();
            usbMan.cancelAccessoryRight(accList[0]);
            ret = usbMan.hasAccessoryRight(accList[0]);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasAccessoryRight003 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
            } else {
                expect(err.code).assertEqual(ACCESSORY_TARGET_NOT_MATCHED);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0700
     * @tc.name       : testCancelAccessoryRight001
     * @tc.desc       : verify cancelAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testCancelAccessoryRight001", 0, () => {
        console.info(TAG, '----------------------testCancelAccessoryRight001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            usbMan.cancelAccessoryRight(access);
            let ret = usbMan.hasAccessoryRight(access);
            console.info(TAG, 'testCancelAccessoryRight001 ret : ', ret);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testCancelAccessoryRight001 err : ', err);
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0800
     * @tc.name       : testCancelAccessoryRight002
     * @tc.desc       : verify cancelAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testCancelAccessoryRight002", 0, async () => {
        console.info(TAG, '----------------------testCancelAccessoryRight002---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            usbMan.cancelAccessoryRight(accList[0]);
            let ret = usbMan.hasAccessoryRight(access);
            console.info(TAG, 'testCancelAccessoryRight002 ret : ', ret);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testCancelAccessoryRight002 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
            } else {
                expect(err.code).assertEqual(ACCESSORY_TARGET_NOT_MATCHED);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0900
     * @tc.name       : testOpenAccessory001
     * @tc.desc       : verify openAccessory no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testOpenAccessory001", 0, () => {
        console.info(TAG, '----------------------testOpenAccessory001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            let ret = usbMan.openAccessory(access);
            console.info(TAG, 'testOpenAccessory001 ret : ', ret);
            expect(ret !== nul).assertFalse();
        } catch (err) {
            console.info(TAG, 'testOpenAccessory001 err : ', err);
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1000
     * @tc.name       : testOpenAccessory002
     * @tc.desc       : verify openAccessory result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testOpenAccessory002", 0, async (done) => {
        console.info(TAG, '----------------------testOpenAccessory002---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            let accHandle = usbMan.openAccessory(accList[0]);
            console.info(TAG, 'testOpenAccessory002 ret : ', accHandle);
            expect(accHandle !== null).assertTrue();
            let accFd = accHandle.accessoryFd;
            expect(accFd > 0).assertTrue();
        } catch (err) {
            console.info(TAG, 'testOpenAccessory002 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
                done();
            } else {
                expect(err.code).assertEqual(ACCESSORY_TARGET_NOT_MATCHED);
                done();
            }
        }
        usbMan.closeAccessory(accList[0]);
        usbMan.cancelAccessoryRight(accList[0]);
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1100
     * @tc.name       : testOpenAccessory003
     * @tc.desc       : verify openAccessory reopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testOpenAccessory003", 0, async (done) => {
        console.info(TAG, '----------------------testOpenAccessory003---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            let acchandle = usbMan.openAccessory(accList[0]);
            console.info(TAG, 'testOpenAccessory003 acchandle : ', acchandle);
            expect(acchandle !== null).assertTrue();
            acchandle = usbMan.openAccessory(accList[0]);
            expect(acchandle !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testOpenAccessory003 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
                done();
            } else {
                console.info(TAG, 'testOpenAccessory003 reopen err : ', err);
                expect(err.code).assertEqual(ACCESSORY_NOT_REOPEN);
                done();
            }    
        }
        usbMan.closeAccessory(accList[0]);
        usbMan.cancelAccessoryRight(accList[0]);
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1200
     * @tc.name       : testOpenAccessory004
     * @tc.desc       : verify openAccessory no permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testOpenAccessory004", 0, () => {
        console.info(TAG, '----------------------testOpenAccessory004---------------------------');
        try {
            let acchandle = usbMan.openAccessory(accList[0]);
            expect(acchandle !== null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testOpenAccessory004 reopen err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
            } else {
                expect(err.code).assertEqual(COMMON_HAS_NO_RIGHT);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1300
     * @tc.name       : testCloseccessory001
     * @tc.desc       : verify closeAccessory result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testCloseccessory001", 0, async (done) => {
        console.info(TAG, '----------------------testCloseccessory001---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        let acchandle;
        try {
            acchandle = usbMan.openAccessory(accList[0]);
            expect(acchandle !== null).assertTrue();
            usbMan.closeAccessory(acchandle);
        } catch (err) {
            console.info(TAG, 'testCloseccessory001 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
                done();
            } else {
                expect(err.code).assertEqual(ACCESSORY_TARGET_NOT_MATCHED);
                done();
            }
        }
        try {
            usbMan.closeAccessory(acchandle);
        } catch (err) {
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(PARAM_TYPE_ERROR);
                done();
            } else {
                expect(err.code).assertEqual(COMMON_SERVICE_EXCEPTION);
                done();
            }
        }
        usbMan.cancelAccessoryRight(accList[0]);
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1400
     * @tc.name       : testCloseccessory002
     * @tc.desc       : verify openAccessory no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("testCloseccessory002", 0, () => {
        console.info(TAG, '----------------------testCloseccessory002---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        let acchandle = {"accessFd": 0};
        try {
            usbMan.closeAccessory(acchandle);
        } catch (err) {
            console.info(TAG, 'testCloseccessory002 err : ', err);
            expect(err.code).assertEqual(SERVICE_EXCEPTION_CODE);
        }
    })

})
}
