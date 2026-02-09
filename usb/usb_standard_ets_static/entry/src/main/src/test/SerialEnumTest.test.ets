/*
* Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import { Driver, MatchPattern, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import serialManager from '@ohos.usbManager.serial';
import bundleManager from '@ohos.bundle.bundleManager';
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import buffer from '@ohos.buffer';
const TAG: string = "[SerialTest]";
let domain: int = 0x0000;

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

function checkDevice() {
  let portList: serialManager.SerialPort[] = serialManager.getPortList();
  if (portList && portList.length > 0) {
    console.info(TAG, 'Test serial device detected');
    return true;
  } else {
    console.info(TAG, 'Test no serial device detected');
    return false;
  }
}

export default function SerialEnumTest() {
  describe("SerialEnumTest", (): void => {
    console.info(TAG, 'describe start');
    let openPortId: int = -1;
    beforeAll(()=> {
      try {
        let portList: serialManager.SerialPort[] = serialManager.getPortList();
        if (portList && portList.length > 0) {
          openPortId = portList[0].portId;
          console.info(TAG, 'openPortId: ', openPortId);
          let hasRight: boolean = serialManager.hasSerialRight(openPortId);
          if (!hasRight) {
            console.info(TAG, 'beforeEach: requestSerialRight start');
            let futureRes: Promise<boolean> = serialManager.requestSerialRight(openPortId);
            try {
              let hasRight: boolean = await futureRes;
              console.info(TAG, 'getPermission isAgree: ', hasRight);
            } catch (error) {
              console.error(TAG, 'getPermission catch error: ', error);
            }
          }
        } else {
          console.info(TAG, 'portList size error: ', portList.length);
        }
      } catch (error) {
        console.info(TAG, 'beforeAll error: ', error);
      }
    })
    afterAll(async () => {
      console.info(TAG, 'afterAll');
      if (serialManager.hasSerialRight(openPortId)){
        serialManager.close(openPortId);
        serialManager.cancelSerialRight(openPortId);
      }
    })

    /**
     * @tc.name   testSetAttribute001
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0100
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute001 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_50,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute001 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute002
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0200
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute002 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_75,
            dataBits: serialManager.DataBits.DATABIT_7,
            parity: serialManager.Parity.PARITY_ODD,
            stopBits: serialManager.StopBits.STOPBIT_2
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute002 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute003
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0300
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute002 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_110,
            dataBits: serialManager.DataBits.DATABIT_6,
            parity: serialManager.Parity.PARITY_EVEN,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute003 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute004
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0400
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute002 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_134,
            dataBits: serialManager.DataBits.DATABIT_5,
            parity: serialManager.Parity.PARITY_MARK,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute004 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute005
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0500
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute005 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_150,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_SPACE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute005 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute006
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0600
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute006 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_200,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute006 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute007
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0700
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute007 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_300,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute007 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute008
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0800
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute008 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_600,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute008 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute009
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_0900
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute009 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_1200,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute009 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute010
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1000
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute010 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_1800,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute010 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute011
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1100
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute011 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_2400,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute011 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute012
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1200
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute012 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_4800,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute012 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute013
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1300
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute013 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_19200,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute013 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute014
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1400
     * @tc.desc   not openPortId to setAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute014 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_38400,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute014 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute015
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1500
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute015 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_57600,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute015 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute016
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1600
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute016 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_115200,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute016 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute017
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1700
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute017 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_230400,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute017 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute018
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1800
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute018 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_460800,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute018 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute019
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_1900
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute019 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_500000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute019 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute020
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2000
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute020 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_576000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute020 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute021
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2100
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute021 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_921600,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute021 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute022
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2200
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute022 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_1000000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute022 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute023
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2300
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute023 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_1152000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute023 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute024
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2400
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute024 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_1500000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute024 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute025
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2500
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute025 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_2000000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute025 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute026
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2600
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute026 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_2500000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute026 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute027
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2700
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute027 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_3000000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute027 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute028
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2800
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute028 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_3500000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute028 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetAttribute029
     * @tc.number SUB_USB_HostMgr_Serial_JS_enum_2900
     * @tc.desc   not openPortId to setAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttribute029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testSetAttribute029 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          let attribute: serialManager.SerialAttribute = {
            baudRate: serialManager.BaudRates.BAUDRATE_4000000,
            dataBits: serialManager.DataBits.DATABIT_8,
            parity: serialManager.Parity.PARITY_NONE,
            stopBits: serialManager.StopBits.STOPBIT_1
          };
          serialManager.setAttribute(openPortId, attribute);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, TAG, 'testSetAttribute029 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400005);
          done();
        }
      }
    })

    /**
     * @tc.name   testWriteSync001
     * @tc.number SUB_USB_HostMgr_writeSync_ErrCode_0100
     * @tc.desc   writeSync error code 31400006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWriteSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, TAG, 'testWriteSync001 start');
      if (checkDevice() === false) {
        done();
        return Promise.resolve();
      } else {
        try {
          console.info(TAG, 'testWriteSync001 start');
          let writeSyncBuffer: Uint8Array = new Uint8Array(8192);
          serialManager.open(openPortId);
          let length: int = serialManager.writeSync(openPortId, writeSyncBuffer, 500);
          expect(length >= 0).assertTrue();
          serialManager.close(openPortId);
          done();
        } catch (error) {
          console.error(TAG, 'testWriteSync001 catch err code: ', error.code, ', message: ', error.message);
          expect((error as BusinessError).code).assertEqual(31400006);
        }
      }
    })
  })
}