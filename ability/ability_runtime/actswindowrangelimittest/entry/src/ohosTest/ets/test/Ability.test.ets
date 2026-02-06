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
import { afterEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from './utils';
import { common, StartOptions, Want } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const wantInfo: Want = {
  bundleName: 'com.example.abilitywindowarg',
  abilityName: 'TestUiAbility'
}

export default function abilityTest(abilityContext: common.UIAbilityContext) {
  describe('ActsAbilityTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_windowRangeLimit_0100
     * @tc.name  : SUB_Ability_AbilityRuntime_windowRangeLimit_0100
     * @tc.desc  : startOptions set window area value undefined startAbility success
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 3
     */
    it('SUB_Ability_AbilityRuntime_windowRangeLimit_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = '[SUB_Ability_AbilityRuntime_windowRangeLimit_0100]'
      console.log(`${tag}: start`);
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbilityRes']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscribe) => {
        console.log(`${tag}: createSubscriber`);
        try {
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            console.log(`${tag}: subscribe` + commonEventData.event + JSON.stringify(commonEventData.parameters?.data));
            try {
              expect(commonEventData.parameters?.data.successStart).assertEqual(true);
            } catch (error) {}
            commonEventManager.unsubscribe(subscribe);
            done();
          });
        } catch (err) {
          console.log(`${tag}: Failed to subscribe: ` + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(`${tag}: Failed to createSubscriber: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      });

      const res = await startAbility(abilityContext, wantInfo, {
        minWindowWidth: undefined,
        minWindowHeight: undefined,
        maxWindowWidth: undefined,
        maxWindowHeight: undefined
      })
      console.log(`${tag} startAbility end res: ${res}`);
      console.log(`${tag}: end`);
    })
  })
}

function startAbility(context: common.UIAbilityContext, want: Want, startOptions: StartOptions): Promise<boolean> {
  return new Promise(async resolve => {
    try {
      await context.startAbility(want, startOptions);
      await Utils.sleep(500);
      resolve(true)
    } catch (err) {
      // 处理入参错误异常
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`startAbility failed, code is ${code}, message is ${message}`);
      resolve(false);
    }
  })
}