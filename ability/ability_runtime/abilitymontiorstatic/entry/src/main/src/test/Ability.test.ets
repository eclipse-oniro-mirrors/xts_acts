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
import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from "../../../hypium/index";
import Subscriber from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
let tag = "ActsAbilityMonitor";
let testAbilityContext:common.UIAbilityContext;

export default function abilityTest() {

  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let monitor: abilityDelegatorRegistry.AbilityMonitor;
  let monitor1: abilityDelegatorRegistry.AbilityMonitor;
  let TAG = "";

  describe('ActsAbilityMonitor', () => {
    beforeAll(async() => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      delegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(0x0000, tag, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError) : void => {
        if (err != null ) {
          hilog.info(0x0000, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(0x0000, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      delegator.executeShellCommand("aa start -a EntryAbility -b com.example.abilitymonitortest.static")
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
    })
    afterEach(async () => {
      hilog.info(0x0000, tag, '%{public}s', TAG + " afterEach each called");
      await Utils.msSleep(3000);
    });

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0100
     * @tc.name: ACTS_AddAbilityMonitor_Callback_0100
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility to trigger onAbilityCreate (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0100";
      hilog.info(0x0000, tag, '%{public}s', TAG + " start");
      let onAbilityCreate = (ability: UIAbility) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>ACTS_AddAbilityMonitor_0100 onAbilityCreate");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onAbilityForeground = (ability: UIAbility) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + " onAbilityForeground");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onAbilityBackgroundPromise = (ability: UIAbility) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onAbilityBackgroundPromise ====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onAbilityDestroy = (ability: UIAbility) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + " onAbilityDestroy====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
        done();
      }
      let onWindowStageCreate = (ability: UIAbility) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onWindowStageCreate====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onWindowStageDestroy = (ability: UIAbility) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onWindowStageDestroy====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate,
        onAbilityForeground: onAbilityForeground,
        onAbilityBackground: onAbilityBackgroundPromise,
        onAbilityDestroy: onAbilityDestroy,
        onWindowStageCreate: onWindowStageCreate,
        onWindowStageDestroy: onWindowStageDestroy,
      };
      hilog.info(0x0000, tag, '%{public}s', TAG + "====>ACTS_AddAbilityMonitor_0100 start");
      await delegator.addAbilityMonitor(monitor).then(() => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>ACTS_AddAbilityMonitor_0800 success====>");
      })
      delegator.addAbilityMonitor(monitor, ((err: BusinessError<void> | null): void => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>ACTS_AddAbilityMonitor_0100 addAbilityMonitor err: " + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(() => {
          hilog.info(0x0000, tag, '%{public}s', TAG + "====>0100startAbility success");
        });
      }));
    })

  })
}