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
import buffer from '@ohos.buffer';
const TAG: string = "[SerialTest]";

function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

async function driveFn() {
  console.info(TAG, '**************driveFn**************');
  try {
    console.info(TAG, '**************Driver.create() start**************');
    let driver: Driver = Driver.create();
    await driver.delayMs(1000)
    console.info(TAG, '**************Driver.create() end**************');
    await sleep(1000);
    let buttons = await driver.findComponents(ON.text('允许'));
    if (buttons && buttons.length > 0) {
      console.info(TAG, 'driver click');
      await buttons[buttons.length - 1].click();
    }
  } catch (error) {
    console.info(TAG, 'driveFn error: ' + error);
  }
}

async function driveDecFn() {
  console.info('**************driveDecFn**************');
  try {
    let driver = Driver.create();
    await sleep(1000);
    let buttons = await driver.findComponents(ON.text('不允许', MatchPattern.CONTAINS));
    console.info(TAG, 'driveDecFn button:', JSON.stringify(buttons));
    if (buttons && buttons.length > 0) {
      await buttons[buttons.length - 1].click();
    }
  } catch (error) {
    console.info(TAG, 'driveDecFn error: ' + error);
  }
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

export default function SerialBaseTest() {
  describe("SerialBaseTest", (): void => {
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
            await driveFn();
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
     * @tc.name   testGetPortList001
     * @tc.number SUB_USB_HostMgr_Serial_ANI_getPortList_Func_0100
     * @tc.desc   getportlist successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPortList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> =>  {
      try {
        console.info(TAG, 'testGetPortList001 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let portList: serialManager.SerialPort[] = serialManager.getPortList();
        console.info(TAG, 'testGetPortList001 portList: ', JSON.stringify(portList));
        if (portList && portList.length > 0) {
          openPortId = portList[0].portId;
          console.info(TAG, 'testGetPortList001 openPortId: ', openPortId);
          let openPortName: string = portList[0].deviceName;
          expect(openPortName !== null && openPortName !== undefined).assertTrue();
        }
        expect(portList.length > 0).assertTrue();
        done();
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetPortList002
     * @tc.number SUB_USB_HostMgr_Serial_ANI_getPortList_Func_0200
     * @tc.desc   getPortList return value is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPortList002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> =>  {
      try {
        console.info(TAG, 'testGetPortList002 start');
        if (checkDevice() === false) {
          let portList: serialManager.SerialPort[] = serialManager.getPortList();
          console.info(TAG, 'testGetPortList002 portList: ', JSON.stringify(portList));
          expect(portList.length).assertEqual(0);
          done();
          return Promise.resolve();
        } else {
          done();
        }
      } catch (error) {
        console.info(TAG, 'testGetPortList002 portList: ', JSON.stringify(error));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHasSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_ANI_hasSerialRight_Func_0100
     * @tc.desc   hasSerialRight successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testHasSerialRight001 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let hasRight: boolean = serialManager.hasSerialRight(openPortId);
        console.info(TAG, 'testHasSerialRight001 hasRight: ', hasRight);
        expect(hasRight).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, 'testHasSerialRight001 catch error: ', error);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHasSerialRight002
     * @tc.number SUB_USB_HostMgr_Serial_ANI_hasSerialRight_ErrCode_0100
     * @tc.desc   invalidInput hasSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testHasSerialRight002 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidInput: int = -1;
        let hasRight: boolean = serialManager.hasSerialRight(invalidInput);
        console.info(TAG, 'testHasSerialRight002 hasRight: ', hasRight);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testHasSerialRight003
     * @tc.number SUB_USB_HostMgr_Serial_ANI_hasSerialRight_ErrCode_0200
     * @tc.desc   invalidPort hasSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasSerialRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testHasSerialRight003 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidPort: int = 100;
        let hasRight: boolean = serialManager.hasSerialRight(invalidPort);
        console.info(TAG, 'testHasSerialRight003 hasRight: ', hasRight);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testRequestSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_ANI_requestSerialRight_Func_0100
     * @tc.desc   requestSerialRight successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRequestSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        serialManager.cancelSerialRight(openPortId);
        await sleep(500);
        expect(serialManager.hasSerialRight(openPortId)).assertFalse();
        let futureRes: Promise<boolean> = serialManager.requestSerialRight(openPortId);
        await driveFn();
        try {
          let hasRight: boolean = await futureRes;
          expect(hasRight).assertTrue();
          done();
        } catch (err) {
          expect().assertFail();
        }
      } catch (err) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testRequestSerialRight002
     * @tc.number SUB_USB_HostMgr_Serial_ANI_requestSerialRight_ErrCode_0100
     * @tc.desc   invalidInput requestSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
        console.info(TAG, 'testRequestSerialRight002 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidInput: int = -1;
        await serialManager.requestSerialRight(invalidInput);
        await driveFn();
        try {
          expect().assertFail();
        } catch (err) {
          console.error(TAG, 'getPermission catch err:',JSON.stringify(err));
          expect().assertFail();
        }
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(401);
        console.error(TAG, 'testRequestSerialRight002 catch err code: ', err.code, ', message: ', err.message);
        done();
      }
    })

    /**
     * @tc.name   testRequestSerialRight003
     * @tc.number SUB_USB_HostMgr_Serial_ANI_requestSerialRight_ErrCode_0200
     * @tc.desc   not exist portId requestSerialRight failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestSerialRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testRequestSerialRight003 start, openPortId: ', openPortId);
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidPort: int = 100;
        await serialManager.requestSerialRight(invalidPort);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(31400003);
        console.error(TAG, 'testRequestSerialRight002 catch err code: ', err.code, ', message: ', err.message);
        done();
      }
    })

    /**
     * @tc.name   testOpen001
     * @tc.number SUB_USB_HostMgr_Serial_ANI_open_Func_0100
     * @tc.desc   open successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testOpen001 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        serialManager.open(openPortId);
        expect().assertEqual(undefined);
        serialManager.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testOpen001 catch err code: ',error);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testOpen002
     * @tc.number SUB_USB_HostMgr_Serial_ANI_open_ErrCode_0100
     * @tc.desc   invalidPort open failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testOpen002 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidInput: int = -1;
        serialManager.open(invalidInput);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testOpen002 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testOpen003
     * @tc.number SUB_USB_HostMgr_Serial_ANI_open_ErrCode_0200
     * @tc.desc   Repeated open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testOpen003 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        serialManager.open(openPortId);
        serialManager.open(openPortId);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testOpen003 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(31400004);
        serialManager.close(openPortId);
        done();
      }
    })

    /**
     * @tc.name   testOpen004
     * @tc.number SUB_USB_HostMgr_Serial_ANI_open_ErrCode_0300
     * @tc.desc   not exist port to open.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testOpen004 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidPort: int = 10;
        serialManager.open(invalidPort);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testOpen004 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(31400003);
        done();
      }
    })

    /**
     * @tc.name   testAddSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_ANI_addSerialRight_ErrCode_0100
     * @tc.desc   not system app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testAddSerialRight001 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }

        let bundleFlags: int = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        await bundleManager.getBundleInfoForSelf(bundleFlags).then(async (bundleInfo: bundleManager.BundleInfo) => {
          console.info(TAG, 'getBundleInfoForSelf success Data: ', JSON.stringify(bundleInfo));

          if (bundleInfo !== null) {
            console.info(TAG, 'bundleInfo is not null');

            const accessTokenId = bundleInfo.appInfo?.accessTokenId;
            if (accessTokenId !== undefined) {
              console.info(TAG, 'accessTokenId:', accessTokenId);

              let tokenId: int = accessTokenId.toInt();

              console.info(TAG, 'testAddSerialRight001 begin, tokenId: ', tokenId);
              serialManager.addSerialRight(tokenId, openPortId);
              expect().assertFail();
            } else {
              console.error(TAG, 'bundleInfo.appInfo.accessTokenId is undefined');
              expect().assertFail();
            }
          } else {
            console.error(TAG, 'bundleInfo is null');
            expect().assertFail();
          }
        });
      } catch (error) {
        const err = error as BusinessError;
        console.info(TAG, 'testAddSerialRight001 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testClose001
     * @tc.number SUB_USB_HostMgr_Serial_ANI_close_Func_0100
     * @tc.desc   close port successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testClose001 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        serialManager.close(openPortId);
        let attribute: serialManager.SerialAttribute = {
          baudRate: serialManager.BaudRates.BAUDRATE_9600,
          dataBits: serialManager.DataBits.DATABIT_8,
          parity: serialManager.Parity.PARITY_NONE,
          stopBits: serialManager.StopBits.STOPBIT_1
        };
        serialManager.setAttribute(openPortId, attribute);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testClose001 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testClose002
     * @tc.number SUB_USB_HostMgr_Serial_ANI_close_ErrCode_0100
     * @tc.desc   Repeated close.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testClose002 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        serialManager.open(openPortId);
        serialManager.close(openPortId);
        serialManager.close(openPortId);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testClose002 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(31400005);
        done();
      }
    })

    /**
     * @tc.name   testClose003
     * @tc.number SUB_USB_HostMgr_Serial_ANI_close_ErrCode_0200
     * @tc.desc   invalid Port to close.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testClose003 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidPort: int = -1;
        serialManager.open(openPortId);
        serialManager.close(invalidPort);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testClose003 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(401);
        serialManager.close(openPortId);
        done();
      }
    })

    /**
     * @tc.name   testClose004
     * @tc.number SUB_USB_HostMgr_Serial_ANI_close_ErrCode_0300
     * @tc.desc   not exist Port to close.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClose004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testClose004 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidPort: int = 100;
        serialManager.open(openPortId);
        serialManager.close(invalidPort);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testClose004 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(31400003);
        serialManager.close(openPortId);
        done();
      }
    })

    /**
     * @tc.name   testOpen005
     * @tc.number SUB_USB_HostMgr_Serial_ANI_open_Func_0400
     * @tc.desc   open failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testOpen005 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        serialManager.cancelSerialRight(openPortId);
        serialManager.open(openPortId);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        console.error(TAG, 'testOpen005 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(31400002);
        done();
      }
    })

    /**
     * @tc.name   testCancelSerialRight001
     * @tc.number SUB_USB_HostMgr_Serial_ANI_cancelSerialRight_Func_0100
     * @tc.desc   cancelSerialRight successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testCancelSerialRight001 start, openPortId: ', openPortId);
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        console.info(TAG, 'it requestSerialRight start');
        let futureRes: Promise<boolean> = serialManager.requestSerialRight(openPortId);
        await driveFn();
        try {
          let hasRight: boolean = await futureRes;
          await sleep(500);
          console.info(TAG, 'getPermission isAgree: ', hasRight);
          serialManager.cancelSerialRight(openPortId);
          await sleep(500);
          expect(serialManager.hasSerialRight(openPortId)).assertFalse();
          done();
        } catch (err) {
          console.error(TAG, 'cancelSerialRight catch err name: ', JSON.stringify(err));
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, 'testCancelSerialRight001 catch err code: ', JSON.stringify(err));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCancelSerialRight002
     * @tc.number SUB_USB_HostMgr_Serial_ANI_cancelSerialRight_ErrCode_0100
     * @tc.desc   invalid portId to cancelSerialRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testCancelSerialRight002 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidInput: int = -1;
        serialManager.cancelSerialRight(invalidInput);
        expect().assertFail();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(401);
        console.error(TAG, 'testCancelSerialRight002 catch err code: ', err.code, ', message: ', err.message);
        done();
      }
    })

    /**
     * @tc.name   testCancelSerialRight003
     * @tc.number SUB_USB_HostMgr_Serial_ANI_cancelSerialRight_ErrCode_0200
     * @tc.desc   not exist portId to cancelSerialRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testCancelSerialRight003 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        let invalidPort: int = 100;
        serialManager.cancelSerialRight(invalidPort);
        console.info(TAG, 'testCancelSerialRight003');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(31400003);
        console.error(TAG, 'testCancelSerialRight003 catch err code: ', err.code, ', message: ', err.message);
        done();
      }
    })

    /**
     * @tc.name   testCancelSerialRight004
     * @tc.number SUB_USB_HostMgr_Serial_ANI_cancelSerialRight_ErrCode_0300
     * @tc.desc   no permission to cancelSerialRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG, 'testCancelSerialRight004 start');
        if (checkDevice() === false) {
          done();
          return Promise.resolve();
        }
        serialManager.cancelSerialRight(openPortId);
        console.info(TAG, 'testCancelSerialRight004');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(31400002);
        console.error(TAG, 'testCancelSerialRight004 catch err code: ', err.code, ', message: ', err.message);
        done();
      }
    })
  })
}
