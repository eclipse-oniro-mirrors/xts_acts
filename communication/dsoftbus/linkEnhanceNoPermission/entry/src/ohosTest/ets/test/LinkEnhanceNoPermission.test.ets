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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import linkEnhance from '@ohos.distributedsched.linkEnhance';
import { BusinessError } from '@kit.BasicServicesKit';
import { common, Permissions } from '@kit.AbilityKit';
import { Driver, ON } from '@ohos.UiTest';
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let logTag = "[linkEnhance_log:]";
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
  }catch (err){
    console.error(logTag + "driveFn err is "+ err);
    return;
  }
}

const ExpectTrue = (n: boolean) => {
  try{
    expect(n).assertTrue();
  }catch (err) {
    console.info("expectInfo", 'test failed');
  }
}

async function sleep(ms:number): Promise<void>{
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function LinkEnhanceNoPermission() {
  describe('LinkEnhanceNoPermission', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
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
    afterAll(() => {
      // Presets a clear action, which is performed after all test case of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100
     * @tc.desc   linkEnhance.createConnection接口权限校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("11:22:33:44:55:66","demo");
        console.info(logTag+"SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100 is" + connection);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100 error.message is " + error.message);
        expect(error.code == 201).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          console.error(logTag + "[ERROR] SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
        console.info(logTag + "reclaim done");
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_noPermission_createConnection_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100
     * @tc.desc   linkEnhance.createServer接口权限校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100----------------");
      let flag = false;
      try {
        let server: linkEnhance.Server = linkEnhance.createServer("demo");
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100 server is" + server);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100 error.code is:" + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100 error.message is:" + error.message);
        ExpectTrue(error.code == 201);
        ExpectTrue(error.message != null);
      }finally {
        if(flag == false){
          console.info(logTag + "[ERROR]SUB_DSoftbus_Trans_linkEnhance_noPermission_createServer_0100 createServer success,expect faile");
        }
        expect(flag == true).assertTrue();
        console.info(logTag + "reclaim done");
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_linkEnhance_API_createServer_0100----------------");
    });
  })
}