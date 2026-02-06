/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


const TAG = '[UsbAccessoryEtsTest]';

let accList: Array<usbMgr.USBAccessory>;
let accessInfo: usbMgr.USBAccessory;
let isDevAccessoryFunc: boolean;
let accessInfoTest: usbMgr.USBAccessory = {
  manufacturer: 'manufacturer',
  product: 'product',
  description: 'description',
  version: 'version',
  serialNumber: 'serialNumber'
}

function devAccessoryFunc() {
  if (accList.length > 0) {
    console.info(TAG, "This USB device is accessory function");
    return true;
  }
  console.info(TAG, "This USB device is accessory function");
  return false;
}

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

async function driveFalse() {
  console.info('**************driveFalse**************');
  try {
    let driver = await UiDriver.create();
    console.info(TAG, ` come in driveFalse`);
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    CheckEmptyUtils.sleep(1000);
    let button = await driver.findComponent(BY.text('不允许'));
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
    usbMgr.requestAccessoryRight(accessInfo).then(hasAccRight => {
      console.info(TAG, `usb requestAccessoryRight success, hasAccRight: ${hasAccRight}`);
    })
  } catch (err) {
    console.info(TAG, `usb getPermission to requestAccessoryRight hasAccRight fail: `, err);
    return
  }
}

