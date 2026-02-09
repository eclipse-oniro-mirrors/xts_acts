/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import Utils from './Util.test';
// import { inspector.sendEventByKey } from '@internal.full.global';
import inspector from '@ohos.arkui.inspector';
// import { inspector.sendEventByKey } from "@kit.ArkUI"
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebDevCloudServiceWebControllerGroupNineTest() {

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
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptioncloudservicecontrollergroupninetest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /*
    * @tc.number     : SUB_WEB_GETRESPONSEDATAEX_RETURN_STRING_0001
    * @tc.name       : testGetResponseDataExReturnString
    * @tc.desc       : test getResponseDataEx return string type
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testGetResponseDataExReturnString', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      let emitKey = "testGetResponseDataExReturnString"
      Utils.emitEvent("testGetResponseDataExReturnString", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseDataExReturnString", true, 36010, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebResourceResponseButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })



    /*
     * @tc.number     : SUB_WEB_GETRESPONSEISREADY_RETURN_TRUE_0005
     * @tc.name       : testGetResponseIsReadyReturnTrue
     * @tc.desc       : test getResponseIsReady return true
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetResponseIsReadyReturnTrue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let emitKey = "testGetResponseIsReadyReturnTrue"
      Utils.emitEvent("testGetResponseIsReadyReturnTrue", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testGetResponseIsReadyReturnTrue", true, 36015, done);
      inspector.sendEventByKey('WebResourceResponseButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}
