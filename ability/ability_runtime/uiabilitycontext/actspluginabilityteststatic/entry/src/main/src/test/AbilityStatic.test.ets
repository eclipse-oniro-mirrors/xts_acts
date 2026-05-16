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

import { describe, it, expect, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import application from '@ohos.app.ability.application';
import wantConstant from "@ohos.app.ability.wantConstant";
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000;
let tag: string = 'PLUGIN_TEST';
let context: common.UIAbilityContext | undefined;

export default function abilityTestStatic() {
  describe('ActsAbilityTestStatic', () => {

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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.ability.plugintest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'start success');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'getcontext success, context: ' + context);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_1900
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_1900
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_Static_Static_1900';
      hilog.info(domain, tag, tag + " it begin");

      let want: Want = {};
      want.parameters = {};
      want.parameters![wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
      try {
        context?.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (err) {
        hilog.info(0x0000, tag, 'startFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_2100
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_2100
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_Static_2100';
      hilog.info(domain, tag, tag + " it begin");

      let want: Want = {
        abilityName: '111',
        bundleName: '111'
      };
      want.parameters = {};
      want.parameters![wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
      try {
        context?.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (err) {
        hilog.info(0x0000, tag, 'startFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_2200
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_2200
     * @tc.desc   Expect: failed with code 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_Static_2200';
      hilog.info(domain, tag, tag + " it begin");

      let want: Want = {
        abilityName: '111',
        bundleName: '111',
        moduleName: '111'
      };
      want.parameters = {};
      want.parameters![wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
      try {
        context?.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(0x0000, tag, 'startFailed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(16000001);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_Static_1200';
      hilog.info(domain, tag, tag + " it begin");
      try {
        application.createPluginModuleContext(context!, '', '')
          .then((data: common.Context): void => {
            hilog.info(domain, tag, 'createPluginModuleContext success data:' + JSON.stringify(data));
          })
          .catch((err: Error): void => {
            hilog.info(domain, tag, `createPluginModuleContext faiiled code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        hilog.info(domain, tag, 'createPluginModuleContext Failed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_1300
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_1300
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_Static_1300';
      hilog.info(domain, tag, tag + " it begin");
      try {
        application.createPluginModuleContext(context!, 'com.example.pluginBundleName', 'pluginModuleName')
          .then((data: common.Context): void => {
            hilog.info(domain, tag, 'createPluginModuleContext success data:' + JSON.stringify(data));
          })
          .catch((err: Error): void => {
            hilog.info(domain, tag, `createPluginModuleContext faiiled code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        hilog.info(domain, tag, 'createPluginModuleContext Failed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_1400
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_1400
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_Static_1400';
      hilog.info(domain, tag, tag + " it begin");
      try {
        application.createPluginModuleContext(context!, '', 'pluginModuleName')
          .then((data: common.Context): void => {
            hilog.info(domain, tag, 'createPluginModuleContext success data:' + JSON.stringify(data));
          })
          .catch((err: Error): void => {
            hilog.info(domain, tag, `createPluginModuleContext faiiled code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        hilog.info(domain, tag, 'createPluginModuleContext Failed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_1500
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_1500
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityRuntime_PluginAbility_Static_1500';
      hilog.info(domain, tag, tag + " it begin");
      try {
        application.createPluginModuleContext(context!, 'com.example.pluginBundleName', '')
          .then((data: common.Context): void => {
            hilog.info(domain, tag, 'createPluginModuleContext success data:' + JSON.stringify(data));
          })
          .catch((err: Error): void => {
            hilog.info(domain, tag, `createPluginModuleContext faiiled code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        hilog.info(domain, tag, 'createPluginModuleContext Failed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })
  })
}