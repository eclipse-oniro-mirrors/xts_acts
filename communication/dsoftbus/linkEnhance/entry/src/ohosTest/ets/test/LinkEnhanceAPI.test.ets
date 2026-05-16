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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import linkEnhance from '@ohos.distributedsched.linkEnhance';
import { Driver, ON } from '@ohos.UiTest';
import abilityAccessCtrl ,{ Permissions } from '@ohos.abilityAccessCtrl';
import {common} from '@kit.AbilityKit';
import btAccess from '@ohos.bluetooth.access';

let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";

let logTag = "[linkEnhance_log]";
async function sleep(ms:number): Promise<void>{
  return new Promise(resolve => setTimeout(resolve, ms));
}
async function driveFn(){
  try {
    let driver: Driver = await Driver.create();
    console.info(logTag + "come in driveFn")
    console.info(logTag + `driver is ${JSON.stringify(driver)}`);
    await sleep(1000);
    console.info(logTag + "come in findComponent");
    let button = await driver.findComponent(ON.text('允许'));
    console.info(logTag + `button is ${JSON.stringify(button)}`);
    await sleep(1000);
    await button.click();
    await sleep(1000);
    let button2 = await driver.findComponent(ON.text('允许'));
    console.info(logTag + `button2 is ${JSON.stringify(button2)}`);
    await sleep(1000);
    await button2.click();
    await sleep(1000);
  }catch (err){
    console.error(logTag + "driveFn err is "+ err);
    return;
  }
}
async function requestPermission(){
  let permissions: Array<Permissions> = ["ohos.permission.DISTRIBUTED_DATASYNC","ohos.permission.ACCESS_BLUETOOTH"];
  let context:common.UIAbilityContext | undefined = AppStorage.get("context") as common.UIAbilityContext;
  console.info(logTag + "context is " + context);
  let atManager:abilityAccessCtrl.AtManager =
    abilityAccessCtrl.createAtManager();
  atManager.requestPermissionsFromUser(context, permissions).then((data) => {
    console.info("request success" + JSON.stringify(data));
  })
}
async function clickRequestPermission(text:string) {
  console.info(logTag +'[bluetooth_js] clickRequestPermission start');
  let driver = await Driver.create();
  try {
    let button = await driver.findComponent(ON.text(text));
    await sleep(1000);
    await button.click();
    await sleep(1000);
    console.info(logTag +'[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    console.info(logTag +'[bluetooth_js] clickRequestPermission failed. ' + err);
  }
}
async function tryToEnableBt() {
  let sta = btAccess.getState();
  console.info(logTag +'[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
  switch(sta){
    case 0:
      btAccess.enableBluetooth();
      await sleep(5000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      console.info(logTag +'[bluetooth_js] bt turn off1:'+ JSON.stringify(sta1));
      break;
    case 1:
      console.info(logTag +'[bluetooth_js] bt turning on2:'+ JSON.stringify(sta));
      await sleep(3000);
      break;
    case 2:
      console.info(logTag +'[bluetooth_js] bt turn on3:'+ JSON.stringify(sta));
      break;
    case 3:
      btAccess.enableBluetooth();
      await sleep(3000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      console.info(logTag +'[bluetooth_js] bt turning off4:'+ JSON.stringify(sta2));
      break;
    default:
      console.info(logTag +'[bluetooth_js] enable success');
  }
}

export default function LinkEnhanceAPI() {
  describe('LinkEnhanceAPI', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      console.info('getPermission beforeAll');
      await requestPermission();
      await sleep(1000);
      await driveFn();
      await sleep(1000);
      await tryToEnableBt()
      await sleep(1000);
      done();
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async (done: Function) => {
      console.info(logTag +'[bluetooth_js] bt close');
      btAccess.disableBluetooth();
      await sleep(5000);
      await clickRequestPermission(CLOSE_BT_TEXT);
      done();
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("","demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection(null, "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0200----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection(undefined, "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0300----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0400----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", null);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0500----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", undefined);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 error.message is " + error.message);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0600----------------");
    });


    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700
     * @tc.desc   linkEnhance.createConnection接口入参name为min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "a");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700 error.message is " + error.message);
      }finally {
        if(flag == true){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == false).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0700----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800
     * @tc.desc   linkEnhance.createConnection接口入参name为max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstu";
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", name);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800 error.message is " + error.message);
      }finally {
        if(flag == true){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == false).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createConnection_0800----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66:77", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 is" + connection);
        try {
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 error.message is " + error.message);
          expect(error.code == 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0200----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 conn start");
          for (let i = 0; i < 11; i++) {
            console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 connect i is " + i);
            connection.connect();
          }
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 error.message is " + error.message);
          expect(error.code == 32390204).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0200----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0300----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection(" ", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 conn start");
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 error.message is " + error.message);
          expect(error.code == 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0300 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0300----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0400----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstu"
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", name);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 conn start");
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 error.message is " + error.message);
          expect(error.code == 32390300).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == false).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0400 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0400----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connect_0500----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstuv"
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", name);
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 conn start");
          connection.connect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connect_0500 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connect_0500----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 sendData start");
          connection.sendData(arraybuffer);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 connection is" + connection);
        connection.connect();
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 sendData start");
          connection.sendData(arraybuffer);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 error.message is " + error.message);
          expect(error.code == 32390205).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100
     * @tc.desc   linkEnhance.connection.on(type:'connectResult')接口入参callback为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 connect_on  start");
          connection.on('connectResult',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_sendData_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200
     * @tc.desc   linkEnhance.connection.on(type:'disconnected')接口入参callback为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 connect_on  start");
          connection.on('disconnected',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300
     * @tc.desc   linkEnhance.connection.on(type:'dataReceived')接口入参callback为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 connect_on  start");
          connection.on('dataReceived',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOn_0300----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100
     * @tc.desc   linkEnhance.connection.off(type:'connectResult')接口入参callback为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 connect_on  start");
          connection.off('connectResult',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200
     * @tc.desc   linkEnhance.connection.off(type:'disconnected')接口入参callback为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 connect_on  start");
          connection.off('disconnected',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300
     * @tc.desc   linkEnhance.connection.off(type:'dataReceived')接口入参callback为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300----------------");
      let flag = false;
      let arraybuffer = new ArrayBuffer(10);
      console.info(logTag +"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 dataLength" + arraybuffer.byteLength);
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 connect_on  start");
          connection.off('dataReceived',null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 error.message is " + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 createConnection success" +
              ",ecpect fail");
          }
          expect(flag == true).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_ConnectionOff_0300----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 connection is" + connection);
        try {
          console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 disconnect  start");
          connection.disconnect();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 error.message is " + error.message);
        }finally {
          if(flag == true){
            console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 disconnect fail" +
              ",ecpect fail");
          }
          expect(flag == false).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100 createConnection error.code is:" + error.code);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_disconnect_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66", "demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 connection is" + connection);
        try {
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 getPeerDeviceId  start");
          let deviceid = connection.getPeerDeviceId();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 error.message is " + error.message);
        }finally {
          if(flag == true){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 getPeerDeviceId fail,expect success");
          }
          expect(flag == false).assertTrue();
          connection.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100 createConnection error.code is:" + error.code);
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_getPeerDeviceId_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_close_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("00:11:22:33:44:55", "demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 connection is" + connection);
        try {
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 close start");
          connection.close();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 error.code is " + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 error.message is " + error.message);
        }finally {
          if(flag == true){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_close_0100 close fail,expect success");
          }
          expect(flag == false).assertTrue();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_close_0100 createConnection error.code is:" + error.code);
        }
        console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_close_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 server is" + server);
        try {
          let server1: linkEnhance.Server = linkEnhance.createServer("demo");
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 server1 is" + server1);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 error.code is:" + error.code);
          expect(error.code == 32390203).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          server.close();
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100 createServer error.code is:" + error.code);
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer(null);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200 server is" + server);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200 error.code is:" + error.code);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          console.info(logTag + "reclaim done");
        }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0200----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300 server is" + server);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300 error.code is:" + error.code);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          console.info(logTag + "reclaim done");
        }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0300----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer(undefined);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400 server is" + server);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400 error.code is:" + error.code);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400 createServer success,expect faile");
          }
          expect(flag == true).assertTrue();
          console.info(logTag + "reclaim done");
        }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0400----------------");
    });
     /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500
     * @tc.desc   linkEnhance.createServer接口入参name长度为min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("a");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500 server is" + server);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500 error.code is:" + error.code);
        }finally {
          if(flag == true){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500 createServer success,expect faile");
          }
          expect(flag == false).assertTrue();
          console.info(logTag + "reclaim done");
        }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0500----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600
     * @tc.desc   linkEnhance.createServer接口入参name长度为max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600----------------");
      let flag = false;
      let name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw" +
        "xyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc" +
        "defghijklmnopqrstuvwxyzabcdefghijklmnopqrstu";
      try {
        let server: linkEnhance.Server = linkEnhance.createServer(name);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600 server is" + server);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600 error.code is:" + error.code);
        }finally {
          if(flag == true){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600 createServer success,expect faile");
          }
          expect(flag == false).assertTrue();
          console.info(logTag + "reclaim done");
        }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0600----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100
     * @tc.desc   linkEnhance.on(type: 'connectionAccepted')接口回调为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100 server is" + server);
        try {
          server.on('connectionAccepted', null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100 error.code is:" + error.code);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100 on(type: 'connectionAccepted') success,expect faile");
          }
          expect(flag == true).assertTrue();
          server.close();
          console.info(logTag + "reclaim done");
          }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100 createServer error.code is:" + error.code);
    }
    console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200
     * @tc.desc   linkEnhance.on(type: 'serverStopped')接口回调为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200 server is" + server);
        try {
          server.on('serverStopped', null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200 error.code is:" + error.code);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200 on(type: 'serverStopped') success,expect faile");
          }
          expect(flag == true).assertTrue();
          server.close();
          console.info(logTag + "reclaim done");
          }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200 createServer error.code is:" + error.code);
    }
    console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_serverOn_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100
     * @tc.desc   linkEnhance.off(type: 'connectionAccepted')接口回调为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100 server is" + server);
        try {
          server.off('connectionAccepted', null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100 error.code is:" + error.code);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100 off(type: 'connectionAccepted') success,expect faile");
          }
          expect(flag == true).assertTrue();
          server.close();
          console.info(logTag + "reclaim done");
          }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100 createServer error.code is:" + error.code);
    }
    console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200
     * @tc.desc   linkEnhance.off(type: 'serverStopped')接口回调为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200 server is" + server);
        try {
          server.off('serverStopped', null);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200 error.code is:" + error.code);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200 off(type: 'serverStopped') success,expect faile");
          }
          expect(flag == true).assertTrue();
          server.close();
          console.info(logTag + "reclaim done");
          }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200 createServer error.code is:" + error.code);
    }
    console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0200----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300
     * @tc.desc   linkEnhance.off(type: 'serverStopped')接口回调为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300 server is" + server);
        try {
          server.off('serverStopped', undefined);
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300 error.code is:" + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300 error.message is:" + error.message);
          expect(error.code == 32390206).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300 off(type: 'serverStopped') success,expect faile");
          }
          expect(flag == true).assertTrue();
          server.close();
          console.info(logTag + "reclaim done");
          }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300 createServer error.code is:" + error.code);
    }
    console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_serverOff_0300----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100----------------");
      let flag = false;
      try {
        let server1: linkEnhance.Server = linkEnhance.createServer("demo1");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server1 is" + server1);
        let server2: linkEnhance.Server = linkEnhance.createServer("demo2");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server2 is" + server2);
        let server3: linkEnhance.Server = linkEnhance.createServer("demo3");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server3 is" + server3);
        let server4: linkEnhance.Server = linkEnhance.createServer("demo4");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server4 is" + server4);
        let server5: linkEnhance.Server = linkEnhance.createServer("demo5");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server5 is" + server5);
        let server6: linkEnhance.Server = linkEnhance.createServer("demo6");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server6 is" + server6);
        let server7: linkEnhance.Server = linkEnhance.createServer("demo7");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server7 is" + server7);
        let server8: linkEnhance.Server = linkEnhance.createServer("demo8");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server8 is" + server8);
        let server9: linkEnhance.Server = linkEnhance.createServer("demo9");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server9 is" + server9);
        let server10: linkEnhance.Server = linkEnhance.createServer("demo10");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server10 is" + server10);
        let server11: linkEnhance.Server = linkEnhance.createServer("demo11");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server11 is" + server11);
        try {
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server1.start");
          server1.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server2.start");
          server2.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server3.start");
          server3.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server4.start");
          server4.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server5.start");
          server5.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server6.start");
          server6.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server7.start");
          server7.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server8.start");
          server8.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server9.start");
          server9.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server10.start");
          server10.start();
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 server11.start");
          server11.start();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.message is:" + error.message);
          expect(error.code == 32390202).assertTrue();
          expect(error.message != null).assertTrue();
        }finally {
          if(flag == false){
            console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 satart success,expect faile");
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
          console.info(logTag + "reclaim done");
        }
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.message is:" + error.message);
        expect(error.message == null).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyz" + 
        "abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdef" + 
        "ghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistu");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200 server is" + server);
        try {
          server.start();
        }catch (error) {
         flag = true;
         console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200 error.code is:" + error.code);
        }finally {
          server.close();
        expect(flag == false).assertTrue();
        console.info(logTag + "reclaim done");
        }
      }catch (error){
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code);
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_start_0200----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyz" + 
        "abcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdef" + 
        "ghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuvwxyzabcdefghijklmnopqistuv");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300 server is" + server);
        server.start();
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300 error.code is:" + error.code);
        expect(error.code == 32390206).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300 createServer success,expect faile");
        }
        expect(flag == true).assertTrue();
        console.info(logTag + "reclaim done");
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_start_0300----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 server is" + server);
        try {
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 server.stop is start");
          server.stop();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 error.code is:" + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 error.message is:" + error.message);
          }finally {
            if(flag == true){
              console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100 stop fail,expect success");
        }
        expect(flag == false).assertTrue();
        server.close();
        console.info(logTag + "reclaim done");
        }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_start_0100 error.code is:" + error.code); 
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_stop_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 server is" + server);
        try {
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 server.close is start");
          server.close();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 error.code is:" + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 error.message is:" + error.message);
          }finally {
            if(flag == true){
              console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 close fail,expect success");
        }
        expect(flag == false).assertTrue();
        console.info(logTag + "reclaim done");
        }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100 error.code is:" + error.code); 
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_server_close_0100----------------");
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
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100----------------");
      let flag = false;
      let success:boolean = false;
      let reason:number = 0;
      let deviceId = "";
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("00:11:22:33:44:55", "demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 connection is" + connection);
        try {
          console.info(logTag + '[CALLBACK]clientconnectionChangeStateOnCallback!!!');
          connection.on('connectResult',(result:linkEnhance.ConnectResult):void=>{
            console.info(logTag + '[CALLBACK]clientConnectResultCallback result.success=' + result.success);
            console.info(logTag + '[CALLBACK]clientConnectResultCallback result.reason=' + result.reason);
            console.info(logTag + '[CALLBACK]clientConnectResultCallback result.deviceId=' + result.deviceId);
            success = result.success;
            reason = result.reason;
            deviceId = result.deviceId;
            });
          connection.connect();
          await sleep(25000);
          expect(success == false).assertTrue();
          expect(reason == 32390200||reason == 32390300).assertTrue();
          expect(deviceId == "00:11:22:33:44:55").assertTrue();
        }catch (error) {
          flag = true;
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 error.code is:" + error.code);
          console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 error.message is:" + error.message);
          }finally {
          expect(flag == false).assertTrue();
          console.info(logTag + "reclaim done");
          connection.close();
          }
      }catch (error) {
        expect(error.message == null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100 createConnection error.code is:" + error.code); 
        }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_connectResult_0100----------------");
    });
  })
}