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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import { Driver } from '@ohos.UiTest'
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;

let emitKey:string = '';

export default function webViewContJavaScriptError() {
  describe('webViewContJavaScriptError', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.logdottingonetest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(500);
      console.info(' beforeEach start');
    })

    /**
     * @tc.name   testRunJavaScriptCallbackInitErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2700
     * @tc.desc   test interface of runJavaScript (callback) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunJavaScriptCallbackInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      emitKey = 'emitRunJavaScriptCallbackInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptCallbackInitErr', 17100001, 652, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testRunJavaScriptPromiseInitErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2800
     * @tc.desc   interface of runJavaScript (promise) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRunJavaScriptPromiseInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = 'emitRunJavaScriptPromiseInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptPromiseInitErr', 17100001, 654, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtCallbackInitErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2900
     * @tc.desc   test interface of runJavaScriptExt (callback) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRunJavaScriptExtCallbackInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = 'emitRunJavaScriptExtCallbackInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptExtCallbackInitErr', 17100001, 656, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtPromiseInitErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3000
     * @tc.desc   test interface of runJavaScriptExt (promise) with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRunJavaScriptExtPromiseInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = 'emitRunJavaScriptExtPromiseInitErr';
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testRunJavaScriptExtPromiseInitErr', 17100001, 658, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContJavaScriptError', 10, '');
      await Utils.msSleep(6000);
      done();
    })
  })
}
