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
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{ BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext:common.UIAbilityContext;
export default function webviewNetworkProxy() {

  describe('webviewNetworkProxyTest', () => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actswebnetworkproxytest.static")
      await Utils.msSleep(4000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name   testNetworkProxySchemeFilterMatchAllSchemes
     * @tc.number SUB_WEB_NETWORKPROXY_0100
     * @tc.desc   test ProxySchemeFilter MATCH_ALL_SCHEMES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkProxySchemeFilterMatchAllSchemes',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      await Utils.msSleep(3000);
      Utils.emitEvent('testNetworkProxySchemeFilterMatchAllSchemes', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchAllSchemes', true, 202502181, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testNetworkProxySchemeFilterMatchHttp
     * @tc.number SUB_WEB_NETWORKPROXY_0200
     * @tc.desc   test ProxySchemeFilter MATCH_HTTP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkProxySchemeFilterMatchHttp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchHttp', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchHttp', true, 202502182, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testNetworkProxySchemeFilterMatchHttps
     * @tc.number SUB_WEB_NETWORKPROXY_0300
     * @tc.desc   test ProxySchemeFilter MATCH_HTTPS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkProxySchemeFilterMatchHttps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testNetworkProxySchemeFilterMatchHttps', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testNetworkProxySchemeFilterMatchHttps', true, 202502183, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testInsertProxyRule
     * @tc.number SUB_WEB_NETWORKPROXY_0400
     * @tc.desc   test insertProxyRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInsertProxyRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testInsertProxyRule', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testInsertProxyRule', true, 202502184, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testInsertDirectRule
     * @tc.number SUB_WEB_NETWORKPROXY_0500
     * @tc.desc   test insertDirectRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInsertDirectRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testInsertDirectRule', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testInsertDirectRule', true, 202502185, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testInsertBypassRule
     * @tc.number SUB_WEB_NETWORKPROXY_0600
     * @tc.desc   test insertBypassRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInsertBypassRule',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testInsertBypassRule', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testInsertBypassRule', true, 202502186, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testBypassHostnamesWithoutPeriod
     * @tc.number SUB_WEB_NETWORKPROXY_0700
     * @tc.desc   test bypassHostnamesWithoutPeriod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBypassHostnamesWithoutPeriod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testBypassHostnamesWithoutPeriod', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testBypassHostnamesWithoutPeriod', true, 202502187, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testClearImplicitRules
     * @tc.number SUB_WEB_NETWORKPROXY_0800
     * @tc.desc   test clearImplicitRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearImplicitRules',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testClearImplicitRules', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testClearImplicitRules', true, 202502188, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testEnableReverseBypass
     * @tc.number SUB_WEB_NETWORKPROXY_0900
     * @tc.desc   test enableReverseBypass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEnableReverseBypass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testEnableReverseBypass', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testEnableReverseBypass', true, 202502189, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetBypassRules
     * @tc.number SUB_WEB_NETWORKPROXY_1000
     * @tc.desc   test getBypassRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetBypassRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testGetBypassRules', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testGetBypassRules', true, 202502190, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetProxyRules
     * @tc.number SUB_WEB_NETWORKPROXY_1100
     * @tc.desc   test getProxyRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetProxyRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>   {
      Utils.emitEvent('testGetProxyRules', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testGetProxyRules', true, 202502191, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testIsReverseBypassEnabled
     * @tc.number SUB_WEB_NETWORKPROXY_1200
     * @tc.desc   test isReverseBypassEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsReverseBypassEnabled',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      Utils.emitEvent('testIsReverseBypassEnabled', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testIsReverseBypassEnabled', false, 202502192, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetSchemeFilter
     * @tc.number SUB_WEB_NETWORKPROXY_1300
     * @tc.desc   test getSchemeFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetSchemeFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      Utils.emitEvent('testGetSchemeFilter', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testGetSchemeFilter', true, 202502193, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testProxyGetUrl
     * @tc.number SUB_WEB_NETWORKPROXY_1300
     * @tc.desc   test getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testProxyGetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      Utils.emitEvent('testProxyGetUrl', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testProxyGetUrl', true, 202502194, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testApplyProxyOverride
     * @tc.number SUB_WEB_NETWORKPROXY_1500
     * @tc.desc   test applyProxyOverride
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApplyProxyOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      Utils.emitEvent('testApplyProxyOverride', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testApplyProxyOverride', true, 202502195, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testRemoveProxyOverride
     * @tc.number SUB_WEB_NETWORKPROXY_1600
     * @tc.desc   test removeProxyOverride
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveProxyOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> =>  {
      Utils.emitEvent('testRemoveProxyOverride', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testRemoveProxyOverride', true, 202502196, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number emitonSwitchNextPage
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitonSwitchNextPage', 10);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('networkProxyButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
   })
}
