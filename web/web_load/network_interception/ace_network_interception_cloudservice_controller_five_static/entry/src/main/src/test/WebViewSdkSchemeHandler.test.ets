/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebViewSdkSchemeHandler() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptioncloudservicecontrollerfivetest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error: Error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_getHeader
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getHeader_API_0001
     * @tc.desc   test SdkSchemeHandler_getHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_getHeader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewSdkSchemeHandler_getHeader', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getHeader", true, 1501, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_getRequestUrl
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getRequestUrl_API_0001
     * @tc.desc   test SdkSchemeHandler_getRequestUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_getRequestUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewSdkSchemeHandler_getRequestUrl', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getRequestUrl", true, 1502, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(4000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_getRequestMethod
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getRequestMethod_API_0001
     * @tc.desc   test SdkSchemeHandler_getRequestMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_getRequestMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewSdkSchemeHandler_getRequestMethod', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getRequestMethod", true, 1503, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(4000);
      done();
    })


    /**
     * @tc.name   testWebViewSdkSchemeHandler_getReferrer
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_getReferrer_API_0001
     * @tc.desc   test SdkSchemeHandler_getReferrer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_getReferrer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewSdkSchemeHandler_getReferrer', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSdkSchemeHandler_getReferrer", true, 1504, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(4000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_isMainFrame
     * @tc.number SUB_ACE_WEB_isMainFrame_API_0001
     * @tc.desc   test isMainFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_isMainFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewSdkSchemeHandler_isMainFrame', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSdkSchemeHandler_isMainFrame", true, 1505, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(4000);
      done();
    })
    /**
     * @tc.name   testWebViewSdkSchemeHandler_hasGesture
     * @tc.number SUB_ACE_WEB_hasGesture_API_0001
     * @tc.desc   test hasGesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewSdkSchemeHandler_hasGesture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewSdkSchemeHandler_hasGesture', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewSdkSchemeHandler_hasGesture", true, 1506, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number SwitchNextPageStatic
     * @tc.desc   SwitchNextPageStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
        await Utils.msSleep(2000);
        done()
      })
  })
}
