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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.bluetooth.connection';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtConnectionTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let deviceId: string = "00:11:22:33:44:55";
let deviceId_invalid: string = "55:45:55:45:55:45"; //此用例connectAllowedProfiles_promise专属
let g_context: common.UIAbilityContext;

function onReceivePinRequiredEvent(data: connection.PinRequiredParam) { // data为配对请求的入参，配对请求参数
  hilog.info(domain, tag, "pin required  = " + JSON.stringify(data));
  hilog.info(domain, tag, "setDevicePairingConfirmation data.deviceId:" + data.deviceId);
  hilog.info(domain, tag, "setDevicePairingConfirmation data.pinCode:" + data.pinCode);
}

function onReceiveEvent(data: Array<connection.DiscoveryResult>) {
  hilog.info(domain, tag, 'bluetooth discoveryResult result:' + JSON.stringify(data));
  hilog.info(domain, tag, 'bluetooth discoveryResult deviceId result:' + JSON.stringify(data[0].deviceId));
  hilog.info(domain, tag, 'bluetooth discoveryResult rssi result:' + JSON.stringify(data[0].rssi));
  hilog.info(domain, tag, 'bluetooth discoveryResult deviceName result:' + JSON.stringify(data[0].deviceName));
  hilog.info(domain, tag, 'bluetooth discoveryResult deviceClass result:' + JSON.stringify(data[0].deviceClass));
}

function onReceiveEvent1(data: connection.BatteryInfo) {
  hilog.info(domain, tag, 'bluetooth BatteryInfo result:' + JSON.stringify(data));
}

function onReceiveEvent2(data: Array<string>) {
  hilog.info(domain, tag, 'Device' + JSON.stringify(data) +
    'length' + data.length);
  expect(data.length > 0).assertTrue();
}

