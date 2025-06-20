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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';
import router from '@ohos.router';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Utils.test';

const TAG = "ACTS_LiveFormExtension";

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let globalScribe: commonEventManager.CommonEventSubscriber | undefined = undefined;

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      hilog.info(0x0000, TAG, 'beforeEach start');

      let options: router.RouterOptions = {
        url: 'testAbility/pages/LaunchPage',
      }
      try {
        await router.pushUrl(options);
        await Utils.sleep(500);
        hilog.info(0x0000, TAG, 'push page succeed');
      } catch (err) {
        hilog.info(0x0000, TAG, `push page error: ${err}`);
      }

      // max wait 8s
      setTimeout(async () => {
        if (globalScribe !== undefined) {
          Utils.unsubscribe(globalScribe)
        }
      }, 8000);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number : SUB_ABILITY_FORM_LIVEFORMEXTENSION_TEST_0100
     * @tc.name   : test_LiveFormExtension_0100
     * @tc.desc   : Start the LiveFormExtensionAbility, and the test is successful.
     * @tc.size   : MediumTest
     * @tc.level  : Level 0
     * @tc.type   : Function
     */
    it('test_LiveFormExtension_0100', Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters:
      // test case name, filter parameter, and test case function.
      const newTag = 'ACTS_LiveFormExtension_0100 == ';

      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['ACTS_LiveFormExtension_OnRemoteReady'],
      };

      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        hilog.info(0x0000, TAG, `createSubscriber data: ${JSON.stringify(data)}`);
        globalScribe = data;
        commonEventManager.subscribe(globalScribe, async (err, data) => {
          hilog.info(0x0000, newTag, `SubscribeInfoCallback: ${JSON.stringify(data)}`);

          let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
          await abilityDelegator.executeShellCommand('aa dump -e').then((data) => {
            hilog.info(0x0000, newTag, `data: ${JSON.stringify(data)}`);
            let output = JSON.stringify(data);
            try {
              expect(output).assertContain('LiveFormExtAbility');
            } catch {
              expect().assertFail();
            }
          });
        });
      }).catch((error: BusinessError) => {
        hilog.info(0x0000, newTag, `createSubscriber err: ${JSON.stringify(error)}`);
        expect().assertFail();
      })
    })
  })
}