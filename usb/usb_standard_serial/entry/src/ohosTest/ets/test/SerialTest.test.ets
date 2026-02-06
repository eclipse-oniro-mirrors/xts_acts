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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { UiDriver, BY } from '@ohos.UiTest';
import { JSON } from '@kit.ArkTS';
import { bundleManager } from "@kit.AbilityKit";
import { buffer } from '@kit.ArkTS';
import serial from '@ohos.usbManager.serial';

const TAG: string = "[SerialTest]";

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

async function getPermission(gPortList: Readonly<serial.SerialPort>[]) {
  console.info('**************getPermission**************');
  try {
    serial.requestSerialRight(gPortList[0].portId).then(hasRight => {
      console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
    });
  } catch (err) {
    console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
    return;
  }
}

async function driveFn() {
  console.info('**************driveFn**************');
  try {
    let driver = await UiDriver.create();
    console.info(TAG, ` come in driveFn`);
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    await sleep(1000);
    let button = await driver.findComponent(BY.text('允许'));
    console.info(TAG, `button is ${JSON.stringify(button)}`);
    await sleep(1000);
    await button.click();
  } catch (err) {
    console.info(TAG, 'err is ' + err);
    return;
  }
}

async function driveDecFn() {
  console.info('**************driveDecFn**************');
  try {
    let driver = await UiDriver.create();
    console.info(TAG, ` come in driveDecFn`);
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    await sleep(1000);
    let button = await driver.findComponent(BY.text('不允许'));
    console.info(TAG, `button is ${JSON.stringify(button)}`);
    await sleep(1000);
    await button.click();
  } catch (err) {
    console.info(TAG, 'err is ' + err);
    return;
  }
}

async function checkDevice() {
  let portList: serial.SerialPort[] = serial.getPortList();
  if (portList && portList.length > 0) {
    console.info(TAG, 'Test serial device detected');
    return true;
  } else {
    console.info(TAG, 'Test no serial device detected');
    return false;
  }
}