function BondStateParam(data: connection.BondStateParam) {
  hilog.info(domain, tag, "bondStateChange on:" + JSON.stringify(data)
    + 'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
}

function BondStateParam1(data: connection.BondStateParam) {
  hilog.info(domain, tag, "bondStateChange on:" + JSON.stringify(data)
    + 'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state + 'bondStateChange cause:' +
    data.cause);
}

export default function bluetoothConnectionTest() {

  describe("bluetoothConnectionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      try {
        await Utils.msSleep(2000);
        hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
        g_context = Hypium.get('Context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.ACCESS_BLUETOOTH')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
          });
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.msSleep(2000);
      await Utils.clickRequestPermission('允许');
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      try {
        await Utils.openBluetooth();
        hilog.info(domain, tag, '%{public}s', 'beforeEach end');
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
      }
    })
    /**
     * @tc.name   getRemoteDeviceNameTest
     * @tc.number getRemoteDeviceNameTest
     * @tc.desc   Test getRemoteDeviceNameTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getRemoteDeviceNameTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let name: string = connection.getRemoteDeviceName("00:11:22:33:44:55");
          hilog.info(domain, tag, "getRemoteDeviceName:" + name);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "getRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   getRemoteDeviceNameAliasTest
     * @tc.number getRemoteDeviceNameAliasTest
     * @tc.desc   Test getRemoteDeviceNameAliasTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getRemoteDeviceNameAliasTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let aliasName: string = connection.getRemoteDeviceName("00:11:22:33:44:55", true);
          hilog.info(domain, tag, "getRemoteDeviceName alias is true:" + aliasName);
          let aliasNames: string = connection.getRemoteDeviceName("00:11:22:33:44:55", false);
          hilog.info(domain, tag, "getRemoteDeviceName alias is false:" + aliasNames);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "getRemoteDeviceName alias get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   getRemoteDeviceClassTest
     * @tc.number getRemoteDeviceClassTest
     * @tc.desc   Test getRemoteDeviceClassTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getRemoteDeviceClassTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let deviceClass: connection.DeviceClass = connection.getRemoteDeviceClass("00:11:22:33:44:55");
          hilog.info(domain, tag, "getRemoteDeviceClass result:" + JSON.stringify(deviceClass));
          hilog.info(domain, tag, "getRemoteDeviceClass result majorClass:" + JSON.stringify(deviceClass.majorClass));
          hilog.info(domain, tag,
            "getRemoteDeviceClass result majorMinorClass:" + JSON.stringify(deviceClass.majorMinorClass));
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "getRemoteDeviceClass get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   setBluetoothScanModeTest
     * @tc.number setBluetoothScanModeTest
     * @tc.desc   Test setBluetoothScanModeTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("setBluetoothScanModeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "setBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   getPairedDevicesTest
     * @tc.number getPairedDevicesTest
     * @tc.desc   Test getPairedDevicesTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getPairedDevicesTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let devices: Array<string> = connection.getPairedDevices();
          hilog.info(domain, tag, "getPairedDevices result:" + JSON.stringify(devices));
          expect(true).assertEqual(devices != null);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   connectionConstantTest
     * @tc.number connectionConstantTest
     * @tc.desc   Test connectionConstantTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("connectionConstantTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let BOND_STATE_BONDED: connection.BondState = connection.BondState.BOND_STATE_BONDED;
          hilog.info(domain, tag, "BOND_STATE_BONDED:" + BOND_STATE_BONDED);
          expect(true).assertEqual(BOND_STATE_BONDED === 2);
          let SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE: connection.ScanMode =
            connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE;
          hilog.info(domain, tag,
            "SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE:" + SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
          expect(true).assertEqual(SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE === 4);
        } catch (err) {
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "ConnectionConstant get errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   bluetoothDeviceFindTest
     * @tc.number bluetoothDeviceFindTest
     * @tc.desc   Test bluetoothDeviceFindTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("bluetoothDeviceFindTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: Array<string>) => void = (changeInfo: Array<string>) => {
          hilog.info(domain, tag, "onReceiveEvent changeInfo bluetoothDeviceFind:" + changeInfo);
        }
        try {
          connection.onBluetoothDeviceFind(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bluetoothDeviceFind on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offBluetoothDeviceFind();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bluetoothDeviceFind off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   bluetoothDeviceFindTest2
     * @tc.number bluetoothDeviceFindTest2
     * @tc.desc   Test bluetoothDeviceFindTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("bluetoothDeviceFindTest2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: Array<string>) => void = (changeInfo: Array<string>) => {
          hilog.info(domain, tag, "onReceiveEvent changeInfo bluetoothDeviceFind:" + changeInfo);
        }
        try {
          connection.onBluetoothDeviceFind(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bluetoothDeviceFind on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offBluetoothDeviceFind(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bluetoothDeviceFind off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   discoveryResultTest
     * @tc.number discoveryResultTest
     * @tc.desc   Test discoveryResultTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("discoveryResultTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: Array<connection.DiscoveryResult>) => void =
          (changeInfo: Array<connection.DiscoveryResult>) => {
            hilog.info(domain, tag, "onReceiveEvent changeInfo discoveryResult:" + changeInfo);
            hilog.info(domain, tag, "onReceiveEvent changeInfo discoveryResult deviceId:" + changeInfo[0].deviceId);
          }
        try {
          connection.onDiscoveryResult(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "discoveryResult on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offDiscoveryResult();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "discoveryResult off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   discoveryResultTest2
     * @tc.number discoveryResultTest2
     * @tc.desc   Test discoveryResultTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("discoveryResultTest2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: Array<connection.DiscoveryResult>) => void =
          (changeInfo: Array<connection.DiscoveryResult>) => {
            hilog.info(domain, tag, "onReceiveEvent changeInfo discoveryResult:" + changeInfo);
          }
        try {
          connection.onDiscoveryResult(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "discoveryResult on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offDiscoveryResult(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "discoveryResult off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   bondStateChangeTest
     * @tc.number bondStateChangeTest
     * @tc.desc   Test bondStateChangeTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("bondStateChangeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: connection.BondStateParam) => void =
          (changeInfo: connection.BondStateParam) => {
            hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange:" + changeInfo);
            hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange deviceId:" + changeInfo.deviceId);
            hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange state:" + changeInfo.state);
          }
        try {
          connection.onBondStateChange(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bondStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offBondStateChange();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bondStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   bondStateChangeTest2
     * @tc.number bondStateChangeTest2
     * @tc.desc   Test bondStateChangeTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("bondStateChangeTest2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: connection.BondStateParam) => void =
          (changeInfo: connection.BondStateParam) => {
            hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange:" + changeInfo);
          }
        try {
          connection.onBondStateChange(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bondStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offBondStateChange(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "bondStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   pinRequiredTest
     * @tc.number pinRequiredTest
     * @tc.desc   Test pinRequiredTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("pinRequiredTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: connection.PinRequiredParam) => void =
          (changeInfo: connection.PinRequiredParam) => {
            hilog.info(domain, tag, "onReceiveEvent changeInfo pinRequired:" + changeInfo);
            hilog.info(domain, tag, "onReceiveEvent changeInfo pinRequired deviceId:" + changeInfo.deviceId);
          }
        try {
          connection.onPinRequired(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pinRequired on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offPinRequired();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pinRequired off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   pinRequiredTest2
     * @tc.number pinRequiredTest2
     * @tc.desc   Test pinRequiredTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("pinRequiredTest2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: connection.PinRequiredParam) => void =
          (changeInfo: connection.PinRequiredParam) => {
            hilog.info(domain, tag, "onReceiveEvent changeInfo pinRequired:" + changeInfo);
          }
        try {
          connection.onPinRequired(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pinRequired on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offPinRequired(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pinRequired off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   batteryChangeTest
     * @tc.number batteryChangeTest
     * @tc.desc   Test batteryChangeTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("batteryChangeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: connection.BatteryInfo) => void = (changeInfo: connection.BatteryInfo) => {
          hilog.info(domain, tag, "onReceiveEvent changeInfo batteryChange:" + changeInfo);
          hilog.info(domain, tag, "onReceiveEvent changeInfo batteryChange deviceId:" + changeInfo.deviceId);
        }
        try {
          connection.onBatteryChange(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "batteryChange on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offBatteryChange();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "batteryChange off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   batteryChangeTest2
     * @tc.number batteryChangeTest2
     * @tc.desc   Test batteryChangeTest API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("batteryChangeTest2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let onReceiveEvent: (changeInfo: connection.BatteryInfo) => void = (changeInfo: connection.BatteryInfo) => {
          hilog.info(domain, tag, "onReceiveEvent changeInfo batteryChange:" + changeInfo);
        }
        try {
          connection.onBatteryChange(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "batteryChange on get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        await Utils.msSleep(1000);
        try {
          connection.offBatteryChange(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "batteryChange off get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number  getLastConnectionTimeTest
     * @tc.name    getLastConnectionTimeTest
     * @tc.desc    Test getLastConnectionTime API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getLastConnectionTimeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await connection.getLastConnectionTime(deviceId).then((time: long) => {
            hilog.info(domain, tag, "getLastConnectionTime result:" + JSON.stringify(time));
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "getLastConnectionTime get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getRemoteDeviceBatteryInfoTest
     * @tc.name    getRemoteDeviceBatteryInfoTest
     * @tc.desc    Test getRemoteDeviceBatteryInfo API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getRemoteDeviceBatteryInfoTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await connection.getRemoteDeviceBatteryInfo(deviceId).then((data: connection.BatteryInfo) => {
            hilog.info(domain, tag, "getRemoteDeviceBatteryInfo success" + JSON.stringify(data));
            hilog.info(domain, tag,
              "getRemoteDeviceBatteryInfo success, BatteryInfo batteryLevel:" + JSON.stringify(data.batteryLevel));
            hilog.info(domain, tag, "getRemoteDeviceBatteryInfo success, BatteryInfo leftEarBatteryLevel:" +
              JSON.stringify(data.leftEarBatteryLevel));
            hilog.info(domain, tag, "getRemoteDeviceBatteryInfo success, BatteryInfo leftEarChargeState:" +
              JSON.stringify(data.leftEarChargeState));
            hilog.info(domain, tag, "getRemoteDeviceBatteryInfo success, BatteryInfo rightEarBatteryLevel:" +
              JSON.stringify(data.rightEarBatteryLevel));
            hilog.info(domain, tag, "getRemoteDeviceBatteryInfo success, BatteryInfo rightEarChargeState:" +
              JSON.stringify(data.rightEarChargeState));
            hilog.info(domain, tag, "getRemoteDeviceBatteryInfo success, BatteryInfo boxBatteryLevel:" +
              JSON.stringify(data.boxBatteryLevel));
            hilog.info(domain, tag,
              "getRemoteDeviceBatteryInfo success, BatteryInfo boxChargeState:" + JSON.stringify(data.boxChargeState));
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "getRemoteDeviceBatteryInfo get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  setRemoteDeviceNameTest
     * @tc.name    setRemoteDeviceNameTest
     * @tc.desc    Test setRemoteDeviceName API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("setRemoteDeviceNameTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await connection.setRemoteDeviceName(deviceId, "RemoteDeviceName").then(() => {
            hilog.info(domain, tag, "setRemoteDeviceName success");
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "setRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest
     * @tc.name    getBluetoothScanModeTest
     * @tc.desc    Test getBluetoothScanMode API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0100 oldScanMode = ' + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_NONE, 0);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0100 newscanmode = ' + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_NONE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0100 setoldscanmode = ' + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_001
     * @tc.name    getBluetoothScanModeTest_001
     * @tc.desc    Test getBluetoothScanModeTest_001 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0200 oldScanMode = ' + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE, 0);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0200 newscanmode = ' + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0200 setoldscanmode = ' + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_002
     * @tc.name    getBluetoothScanModeTest_002
     * @tc.desc    Test getBluetoothScanModeTest_002 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0300 oldScanMode = ' + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE, 40000);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0300 getScanMode = ' + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0300 getOldScanMode = ' + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_003
     * @tc.name    getBluetoothScanModeTest_003
     * @tc.desc    Test getBluetoothScanModeTest_003 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0400 oldScanMode = " + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE, 40000);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0400 getScanMode = " + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0400 getOldScanMode = " + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_004
     * @tc.name    getBluetoothScanModeTest_004
     * @tc.desc    Test getBluetoothScanModeTest_004 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0500 oldScanMode = " + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE, 0);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0500 getScanMode = " + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0500 getOldScanMode = " + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_005
     * @tc.name    getBluetoothScanModeTest_005
     * @tc.desc    Test getBluetoothScanModeTest_005 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0600 oldScanMode = " + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE, 0);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0600 getScanMode = " + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0600 getOldScanMode = " + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_006
     * @tc.name    getBluetoothScanModeTest_006
     * @tc.desc    Test getBluetoothScanModeTest_006 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0700 oldScanMode = " + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE, 20000);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0700 getScanMode = " + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0700 getOldScanMode = " + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_007
     * @tc.name    getBluetoothScanModeTest_007
     * @tc.desc    Test getBluetoothScanModeTest_007 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, "ScanMode_0800 oldScanMode = " + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0800 getScanMode = ' + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0800 getOldScanMode = ' + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getBluetoothScanModeTest_008
     * @tc.name    getBluetoothScanModeTest_008
     * @tc.desc    Test getBluetoothScanModeTest_008 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getBluetoothScanModeTest_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0900 oldScanMode = ' + JSON.stringify(Number(oldScanMode)));
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 30000);
          let getScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0900 getScanMode = ' + JSON.stringify(Number(getScanMode)));
          expect(true).assertEqual(getScanMode === connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
          connection.setBluetoothScanMode(oldScanMode, 0);
          let getOldScanMode = connection.getBluetoothScanMode();
          hilog.info(domain, tag, 'ScanMode_0900 getOldScanMode = ' + JSON.stringify(Number(getOldScanMode)));
          expect(true).assertEqual(oldScanMode === getOldScanMode);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getProfileConnectionStateTest
     * @tc.name    getProfileConnectionStateTest
     * @tc.desc    Test getProfileConnectionState API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getProfileConnectionStateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let connectionState = connection.getProfileConnectionState();
          expect(true)
            .assertEqual(connectionState === 0 || connectionState === 1 || connectionState === 2 ||
              connectionState === 3);

          let result = connection.getProfileConnectionState(connection.ProfileId.PROFILE_A2DP_SOURCE);
          expect(true).assertEqual(result === 0 || result === 1 || result === 2 || result === 3);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number  getLocalNameTest
     * @tc.name    getLocalNameTest
     * @tc.desc    Test getLocalName API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getLocalNameTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let getNewName = connection.getLocalName();
          hilog.info(domain, tag, 'LocalName_0700 NewName = ' + JSON.stringify(getNewName));
          expect(true).assertEqual(getNewName != null);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })


    /**
     * @tc.number  getPairStateTest
     * @tc.name    getPairStateTest
     * @tc.desc    Test getPairState API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getPairStateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let state: connection.BondState = connection.getPairState("00:11:22:33:44:55");
          hilog.info(domain, tag, "getPairState: " + state);
          expect(true).assertEqual(state === 0 || state === 1 || state === 2);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "getPairState errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  isBluetoothDiscoveringTest
     * @tc.name    isBluetoothDiscoveringTest
     * @tc.desc    Test isBluetoothDiscovering API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("isBluetoothDiscoveringTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let result: boolean = connection.isBluetoothDiscovering();
          hilog.info(domain, tag, "isBluetoothDiscovering: " + result);
          expect(result).assertEqual(false);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "isBluetoothDiscovering errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number  connectAllowedProfiles_callback
     * @tc.name    connectAllowedProfiles_callback
     * @tc.desc    Test connectAllowedProfiles_callback API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("connectAllowedProfiles_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.connectAllowedProfiles(deviceId, (err) => {
            if (err) {
              hilog.info(domain, tag,
                'errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
              return;
            }
            hilog.info(domain, tag, 'connectAllowedProfiles_callback, err: ' + JSON.stringify(err));
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag,
            "connectAllowedProfiles_callback get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  connectAllowedProfiles_promise
     * @tc.name    connectAllowedProfiles_promise
     * @tc.desc    Test connectAllowedProfiles_promise API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("connectAllowedProfiles_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await connection.connectAllowedProfiles(deviceId_invalid);
          hilog.info(domain, tag, 'connectAllowedProfiles success');
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag,
            "connectAllowedProfiles_promise get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getRemoteProfileUuids_callback
     * @tc.name    getRemoteProfileUuids_callback
     * @tc.desc    Test getRemoteProfileUuids_callback API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getRemoteProfileUuids_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.getRemoteProfileUuids(deviceId, (err, data: connection.ProfileUuids[] | undefined) => {
            if (err) {
              hilog.info(domain, tag, "getRemoteProfileUuids_callback, err:" + JSON.stringify(err));
            } else {
              hilog.info(domain, tag, "getRemoteProfileUuids_callback success");
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag,
            "getRemoteProfileUuids_callback get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(Number(err.code) === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  getRemoteProfileUuids_promise
     * @tc.name    getRemoteProfileUuids_promise
     * @tc.desc    Test getRemoteProfileUuids_promise API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("getRemoteProfileUuids_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await connection.getRemoteProfileUuids(deviceId).then((data: connection.ProfileUuids[]) => {
            hilog.info(domain, tag, "getRemoteProfileUuids_promise resule:" + JSON.stringify(data));
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag,
            "getRemoteProfileUuids_promise get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(Number(err.code) === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  setDevicePinCode_callback
     * @tc.name    setDevicePinCode_callback
     * @tc.desc    Test setDevicePinCode_callback API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("setDevicePinCode_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.setDevicePinCode(deviceId, "12345", (error, data) => {
            if (error) {
              hilog.info(domain, tag, "setDevicePinCode_callback,device name err:" + JSON.stringify(error));
            } else {
              hilog.info(domain, tag, "setDevicePinCode_callback success");
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "setDevicePinCode_callback get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "setDevicePinCode is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  setDevicePinCode_promise
     * @tc.name    setDevicePinCode_promise
     * @tc.desc    Test setDevicePinCode_promise API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("setDevicePinCode_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await connection.setDevicePinCode(deviceId, "12345").then(() => {
            hilog.info(domain, tag, "setDevicePinCode_promise");
          }).catch((err: Error) => {
            hilog.info(domain, tag, "setDevicePinCode_promise error:" + Number(err.code));
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "setDevicePinCode_promise get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "setDevicePinCode is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  testBluetoothTransport
     * @tc.name    testBluetoothTransport
     * @tc.desc    Test testBluetoothTransport API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testBluetoothTransport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let TRANSPORT_BR_EDR = connection.BluetoothTransport.TRANSPORT_BR_EDR;
          let TRANSPORT_LE = connection.BluetoothTransport.TRANSPORT_LE;
          expect(TRANSPORT_BR_EDR).assertEqual(0);
          expect(TRANSPORT_LE).assertEqual(1);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "BluetoothTransport errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number  testScanMode
     * @tc.name    testScanMode
     * @tc.desc    Test testScanMode API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testScanMode", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let SCAN_MODE_NONE = connection.ScanMode.SCAN_MODE_NONE;
        hilog.info(domain, tag, "ScanMode SCAN_MODE_NONE: " + SCAN_MODE_NONE);
        expect(SCAN_MODE_NONE).assertEqual(0);

        let SCAN_MODE_CONNECTABLE = connection.ScanMode.SCAN_MODE_CONNECTABLE;
        hilog.info(domain, tag, "ScanMode SCAN_MODE_CONNECTABLE: " + SCAN_MODE_CONNECTABLE);
        expect(SCAN_MODE_CONNECTABLE).assertEqual(1);

        let SCAN_MODE_GENERAL_DISCOVERABLE = connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE;
        hilog.info(domain, tag, "ScanMode SCAN_MODE_GENERAL_DISCOVERABLE: " + SCAN_MODE_GENERAL_DISCOVERABLE);
        expect(SCAN_MODE_GENERAL_DISCOVERABLE).assertEqual(2);

        let SCAN_MODE_LIMITED_DISCOVERABLE = connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE;
        hilog.info(domain, tag, "ScanMode SCAN_MODE_LIMITED_DISCOVERABLE: " + SCAN_MODE_LIMITED_DISCOVERABLE);
        expect(SCAN_MODE_LIMITED_DISCOVERABLE).assertEqual(3);

        let SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE = connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE;
        hilog.info(domain, tag,
          "ScanMode SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE: " + SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
        expect(SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE).assertEqual(4);

        let SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE = connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE;
        hilog.info(domain, tag,
          "ScanMode SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE: " + SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
        expect(SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE).assertEqual(5);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "testScanMode errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number  testDeviceChargeState
     * @tc.name    testDeviceChargeState
     * @tc.desc    Test testDeviceChargeState API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testDeviceChargeState", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let deviceNormalChargeNotCharged = connection.DeviceChargeState.DEVICE_NORMAL_CHARGE_NOT_CHARGED;
          let deviceNormalChargeInCharging = connection.DeviceChargeState.DEVICE_NORMAL_CHARGE_IN_CHARGING;
          let deviceSuperChargeNotCharged = connection.DeviceChargeState.DEVICE_SUPER_CHARGE_NOT_CHARGED;
          let deviceSuperChargeInCharging = connection.DeviceChargeState.DEVICE_SUPER_CHARGE_IN_CHARGING;
          expect(deviceNormalChargeNotCharged).assertEqual(0);
          expect(deviceNormalChargeInCharging).assertEqual(1);
          expect(deviceSuperChargeNotCharged).assertEqual(2);
          expect(deviceSuperChargeInCharging).assertEqual(3);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "testDeviceChargeState errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number  testUnbondCause
     * @tc.name    testUnbondCause
     * @tc.desc    Test testUnbondCause API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testUnbondCause", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let userRemoved = connection.UnbondCause.USER_REMOVED;
          let remoteDeviceDown = connection.UnbondCause.REMOTE_DEVICE_DOWN;
          let authFailure = connection.UnbondCause.AUTH_FAILURE;
          let authRejected = connection.UnbondCause.AUTH_REJECTED;
          let internalRrror = connection.UnbondCause.INTERNAL_ERROR;
          expect(userRemoved).assertEqual(0);
          expect(remoteDeviceDown).assertEqual(1);
          expect(authFailure).assertEqual(2);
          expect(authRejected).assertEqual(3);
          expect(internalRrror).assertEqual(4);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag, "testUnbondCause errCode:" + err.code + ",errMessage:" + err.message);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number  setDevicePairingConfirmationTest
     * @tc.name    setDevicePairingConfirmationTest
     * @tc.desc    Test setDevicePairingConfirmationTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("setDevicePairingConfirmationTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onPinRequired(onReceivePinRequiredEvent);
          connection.setDevicePairingConfirmation(deviceId, false);
          await Utils.msSleep(2000);
          connection.offPinRequired(onReceivePinRequiredEvent);
          hilog.info(domain, tag, "setDevicePairingConfirmation success");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag,
            "setDevicePairingConfirmation get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  startOrStopBluetoothDiscoveryTest
     * @tc.name    startOrStopBluetoothDiscoveryTest
     * @tc.desc    Test startOrStopBluetoothDiscoveryTest API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("startOrStopBluetoothDiscoveryTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBluetoothDeviceFind(onReceiveEvent2);
          connection.startBluetoothDiscovery();
          await Utils.msSleep(3000);
          connection.offBluetoothDeviceFind(onReceiveEvent2);
          connection.stopBluetoothDiscovery();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag,
            "startOrStopBluetoothDiscoveryTest errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        connection.offBluetoothDeviceFind(onReceiveEvent2);
        done();
      })

    /**
     * @tc.number  pairDeviceTest_callback
     * @tc.name    pairDeviceTest_callback
     * @tc.desc    Test pairDeviceTest_callback API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("pairDeviceTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBondStateChange(BondStateParam);
          connection.pairDevice('11:22:33:44:55:66', (error) => {
            if (error) {
              hilog.info(domain, tag, "pairDevice,device name err:" + JSON.stringify(error));
            } else {
              hilog.info(domain, tag, "pairDevice success");
            }
          });
          expect(connection.BondState.BOND_STATE_INVALID === 0).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDING === 1).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDED === 2).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pairDeviceTest_callback, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "pairDevice is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        connection.offBondStateChange(BondStateParam);
        done();
      })

    /**
     * @tc.number  pairDeviceTest_promise
     * @tc.name    pairDeviceTest_promise
     * @tc.desc    Test pairDeviceTest_promise API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("pairDeviceTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBondStateChange(BondStateParam);
          await connection.pairDevice("11:22:55:66:33:44").then(() => {
            hilog.info(domain, tag, "pairDevice success");
          });
          await Utils.msSleep(900);
          expect(connection.BondState.BOND_STATE_INVALID === 0).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDING === 1).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDED === 2).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pairDeviceTest_promise, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "pairDevice is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        connection.offBondStateChange(BondStateParam);
        done();
      })

    /**
     * @tc.number  testOnBondStateChange
     * @tc.name    testOnBondStateChange
     * @tc.desc    Test testOnBondStateChange API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testOnBondStateChange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBondStateChange(BondStateParam1);
          await connection.pairDevice("11:22:55:66:33:44").then(() => {
            hilog.info(domain, tag, "pairDevice success");
          });
          await Utils.msSleep(900);
          expect(connection.BondState.BOND_STATE_INVALID === 0).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDING === 1).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDED === 2).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pairDeviceTest_promise, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "pairDevice is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        connection.offBondStateChange(BondStateParam1);
        done();
      })

    /**
     * @tc.number  testOnDiscoveryResult
     * @tc.name    testOnDiscoveryResult
     * @tc.desc    Test testOnDiscoveryResult API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testOnDiscoveryResult", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onDiscoveryResult(onReceiveEvent);
          await Utils.msSleep(900);
          connection.offDiscoveryResult(onReceiveEvent);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "testOnDiscoveryResult, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "pairDevice is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number  testBatteryChange
     * @tc.name    testBatteryChange
     * @tc.desc    Test testBatteryChange API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testBatteryChange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBatteryChange(onReceiveEvent1);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "testBatteryChange, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "api is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        try {
          connection.offBatteryChange(onReceiveEvent1);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "testBatteryChange, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "api is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  setDevicePairingConfirmationTest_001
     * @tc.name    setDevicePairingConfirmationTest_001
     * @tc.desc    Test setDevicePairingConfirmationTest_001 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("setDevicePairingConfirmationTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onPinRequired(onReceivePinRequiredEvent);
          connection.setDevicePairingConfirmation(deviceId, false);
          await Utils.msSleep(2000);
          connection.offPinRequired();
          hilog.info(domain, tag, "setDevicePairingConfirmation success");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "get error:" + JSON.stringify(err));
          hilog.info(domain, tag,
            "setDevicePairingConfirmation get errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number  startOrStopBluetoothDiscoveryTest_001
     * @tc.name    startOrStopBluetoothDiscoveryTest_001
     * @tc.desc    Test startOrStopBluetoothDiscoveryTest_001 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("startOrStopBluetoothDiscoveryTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBluetoothDeviceFind(onReceiveEvent2);
          connection.startBluetoothDiscovery();
          await Utils.msSleep(3000);
          connection.offBluetoothDeviceFind();
          connection.stopBluetoothDiscovery();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag,
            "startOrStopBluetoothDiscoveryTest errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, 'api is not support');
            expect(true).assertEqual(err.code === 801);
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        connection.offBluetoothDeviceFind();
        done();
      })

    /**
     * @tc.number  pairDeviceTest_callback_001
     * @tc.name    pairDeviceTest_callback_001
     * @tc.desc    Test pairDeviceTest_callback_001 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("pairDeviceTest_callback_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBondStateChange(BondStateParam);
          connection.pairDevice('11:22:33:44:55:66', (error) => {
            if (error) {
              hilog.info(domain, tag, "pairDevice,device name err:" + JSON.stringify(error));
            } else {
              hilog.info(domain, tag, "pairDevice success");
            }
          });
          expect(connection.BondState.BOND_STATE_INVALID === 0).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDING === 1).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDED === 2).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pairDeviceTest_callback, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "pairDevice is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        connection.offBondStateChange();
        done();
      })

    /**
     * @tc.number  pairDeviceTest_promise_001
     * @tc.name    pairDeviceTest_promise_001
     * @tc.desc    Test pairDeviceTest_promise_001 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("pairDeviceTest_promise_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBondStateChange(BondStateParam);
          await connection.pairDevice("11:22:55:66:33:44").then(() => {
            hilog.info(domain, tag, "pairDevice success");
          });
          await Utils.msSleep(900);
          expect(connection.BondState.BOND_STATE_INVALID === 0).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDING === 1).assertTrue();
          expect(connection.BondState.BOND_STATE_BONDED === 2).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "pairDeviceTest_promise, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "pairDevice is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        connection.offBondStateChange();
        done();
      })

    /**
     * @tc.number  testOnDiscoveryResult_001
     * @tc.name    testOnDiscoveryResult_001
     * @tc.desc    Test testOnDiscoveryResult_001 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testOnDiscoveryResult_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onDiscoveryResult(onReceiveEvent);
          await Utils.msSleep(900);
          connection.offDiscoveryResult();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "testOnDiscoveryResult, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "pairDevice is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number  testBatteryChange_001
     * @tc.name    testBatteryChange_001
     * @tc.desc    Test testBatteryChange_001 API functionality
     * @tc.level   Level 0
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     */
    it("testBatteryChange_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          connection.onBatteryChange(onReceiveEvent1);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "testBatteryChange, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "api is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        try {
          connection.offBatteryChange();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, "testBatteryChange, errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, "api is not support");
            expect(err.code === 801).assertTrue();
          } else {
            expect(Number(err.code)).assertEqual(2900099);
          }
        }
        done();
      })
  })
}