/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import UsbMgr from '@ohos.usbManager';

let domain: int = 0x0000;
let tag: string = 'testTag';

function deviceConnected(gDeviceList: Array<Readonly<UsbMgr.USBDevice>>) {
  if (gDeviceList.length > 0) {
    hilog.info(domain, tag, "Test USB devices connected");
    return true;
  }
  hilog.info(domain, tag, "Test No USB devices connected");
  return false;
}

function devAccessoryFunc(accList:Array<UsbMgr.USBAccessory>) {
  if (accList.length > 0) {
    hilog.info(domain, tag, "Test Accessory devices connected");
    return true;
  }
  hilog.info(domain, tag, "Test No Accessory devices connected");
  return false;
}

export default function UsbRetValueTest() {

  describe("UsbRetValueTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    let isDeviceConnected: boolean = false;
    let isDevAccessoryFunc: boolean = false;
    let devices: UsbMgr.USBDevice;
    let accessInfo:UsbMgr.USBAccessory;
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
      hilog.info(domain, tag, 'getDevices: %{public}s', JSON.stringify(gDeviceList));
      isDeviceConnected = deviceConnected(gDeviceList);
      if (isDeviceConnected) {
        devices = gDeviceList[0];
      }

      let accList:Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
      hilog.info(domain, tag, 'getAccessoryList: %{public}s', JSON.stringify(accList));
      isDevAccessoryFunc = devAccessoryFunc(accList);
      if (isDevAccessoryFunc) {
        accessInfo = accList[0];
      }
      hilog.info(domain, tag, 'devices empty');
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })
    /**
     * @tc.name   testGetDevices002
     * @tc.number SUB_USB_HostManager_RetValue_Func_0100
     * @tc.desc   getDevices return value is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDevices002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB testGetDevices002 begin');
        if (!isDeviceConnected) {
          try{
            let res: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
            hilog.info(domain, tag, 'usb case getDevices ret length: ' + res.length);
            expect(res.length).assertEqual(0);
            done();
          } catch(error) {
            hilog.info(domain, tag, 'testGetDevices002 catch err code:%{public}s', JSON.stringify(error));
            done();
          }
        } else {
          done();
        }
        hilog.info(domain, tag, 'USB testGetDevices002 end');
      })

    /**
     * @tc.name   testRequestRightFalse
     * @tc.number SUB_USB_HostManager_RetValue_Func_0200
     * @tc.desc   Positive test: requestRight false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRequestRightFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testRequestRightFalse begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testRequestRightFalse No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let isHasRight = await UsbMgr.requestRight(devices.name);
            hilog.info(domain, tag, 'usb case requestRight ret : ' + isHasRight);
            expect(isHasRight).assertFalse();
            done();
          } catch (error) {
            hilog.info(domain, tag, 'testRequestRightFalse catch err code: ' + JSON.stringify(error));
          }
          done();
        }
        hilog.info(domain, tag, 'testRequestRightFalse end');
      })

    /**
     * @tc.name   testRemoveRightFalse
     * @tc.number SUB_USB_HostManager_RetValue_Func_0300
     * @tc.desc   Positive test: removeRight false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveRightFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testRemoveRightFalse begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testRemoveRight001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let remRight = UsbMgr.removeRight(devices.name);
            hilog.info(domain, tag, 'usb case removeRight ret : ' + remRight);
            expect(remRight).assertFalse();
          } catch (error) {
            hilog.info(domain, tag, 'testRemoveRightFalse catch err code: ' + JSON.stringify(error));
          }
          done();
        }
        hilog.info(domain, tag, 'testRemoveRightFalse end');
      })

    /**
     * @tc.name   getAccessoryList002
     * @tc.number SUB_USB_HostManager_RetValue_Func_0400
     * @tc.desc   Positive test: getAccessoryList is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getAccessoryList002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB getAccessoryList002 begin');
        if (!isDevAccessoryFunc) {
          hilog.info(domain, tag, 'usb getAccessoryList002 No Accessory is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let res = UsbMgr.getAccessoryList();
            hilog.info(domain, tag, 'usb case getAccessoryList ret length: ' + res.length);
            expect(res.length > 0).assertTrue();
            done();
          } catch (error) {
            hilog.info(domain, tag, 'getAccessoryList002 catch err : ' + JSON.stringify(error));
            done();
          }
        }
        hilog.info(domain, tag, 'USB getAccessoryList002 end');
      })

    /**
     * @tc.name   getAccessoryList003
     * @tc.number SUB_USB_HostManager_RetValue_Func_0500
     * @tc.desc   Positive test: getAccessoryList is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getAccessoryList003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB getAccessoryList003 begin');
        if (!isDevAccessoryFunc) {
          try {
            let res = UsbMgr.getAccessoryList();
            hilog.info(domain, tag, 'usb case getAccessoryList ret length: ' + res.length);
            expect(res.length).assertEqual(0);
            done();
          } catch (error) {
            hilog.info(domain, tag, 'getAccessoryList003 catch err : ' + JSON.stringify(error));
            done();
          }
        } else {
          done();
        }
        hilog.info(domain, tag, 'USB getAccessoryList003 end');
      })

    /**
     * @tc.name   requestAccessoryRight
     * @tc.number SUB_USB_HostManager_RetValue_Func_0600
     * @tc.desc   Positive test: requestAccessoryRight true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("requestAccessoryRight", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB requestAccessoryRight begin');
        try {
          let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
          if (accList && accList.length > 0) {
            let res = await UsbMgr.requestAccessoryRight(accList[0]);
            hilog.info(domain, tag, 'usb case requestAccessoryRight ret: ' + res);
            expect(res).assertTrue();
            UsbMgr.cancelAccessoryRight(accList[0]);
            done();
          } else {
            hilog.info(domain, tag, 'no accessory');
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, 'requestAccessoryRight catch err : ' + JSON.stringify(error));
          done();
        }
        hilog.info(domain, tag, 'USB requestAccessoryRight end');
      })

    /**
     * @tc.name   requestAccessoryRightFalse
     * @tc.number SUB_USB_HostManager_RetValue_Func_0700
     * @tc.desc   Positive test: requestAccessoryRight false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("requestAccessoryRightFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB requestAccessoryRightFalse begin');
        try {
          let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
          if (accList && accList.length > 0) {
            let res = await UsbMgr.requestAccessoryRight(accList[0]);
            hilog.info(domain, tag, 'usb case requestAccessoryRight ret: ' + res);
            expect(res).assertFalse();
            done();
          } else {
            hilog.info(domain, tag, 'no accessory');
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, 'requestAccessoryRightFalse catch err : ' + JSON.stringify(error));
          done();
        }
        hilog.info(domain, tag, 'USB requestAccessoryRightFalse end');
      })
  })
}