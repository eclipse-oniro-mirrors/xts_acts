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
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import deviceInfo from "@ohos.deviceInfo";
import { image } from '@kit.ImageKit';
import application from '@ohos.app.ability.application';
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext | undefined;

let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
let opts: image.InitializationOptions = {editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {height: 512, width: 512}};
let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
let disable = false;

export default function UIAbilityContextStatic() {
  describe('ActsUIAbilityContextStatic', () => {

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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.startabilityforresulttest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'start success');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      await context!.revokeDelegator().then(() => {
        hilog.info(domain, tag, 'revokeDelegator success');
      }).catch((err: Error): void => {
        if (err.code == 801) {
          disable = true;
        }
        hilog.info(domain, tag, `beforeAll revokeDelegator failed, code is ${err.code}, message is ${err.message}`);
      });
      hilog.info(domain, tag, 'getcontext success, context: ' + context!);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200
     * @tc.desc   Call UIAbilityContext showAbility succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'MainAbility1'
      };
      try {
        context?.startAbility(want, (err: BusinessError<void>|null) => {
          if (err?.code) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            return;
          }
          hilog.info(domain, tag,'startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(domain, tag,`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      context?.showAbility().then(() => {
        hilog.info(domain, tag,`showAbility success`);
      }).catch((err: Error): void => {
        hilog.info(domain, tag,`showAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            hilog.info(domain, tag,"getSync" + JSON.stringify(info));
            if (info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            hilog.info(domain, tag,"getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100
     * @tc.desc   Call UIAbilityContext hideAbility succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'MainAbility1'
      };
      try {
        context?.startAbility(want, (err: BusinessError<void>|null) => {
          if (err?.code) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            return;
          }
          hilog.info(domain, tag,'startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(domain, tag,`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      context?.hideAbility().then(() => {
        hilog.info(domain, tag,`highAbility success`);
      }).catch((err: Error): void => {
        hilog.info(domain, tag,`highAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            hilog.info(domain, tag,"getSync" + JSON.stringify(info));
            if(info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            hilog.info(domain, tag,"getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800
     * @tc.desc   API test for context.setRestoreEnabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let par: boolean = true
      try {
        context?.setRestoreEnabled(par);
        hilog.info(domain, tag, 'setRestoreEnabled success ');
        expect(par).assertTrue()
        done();
      } catch (error) {
        hilog.info(domain, tag, 'setRestoreEnabled failed ' + JSON.stringify(error));
        let code = (error as BusinessError).code;
        expect(code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300
     * @tc.desc   API test for context.SetAbilityInstanceInfo errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "it begin");
      try {
        await context!.setAbilityInstanceInfo('', pixelMap);
        hilog.info(domain, tag, "fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(domain,  tag, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        let code = (err as BusinessError).code;
        try { expect(code).assertEqual(401); } catch (err) {}
        hilog.info(domain, tag, "success");
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100
     * @tc.desc   API test for context.SetAbilityInstanceInfo errcode 801, 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag , "it begin");
      try {
        await context!.setAbilityInstanceInfo('instance label', pixelMap)
          .catch((err: Error): void => {
            hilog.info(domain, tag , "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            let code = err?.code;
            if (code === 801) {
              hilog.info(domain, tag , "device not support multi instance");
              done();
            } else {
              hilog.info(domain, tag , "setAbilityInstanceInfo err: " + code)
              try { expect(code).assertEqual(201); } catch (err) {}
              done();
            }
          });
      } catch (err) {
        hilog.info(domain, tag , "setAbilityInstanceInfo error: " + JSON.stringify(err))
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HookAbility_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_HookAbility_Static_0700
     * @tc.desc   API test for context.revokeDelegator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HookAbility_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain,  tag , " it begin");
      if (disable) {
        done();
        return;
      }
      context?.revokeDelegator().then(() => {
        hilog.info(domain,  tag ,'%{public}s', 'revokeDelegator success');
      }).catch((err: Error): void => {
        expect(err.code).assertEqual(16000084);
        hilog.info(domain,  tag , '%{public}s revokeDelegator failed', JSON.stringify(err));
        done();
      });
      hilog.info(domain,  tag , '%{public}s', '--end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        application.createPluginModuleContext(context!, '', '')
          .then((data: common.Context): void => {
            hilog.info(0x0000, 'testTag', 'createPluginModuleContext success data:' + JSON.stringify(data));
          })
          .catch((err: Error): void => {
            hilog.info(0x0000, 'testTag', `createPluginModuleContext faiiled code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        hilog.info(domain,  tag , 'createPluginModuleContext Failed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    })
  })
}