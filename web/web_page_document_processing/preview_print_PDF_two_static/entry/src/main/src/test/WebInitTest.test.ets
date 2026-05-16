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

export default function webInitTest() {
  describe('WebInitTest', (): void => {
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
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.webPageDocumentProcessingTwo.test.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testControllerAttachStateStatic001
    * @tc.number       SUB_ACE_WEB_CONTROLLER_ATTACH_STATE_001
    * @tc.desc         test ControllerAttachState001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testControllerAttachStateStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitControllerAttachState001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testControllerAttachState001', 1, 60600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testControllerAttachState002
    * @tc.number       SUB_ACE_WEB_CONTROLLER_ATTACH_STATE_002
    * @tc.desc         test ControllerAttachState002
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testControllerAttachState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitControllerAttachState002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testControllerAttachState002', 0, 60601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAudioMutedStatic001
    * @tc.number       SUB_ACE_WEB_SET_AUDIO_MUTED_001
    * @tc.desc         test setAudioMuted001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testSetAudioMutedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAudioMuted001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetAudioMuted001', true, 60602, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetAudioMutedStatic002
    * @tc.number       SUB_ACE_WEB_SET_AUDIO_MUTED_002
    * @tc.desc         test setAudioMuted002
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testSetAudioMutedStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetAudioMuted002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetAudioMuted002', 17100001, 60603, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })


    /**
    * @tc.name         testDeleteAllDataStatic001
    * @tc.number       SUB_ACE_WEB_DELETE_ALL_DATA_001
    * @tc.desc         test deleteAllData001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testDeleteAllDataStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitDeleteAllData001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testDeleteAllData001', "success", 60605, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testDeleteAllData002
    * @tc.number       SUB_ACE_WEB_DELETE_ALL_DATA_002
    * @tc.desc         test deleteAllData002
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testDeleteAllData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitDeleteAllData002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testDeleteAllData002', "success", 60606, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testSetWebDestroyMode001
    * @tc.number       SUB_ACE_WEB_SET_WEB_DESTROY_MODE_001
    * @tc.desc         test setWebDestroyMode001
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testSetWebDestroyMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetWebDestroyMode001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetWebDestroyMode001', true, 60604, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebInitButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}
