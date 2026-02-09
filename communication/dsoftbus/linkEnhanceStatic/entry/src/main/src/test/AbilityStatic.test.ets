/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from '../../../hypium/index';
import linkEnhance from '@ohos.distributedsched.linkEnhance';
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { common } from '@kit.AbilityKit';
import btAccess from '@ohos.bluetooth.access';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let tag = "[linkEnhance_log]";
let domain: int = 0x0000;
async function driveFn(){
  try {
    let driver: Driver = Driver.create();
    hilog.info(domain, tag, '%{public}s', 'come in driveFn');
    await Utils.msSleep(1000);
    hilog.info(domain, tag, 'come in findComponent');
    let button: Component | null = await driver.findComponent(ON.text('允许'));
    if (button != null) {
      hilog.info(domain, tag, 'button is ${JSON.stringify(button)}');
      await button.click();
    }
    await Utils.msSleep(1000);
    let button2: Component | null = await driver.findComponent(ON.text('允许'));
    await Utils.msSleep(1000);
    if (button2 != null) {
      hilog.info(domain, tag, 'button2 is ${JSON.stringify(button2)}');
      await button2.click();
    }
    await Utils.msSleep(1000);
  } catch (err) {
    hilog.error(domain, tag, "driveFn err is "+ err);
  }
  hilog.error(domain, tag, "come in drivenFn end");
}

async function requestPermission() {
  hilog.error(domain, tag, "come in requestPermission");
  let permissions: Array<Permissions> = new Array<Permissions>();
  permissions.push('ohos.permission.DISTRIBUTED_DATASYNC', 'ohos.permission.ACCESS_BLUETOOTH');
  let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
  let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  atManager.requestPermissionsFromUser(context,["ohos.permission.DISTRIBUTED_DATASYNC", "ohos.permission.ACCESS_BLUETOOTH"],
  (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
    hilog.info(domain, tag, 'data:' + JSON.stringify(data));
    hilog.info(domain, tag, 'data permissions:' + data?.permissions);
    hilog.info(domain, tag, 'data authResults:' + data?.authResults);
    hilog.info(domain, tag, 'data dialogShownResults:' + data?.dialogShownResults);
  })
}

async function clickRequestPermission(text:string) {
  hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission start');
  let driver = Driver.create();
  try {
    let button: Component | null = await driver.findComponent(ON.text(text));
    await Utils.msSleep(1000);
    if (button != null) {
      button.click();
    }
    await Utils.msSleep(1000);
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission end');
  } catch (error) {
    error = error as BusinessError;
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission failed.' + error);
  }
}

