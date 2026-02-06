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
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application'

let domain: number = 0x0000;
let tag: string = 'testTag';
let context:common.UIAbilityContext;

export default function actsStageContextTestStatic() {
  describe('ActsStageContextStaticTest', () => {

    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.stage_app.static").then((result: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(domain, tag, `ShellCmdResult stdResult:` + result.stdResult);
        hilog.info(domain, tag, `ShellCmdResult exitCode:` + result.exitCode);
      })
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'beforeAll end');
    })


    /*
     * @tc.number    : ACTS_StageContext_Static_1500
     * @tc.name      : ACTS_StageContext_Static_1500
     * @tc.desc      : test CreateModuleContext
     */
    it("ACTS_StageContext_Static_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'ACTS_StageContext_Static_1500 begin');
      try {
        application.createModuleContext(context, 'entry').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success' + JSON.stringify(Context));
          hilog.info(domain, tag, 'createContext area: ' + JSON.stringify(Context.area));
          expect(Context.area + "").assertEqual("1");
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + JSON.stringify(Context.applicationInfo.name));
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          hilog.info(domain, tag, 'createContext cacheDir: ' + JSON.stringify(Context.cacheDir));
          expect(Context.cacheDir + "").assertEqual("/data/storage/el2/base/cache");
          hilog.info(domain, tag, 'createContext tempDir: ' + JSON.stringify(Context.tempDir));
          expect(Context.tempDir + "").assertEqual("/data/storage/el2/base/temp");
          hilog.info(domain, tag, 'createContext filesDir: ' + JSON.stringify(Context.filesDir));
          expect(Context.filesDir + "").assertEqual("/data/storage/el2/base/files");
          hilog.info(domain, tag, 'createContext databaseDir: ' + JSON.stringify(Context.databaseDir));
          expect(Context.databaseDir + "").assertEqual("/data/storage/el2/database");
          hilog.info(domain, tag, 'createContext preferencesDir: ' + JSON.stringify(Context.preferencesDir));
          expect(Context.preferencesDir + "").assertEqual("/data/storage/el2/base/preferences");
          hilog.info(domain, tag, 'createContext stageMode: ' + JSON.stringify(Context.stageMode));
          expect(Context.stageMode + "").assertEqual("false");
          done();
        }).catch((error : BusinessError): void => {
          hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
          expect().assertFail();
          done()
        })
      } catch (error : BusinessError) {
        hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
    });

    /*
    * @tc.number    : ACTS_StageContext_Static_1600
    * @tc.name      : ACTS_StageContext_Static_1600
    * @tc.desc      : test CreateModuleContext
    */
    it("ACTS_StageContext_Static_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ACTS_StageContext_Static_1600 begin");
      try {
        application.createModuleContext(context, 'entry').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success');
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + JSON.stringify(Context.applicationInfo.name));
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          done();
        }).catch((error : BusinessError): void => {
          hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
          expect().assertFail();
          done()
        })
      } catch (error : BusinessError) {
        hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
    });
  })
}
