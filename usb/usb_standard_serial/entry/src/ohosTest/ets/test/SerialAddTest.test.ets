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

const TAG: string = "[SerialAddTest]";

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

async function getPermission(gPortList: Readonly<serial.SerialPort>[]) {
  console.info('**************getPermission**************');
  try {
    serial.requestSerialRight(gPortList[0].portId).then((hasRight:boolean) => {
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

export default function SerialAddTest() {
  describe('SerialAddTest', () => {
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
     * @tc.name   testGetAttribute005
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_0300
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute005 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_500000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_EVEN,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute005 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute006
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_0400
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute006 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_576000,
          dataBits: serial.DataBits.DATABIT_5,
          parity: serial.Parity.PARITY_MARK,
          stopBits: serial.StopBits.STOPBIT_2
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_2);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute006 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute007
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_0700
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute007 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_1152000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_2
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_2);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute007 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute008
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_0900
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute008 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_2000000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_2
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_2);
        serial.close(openPortId);
        done();  
      } catch (error) {
        console.error(TAG, 'testGetAttribute008 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute009
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1000
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute009 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_2500000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_2
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_2);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute009 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute010
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1100
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute010 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_3000000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_2
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_2);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute010 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute011
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1200
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute011 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_3500000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute011 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute012
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1300
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute012 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_230400,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute012 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute013
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1400
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute013 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_115200,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute013 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute014
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1500
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute014 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_57600,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute014 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute015
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1600
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute015 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_38400,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute015 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute016
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1700
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute016 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_19200,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute016 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute017
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1800
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute017 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute017 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute018
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_1900
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute018 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_4800,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute018 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute019
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2000
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute019 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_2400,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute019 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute020
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2100
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute020 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_1800,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute020 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute021
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2200
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute021 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_1200,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute021 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute022
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2300
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute022 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_600,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute022 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute023
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2400
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute023 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_300,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute023 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute024
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2500
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute024 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_200,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute024 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute025
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2600
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute025 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_150,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute025 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute026
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_2700
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute026 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_134,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute026 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute027
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3000
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute027 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_110,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute027 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute028
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3100
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute028 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_75,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute028 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute029
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3200
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute029 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_50,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute029 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute030
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3300
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute030 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_4000000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute030 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute031
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3400
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute031 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_460800,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute031 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute032
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3500
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute032 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_921600,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute032 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute033
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3600
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute033 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_1000000,
          dataBits: serial.DataBits.DATABIT_6,
          parity: serial.Parity.PARITY_ODD,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute033 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetAttribute034
     * @tc.number SUB_USB_HostMgr_Serial_JS_getAttribute_Func_3700
     * @tc.desc   getAttribute successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAttribute034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute034 start');
        if (await checkDevice() === false) {
          done();
          return;
        }
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_1500000,
          dataBits: serial.DataBits.DATABIT_7,
          parity: serial.Parity.PARITY_SPACE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect(serial.getAttribute(openPortId).stopBits).assertEqual(serial.StopBits.STOPBIT_1);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute034 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })
  })
}