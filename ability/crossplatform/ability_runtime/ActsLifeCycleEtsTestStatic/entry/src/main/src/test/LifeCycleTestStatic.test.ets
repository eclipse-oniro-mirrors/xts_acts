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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';

type OnAbilityFn = (ability: UIAbility) => void;
type OnAbilityAndStageFn = (ability: UIAbility, windowStage: window.WindowStage) => void;

class CustomAbilityLifecycleCallback extends AbilityLifecycleCallback {
  public isAbilityCreate: boolean = false;
  public isAbilityWillCreate: boolean = false;
  public isWindowStageCreate: boolean = false;
  public isWindowStageWillCreate: boolean = false;
  public isAbilityForeground: boolean = false;
  public isAbilityWillForeground: boolean = false;

  onAbilityCreate(ability: UIAbility) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityCreate');
    this.isAbilityCreate = true;
  }

  onAbilityWillCreate?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityWillCreate');
    this.isAbilityWillCreate = true;
  }

  onWillNewWant?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWillNewWant');
  }

  onNewWant?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onNewWant');
  }

  onWindowStageCreate(ability: UIAbility, windowStage: window.WindowStage) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageCreate');
    this.isWindowStageCreate = true;
  }

  onWindowStageWillCreate?: OnAbilityAndStageFn = (ability: UIAbility, windowStage: window.WindowStage) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageWillCreate');
    this.isWindowStageWillCreate = true;
  }

  onWindowStageActive(ability: UIAbility, windowStage: window.WindowStage) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageActive');
  }

  onWindowStageInactive(ability: UIAbility, windowStage: window.WindowStage) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageInactive');
  }

  onWindowStageDestroy(ability: UIAbility, windowStage: window.WindowStage) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageDestroy');
  }

  onWindowStageWillDestroy?: OnAbilityAndStageFn = (ability: UIAbility, windowStage: window.WindowStage) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageWillCreate');
  }

  onAbilityDestroy(ability: UIAbility) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityDestroy');
  }

  onAbilityWillDestroy?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityWillDestroy');
  };

  onAbilityForeground(ability: UIAbility) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityForeground');
    this.isAbilityForeground = true;
  }

  onAbilityWillForeground?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityWillForeground');
    this.isAbilityWillForeground = true;
  };

  onAbilityBackground(ability: UIAbility) {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityBackground');
  }

  onAbilityWillBackground?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityWillBackground');
  };

  onWindowStageWillRestore?: OnAbilityAndStageFn = (ability: UIAbility, windowStage: window.WindowStage) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageWillCreate');
  }

  onWindowStageRestore?: OnAbilityAndStageFn = (ability: UIAbility, windowStage: window.WindowStage) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onWindowStageWillCreate');
  }

  onAbilityWillSaveState?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilityWillSaveState');
  };

  onAbilitySaveState?: OnAbilityFn = (ability: UIAbility) => {
    hilog.info(domain, tag,'CustomAbilityLifecycleCallback onAbilitySaveState');
  };
}

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function lifecycleStaticTest() {
  describe("lifecycleStaticTest", () => {
    let applicationContext: common.ApplicationContext;
    let uiAbilityContext: common.UIAbilityContext;
    beforeAll(async () => {
      hilog.info(domain, tag,'beforeAll start');
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.test.lifecycle_crossplatform_xts.static");
      await Utils.msSleep(2000);
      uiAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      hilog.info(domain, tag, `uiAbilityContext: ${!!uiAbilityContext}`);
      applicationContext = uiAbilityContext.getApplicationContext() as common.ApplicationContext;
      hilog.info(domain, tag, `applicationContext: ${!!applicationContext}`);
      hilog.info(domain, tag, 'beforeAll end');
    });


    /**
     * @tc.name   Crossplatform_Singlehap_LifeCycleTest_Static_0700
     * @tc.number Crossplatform_Singlehap_LifeCycleTest_Static_0700
     * @tc.desc   Multiple registration/unregistration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Crossplatform_Singlehap_LifeCycleTest_Static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'Crossplatform_Singlehap_LifeCycleTest_Static_0700';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const abilityLifecycleCb = new CustomAbilityLifecycleCallback();

          hilog.info(domain, tag, `${itName} on abilityLifecycle1`);
          const id1 = applicationContext.onAbilityLifecycle(abilityLifecycleCb);
          hilog.info(domain, tag, `${itName} on abilityLifecycle1 id: ${id1}`);
          await Utils.msSleep(2000);
          let want: Want = {
            bundleName: 'com.test.lifecycle_crossplatform_xts.static',
            abilityName: 'EntryAbility1',
          };
          try {
            uiAbilityContext.startAbility(want).then(() => {
              hilog.info(domain, tag, `startAbility success`);
            }).catch((err: Error): void => {
              hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
              expect().assertFail();
              done();
            });
          } catch (err) {
            hilog.info(domain, tag, `startAbility fail: ` + err);
            expect().assertFail();
            done();
          }
          await Utils.msSleep(5000);
          expect(abilityLifecycleCb.isAbilityCreate).assertTrue();
          expect(abilityLifecycleCb.isAbilityWillCreate).assertTrue();
          expect(abilityLifecycleCb.isWindowStageCreate).assertTrue();
          expect(abilityLifecycleCb.isWindowStageWillCreate).assertTrue();
          expect(abilityLifecycleCb.isAbilityForeground).assertTrue();
          expect(abilityLifecycleCb.isAbilityWillForeground).assertTrue();
          hilog.info(domain, tag, `${itName} off abilityLifecycle1`);
          applicationContext.offAbilityLifecycle(id1, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} off abilityLifecycle1 error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} off abilityLifecycle1 fail`);
              expect().assertFail();
              return;
            }
            hilog.info(domain, tag, `${itName} off abilityLifecycle1 success`);
          });
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} on abilityLifecycle2`);
          const id2 = applicationContext.onAbilityLifecycle(abilityLifecycleCb);
          hilog.info(domain, tag, `${itName} on abilityLifecycle2 id: ${id2}`);
          hilog.info(domain, tag, `${itName} off abilityLifecycle2`);
          applicationContext.offAbilityLifecycle(id2, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${itName} off abilityLifecycle2 error code: ${err?.code}, msg: ${err?.message}`);
            if (err?.code) {
              hilog.info(domain, tag, `${itName} off abilityLifecycle2 fail`);
              expect().assertFail();
              return;
            }
            hilog.info(domain, tag, `${itName} off abilityLifecycle2 success`);
          });
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} on abilityLifecycle3`);
          const id3 = applicationContext.onAbilityLifecycle(abilityLifecycleCb);
          hilog.info(domain, tag, `${itName} on abilityLifecycle3 id: ${id3}`);
          hilog.info(domain, tag, `${itName} off abilityLifecycle3`);
          applicationContext.offAbilityLifecycle(id3).then(() => {
            hilog.info(domain, tag, `${itName} off abilityLifecycle3 success`);
            expect(id1 >= 0).assertTrue();
            expect(`${id2}`).assertEqual(`${id1 + 1}`);
            expect(`${id3}`).assertEqual(`${id2 + 1}`);
          }).catch((e) => {
            hilog.info(domain, tag, `${itName} off abilityLifecycle3 fail`);
            expect().assertFail();
          })
          await Utils.msSleep(2000);
        } catch(err: Error) {
          hilog.info(domain, tag, `${itName} error error: ${JSON.stringify(err)}`)
          hilog.info(domain, tag, `${itName} error code: ${err?.code}, msg: ${err?.message}`);
          expect().assertFail();
        }
        hilog.info(domain, tag, `${itName} end`);
        done();
      });
  });
}
