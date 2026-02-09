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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function WebViewControllerTest() {

  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      console.log('App start')
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
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacewebhistoryenhancedtest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('webViewController beforeEach start');
    })

    /**
     * @tc.name   testBackForwardListCurrentIndexStatic001
     * @tc.number SUB_WEB_BACKFORWARDLIST_CURRENTINDEX_TITLE_0100
     * @tc.desc   test BackForwardList CurrentIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBackForwardListCurrentIndexStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBackForwardListCurrentIndex001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testBackForwardListCurrentIndex001', 0, 31027, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.msSleep(8000)
        done()
      })

    /**
     * @tc.name   testBackForwardListCurrentSizeStatic001
     * @tc.number SUB_WEB_BACKFORWARDLIST_SIZE_TITLE_0100
     * @tc.desc   test BackForwardList Size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBackForwardListCurrentSizeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBackForwardListCurrentSize001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testBackForwardListCurrentSize001', 1, 31028, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.msSleep(8000)
        done()
      })

  })
}