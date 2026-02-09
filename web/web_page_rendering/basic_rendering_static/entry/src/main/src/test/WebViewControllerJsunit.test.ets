/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Level, Size, TestType, beforeAll, describe, beforeEach, afterEach, it } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;
let emitKey = 'emitGetWebId';

export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.basicrenderingtest.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    afterEach(async () => {
      console.info('web afterEach start:'+emitKey);
      try {
            let tempData: Record<string, RecordData> = {};
            tempData['ACTION'] = emitKey;
            let backData: events_emitter.EventData = {
              data: tempData
            }

            let backEvent: events_emitter.InnerEvent = {
                eventId:10,
                priority:events_emitter.EventPriority.LOW
            }
            console.info('start send emitKey');
            events_emitter.emit(backEvent, backData);
      } catch (err) {
            console.info('emit emitKey  err: ' + JSON.stringify(err));
      }
      await Utils.msSleep(2000);
    })

    /**
     * @tc.name   testGetWebIdStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_STATIC_0100
     * @tc.desc   Get the WebId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWebIdStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey='emitFetchCookieSync';
      Utils.registerEvent('testGetWebId',6,100,done); //3个Web页面的id之和(6)会根据此用例之前的测试套及用例的运行发生变化
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_ACE_BASIC_ETS_API_STATIC_0200
     * @tc.desc   PAGE_REDIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('webcomponent'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(5000);
        done()
      })
  })
}
