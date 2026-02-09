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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;

export default function webViewControllerErrorCodeSecond() {

  describe('WebViewControllerErrorCodeSecondTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.logdottingtwotest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /*
    * @tc.number     : SUB_WEB_GETDEFAULTUSERAGENT_0100
    * @tc.name       : testGetDefaultUserAgentStatic001
    * @tc.desc       : test getDefaultUserAgent
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testGetDefaultUserAgentStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGetDefaultUserAgent001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetDefaultUserAgent001", true, 202503209, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerErrorCodeSecondButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /*
     *@tc.number  :SUB_ACE_WEB_WebHttpBodyStream_READ_0100
     *@tc.name  :testWebView_WebHttpBodyStream_READ
     *@tc.desc  :test WebView_WebHttpBodyStream_READ
     *@tc.size  :MediumTest
     *@tc.type  :Function
     *@tc.level  :Level 3
     */
    it('testWebView_WebHttpBodyStream_READ', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitWebView_WebHttpBodyStream_READ", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebView_WebHttpBodyStream_READ", true, 1555, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerErrorCodeSecondButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /*
      * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0500
      * @tc.name       : SwitchNextPageStatic
      * @tc.desc       : test PAGE_REDIRECT
      * @tc.size       : MEDIUM
      * @tc.type       : Function
      * @tc.level      : Level 3
      */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebViewControllerErrorCodeSecondButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
