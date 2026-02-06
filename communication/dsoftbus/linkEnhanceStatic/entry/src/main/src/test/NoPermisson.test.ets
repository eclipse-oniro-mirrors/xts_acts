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
'use static'
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

let tag = "[linkEnhance_log]";
let domain: int = 0x0000;
export default function LinkEnhanceNoPermissionAPI() {
  describe('LinkEnhanceNoPermissionAPI', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(async () => {
    })
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100
     * @tc.desc   linkEnhance.createConnection接口未申请权限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Connection = linkEnhance.createConnection("00:11:22:33:44:55","demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100 is" + connection);
      }catch (error) {
        error = error as BusinessError;
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100 error.message is " + error.message);
        expect(error.code === 201).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100 createConnection success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_No_Permission_0100----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200
     * @tc.number SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200
     * @tc.desc   linkEnhance.createServer接口未申请权限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200----------------");
      let flag = false;
      try {
        let connection: linkEnhance.Server = linkEnhance.createServer("demo");
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200 is" + connection);
      }catch (error) {
        error = error as BusinessError;
        flag = true;
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200 error.code is " + error.code);
        hilog.info(domain, tag, "SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200 error.message is " + error.message);
        expect(error.code === 201).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        if(flag == false){
          hilog.error(domain, tag, "[ERROR] SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200 createServer success" +
            ",ecpect fail");
        }
        expect(flag == true).assertTrue();
      }
      hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_linkEnhance_No_Permission_0200----------------");
    });
  })
}