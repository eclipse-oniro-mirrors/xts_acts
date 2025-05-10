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

import usbMgr from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';


export default function UsbAccessoryJsTest() {
describe("UsbAccessoryJsTest", function () {

    const TAG = '[UsbAccessoryJsTest]';

    let accList;
    let isDevAccessoryFunc;
    let isSupport = true;

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
            accList = usbMgr.getAccessoryList();
            console.info(TAG, 'beforeAll ret : ', JSON.stringify(accList));
        } catch (err) {
            console.info(TAG, 'beforeAll err : ', err);
            if (err.code == 801) {
                isSupport = false;
            }
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
            usbMgr.requestAccessoryRight(accList[0]).then(hasAccRight => {
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
     * @tc.desc       : verify getAccessoryList result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testGetAccessoryList001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testGetAccessoryList001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            accList = usbMgr.getAccessoryList();
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
            expect(err.code).assertEqual(14400005);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0200
     * @tc.name       : testRequestAccessoryRight001
     * @tc.desc       : verify requestAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testRequestAccessoryRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG, '----------------------testRequestAccessoryRight001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            await usbMgr.requestAccessoryRight(access).then(data => {
                console.info(TAG, 'testRequestAccessoryRight001 ret : ', JSON.stringify(data));
                expect(data !== null).assertFalse();
            });
        } catch (err) {
            console.info(TAG, 'testRequestAccessoryRight001 err : ', err);
            expect(err.code).assertEqual(14400005);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0300
     * @tc.name       : testRequestAccessoryRight002
     * @tc.desc       : verify requestAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testRequestAccessoryRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG, '----------------------testRequestAccessoryRight002---------------------------');
        try {
            await usbMgr.requestAccessoryRight(accList[0]).then(data => {
                console.info(TAG, 'testRequestAccessoryRight002 ret : ', JSON.stringify(data));
                expect(data).assertTrue();
            });
            await driveFn();
            CheckEmptyUtils.sleep(1000);
            usbMgr.cancelAccessoryRight(accList[0]);
        } catch (err) {
            console.info(TAG, 'testRequestAccessoryRight002 err : ', err);
            expect(isDevAccessoryFunc).assertFalse();
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
            } else {
                expect(err.code).assertEqual(14401001);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0400
     * @tc.name       : testHasAccessoryRight001
     * @tc.desc       : erify hasAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testHasAccessoryRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testHasAccessoryRight001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = { manufacturer: "accessoryTest" };
            let ret = usbMgr.hasAccessoryRight(access);
            console.info(TAG, 'testHasAccessoryRight001 ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasAccessoryRight001 err : ', err);
            expect(err.code).assertEqual(14400005);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0500
     * @tc.name       : testHasAccessoryRight002
     * @tc.desc       : verify hasAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testHasAccessoryRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testHasAccessoryRight002---------------------------');
        try {
            let ret = usbMgr.hasAccessoryRight(accList[0]);
            console.info(TAG, 'testHasAccessoryRight002 ret : ', ret);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasAccessoryRight002 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
            } else {
                expect(err.code).assertEqual(14401001);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0600
     * @tc.name       : testHasAccessoryRight003
     * @tc.desc       : verify hasAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testHasAccessoryRight003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG, '----------------------testHasAccessoryRight003---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            let ret = usbMgr.hasAccessoryRight(accList[0]);
            console.info(TAG, 'testHasAccessoryRight003 ret : ', ret);
            expect(ret).assertTrue();
            usbMgr.cancelAccessoryRight(accList[0]);
            ret = usbMgr.hasAccessoryRight(accList[0]);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasAccessoryRight003 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
            } else {
                expect(err.code).assertEqual(14401001);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0700
     * @tc.name       : testCancelAccessoryRight001
     * @tc.desc       : verify cancelAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testCancelAccessoryRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testCancelAccessoryRight001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            usbMgr.cancelAccessoryRight(access);
            let ret = usbMgr.hasAccessoryRight(access);
            console.info(TAG, 'testCancelAccessoryRight001 ret : ', ret);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testCancelAccessoryRight001 err : ', err);
            expect(err.code).assertEqual(14400005);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0800
     * @tc.name       : testCancelAccessoryRight002
     * @tc.desc       : verify cancelAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testCancelAccessoryRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG, '----------------------testCancelAccessoryRight002---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            usbMgr.cancelAccessoryRight(accList[0]);
            let ret = usbMgr.hasAccessoryRight(access);
            console.info(TAG, 'testCancelAccessoryRight002 ret : ', ret);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testCancelAccessoryRight002 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
            } else {
                expect(err.code).assertEqual(14401001);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_0900
     * @tc.name       : testOpenAccessory001
     * @tc.desc       : verify openAccessory no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testOpenAccessory001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testOpenAccessory001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            let ret = usbMgr.openAccessory(access);
            console.info(TAG, 'testOpenAccessory001 ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testOpenAccessory001 err : ', err);
            expect(err.code).assertEqual(14400005);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1000
     * @tc.name       : testOpenAccessory002
     * @tc.desc       : verify openAccessory result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testOpenAccessory002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
        console.info(TAG, '----------------------testOpenAccessory002---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            let accHandle = usbMgr.openAccessory(accList[0]);
            console.info(TAG, 'testOpenAccessory002 ret : ', accHandle);
            expect(accHandle !== null).assertTrue();
            let accFd = accHandle.accessoryFd;
            expect(accFd > 0).assertTrue();
            usbMgr.closeAccessory(accHandle);
        } catch (err) {
            console.info(TAG, 'testOpenAccessory002 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
                done();
            } else {
                expect(err.code).assertEqual(14401001);
            }
        }
        usbMgr.cancelAccessoryRight(accList[0]);
        done();
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1100
     * @tc.name       : testOpenAccessory003
     * @tc.desc       : verify openAccessory reopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testOpenAccessory003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
        console.info(TAG, '----------------------testOpenAccessory003---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            let accHandle = usbMgr.openAccessory(accList[0]);
            console.info(TAG, 'testOpenAccessory003 accHandle : ', accHandle);
            expect(accHandle !== null).assertTrue();
            accHandle = usbMgr.openAccessory(accList[0]);
            expect(accHandle !== null).assertFalse();
            usbMgr.closeAccessory(accHandle);
        } catch (err) {
            console.info(TAG, 'testOpenAccessory003 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
                done();
            } else {
                console.info(TAG, 'testOpenAccessory003 reopen err : ', err);
                expect(err.code).assertEqual(14401003);
            }
        }
        usbMgr.cancelAccessoryRight(accList[0]);
        done();
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1200
     * @tc.name       : testOpenAccessory004
     * @tc.desc       : verify openAccessory no permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testOpenAccessory004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testOpenAccessory004---------------------------');
        try {
            let acchandle = usbMgr.openAccessory(accList[0]);
            expect(acchandle !== null).assertTrue();
        } catch (err) {
            console.info(TAG, 'testOpenAccessory004 reopen err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
            } else {
                expect(err.code).assertEqual(14400001);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1300
     * @tc.name       : testCloseAccessory001
     * @tc.desc       : verify closeAccessory result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testCloseAccessory001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
        console.info(TAG, '----------------------testCloseAccessory001---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        let acchandle;
        try {
            acchandle = usbMgr.openAccessory(accList[0]);
            expect(acchandle !== null).assertTrue();
            usbMgr.closeAccessory(acchandle);
        } catch (err) {
            console.info(TAG, 'testCloseAccessory001 err : ', err);
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
            } else {
                expect(err.code).assertEqual(14401001);
            }
        }
        try {
            usbMgr.closeAccessory(acchandle);
        } catch (err) {
            if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
                done();
            } else {
                expect(err.code).assertEqual(14400004);
            }
        }
        usbMgr.cancelAccessoryRight(accList[0]);
        done();
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_Accessory_1400
     * @tc.name       : testCloseAccessory002
     * @tc.desc       : verify openAccessory no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testCloseAccessory002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testCloseAccessory002---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        let acchandle = {"accessFd": 0};
        try {
            usbMgr.closeAccessory(acchandle);
        } catch (err) {
            console.info(TAG, 'testCloseAccessory002 err : ', err);
            expect(err.code).assertEqual(14400005);
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_AccessoryErr_0600
     * @tc.name       : testHasAccessoryRight801Err003
     * @tc.desc       : verify HasAccessoryRight result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testHasAccessoryRight801Err003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG, '----------------------testHasAccessoryRight801Err003---------------------------');
        await getAccPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        try {
            let ret = usbMgr.hasAccessoryRight(accList[0]);
            console.info(TAG, 'testHasAccessoryRight801Err003 ret : ', ret);
            expect(ret).assertTrue();
            usbMgr.cancelAccessoryRight(accList[0]);
            ret = usbMgr.hasAccessoryRight(accList[0]);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testHasAccessoryRight801Err003 err : ', err);
            if (!isSupport) {
                expect(err.code).assertEqual(801);
            } else if (!isDevAccessoryFunc) {
                expect(err.code).assertEqual(401);
            } else {
                expect(err.code).assertEqual(14401001);
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_AccessoryErr_0200
     * @tc.name       : testRequestAccessoryRight801Err001
     * @tc.desc       : verify requestAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testRequestAccessoryRight801Err001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG, '----------------------testRequestAccessoryRight001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            await usbMgr.requestAccessoryRight(access).then(data => {
                console.info(TAG, 'testRequestAccessoryRight801Err001 ret : ', JSON.stringify(data));
                expect(data !== null).assertFalse();
            });
        } catch (err) {
            console.info(TAG, 'testRequestAccessoryRight801Err001 err : ', err);
            if(err){
            expect(err.code).assertEqual(14400005);
            }else{
            expect(err.code).assertEqual(801);            
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_AccessoryErr_0700
     * @tc.name       : testCancelAccessoryRight801Err001
     * @tc.desc       : verify cancelAccessoryRight no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testCancelAccessoryRight801Err001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testCancelAccessoryRight801Err001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            usbMgr.cancelAccessoryRight(access);
            let ret = usbMgr.hasAccessoryRight(access);
            console.info(TAG, 'testCancelAccessoryRight801Err001 ret : ', ret);
            expect(ret).assertFalse();
        } catch (err) {
            console.info(TAG, 'testCancelAccessoryRight801Err001 err : ', err);
            if(err){
                expect(err.code).assertEqual(14400005);
            }else{
                expect(err.code).assertEqual(801);  
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_AccessoryErr_0100
     * @tc.name       : testGetAccessoryList801Err001
     * @tc.desc       : verify getAccessoryList result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testGetAccessoryList801Err001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testGetAccessoryList801Err001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            accList = usbMgr.getAccessoryList();
            console.info(TAG, 'testGetAccessoryList801Err001 ret : ', JSON.stringify(accList));
            expect(accList != null).assertEqual(true);
            expect(accList.length == 1).assertEqual(true);
            expect(typeof(accList[0].manufacturer)).assertEqual('string');
            expect(typeof(accList[0].product)).assertEqual('string');
            expect(typeof(accList[0].description)).assertEqual('string');
            expect(typeof(accList[0].version)).assertEqual('string');
            expect(typeof(accList[0].serialNumber)).assertEqual('string');
        } catch (err) {
            console.info(TAG, 'testGetAccessoryList801Err001 err : ', err);
            if(err){
                expect(err.code).assertEqual(14400005);
            }else{
                expect(err.code).assertEqual(801);  
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_AccessoryErr_0900
     * @tc.name       : testOpenAccessory001
     * @tc.desc       : verify openAccessory no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testOpenAccessory801Err001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testOpenAccessory801Err001---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        try {
            let access = {"manufacturer": "accessoryTest"};
            let ret = usbMgr.openAccessory(access);
            console.info(TAG, 'testOpenAccessory801Err001 ret : ', ret);
            expect(ret !== null).assertFalse();
        } catch (err) {
            console.info(TAG, 'testOpenAccessory801Err001 err : ', err);
            if(err){
                expect(err.code).assertEqual(14400005);
            }else{
                expect(err.code).assertEqual(801);  
            }
        }
    })

    /**
     * @tc.number     : SUB_USB_DeviceManager_JS_AccessoryErr_1400
     * @tc.name       : testCloseAccessory801Err002
     * @tc.desc       : verify openAccessory no param result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testCloseAccessory801Err002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info(TAG, '----------------------testCloseAccessory801Err002---------------------------');
        if (!isDevAccessoryFunc) {
            expect(isDevAccessoryFunc).assertFalse();
            return
        }
        let acchandle = {"accessFd": 0};
        try {
            usbMgr.closeAccessory(acchandle);
        } catch (err) {
            console.info(TAG, 'testCloseAccessory801Err002 err : ', err);
            if(err){
                expect(err.code).assertEqual(14400005);
            }else{
                expect(err.code).assertEqual(801);  
            }
        }
    })
})
}