export default function SerialTest() {
  describe('SerialTest', () => {
    let openPortId: number = -1;
    beforeAll(async (done: Function) => {
      try {
        let portList: serial.SerialPort[] = serial.getPortList();
        if (portList && portList.length > 0) {
          openPortId = portList[0].portId;
          console.info(TAG, 'openPortId: ', openPortId);
          let hasRight: boolean = serial.hasSerialRight(openPortId);
          if (!hasRight) {
            console.info(TAG, 'beforeEach: requestSerialRight start');
            let futureRes: Promise<boolean> = serial.requestSerialRight(openPortId);
            await driveFn();
            try {
              let hasRight: boolean = await futureRes;
              console.info(TAG, 'getPermission isAgree: ', hasRight);
            } catch (err) {
              console.error(TAG, 'getPermission catch err name: ', err.name, ', message: ', err.message);
            }
          }
        } else {
          done();
        }
      } catch (error) {
        console.info(TAG, 'beforeAll error: ', JSON.stringify(error));
      }
    })
    afterAll(async () => {
      console.info(TAG, 'afterAll');
      if (serial.hasSerialRight(openPortId)){
        serial.close(openPortId);
        serial.cancelSerialRight(openPortId);
      }
    })

    /**
     * @tc.name   testGetPortList001
     * @tc.number SUB_USB_HostMgr_Serial_JS_getPortList_Func_0100
     * @tc.desc   getportlist successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPortList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetPortList001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let portList: serial.SerialPort[] = serial.getPortList();
        console.info(TAG, 'testGetPortList001 portList: ', JSON.stringify(portList));
        if (portList && portList.length > 0) {
          openPortId = portList[0].portId;
          console.info(TAG, 'testGetPortList001 openPortId: ', openPortId);
          let openPortName: string = portList[0].deviceName;
          expect(openPortName !== null && openPortName !== undefined).assertTrue();
        }
        expect(portList.length > 0).assertTrue();
        done();
      } catch (err) {
        expect().assertFail();
        console.error(TAG, 'testGetPortList001 catch err code: ', err.code, ', message: ', err.message);
      }
    })

    /**
     * @tc.name   testGetPortList002
     * @tc.number SUB_USB_HostMgr_Serial_JS_getPortList_RetValue_0300
     * @tc.desc   getportlist is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPortList002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.info(TAG, 'testGetPortList002 start');
        if (await checkDevice() === false) {
          let res: serial.SerialPort[] = serial.getPortList();
          console.info(TAG, 'testGetPortList002 portList: ', JSON.stringify(res));
          expect(res.length).assertEqual(0);
          done();
        } else {
          done();
          return;
        }
    })

    /**
     * @tc.name   testHasSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_JS_hasSerialRight_Func_0100
     * @tc.desc   hasSerialRight successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testHasSerialRight001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let hasRight: boolean = serial.hasSerialRight(openPortId);
        console.info(TAG, 'testHasSerialRight001 hasRight: ', hasRight);
        expect(hasRight).assertTrue();
        done();
      } catch (error) {
        expect().assertFail();
        console.error(TAG, 'testHasSerialRight001 catch err code: ', error.code, ', message: ', error.message);
      }
    })

    /**
     * @tc.name   testHasSerialRight002
     * @tc.number SUB_USB_HostMgr_Serial_JS_hasSerialRight_ErrCode_0100
     * @tc.desc   invalidInput hasSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testHasSerialRight002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = -1;
        let hasRight: boolean = serial.hasSerialRight(invalidInput);
        console.info(TAG, 'testHasSerialRight002 hasRight: ', hasRight);
        expect(hasRight).assertFalse();
      } catch (error) {
        expect(error.code).assertEqual(401);
        console.error(TAG, 'testHasSerialRight002 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })

    /**
     * @tc.name   testHasSerialRight003
     * @tc.number SUB_USB_HostMgr_Serial_JS_hasSerialRight_ErrCode_0200
     * @tc.desc   invalidPort hasSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasSerialRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testHasSerialRight003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidPort: number = 100;
        let hasRight: boolean = serial.hasSerialRight(invalidPort);
        console.info(TAG, 'testHasSerialRight003 hasRight: ', hasRight);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(31400003);
        console.error(TAG, 'testHasSerialRight003 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })

    /**
     * @tc.name   testRequestSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_JS_requestSerialRight_Func_0100
     * @tc.desc   requestSerialRight successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRequestSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testRequestSerialRight001 start, openPortId: ', openPortId);
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.cancelSerialRight(openPortId);
        await sleep(500);
        expect(serial.hasSerialRight(openPortId)).assertFalse();
        console.info(TAG, 'it requestSerialRight start');
        let futureRes: Promise<boolean> = serial.requestSerialRight(openPortId);
        await driveFn();
        try {
          let hasRight: boolean = await futureRes;
          console.info(TAG, 'getPermission isAgree: ', hasRight);
          expect(hasRight).assertTrue();
          done();
        } catch (err) {
          console.error(TAG, 'getPermission catch err name: ', err.name, ', message: ', err.message);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, 'testRequestSerialRight001 catch err code: ', err.code, ', message: ', err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRequestSerialRight002
     * @tc.number SUB_USB_HostMgr_Serial_JS_requestSerialRight_ErrCode_0100
     * @tc.desc   invalidInput requestSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try{
        console.info(TAG, 'testRequestSerialRight002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = -1;
        let futureRes: Promise<boolean> = serial.requestSerialRight(invalidInput);
        await driveFn();
        try {
          let hasRight: boolean = await futureRes;
          console.info(TAG, 'getPermission isAgree: ', hasRight);
          expect(hasRight).assertFalse();
        } catch (err) {
          console.error(TAG, 'getPermission catch err name: ', err.name, ', message: ', err.message);
          expect().assertFail();
        }
      } catch (error) {
        expect(error.code).assertEqual(401);
        console.error(TAG, 'testRequestSerialRight002 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })

    /**
     * @tc.name   testRequestSerialRight003
     * @tc.number SUB_USB_HostMgr_Serial_JS_requestSerialRight_ErrCode_0200
     * @tc.desc   not exist portId requestSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestSerialRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testRequestSerialRight003 start, openPortId: ', openPortId);
        if (await checkDevice() === false) {
          done();
          return;
        }
	      let invalidPort: number = 100;
        await serial.requestSerialRight(invalidPort);
        expect().assertFail();
      } catch (error) {
        expect(error).assertEqual(31400003);
        console.error(TAG, 'testRequestSerialRight003 catch err code: ', error);
        done();
      }
    })

    /**
     * @tc.name   testOpen001
     * @tc.number SUB_USB_HostMgr_Serial_JS_open_Func_0100
     * @tc.desc   open successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.open(openPortId);
        expect().assertEqual(undefined);
        serial.close(openPortId);
        done();
      } catch (error) {
        expect().assertFail();
        console.error(TAG, 'testOpen001 catch err code: ', error.code, ', message: ', error.message);
      }
    })

    /**
     * @tc.name   testOpen002
     * @tc.number SUB_USB_HostMgr_Serial_JS_open_ErrCode_0100
     * @tc.desc   invalidPort open failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = -1;
        serial.open(invalidInput);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testOpen002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testOpen003
     * @tc.number SUB_USB_HostMgr_Serial_JS_open_ErrCode_0200
     * @tc.desc   Repeated open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.open(openPortId);
        serial.open(openPortId);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testOpen003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400004);
        serial.close(openPortId);
        done();
      }
    })

    /**
     * @tc.name   testOpen004
     * @tc.number SUB_USB_HostMgr_Serial_JS_open_ErrCode_0300
     * @tc.desc   not exist port to open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidPort: number = 10;
        serial.open(invalidPort);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testOpen004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testAddSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_JS_addSerialRight_ErrCode_0100
     * @tc.desc   not system app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testAddSerialRight001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        await bundleManager.getBundleInfoForSelf(bundleFlags).then((bundleInfo: bundleManager.BundleInfo) => {
          console.info(TAG, 'getBundleInfoForSelf success Data: ', JSON.stringify(bundleInfo));
          let tokenId: number = bundleInfo.appInfo.accessTokenId;
          console.info(TAG, ' testAddSerialRight001 begin'+ JSON.stringify(tokenId));
          serial.addSerialRight(tokenId, openPortId);
          expect().assertFail();
        });
      } catch (error) {
        console.info(TAG, 'testAddSerialRight001 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testSetAttribute001
     * @tc.number SUB_USB_HostMgr_Serial_JS_setAttribute_Func_0100
     * @tc.desc   setAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAttribute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testSetAttribute001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).dataBits).assertEqual(serial.DataBits.DATABIT_8);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testSetAttribute001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSetAttribute002
     * @tc.number SUB_USB_HostMgr_Serial_JS_setAttribute_ErrCode_0100
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testSetAttribute002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.setAttribute(openPortId, attribute);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testSetAttribute002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testSetAttribute003
     * @tc.number SUB_USB_HostMgr_Serial_JS_setAttribute_ErrCode_0200
     * @tc.desc   invalid PortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testSetAttribute003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        let invalidInput: number = -1;
        serial.setAttribute(invalidInput, attribute);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testSetAttribute003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetAttribute004
     * @tc.number SUB_USB_HostMgr_Serial_JS_setAttribute_ErrCode_0300
     * @tc.desc   not exist PortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testSetAttribute004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        let invalidInput: number = 100;
        serial.setAttribute(invalidInput, attribute);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testSetAttribute004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testGetAttribute001
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_0100
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_2
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_2);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute002
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_ErrCode_0100
     * @tc.desc   not openPortId to getAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAttribute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.getAttribute(openPortId);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testGetAttribute002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testGetAttribute003
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_ErrCode_0200
     * @tc.desc   invalid openPortId to getAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAttribute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = -1;
        serial.getAttribute(invalidInput);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testGetAttribute003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testGetAttribute004
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_ErrCode_0300
     * @tc.desc   not exist portId to getAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAttribute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = 100;
        serial.getAttribute(invalidInput);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testGetAttribute004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testClose001
     * @tc.number SUB_USB_HostMgr_Serial_JS_close_Func_0100
     * @tc.desc   close port successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testClose001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.open(openPortId);
        serial.close(openPortId);
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.setAttribute(openPortId, attribute);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testClose001 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testClose002
     * @tc.number SUB_USB_HostMgr_Serial_JS_close_ErrCode_0100
     * @tc.desc   Repeated close.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testClose002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.open(openPortId);
        serial.close(openPortId);
        serial.close(openPortId);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testClose002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testClose003
     * @tc.number SUB_USB_HostMgr_Serial_JS_close_ErrCode_0200
     * @tc.desc   invalid Port to close.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testClose003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidPort: number = -1;
        serial.open(openPortId);
        serial.close(invalidPort);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testClose003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        serial.close(openPortId);
        done();
      }
    })

    /**
     * @tc.name   testClose004
     * @tc.number SUB_USB_HostMgr_Serial_JS_close_ErrCode_0300
     * @tc.desc   not exist Port to close.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testClose004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidPort: number = 100;
        serial.open(openPortId);
        serial.close(invalidPort);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testClose004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400003);
        serial.close(openPortId);
        done();
      }
    })

    /**
     * @tc.name   testRead001
     * @tc.number SUB_USB_HostMgr_Serial_JS_read_ErrCode_0100
     * @tc.desc   read timeout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testRead001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        await sleep(1000);
        serial.open(openPortId);
        await sleep(1000);
        let readBuffer: Uint8Array = new Uint8Array(8192);
        await serial.read(openPortId, readBuffer, 300);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testRead001 catch err name: ', error);
        expect(error).assertEqual(31400006);
        done();
      }
    })

    /**
     * @tc.name   testReadSync001
     * @tc.number SUB_USB_HostMgr_Serial_JS_readSync_ErrCode_0100
     * @tc.desc   read timeout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testReadSync001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(openPortId, readSyncBuffer, 300);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testReadSync001 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400006);
        serial.close(openPortId);
        done();
      }
    })

    /**
     * @tc.name   testWriteSync001
     * @tc.number SUB_USB_HostMgr_Serial_JS_writeSync_Func_0100
     * @tc.desc   writeSync successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWriteSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testWriteSync001 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        serial.open(openPortId);
        let length: number = serial.writeSync(openPortId, writeSyncBuffer, 500);
        expect(length >= 0).assertTrue();
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testWriteSync001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteSync002
     * @tc.number SUB_USB_HostMgr_Serial_JS_writeSync_ErrCode_0100
     * @tc.desc   not openPortId to writeSync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testWriteSync002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        serial.writeSync(openPortId, writeSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWriteSync002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testWriteSync003
     * @tc.number SUB_USB_HostMgr_Serial_JS_writeSync_ErrCode_0200
     * @tc.desc   invalidPortId to writeSync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testWriteSync003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = -1;
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        serial.writeSync(invalidInput, writeSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWriteSync003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testWriteSync004
     * @tc.number SUB_USB_HostMgr_Serial_JS_writeSync_ErrCode_0300
     * @tc.desc   not exist PortId to writeSync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testWriteSync004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = 100;
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        serial.writeSync(invalidInput, writeSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWriteSync004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testWrite001
     * @tc.number SUB_USB_HostMgr_Serial_JS_write_Func_0100
     * @tc.desc   write successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testWrite001 start');
      if (await checkDevice() === false) {
        done();
        return;
      }
      let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
      serial.open(openPortId);
      serial.write(openPortId, writeBuffer, 500)
        .then((length: number) => {
          expect(length >= 0).assertTrue();
          serial.close(openPortId);
          done();
        })
        .catch((error: Error) => {
          console.error(TAG, 'testWrite001 catch err name: ', error.name, ', message: ', error.message);
          expect().assertFail();
        });
    })

    /**
     * @tc.name   testWrite002
     * @tc.number SUB_USB_HostMgr_Serial_JS_write_ErrCode_0100
     * @tc.desc   invalid PortId to write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try{
        console.info(TAG, 'testWrite002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        let invalidInput: number = -1;
        serial.write(invalidInput, writeBuffer, 500)
          .then((length: number) => {
            expect().assertFail();
          })
      } catch (error) {
        console.error(TAG, 'testWrite002 catch err name: ', error.name, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        done();
      };
    })

    /**
     * @tc.name   testWrite003
     * @tc.number SUB_USB_HostMgr_Serial_JS_write_ErrCode_0200
     * @tc.desc   not openPortId to write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try{
        console.info(TAG, 'testWrite003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        await serial.write(openPortId, writeBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWrite003 catch err name: ', error);
        expect(error).assertEqual(31400005);
        done();
      };
    })

    /**
     * @tc.name   testWrite004
     * @tc.number SUB_USB_HostMgr_Serial_JS_write_ErrCode_0300
     * @tc.desc   not exist PortId to write.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try{
        console.info(TAG, 'testWrite004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidport: number = 100;
        let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer);
        await serial.write(invalidport, writeBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWrite004 catch err name: ', error);
        expect(error).assertEqual(31400003);
        done();
      };
    })

    /**
     * @tc.name   testReadSync002
     * @tc.number SUB_USB_HostMgr_Serial_JS_readSync_Func_0100
     * @tc.desc   readsync successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReadSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      try {
        console.info(TAG, 'testReadSync002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.open(openPortId);
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(openPortId, readSyncBuffer, 500);
        console.info(TAG, 'testReadSync002 length = ' + length);
        expect(length >= 0).assertTrue();
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testReadSync002 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testReadSync003
     * @tc.number SUB_USB_HostMgr_Serial_JS_readSync_ErrCode_0200
     * @tc.desc   port not open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await sleep(1000);
      try {
        console.info(TAG, 'testReadSync003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        serial.readSync(openPortId, readSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testReadSync003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testReadSync004
     * @tc.number SUB_USB_HostMgr_Serial_JS_readSync_ErrCode_0300
     * @tc.desc   invalidport to open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testReadSync004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalid: number = -1;
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(invalid, readSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testReadSync004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testReadSync005
     * @tc.number SUB_USB_HostMgr_Serial_JS_readSync_ErrCode_0400
     * @tc.desc   invalidport to open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testReadSync005 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalid: number = 100;
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(invalid, readSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testReadSync005 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testRead002
     * @tc.number SUB_USB_HostMgr_Serial_JS_read_Func_0100
     * @tc.desc   read successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testRead002 start');
      await sleep(3000);
      if (await checkDevice() === false) {
        done();
        return;
      }
      let readBuffer: Uint8Array = new Uint8Array(8192);
      serial.open(openPortId);
      serial.read(openPortId, readBuffer, 1000)
        .then((length: number) => {
          console.info(TAG, 'testRead002 length = ' + length);
          expect(length >= 0).assertTrue();
          serial.close(openPortId);
          done();
        })
        .catch((error: Error) => {
          console.error(TAG, 'testRead002 catch err name: ', error.name, ', message: ', error.message);
          expect().assertFail();
        });
    })

    /**
     * @tc.name   testRead003
     * @tc.number SUB_USB_HostMgr_Serial_JS_read_ErrCode_0200
     * @tc.desc   port not open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await sleep(1000);
      try {
        console.info(TAG, 'testRead003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let readBuffer: Uint8Array = new Uint8Array(8192);
        await serial.read(openPortId, readBuffer, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testRead003 catch err name: ', error);
        expect(error).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testRead004
     * @tc.number SUB_USB_HostMgr_Serial_JS_read_ErrCode_0300
     * @tc.desc   invalidPort to read.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testRead004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let readBuffer: Uint8Array = new Uint8Array(8192);
        let invalid: number = -1;
        serial.read(invalid, readBuffer, 1000)
          .then((length: number) => {
            expect().assertFail();
          });
      } catch (error) {
        console.error(TAG, 'testRead004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testRead005
     * @tc.number SUB_USB_HostMgr_Serial_JS_read_ErrCode_0400
     * @tc.desc   not exist to read.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testRead004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let readBuffer: Uint8Array = new Uint8Array(8192);
        let invalid: number = 100;
        await serial.read(invalid, readBuffer, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testRead005 catch err name: ', error);
        expect(error).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testOpen005
     * @tc.number SUB_USB_HostMgr_Serial_JS_open_Func_0400
     * @tc.desc   open failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen005 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.cancelSerialRight(openPortId);
        serial.open(openPortId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOpen005 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(31400002);
        done();
      }
    })

    /**
     * @tc.name   testCancelSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_JS_cancelSerialRight_Func_0100
     * @tc.desc   cancelSerialRight successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testCancelSerialRight001 start, openPortId: ', openPortId);
        if (await checkDevice() === false) {
          done();
          return;
        }
        console.info(TAG, 'it requestSerialRight start');
        let futureRes: Promise<boolean> = serial.requestSerialRight(openPortId);
        await driveFn();
        try {
          let hasRight: boolean = await futureRes;
          await sleep(500);
          console.info(TAG, 'getPermission isAgree: ', hasRight);
          serial.cancelSerialRight(openPortId);
          await sleep(500);
          expect(serial.hasSerialRight(openPortId)).assertFalse();
          done();
        } catch (err) {
          console.error(TAG, 'cancelSerialRight catch err name: ', err.name, ', message: ', err.message);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, 'testCancelSerialRight001 catch err code: ', err.code, ', message: ', err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCancelSerialRight002
     * @tc.number SUB_USB_HostMgr_Serial_JS_cancelSerialRight_ErrCode_0100
     * @tc.desc   invalid portId to cancelSerialRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testCancelSerialRight002 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidInput: number = -1;
        serial.cancelSerialRight(invalidInput);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(401);
        console.error(TAG, 'testCancelSerialRight002 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })

    /**
     * @tc.name   testCancelSerialRight003
     * @tc.number SUB_USB_HostMgr_Serial_JS_cancelSerialRight_ErrCode_0200
     * @tc.desc   not exist portId to cancelSerialRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testCancelSerialRight003 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let invalidPort: number = 100;
        serial.cancelSerialRight(invalidPort);
        console.info(TAG, 'testCancelSerialRight003');
      } catch (error) {
        expect(error.code).assertEqual(31400003);
        console.error(TAG, 'testCancelSerialRight003 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })

    /**
     * @tc.name   testCancelSerialRight004
     * @tc.number SUB_USB_HostMgr_Serial_JS_cancelSerialRight_ErrCode_0300
     * @tc.desc   no permission to cancelSerialRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testCancelSerialRight004 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        serial.cancelSerialRight(openPortId);
        console.info(TAG, 'testCancelSerialRight004');
      } catch (error) {
        expect(error.code).assertEqual(31400002);
        console.error(TAG, 'testCancelSerialRight004 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })
  })
}