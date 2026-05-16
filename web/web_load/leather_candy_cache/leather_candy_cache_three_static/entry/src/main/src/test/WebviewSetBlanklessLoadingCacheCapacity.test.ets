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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''

export default function ActsAceWebviewEnableBackForwardCache() {
  describe('ActsAceWebviewEnableBackForwardCache', (): void => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.leathercandycachethreetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
    })



    /**
     * @tc.name   testSetBlanklessLoadingCacheCapacityStatic
     * @tc.number SUB_ACE_WEBVIEW_ENABLEBACKFORWARDCACHE_API_0001
     * @tc.desc   test setBlanklessLoadingCacheCapacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingCacheCapacityStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitSetBlanklessLoadingCacheCapacityStatic001'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetBlanklessLoadingCacheCapacityStatic', 'success', 2603261011, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testEmulateTouchFromMouseEventStatic002
     * @tc.number SUB_ACE_WEBVIEW_EMULATOUCHFROMMOUSE_API_0001
     * @tc.desc   test EmulateTouchFromMouse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEmulateTouchFromMouseEventStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitEmulateTouchFromMouseEventStatic002'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEmulateTouchFromMouseEventStatic002', '17100001', 2630141801, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testRegisterJavaScriptProxyStatic001
     * @tc.number SUB_ACE_WEBVIEW_REGISTERJAVASCRIPTPROXY_API_0001
     * @tc.desc   test RegisterJavaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterJavaScriptProxyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitRegisterJavaScriptProxyStatic001'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRegisterJavaScriptProxyStatic001', "17100001", 260327141, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testRegisterJavaScriptProxyStatic002
     * @tc.number SUB_ACE_WEBVIEW_REGISTERJAVASCRIPTPROXY_API_0002
     * @tc.desc   test RegisterJavaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterJavaScriptProxyStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitRegisterJavaScriptProxyStatic002'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRegisterJavaScriptProxyStatic002', true, 260327142, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testRegisterJavaScriptProxyStatic003
     * @tc.number SUB_ACE_WEBVIEW_REGISTERJAVASCRIPTPROXY_API_0003
     * @tc.desc   test RegisterJavaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterJavaScriptProxyStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitRegisterJavaScriptProxyStatic003'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRegisterJavaScriptProxyStatic003', true, 260327143, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testRegisterJavaScriptProxyStatic004
     * @tc.number SUB_ACE_WEBVIEW_REGISTERJAVASCRIPTPROXY_API_0004
     * @tc.desc   test RegisterJavaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterJavaScriptProxyStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = 'emitRegisterJavaScriptProxyStatic004'
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testRegisterJavaScriptProxyStatic004', true, 260327144, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number SwitchNextPageStatic
     * @tc.desc   SwitchNextPageStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewEnableBackForwardCacheButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })

  })
}