export default function UsbAccessoryEtsTest() {
  describe("UsbAccessoryEtsTest", () => {

    beforeAll(() => {
      console.info(TAG, 'beforeAll called');
      try {
        accList = usbMgr.getAccessoryList();
        accessInfo = accList[0];
        console.info(TAG, 'beforeAll ret : ', JSON.stringify(accList));
      } catch (err) {
        console.info(TAG, 'beforeAll err : ', err);
      }
      isDevAccessoryFunc = devAccessoryFunc();
    })

    afterAll(() => {
      console.info(TAG, 'afterAll called');
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach called');
    })

    afterEach(() => {
      console.info(TAG, 'afterEach called');
    })

    /**
     * @tc.name   testGetAccessoryList001
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0100
     * @tc.desc   verify getAccessoryList result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        expect(typeof(accessInfo.manufacturer)).assertEqual('string');
        expect(typeof(accessInfo.product)).assertEqual('string');
        expect(typeof(accessInfo.description)).assertEqual('string');
        expect(typeof(accessInfo.version)).assertEqual('string');
        expect(typeof(accessInfo.serialNumber)).assertEqual('string');
      } catch (err) {
        console.info(TAG, 'testGetAccessoryList001 err : ', err);
        expect(err.code).assertEqual(14400005);
      }
    })

    /**
     * @tc.name   testGetAccessoryList002
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_RetValue_0400
     * @tc.desc   verify getAccessoryList result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testGetAccessoryList002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, '----------------------testGetAccessoryList002---------------------------');
      if (!isDevAccessoryFunc) {
        let res = usbMgr.getAccessoryList();
        console.info(TAG, 'testGetAccessoryList002 ret : ', JSON.stringify(res));
        expect(res.length).assertEqual(0);
        return;
      } else {
        return;
      }
    })

    /**
     * @tc.name   testRequestAccessoryRight001
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0200
     * @tc.desc   verify requestAccessoryRight no param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRequestAccessoryRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, '----------------------testRequestAccessoryRight001---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return
      }
      try {
        await usbMgr.requestAccessoryRight(accessInfoTest).then(data => {
          console.info(TAG, 'testRequestAccessoryRight001 ret : ', JSON.stringify(data));
          expect(data !== null).assertFalse();
        });
      } catch (err) {
        console.info(TAG, 'testRequestAccessoryRight001 err : ', err);
        expect(err.code).assertEqual(14400005);
      }
    })

    /**
     * @tc.name   testRequestAccessoryRight002
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0300
     * @tc.desc   verify requestAccessoryRight result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRequestAccessoryRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, '----------------------testRequestAccessoryRight002---------------------------');
      try {
        await usbMgr.requestAccessoryRight(accessInfo).then(data => {
          console.info(TAG, 'testRequestAccessoryRight002 ret : ', JSON.stringify(data));
          expect(data).assertTrue();
        });
        await driveFn();
        CheckEmptyUtils.sleep(1000);
        usbMgr.cancelAccessoryRight(accessInfo);
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
     * @tc.name   testRequestAccessoryRight003
     * @tc.number SUB_USB_DeviceManager_ReValue_Accessory_0100
     * @tc.desc   verify requestAccessoryRight result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRequestAccessoryRight003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, '----------------------testRequestAccessoryRight003---------------------------');
      try {
        await usbMgr.requestAccessoryRight(accessInfo).then(data => {
          console.info(TAG, 'testRequestAccessoryRight003 ret : ', JSON.stringify(data));
          expect(data).assertFalse();
        });
        await driveFalse();
        CheckEmptyUtils.sleep(1000);
      } catch (err) {
        console.info(TAG, 'testRequestAccessoryRight003 err : ', err);
        if (!isDevAccessoryFunc) {
          expect(err.code).assertEqual(401);
        } else {
          expect(err.code).assertEqual(14401001);
        }
      }
    })

    /**
     * @tc.name   testHasAccessoryRight001
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0400
     * @tc.desc   erify hasAccessoryRight no param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testHasAccessoryRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, '----------------------testHasAccessoryRight001---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return
      }
      try {
        let ret = usbMgr.hasAccessoryRight(accessInfoTest);
        console.info(TAG, 'testHasAccessoryRight001 ret : ', ret);
        expect(ret !== null).assertFalse();
      } catch (err) {
        console.info(TAG, 'testHasAccessoryRight001 err : ', err);
        expect(err.code).assertEqual(14400005);
      }
    })

    /**
     * @tc.name   testHasAccessoryRight002
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0500
     * @tc.desc   verify hasAccessoryRight result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testHasAccessoryRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, '----------------------testHasAccessoryRight002---------------------------');
      try {
        let ret = usbMgr.hasAccessoryRight(accessInfo);
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
     * @tc.name   testHasAccessoryRight003
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0600
     * @tc.desc   verify hasAccessoryRight result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testHasAccessoryRight003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, '----------------------testHasAccessoryRight003---------------------------');
      await getAccPermission();
      CheckEmptyUtils.sleep(1000);
      await driveFn();
      CheckEmptyUtils.sleep(1000);
      try {
        let ret = usbMgr.hasAccessoryRight(accessInfo);
        console.info(TAG, 'testHasAccessoryRight003 ret : ', ret);
        expect(ret).assertTrue();
        usbMgr.cancelAccessoryRight(accessInfo);
        ret = usbMgr.hasAccessoryRight(accessInfo);
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
     * @tc.name   testCancelAccessoryRight001
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0700
     * @tc.desc   verify cancelAccessoryRight no param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCancelAccessoryRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, '----------------------testCancelAccessoryRight001---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return
      }
      try {
        usbMgr.cancelAccessoryRight(accessInfoTest);
        let ret = usbMgr.hasAccessoryRight(accessInfoTest);
        console.info(TAG, 'testCancelAccessoryRight001 ret : ', ret);
        expect(ret).assertFalse();
      } catch (err) {
        console.info(TAG, 'testCancelAccessoryRight001 err : ', err);
        expect(err.code).assertEqual(14400005);
      }
    })

    /**
     * @tc.name   testCancelAccessoryRight002
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0800
     * @tc.desc   verify cancelAccessoryRight result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCancelAccessoryRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG, '----------------------testCancelAccessoryRight002---------------------------');
      await getAccPermission();
      CheckEmptyUtils.sleep(1000);
      await driveFn();
      CheckEmptyUtils.sleep(1000);
      try {
        usbMgr.cancelAccessoryRight(accessInfo);
        let ret = usbMgr.hasAccessoryRight(accessInfoTest);
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
     * @tc.name   testOpenAccessory001
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_0900
     * @tc.desc   verify openAccessory no param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testOpenAccessory001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, '----------------------testOpenAccessory001---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return
      }
      try {
        let ret = usbMgr.openAccessory(accessInfoTest);
        console.info(TAG, 'testOpenAccessory001 ret : ', ret);
        expect(ret !== null).assertFalse();
      } catch (err) {
        console.info(TAG, 'testOpenAccessory001 err : ', err);
        expect(err.code).assertEqual(14400005);
      }
    })

    /**
     * @tc.name   testOpenAccessory002
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_1000
     * @tc.desc   verify openAccessory result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testOpenAccessory002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, '----------------------testOpenAccessory002---------------------------');
      await getAccPermission();
      CheckEmptyUtils.sleep(1000);
      await driveFn();
      CheckEmptyUtils.sleep(1000);
      try {
        let accHandle: usbMgr.USBAccessoryHandle = usbMgr.openAccessory(accessInfo);
        console.info(TAG, 'testOpenAccessory002 ret : ', accHandle);
        expect(accHandle !== null).assertTrue();
        let accFd = accHandle.accessoryFd;
        expect(accFd > 0).assertTrue();
        usbMgr.closeAccessory(accHandle);
        usbMgr.cancelAccessoryRight(accessInfo);
        done();
      } catch (err) {
        console.info(TAG, 'testOpenAccessory002 err : ', err);
        if (!isDevAccessoryFunc) {
          expect(err.code).assertEqual(401);
          done();
        } else {
          expect(err.code).assertEqual(14401001);
          done();
        }
      }
    })

    /**
     * @tc.name   testOpenAccessory003
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_1100
     * @tc.desc   verify openAccessory reopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testOpenAccessory003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, '----------------------testOpenAccessory003---------------------------');
      await getAccPermission();
      CheckEmptyUtils.sleep(1000);
      await driveFn();
      CheckEmptyUtils.sleep(1000);
      try {
        let accHandle = usbMgr.openAccessory(accessInfo);
        console.info(TAG, 'testOpenAccessory003 accHandle : ', accHandle);
        expect(accHandle !== null).assertTrue();
        accHandle = usbMgr.openAccessory(accessInfo);
        expect(accHandle !== null).assertFalse();
        usbMgr.closeAccessory(accHandle);
        usbMgr.cancelAccessoryRight(accessInfo);
        done();
      } catch (err) {
        console.info(TAG, 'testOpenAccessory003 err : ', err);
        if (!isDevAccessoryFunc) {
          expect(err.code).assertEqual(401);
          done();
        } else {
          console.info(TAG, 'testOpenAccessory003 reopen err : ', err);
          expect(err.code).assertEqual(14401003);
          done();
        }
      }
    })

    /**
     * @tc.name   testOpenAccessory004
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_1200
     * @tc.desc   verify openAccessory no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testOpenAccessory004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, '----------------------testOpenAccessory004---------------------------');
      try {
        let accHandle = usbMgr.openAccessory(accessInfo);
        expect(accHandle !== null).assertTrue();
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
     * @tc.name   testCloseAccessory001
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_1300
     * @tc.desc   verify closeAccessory result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCloseAccessory001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, '----------------------testCloseAccessory001---------------------------');
      await getAccPermission();
      CheckEmptyUtils.sleep(1000);
      await driveFn();
      CheckEmptyUtils.sleep(1000);
      let accHandle: usbMgr.USBAccessoryHandle;
      try {
        accHandle = usbMgr.openAccessory(accessInfo);
        expect(accHandle !== null).assertTrue();
        usbMgr.closeAccessory(accHandle);
      } catch (err) {
        console.info(TAG, 'testCloseAccessory001 err : ', err);
        if (!isDevAccessoryFunc) {
          expect(err.code).assertEqual(401);
          done()
        } else {
          expect(err.code).assertEqual(14401001);
          done()
        }
      }
      usbMgr.cancelAccessoryRight(accessInfo);
      done();
    })

    /**
     * @tc.name   testCloseAccessory002
     * @tc.number SUB_USB_DeviceManager_JS_Accessory_1400
     * @tc.desc   verify openAccessory no param result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCloseAccessory002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(TAG, '----------------------testCloseAccessory002---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return
      }
      let accHandle: usbMgr.USBAccessoryHandle = {accessoryFd: 0};
      try {
        usbMgr.closeAccessory(accHandle);
      } catch (err) {
        console.info(TAG, 'testCloseAccessory002 err : ', err);
        expect(err.code).assertEqual(14400005);
      }
    })

  })
}
