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

import { describe, it, expect, TestType, Size, Level, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions'
import contextConstant from "@ohos.app.ability.contextConstant";
import bundleManager from '@ohos.bundle.bundleManager';

let domain: number = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext

export default function startAbilityTestStatic() {
  describe('ActsstartAbilityTestStatic', () => {

    beforeEach(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'getAbilityDelegator success');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.startabilitytest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'start success');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'getcontext success, context: ' + context);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0100
     * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0100
     * @tc.desc   : Call UIAbilityContext startAbility succeeded.(promise),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0100`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0200
     * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0200
     * @tc.desc   : Call UIAbilityContext startAbility failed.(promise),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0200`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0300
     * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0300
     * @tc.desc   : Call UIAbilityContext startAbility with options succeeded.(promise),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0300`;
      hilog.info(domain, tag, `it begin`);
      let parameters: Record<String,Object>= {
        'key': 'parameters key'
      }
      let fds: Record<String,Double> = {
        'key': 1
      }
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.startabilitytest.static',
        moduleName: 'entry',
        abilityName: 'EntryAbility1',
        action: 'abc',
        entities: ['abc'],
        uri: 'example://www.example.com',
        type: '',
        parameters: parameters,
        fds: fds
      };

      let options: StartOptions = {
        windowMode: 0,
        displayId: 0,
        withAnimation: true,
        windowLeft: 100,
        windowTop: 100,
        windowWidth: 100,
        windowHeight: 100,
        processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM,
        startupVisibility: contextConstant.StartupVisibility.STARTUP_SHOW,
        startWindowIcon: undefined,
        startWindowBackgroundColor: undefined,
        supportWindowModes:[
          bundleManager.SupportWindowMode.FULL_SCREEN,
        ],
        minWindowWidth: 100,
        minWindowHeight: 100,
        maxWindowWidth: 100,
        maxWindowHeight: 100
      };
      let options1: StartOptions = {
        displayId: 0,
      };
      try {
        context.startAbility(want, options1).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0400
     * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0400
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0400`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0500
     * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0500
     * @tc.desc   : Call UIAbilityContext startAbility succeeded.(callback),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0500`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        context.startAbility(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0600
     * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0600
     * @tc.desc   : Call UIAbilityContext startAbility failed.(callback),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0600`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbility(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0700
     * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0700
     * @tc.desc   : Call UIAbilityContext startAbility with options succeeded.(callback),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbility(want, options, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_startAbility_Static_0800
    * @tc.name   : SUB_Ability_AbilityRuntime_startAbility_Static_0800
    * @tc.desc   : Call UIAbilityContext startAbility with options failed.(callback),
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityRuntime_startAbility_Static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0800`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilitytest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbility(want, options, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}
