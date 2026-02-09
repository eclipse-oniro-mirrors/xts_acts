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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions'
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext

export default function startAbilityForResultTestStatic() {
  describe('ActsstartAbilityForResultTestStatic', () => {

    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'getAbilityDelegator success');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.startabilityforresulttest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'start success');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'getcontext success, context: ' + context);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0100
     * @tc.desc   Call UIAbilityContext startAbilityForResult succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0100`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        await context.startAbilityForResult(want).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect(true).assertTrue()
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0200
     * @tc.desc   Call UIAbilityContext startAbilityForResult failed.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0200`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityForResultest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbilityForResult(want).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0300
     * @tc.desc   Call UIAbilityContext startAbilityForResult with options succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0300`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1',
      };
      let options: StartOptions = {
        displayId: 0,
      };
      try {
        await context.startAbilityForResult(want, options).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect(true).assertTrue()
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0400
     * @tc.desc   Call UIAbilityContext startAbilityForResult with options failed.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0400`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0500
     * @tc.desc   Call UIAbilityContext startAbilityForResult succeeded.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0500`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        context.startAbilityForResult(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0600
     * @tc.desc   Call UIAbilityContext startAbilityForResult failed.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0600`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbilityForResult(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0700
     * @tc.desc   Call UIAbilityContext startAbilityForResult with options succeeded.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options, (err: BusinessError<void> | null) => {
        hilog.info(domain, tag,`startAbilityForResult start`);
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag,`startAbilityForResult end`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0800
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0800`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}