async function tryToEnableBt() {
  hilog.error(domain, tag, "tryToEnableBt start");
  let sta : btAccess.BluetoothState = btAccess.getState();
  hilog.info(domain, tag, '[bluetooth_js] bt turn off:' + JSON.stringify(sta));
  switch(sta) {
    case btAccess.BluetoothState.STATE_OFF:
      btAccess.enableBluetooth();
      await Utils.msSleep(5000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await Utils.msSleep(10000);
      let sta1 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turn off1:' + JSON.stringify(sta1));
      break;
    case btAccess.BluetoothState.STATE_TURNING_ON:
    hilog.info(domain, tag, '[bluetooth_js] bt turning on2:' + JSON.stringify(sta));
      await Utils.msSleep(3000);
      break;
    case btAccess.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on3:'+ JSON.stringify(sta));
      break;
    case btAccess.BluetoothState.STATE_TURNING_OFF:
      btAccess.enableBluetooth();
      await Utils.msSleep(3000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await Utils.msSleep(10000);
      let sta2 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turning off4:'+ JSON.stringify(sta2));
      break;
    default:
      hilog.info(domain, tag, '[bluetooth_js] enable success');
  }
}

export default function LinkEnhanceAPI() {
  describe('LinkEnhanceAPI', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      hilog.info(domain, tag, 'getPermission beforeAll');
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.linkenhancetest.static");
      await Utils.msSleep(5000);
      await requestPermission();
      await Utils.msSleep(3000);
      await driveFn();
      await Utils.msSleep(2000);
      await tryToEnableBt()
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'LinkEnhanceAPI end');
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      hilog.info(domain, tag, 'beforeEach start');
      await Utils.msSleep(1000);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      hilog.info(domain, tag, '[bluetooth_js] bt close');
      btAccess.disableBluetooth();
      await Utils.msSleep(5000);
      await clickRequestPermission(CLOSE_BT_TEXT);
    })
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100
     * @tc.desc   linkEnhance.createConnection接口入参deviceid长度为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("","demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 is" + connection);
      }catch (error: BusinessError) {
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 error.message is " + error.message);
        expect(error.code === 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200
     * @tc.desc   linkEnhance.createConnection接口入参deviceid长度为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 is" + connection);
      }catch (error: BusinessError) {
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 error.message is " + error.message);
        expect(error.code === 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300
     * @tc.desc   linkEnhance.createConnection接口入参deviceid为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 is" + connection);
      }catch (error: BusinessError) {
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 error.message is " + error.message);
        expect(error.code === 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400
     * @tc.desc   linkEnhance.createConnection接口入参name长度为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 is" + connection);
      }catch (error: BusinessError) {
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 error.message is " + error.message);
        expect(error.code === 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500
     * @tc.desc   linkEnhance.createConnection接口入参name为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 is" + connection);
      }catch (error: BusinessError) {
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 error.message is " + error.message);
        expect(error.code === 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600
     * @tc.desc   linkEnhance.createConnection接口入参name为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 is" + connection);
      }catch (error) {
        error = error as BusinessError;
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 error.message is " + error.message);
        expect(error.code === 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_connect_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_connect_0100
     * @tc.desc   linkEnhance.connection.connect()接口,createConnection入参deviceid格式错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66:77", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 is" + connection);
        try {
          connection.connect();
        }catch (error) {
          error = error as BusinessError;
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 error.message is " + error.message);
          expect(error.code === 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_connect_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_connect_0200
     * @tc.desc   linkEnhance.connection.connect()接口超过10个限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0200----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 is" + connection);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 conn start");
          for (let i = 0; i < 11; i++) {
            hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 connect i is " + i);
            connection.connect();
          }
        }catch (error) {
          error = error as BusinessError;
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 error.message is " + error.message);
          expect(error.code === 32390204).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          if (connection == null) {
            hilog.info(domain, tag, "connection is null");
          }
          connection.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_connect_0300
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_connect_0300
     * @tc.desc   linkEnhance.connection.connect()接口deviceid为空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0300----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection(" ", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 is" + connection);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 conn start");
          connection.connect();
        }catch (error) {
          error = error as BusinessError;
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 error.message is " + error.message);
          expect(error.code === 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0300----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_connect_0400
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_connect_0400
     * @tc.desc   linkEnhance.connection.connect()接口name为max(255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0400----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstu"
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", name);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 is" + connection);
      }catch (error: BusinessError) {
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 createConnection error.code is:" + error.code);
        expect(error.code === 32390300).assertTrue();
        expect(error.message != null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0400----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_connect_0500
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_connect_0500
     * @tc.desc   linkEnhance.connection.connect()接口name为max+1(256)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connect_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0500----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstuv"
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", name);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 is" + connection);
      }catch (error: BusinessError) {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 createConnection error.code is: " + error.code);
          expect(error.code === 32390206).assertTrue();
          expect(error.message != null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0500----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100
     * @tc.desc   linkEnhance.connection.sendData()接口连接无效发送数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 connection is" + connection);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 sendData start");
          connection.sendData(arraybuffer);
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 error.message is " + error.message);
          expect(error.code === 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200
     * @tc.desc   linkEnhance.connection.sendData()接口连接处于不可用状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 connection is" + connection);
        connection.connect();
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 sendData start");
          connection.sendData(arraybuffer);
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 error.message is " + error.message);
          expect(error.code === 32390205).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
    });
    
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100
     * @tc.desc   linkEnhance.connection.disconnet接口入调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 connection is" + connection);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 disconnect  start");
          connection.disconnect();
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 error.message is " + error.message);
        }finally {
          if(flag == true){
            hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 disconnect fail" +
              ",ecpect fail");
          }
          expect(flag == false).assertTrue();
          connection.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100
     * @tc.desc   linkEnhance.connection.getPeerDeviceId接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 connection is" + connection);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 getPeerDeviceId  start");
          let deviceid = connection.getPeerDeviceId();
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 error.message is " + error.message);
        }finally {
          if(flag == true){
            hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 getPeerDeviceId fail,expect success");
          }
          expect(flag == false).assertTrue();
          connection.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        expect(error.message == null).assertTrue();
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 createConnection error.code is:" + error.code);
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_close_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_close_0100
     * @tc.desc   linkEnhance.connection.close接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_close_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("00:11:22:33:44:55", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 connection is" + connection);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 close start");
          connection.close();
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 error.code is " + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 error.message is " + error.message);
        }finally {
          if(flag == true){
            hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_close_0100 close fail,expect success");
          }
          expect(flag == false).assertTrue();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        expect(error.message == null).assertTrue();
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 createConnection error.code is:" + error.code);
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_close_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100
     * @tc.desc   linkEnhance.createServer接口正在创建的服务名已存在
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 server is" + server);
        try {
          let server1: linkEnhance.Server = linkEnhance.createServer("demo");
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 server1 is" + server1);
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 error.code is:" + error.code);
          expect(error.code === 32390203).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          server.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        expect(error.message == null).assertTrue();
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 createServer error.code is:" + error.code);
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200
     * @tc.desc   linkEnhance.createServer接口入参name为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200 server is" + server);
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200 error.code is:" + error.code);
          expect(error.code === 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          hilog.info(domain, tag, "reclaim done");
        }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300
     * @tc.desc   linkEnhance.createServer接口入参name为空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300 server is" + server);
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300 error.code is:" + error.code);
          expect(error.code === 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          hilog.info(domain, tag, "reclaim done");
        }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400
     * @tc.desc   linkEnhance.createServer接口入参name为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400 server is" + server);
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400 error.code is:" + error.code);
          expect(error.code === 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          hilog.info(domain, tag, "reclaim done");
        }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400----------------");
    });
    
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100
     * @tc.desc   linkEnhance.createServer接口服务个数超过10个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100----------------");
      let flag = false;
      try {
        let server1: linkEnhance.Server = linkEnhance.createServer("demo1");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server1 is" + server1);
        let server2: linkEnhance.Server = linkEnhance.createServer("demo2");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server2 is" + server2);
        let server3: linkEnhance.Server = linkEnhance.createServer("demo3");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server3 is" + server3);
        let server4: linkEnhance.Server = linkEnhance.createServer("demo4");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server4 is" + server4);
        let server5: linkEnhance.Server = linkEnhance.createServer("demo5");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server5 is" + server5);
        let server6: linkEnhance.Server = linkEnhance.createServer("demo6");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server6 is" + server6);
        let server7: linkEnhance.Server = linkEnhance.createServer("demo7");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server7 is" + server7);
        let server8: linkEnhance.Server = linkEnhance.createServer("demo8");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server8 is" + server8);
        let server9: linkEnhance.Server = linkEnhance.createServer("demo9");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server9 is" + server9);
        let server10: linkEnhance.Server = linkEnhance.createServer("demo10");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server10 is" + server10);
        let server11: linkEnhance.Server = linkEnhance.createServer("demo11");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server11 is" + server11);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server1.start");
          server1.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server2.start");
          server2.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server3.start");
          server3.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server4.start");
          server4.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server5.start");
          server5.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server6.start");
          server6.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server7.start");
          server7.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server8.start");
          server8.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server9.start");
          server9.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server10.start");
          server10.start();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server11.start");
          server11.start();
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.message is:" + error.message);
          expect(error.code === 32390202).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 satart success,expect faile");
          }
          expect(flag == true).assertTrue();
          server1.close();
          server2.close();
          server3.close();
          server4.close();
          server5.close();
          server6.close();
          server7.close();
          server8.close();
          server9.close();
          server10.close();
          server11.close();
          hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.message is:" + error.message);
        expect(error.message == null).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200
     * @tc.desc   linkEnhance.createServer接口入参name长度为max(255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyz" + 
        "abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdef" + 
        "ghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistu");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200 server is" + server);
        try {
          server.start();
        }catch (error: BusinessError) {
         flag = true;
         hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200 error.code is:" + error.code);
        }finally {
          server.close();
        expect(flag == false).assertTrue();
        hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError){
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code);
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300
     * @tc.desc   linkEnhance.createServer接口入参name长度为max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyz" + 
        "abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdef" + 
        "ghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuv");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300 server is" + server);
      }catch (error: BusinessError) {
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300 error.code is:" + error.code);
        expect(error.code === 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300 createServer success,expect faile");
        }
        expect(flag == true).assertTrue();
        hilog.info(domain, tag, "reclaim done");
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100
     * @tc.desc   linkEnhance.server.stop接口调用正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 server is" + server);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 server.stop is start");
          server.stop();
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 error.code is:" + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 error.message is:" + error.message);
          }finally {
            if(flag == true){
              hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 stop fail,expect success");
        }
        expect(flag == false).assertTrue();
        server.close();
        hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        expect(error.message == null).assertTrue();
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code); 
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100
     * @tc.desc   linkEnhance.server.close接口正常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 server is" + server);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 server.close is start");
          server.close();
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 error.code is:" + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 error.message is:" + error.message);
          }finally {
            if(flag == true){
              hilog.info(domain, tag, "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 close fail,expect success");
        }
        expect(flag == false).assertTrue();
        hilog.info(domain, tag, "reclaim done");
        }
      }catch (error: BusinessError) {
        expect(error.message == null).assertTrue();
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 error.code is:" + error.code); 
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100
     * @tc.desc   linkEnhance.connection.connectResult接口参数错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100----------------");
      let flag = false;
      let success:boolean = false;
      let reason:number = 0;
      let deviceId = "";
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("00:11:22:33:44:55", "demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 connection is" + connection);
        try {
          hilog.info(domain, tag, '[CALLBACK]clientconnectionChangeStateOnCallback!!!');
          connection.onConnectResult((result:linkEnhance.ConnectResult):void=>{
            hilog.info(domain, tag, '[CALLBACK]clientConnectResultCallback result.success=' + result.success);
            hilog.info(domain, tag, '[CALLBACK]clientConnectResultCallback result.reason=' + result.reason);
            hilog.info(domain, tag, '[CALLBACK]clientConnectResultCallback result.deviceId=' + result.deviceId);
            success = result.success;
            reason = result.reason;
            deviceId = result.deviceId;
            });
          connection.connect();
          await Utils.msSleep(15000);
          expect(success == false).assertTrue();
          expect(reason === 32390200||reason === 32390300).assertTrue();
          expect(deviceId == "00:11:22:33:44:55").assertTrue();
        }catch (error: BusinessError) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 error.code is:" + error.code);
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 error.message is:" + error.message);
          }finally {
          expect(flag == false).assertTrue();
          hilog.info(domain, tag, "reclaim done");
          connection.close();
          }
      }catch (error: BusinessError) {
        expect(error.message == null).assertTrue();
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 createConnection error.code is:" + error.code); 
        }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100----------------");
    });
  })
}  