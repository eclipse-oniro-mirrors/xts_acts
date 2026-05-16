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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function webViewControllerPart3Test() {
  describe('WebViewControllerPart3', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.injectjavascriptonetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /**
     * @tc.name        javaScriptProxyTestStatic001
     * @tc.number      SUB_WEB_JAVASCRIPTPROXY_0100
     * @tc.desc        test javaScriptProxy
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('javaScriptProxyTestStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("javaScriptProxyTest001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("javaScriptProxyTest001", '"hello word"', 20260313, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name        javaScriptProxyTestStatic002
     * @tc.number      SUB_WEB_JAVASCRIPTPROXY_0200
     * @tc.desc        test javaScriptProxy
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('javaScriptProxyTestStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("javaScriptProxyTest002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("javaScriptProxyTest002", '"HELLO WORD"', 20260314, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name        javaScriptProxyTestStatic003
     * @tc.number      SUB_WEB_JAVASCRIPTPROXY_0300
     * @tc.desc        test javaScriptProxy
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('javaScriptProxyTestStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("javaScriptProxyTest003", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("javaScriptProxyTest003", '"hello word"', 20260315, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
