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
let g_context: common.UIAbilityContext;

export default function bluetoothConnectionTest() {

  describe("bluetoothConnectionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
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
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.msSleep(2000);
      await Utils.clickRequestPermission('允许');
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      try {
        await Utils.openBluetooth();
        hilog.info(domain, tag, '%{public}s', 'beforeEach end');
      } catch (err) {
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
    it("getRemoteDeviceNameTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let name: string = connection.getRemoteDeviceName("00:11:22:33:44:55");
        hilog.info(domain, tag, "getRemoteDeviceName:" + name);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("getRemoteDeviceNameAliasTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let aliasName: string = connection.getRemoteDeviceName("00:11:22:33:44:55", true);
        hilog.info(domain, tag, "getRemoteDeviceName alias is true:" + aliasName);
        let aliasNames: string = connection.getRemoteDeviceName("00:11:22:33:44:55", false);
        hilog.info(domain, tag, "getRemoteDeviceName alias is false:" + aliasNames);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getRemoteDeviceName alias get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("getRemoteDeviceClassTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let deviceClass: connection.DeviceClass = connection.getRemoteDeviceClass("00:11:22:33:44:55");
        hilog.info(domain, tag, "getRemoteDeviceClass result:" + JSON.stringify(deviceClass));
        hilog.info(domain, tag, "getRemoteDeviceClass result majorClass:" + JSON.stringify(deviceClass.majorClass));
        hilog.info(domain, tag, "getRemoteDeviceClass result majorMinorClass:" + JSON.stringify(deviceClass.majorMinorClass));
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getRemoteDeviceClass get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("setBluetoothScanModeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "setBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("getPairedDevicesTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let devices: Array<string> = connection.getPairedDevices();
        hilog.info(domain, tag, "getPairedDevices result:" + JSON.stringify(devices));
        expect(true).assertEqual(devices != null);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("connectionConstantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let BOND_STATE_BONDED: connection.BondState = connection.BondState.BOND_STATE_BONDED;
        hilog.info(domain, tag, "BOND_STATE_BONDED:" + BOND_STATE_BONDED);
        expect(true).assertEqual(BOND_STATE_BONDED == 2);
        let SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE: connection.ScanMode = connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE;
        hilog.info(domain, tag, "SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE:" + SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
        expect(true).assertEqual(SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE == 4);
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
    it("bluetoothDeviceFindTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: Array<string>) => void = (changeInfo: Array<string>) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo bluetoothDeviceFind:" + changeInfo);
      }
      try{
        connection.onBluetoothDeviceFind(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bluetoothDeviceFind on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offBluetoothDeviceFind();
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bluetoothDeviceFind off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("bluetoothDeviceFindTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: Array<string>) => void = (changeInfo: Array<string>) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo bluetoothDeviceFind:" + changeInfo);
      }
      try{
        connection.onBluetoothDeviceFind(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bluetoothDeviceFind on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offBluetoothDeviceFind(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bluetoothDeviceFind off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("discoveryResultTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: Array<connection.DiscoveryResult>) => void = (changeInfo: Array<connection.DiscoveryResult>) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo discoveryResult:" + changeInfo);
        hilog.info(domain, tag, "onReceiveEvent changeInfo discoveryResult deviceId:" + changeInfo[0].deviceId);
      }
      try{
        connection.onDiscoveryResult(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "discoveryResult on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offDiscoveryResult();
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "discoveryResult off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("discoveryResultTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: Array<connection.DiscoveryResult>) => void = (changeInfo: Array<connection.DiscoveryResult>) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo discoveryResult:" + changeInfo);
      }
      try{
        connection.onDiscoveryResult(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "discoveryResult on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offDiscoveryResult(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "discoveryResult off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("bondStateChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: connection.BondStateParam) => void = (changeInfo: connection.BondStateParam) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange:" + changeInfo);
        hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange deviceId:" + changeInfo.deviceId);
        hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange state:" + changeInfo.state);
      }
      try{
        connection.onBondStateChange(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bondStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offBondStateChange();
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bondStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("bondStateChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: connection.BondStateParam) => void = (changeInfo: connection.BondStateParam) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo bondStateChange:" + changeInfo);
      }
      try{
        connection.onBondStateChange(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bondStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offBondStateChange(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "bondStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("pinRequiredTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: connection.PinRequiredParam) => void = (changeInfo: connection.PinRequiredParam) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo pinRequired:" + changeInfo);
        hilog.info(domain, tag, "onReceiveEvent changeInfo pinRequired deviceId:" + changeInfo.deviceId);
      }
      try{
        connection.onPinRequired(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "pinRequired on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offPinRequired();
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "pinRequired off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("pinRequiredTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: connection.PinRequiredParam) => void = (changeInfo: connection.PinRequiredParam) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo pinRequired:" + changeInfo);
      }
      try{
        connection.onPinRequired(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "pinRequired on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offPinRequired(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "pinRequired off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("batteryChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: connection.BatteryInfo) => void = (changeInfo: connection.BatteryInfo) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo batteryChange:" + changeInfo);
        hilog.info(domain, tag, "onReceiveEvent changeInfo batteryChange deviceId:" + changeInfo.deviceId);
      }
      try{
        connection.onBatteryChange(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "batteryChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offBatteryChange();
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "batteryChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
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
    it("batteryChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: connection.BatteryInfo) => void = (changeInfo: connection.BatteryInfo) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo batteryChange:" + changeInfo);
      }
      try{
        connection.onBatteryChange(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "batteryChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        connection.offBatteryChange(onReceiveEvent);
      }catch(err){
        err = err as BusinessError;
        hilog.info(domain, tag, "batteryChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code == 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(true).assertEqual(err.code == 801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })
  })
}