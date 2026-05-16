/**
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function webContextMenuEditStateFlagTest() {
  describe('WebContextMenuEditStateFlagTest', (): void => {
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
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.pageInteractiontest.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         ContextMenuEditStateFlagsStatic001
    * @tc.number       SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_031
    * @tc.desc         ContextMenuEditStateFlags
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('ContextMenuEditStateFlagsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('ContextMenuEditStateFlags001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('ContextMenuEditStateFlags001', 0, 60600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         ContextMenuEditStateFlagsStatic002
    * @tc.number       SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_032
    * @tc.desc         ContextMenuEditStateFlags
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('ContextMenuEditStateFlagsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('ContextMenuEditStateFlags002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('ContextMenuEditStateFlags002', 1, 60601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         ContextMenuEditStateFlagsStatic003
    * @tc.number       SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_033
    * @tc.desc         ContextMenuEditStateFlags
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('ContextMenuEditStateFlagsStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('ContextMenuEditStateFlags003', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('ContextMenuEditStateFlags003', 2, 60602, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         ContextMenuEditStateFlagsStatic004
    * @tc.number       SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_034
    * @tc.desc         ContextMenuEditStateFlags
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('ContextMenuEditStateFlagsStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('ContextMenuEditStateFlags004', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('ContextMenuEditStateFlags004', 4, 60603, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         ContextMenuEditStateFlagsStatic005
    * @tc.number       SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_036
    * @tc.desc         ContextMenuEditStateFlags
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('ContextMenuEditStateFlagsStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('ContextMenuEditStateFlags005', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('ContextMenuEditStateFlags005', 8, 60604, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
    /**
     * @tc.name         SwitchNextPageStatic
     * @tc.number       SUB_WEB_SWITCH_NEXT_PAGE3331
     * @tc.desc         test SwitchNextPageStatic
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.msSleep(3000);
        done()
      })
  })
}
