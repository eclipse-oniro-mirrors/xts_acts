/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import UsbMgr from '@ohos.usbManager';
import bundleManager from '@ohos.bundle.bundleManager';

let domain: int = 0x0000;
let tag: string = 'testTag';

function getTransfersParam(gPipe: UsbMgr.USBDevicePipe, flagsValue: UsbMgr.UsbTransferFlags,
  endpointValue: int, typeValue: UsbMgr.UsbEndpointTransferType, timeOutValue: int) {
  let transferParams: UsbMgr.UsbDataTransferParams = {
    devPipe: gPipe,
    flags: flagsValue,
    endpoint: endpointValue,
    type: typeValue,
    timeout: timeOutValue,
    length: 1000,
    callback: () => {
    },
    userData: new Uint8Array(1000),
    buffer: new Uint8Array(1000),
    isoPacketCount: 0,
  };
  return transferParams;
}

function deviceConnected(gDeviceList: Array<Readonly<UsbMgr.USBDevice>>) {
  if (gDeviceList.length > 0) {
    hilog.info(domain, tag, "Test USB device is connected");
    return true;
  }
  hilog.info(domain, tag, "Test USB device is not connected");
  return false;
}

function getPipe(testCaseName: string) {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  let devices: UsbMgr.USBDevice = gDeviceList[0];
  let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
  hilog.info(domain, tag, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
  expect(gPipe !== null).assertTrue();
}

function toClosePipe(testCaseName: string) {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  let devices: UsbMgr.USBDevice = gDeviceList[0];
  let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
  let isPipClose = UsbMgr.closePipe(gPipe);
  console.info(domain, tag, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
  expect(isPipClose).assertEqual(0);
}


export default function UsbBaseTest() {

  describe("UsbBaseTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    let isDeviceConnected: boolean = false;
    let devices: UsbMgr.USBDevice;
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');

      let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
      isDeviceConnected = deviceConnected(gDeviceList);
      if (isDeviceConnected) {
        devices = gDeviceList[0];
        hilog.info(domain, tag, '获取设备信息: %{public}s', JSON.stringify(gDeviceList));
      }
      hilog.info(domain, tag, 'devices empty');
    })
    /**
     * @tc.name   testGetDevices001
     * @tc.number SUB_USB_HostManager_JS_Func_0100
     * @tc.desc   【C-ALL-HARDWARE-0502】必须支持连接标准 USB 外围设备
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testGetDevices001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          hilog.info(domain, tag, 'usb testGetDevices001 begin');
          let getDeviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          hilog.info(domain, tag, 'usb case getDevices ret length: ' + getDeviceList.length);
          expect(getDeviceList.length > 0).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   testGetRawDescriptorRight001
     * @tc.number SUB_USB_HostManager_JS_Func_0200
     * @tc.desc   Positive test: getRawDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetRawDescriptorRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB getRawDescriptor begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testGetRawDescriptorRight001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            hilog.info(domain, tag, 'USB getRawDescriptor begin 1');
            let hasRight = UsbMgr.requestRight(devices.name);
            hilog.info(domain, tag, 'USB getRawDescriptor begin 2');
            hilog.info(domain, tag, 'USB getRawDescriptor begin 2' + devices.name);
            if (!hasRight) {
              hilog.info(domain, tag, 'requestRight true');
            }
            let gPipe = UsbMgr.connectDevice(devices);
            let devs = UsbMgr.getRawDescriptor(gPipe);
            hilog.info(domain, tag, `getRawDescriptor busNum = ${gPipe.busNum}`);
            hilog.info(domain, tag, `getRawDescriptor evAddress = ${gPipe.devAddress}`);
            hilog.info(domain, tag, `usb getRawDescriptor success : ret :` + devs);
            expect(devs instanceof Uint8Array).assertTrue();
            expect(devs.length > 0).assertTrue();
          } catch (error) {
            const err = error as BusinessError;
            hilog.info(domain, tag, 'usb testGetRawDescriptorRight001 catch err code: ', err.code, ', message: ',
              err.message);
          }
          done();
        }
      })

    /**
     * @tc.name   testClaimInterface001
     * @tc.number SUB_USB_HostManager_JS_Func_0300
     * @tc.desc   Positive test: claimInterface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testClaimInterface001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB testClaimInterface001 begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testClaimInterface001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            UsbMgr.requestRight(devices.name);
            let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
            let interfaces: UsbMgr.USBInterface = devices.configs[0].interfaces[0];


            hilog.info(domain, tag, `testClaimInterface001 busNum = ${devicePipe.busNum}`);
            hilog.info(domain, tag, `testClaimInterface001 busNum = ${devicePipe.devAddress}`);
            hilog.info(domain, tag, 'testClaimInterface001 interfaces = %{public}s', JSON.stringify(interfaces));
            let ret: int = UsbMgr.claimInterface(devicePipe, interfaces, false);
            UsbMgr.releaseInterface(devicePipe, interfaces);
            hilog.info(domain, tag, `claimInterface = ${ret}`);
            expect(ret === 0).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, 'testClaimInterface001 catch err code:%{public}s', JSON.stringify(err));
          }
          done();
        }
      })

    /**
     * @tc.name   testReleaseInterface001
     * @tc.number SUB_USB_HostManager_JS_Func_0400
     * @tc.desc   Positive test: releaseInterface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testReleaseInterface001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testReleaseInterface001');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testReleaseInterface001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            UsbMgr.requestRight(devices.name);
            let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
            let interfaces: UsbMgr.USBInterface = devices.configs[0].interfaces[0];

            hilog.info(domain, tag, `testReleaseInterface001 busNum = ${devicePipe.busNum}`);
            hilog.info(domain, tag, `testReleaseInterface001 busNum = ${devicePipe.devAddress}`);
            hilog.info(domain, tag, 'testReleaseInterface001 interfaces = %{public}s',
              JSON.stringify(interfaces));

            UsbMgr.claimInterface(devicePipe, interfaces);
            let ret = UsbMgr.releaseInterface(devicePipe, interfaces);
            hilog.info(domain, tag, `releaseInterface = ${ret}`);
            expect(ret === 0).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, 'testReleaseInterface001 catch err code:%{public}s', JSON.stringify(err));
          }
          done();
        }
      })

    /**
     * @tc.name   testSetInterface001
     * @tc.number SUB_USB_HostManager_JS_Func_0500
     * @tc.desc   Positive test: setInterface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetInterface001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testSetInterface001');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testSetInterface001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            UsbMgr.requestRight(devices.name);
            let devicePipe = UsbMgr.connectDevice(devices);
            let interfaces = devices.configs[0].interfaces[0];
            hilog.info(domain, tag, `testSetInterface001 busNum = ${devicePipe.busNum}`);
            hilog.info(domain, tag, `testSetInterface001 busNum = ${devicePipe.devAddress}`);
            hilog.info(domain, tag, 'testSetInterface001 interfaces = %{public}s',
              JSON.stringify(interfaces));
            UsbMgr.claimInterface(devicePipe, interfaces);
            let ret = UsbMgr.setInterface(devicePipe, interfaces);
            UsbMgr.releaseInterface(devicePipe, interfaces);
            hilog.info(domain, tag, `releaseInterface = ${ret}`);
            expect(ret === 0).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, 'testSetInterface001 catch err code:%{public}s', JSON.stringify(err));
          }
          done();
        }
      })

    /**
     * @tc.name   testSetConfiguration001
     * @tc.number SUB_USB_HostManager_JS_Func_0600
     * @tc.desc   Positive test: setConfiguration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetConfiguration001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testSetConfiguration001');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testSetConfiguration001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            hilog.info(domain, tag, "devices name " + devices.name);
            UsbMgr.requestRight(devices.name);
            let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
            hilog.info(domain, tag, `testSetConfiguration001 busNum = ${devicePipe.busNum}`);
            hilog.info(domain, tag, `testSetConfiguration001 busNum = ${devicePipe.devAddress}`);
            let config: UsbMgr.USBConfiguration = devices.configs[0];
            hilog.info(domain, tag, `testSetConfiguration001 busNum = ${config}`);
            let ret: int = UsbMgr.setConfiguration(devicePipe, config);
            hilog.info(domain, tag, `setConfiguration = ${ret}`);
            expect(ret === 0).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, 'testSetConfiguration001 catch err code:%{public}s', JSON.stringify(err));
          }
          done();
        }
      })

    /**
     * @tc.name   testGetFileDescriptor001
     * @tc.number SUB_USB_HostManager_JS_Func_0700
     * @tc.desc   Positive test: getFileDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testGetFileDescriptor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testGetFileDescriptor001');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testGetFileDescriptor001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            UsbMgr.requestRight(devices.name);
            let isHasRight = UsbMgr.hasRight(devices.name);
            let gPipe = UsbMgr.connectDevice(devices);
            let devs: number = UsbMgr.getFileDescriptor(gPipe);
            hilog.info(domain, tag, `usb testGetFileDescriptor001 success ret :` + devs);
            expect(devs >= 0).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, 'testGetFileDescriptor001 catch err code:%{public}s', JSON.stringify(err));
          }
          done();
        }
      })

    /**
     * @tc.name   testRequestRight001
     * @tc.number SUB_USB_HostManager_JS_Func_0800
     * @tc.desc   Positive test: requestRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRequestRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testRequestRight001');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testRequestRight001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let isHasRight = await UsbMgr.requestRight(devices.name);
            hilog.info(domain, tag, 'usb case testRequestRight001 ret : ' + isHasRight);
            expect(isHasRight).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, 'testRequestRight001 catch err code: ' + JSON.stringify(err));
            expect(err !== null).assertFalse();
          }
          done();
        }
      })

    /**
     * @tc.name   testHasRight002
     * @tc.number SUB_USB_HostManager_JS_Func_0900
     * @tc.desc   Positive test: hasRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasRight002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB testHasRight002 begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testHasRight002 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
          try {
            for (let i = 0; i < gDeviceList.length; i++) {
              let deviceName = gDeviceList[i].name;
              deviceName = deviceName + "123";
              let isHasRight = UsbMgr.hasRight(deviceName);
              hilog.info(domain, tag, 'usb [', deviceName, '] hasRight ret : ' + isHasRight);
              expect(isHasRight).assertFalse();
            }
          } catch (err) {
            hilog.info(domain, tag, 'testHasRight002 catch err : ' + JSON.stringify(err));
            expect(err !== null).assertFalse();
          }
          done();
        }
      })

    /**
     * @tc.name   testHasRight003
     * @tc.number SUB_USB_HostManager_JS_Func_1000
     * @tc.desc   Positive test: hasRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHasRight003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB testHasRight003 begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testHasRight003 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let isHasRight = UsbMgr.hasRight(devices.name);
            hilog.info(domain, tag, 'usb case hasRight ret : ' + isHasRight);
            expect(isHasRight).assertTrue();
          } catch (error) {
            const err = error as BusinessError;
            hilog.info(domain, tag, 'usb testHasRight003 catch err code: ', err.code, ', message: ',
              err.message);
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })

    /**
     * @tc.name   testConnectDevice001
     * @tc.number SUB_USB_HostManager_JS_Func_1100
     * @tc.desc   Positive test: connectDevice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testConnectDevice001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB testConnectDevice001 begin');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testConnectDevice001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let deviceName = devices.name;
            let isHasRight: boolean = await UsbMgr.requestRight(deviceName);
            if (isHasRight) {
              hilog.info(domain, tag, 'requestRight is true');
            }
            let gPipe = UsbMgr.connectDevice(devices);
            hilog.info(domain, tag, 'testConnectDevice001 success  gPipe.busNum : ' + gPipe.busNum);
            hilog.info(domain, tag, 'testConnectDevice001 success gPipe.devAddress : ' + gPipe.devAddress);
            expect(gPipe.busNum > 0).assertTrue();
            expect(gPipe.devAddress > 0).assertTrue();

            expect(gPipe.busNum < 256).assertTrue();
            expect(gPipe.devAddress < 128).assertTrue();
          } catch (err) {
            hilog.info(domain, tag, 'testConnectDevice001 catch err code: ' + JSON.stringify(err));
            expect(err !== null).assertFalse();
          }
          toClosePipe('testConnectDevice001');
          done();
        }
      })

    /**
     * @tc.name   testRemoveRight001
     * @tc.number SUB_USB_HostManager_JS_Func_1300
     * @tc.desc   Positive test: removeRight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRemoveRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'testRemoveRight001');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testRemoveRight001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
            let devices: UsbMgr.USBDevice = gDeviceList[0];
            let isHasRight = UsbMgr.hasRight(devices.name);
            if (isHasRight == true) {
              let remRight = UsbMgr.removeRight(devices.name);
              hilog.info(domain, tag, 'usb case testRemoveRight001 ret : ' + remRight);
              expect(remRight).assertTrue();
              done();
            } else {
              let res: boolean = await UsbMgr.requestRight(devices.name);
              let remRight = UsbMgr.removeRight(devices.name);
              expect(remRight).assertTrue();
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, 'testRemoveRight001 catch err code: ' + JSON.stringify(err));
            expect(err !== null).assertFalse();
          }
          done();
        }
      })

    /**
     * @tc.name   testGetRawDescriptor001
     * @tc.number SUB_USB_HostManager_JS_Func_1200
     * @tc.desc   Positive test: Get the original USB descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'usb testGetRawDescriptor001 begin');
      if (!isDeviceConnected) {
        hilog.info(domain, tag, 'usb testGetRawDescriptor001 No device is connected');
        expect(isDeviceConnected).assertFalse();
        done();
      } else {
        let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
        let devices: UsbMgr.USBDevice = gDeviceList[0];
        let isHasRight: boolean = await UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        getPipe('testGetRawDescriptor001');
        let descriptor = UsbMgr.getRawDescriptor(gPipe);
        hilog.info(domain, tag, 'usb case testGetRawDescriptor001 ret: ' + JSON.stringify(descriptor));
        expect(descriptor.length).assertLarger(0);
        toClosePipe('testGetRawDescriptor001');
        done();
      }
    })

    /**
     * @tc.name   USBRequestTargetType001
     * @tc.number SUB_USB_HostManager_JS_Func_1400
     * @tc.desc   Positive test: enum USBRequestTargetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("USBRequestTargetType001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '----------------------USBRequestTargetType001---------------------------');
      hilog.info(domain, tag, `USB_REQUEST_TARGET_DEVICE: ${UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE}`);
      expect(typeof(UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE)).assertEqual('int');
      hilog.info(domain, tag, `USB_REQUEST_TARGET_INTERFACE: ${UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE}`);
      expect(typeof(UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE)).assertEqual('int');
      hilog.info(domain, tag, `USB_REQUEST_TARGET_ENDPOINT: ${UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT}`);
      expect(typeof(UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT)).assertEqual('int');
      hilog.info(domain, tag, `USB_REQUEST_TARGET_OTHER: ${UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER}`);
      expect(typeof(UsbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER)).assertEqual('int');
      done();
      hilog.info(domain, tag, '%{public}s', 'USBRequestTargetType001 end');
    })

    /**
     * @tc.name   testResetUsbDevice
     * @tc.number SUB_USB_HostManager_JS_Reset_0100
     * @tc.desc   Negative test: Reset device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDevice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(domain, 'usb testResetUsbDevice begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
            let device: UsbMgr.USBDevice = gDeviceList[0];
            let hasRight = await UsbMgr.requestRight(gDeviceList[0].name);
            console.info(domain, 'usb testRequestRight004 ret :' + hasRight);
            expect(hasRight).assertTrue();
            let gPipe:UsbMgr.USBDevicePipe = UsbMgr.connectDevice(device);
            let result: boolean = UsbMgr.resetUsbDevice(gPipe);
            console.info(domain, 'usb resetUsbDevice ret :' + result);
            expect(result == true).assertTrue();
          } catch (error) {
            console.info(domain, 'resetUsbDevice failed: ' + error);
            expect(error !== null).assertFalse();
          }
          toClosePipe('testResetUsbDevice');
          done();
        }
      })

    /**
     * @tc.name   testResetUsbDeviceErrorCode
     * @tc.number SUB_USB_HostManager_JS_Reset_0200
     * @tc.desc   Negative test: resetUsbDevice error code 14400008 overwrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(domain, 'usb testResetUsbDeviceErrorCode begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
            let device: UsbMgr.USBDevice = gDeviceList[0];
            let hasRight = await UsbMgr.requestRight(gDeviceList[0].name);
            console.info(domain, 'usb testRequestRight005 ret :' + hasRight);
            expect(hasRight).assertTrue();
            let gPipe:UsbMgr.USBDevicePipe = UsbMgr.connectDevice(device);
            gPipe = {
              "busNum":0,
              "devAddress":0
            };
            let result: boolean = UsbMgr.resetUsbDevice(gPipe);
            console.info(domain, 'usb resetUsbDevice ret :' + result);
            expect(result == false).assertTrue();
          } catch (error) {
            const err = error as BusinessError;
            console.info(domain, 'resetUsbDevice failed: ' + err);
            expect(err.code).assertEqual(14400008);
          }
          toClosePipe('testResetUsbDeviceErrorCode');
          done();
        }
      })

    /**
     * @tc.name   testResetUsbDeviceErrorCode002
     * @tc.number SUB_USB_HostManager_JS_Reset_0400
     * @tc.desc   Negative test: resetUsbDevice error code 14400001 overwrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceErrorCode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(domain, 'usb testResetUsbDeviceErrorCode002 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
            let device: UsbMgr.USBDevice = gDeviceList[0];
            let hasRight = await UsbMgr.requestRight(gDeviceList[0].name);
            console.info(domain, 'usb testRequestRight007 ret :' + hasRight);
            expect(hasRight).assertTrue();
            let gPipe:UsbMgr.USBDevicePipe = UsbMgr.connectDevice(device);
            let remRight = UsbMgr.removeRight(gDeviceList[0].name);
            console.info(domain, 'usb testRemoveRight001 ret :' + remRight);
            expect(remRight).assertTrue();
            let result: boolean = UsbMgr.resetUsbDevice(gPipe);
            console.info(domain, 'usb resetUsbDevice ret :' + result);
            expect(result == false).assertTrue();
          } catch (error) {
            const err = error as BusinessError;
            console.info(domain, 'resetUsbDevice failed: ' + err);
            expect(err.code).assertEqual(14400001);
          }
          done();
        }
      })

    /**
     * @tc.name   testResetUsbDeviceErrorCode001
     * @tc.number SUB_USB_HostManager_JS_Reset_0300
     * @tc.desc   Negative test: resetUsbDevice error code 14400013 overwrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(domain, 'usb testResetUsbDeviceErrorCode001 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        } else {
          try {
            let gDeviceList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
            let hasRight = await UsbMgr.requestRight(gDeviceList[0].name);
            console.info(domain, 'usb testRequestRight006 ret :' + hasRight);
            expect(hasRight).assertTrue();
            let gPipe:UsbMgr.USBDevicePipe = {
              "busNum":gDeviceList[0].busNum,
              "devAddress":gDeviceList[0].devAddress
            };
            let result: boolean = UsbMgr.resetUsbDevice(gPipe);
            console.info(domain, 'usb resetUsbDevice ret :' + result);
            expect(result == false).assertTrue();
          } catch (error) {
            const err = error as BusinessError;
            console.info(domain, 'resetUsbDevice failed: ' + err);
            expect(err.code).assertEqual(14400013);
          }
          toClosePipe('testResetUsbDeviceErrorCode001');
          done();
        }
      })

    /**
     * @tc.name   testGetRawDescriptor002
     * @tc.number SUB_USB_HostManager_JS_FuncErrcode_1500
     * @tc.desc   Positive test: getRawDescriptor errcode 14400001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb testGetRawDescriptor002 begin');
        try{
          let gPipe:UsbMgr.USBDevicePipe = {
            "busNum":0,
            "devAddress":0
          };
          let descriptor = UsbMgr.getRawDescriptor(gPipe);
          hilog.info(domain, tag, 'usb case testGetRawDescriptor002 ret: ' + JSON.stringify(descriptor));
        } catch(error){
          const err = error as BusinessError;
          console.info(domain, 'getRawDescriptor failed: ' + err);
          expect(err.code).assertEqual(14400001);
          done();
        }
      })
  })
}