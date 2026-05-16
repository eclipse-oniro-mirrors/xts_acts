/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import UIAbility from '@ohos.app.ability.UIAbility';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import appManager from '@ohos.app.ability.appManager';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext | null = null;

function msSleep(count: int) {
  Utils.msSleep(count).awaitSync();
}

export default function ApplicationContextGetIsPreloadTest() {
  describe('ActsAbilityStaticTest', () => {
    const BUNDLE_NAME = 'com.example.ispreload';
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(() => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      msSleep(2000);
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b com.example.ispreload`);
      msSleep(2000);
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
    })


    /**
     * @tc.name   SUB_Ability_applicationContext_getIsPreload_Static_0100
     * @tc.number SUB_Ability_applicationContext_getIsPreload_Static_0100
     * @tc.desc   test addAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_applicationContext_getIsPreload_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_applicationContext_getIsPreload_Static_0100';
        hilog.info(domain, tag, `${itName} start`);
        let applicationContext = testAbilityContext?.getApplicationContext();
        let isPreload: boolean = false
        applicationContext?.getRunningProcessInformation().then((data: Array<appManager.ProcessInformation>) => {
          for (let info of data) {
            hilog.info(0x0000, "testTag", `applicationContext.getRunningProcessInformation_promise success: ${JSON.stringify(info)}`);
            if(info.processName == "com.example.ispreload"){
              isPreload = info.isPreload!
            }
          }
          hilog.info(0x0000, "testTag", `isPreload is: ${JSON.stringify(isPreload)}`);
          expect(isPreload).assertEqual(false);
          done();
        }).catch((error: Error) => {
          hilog.error(0x0000, "testTag", `error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_Ability_applicationContext_getIsPreload_Static_0200
     * @tc.number SUB_Ability_applicationContext_getIsPreload_Static_0200
     * @tc.desc   test addAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_applicationContext_getIsPreload_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_applicationContext_getIsPreload_Static_0200';
        hilog.info(domain, tag, `${itName} start`);
        let applicationContext = testAbilityContext?.getApplicationContext();
        let isPreload: boolean = false
        applicationContext?.getRunningProcessInformation((err: BusinessError|null, data: Array<appManager.ProcessInformation>|undefined) => {
        if (err?.code) {
          hilog.info(0x0000, "testTag", `applicationContext.getRunningProcessInformation failed, err: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        } else {
          for (let info of data!) {
            hilog.info(0x0000, "testTag", `applicationContext.getRunningProcessInformation_callback success: ${JSON.stringify(info)}`);
            if(info.processName == "com.example.ispreload"){
              isPreload = info.isPreload!
            }
          }
          hilog.info(0x0000, "testTag", `isPreload is: ${JSON.stringify(isPreload)}`);
          expect(isPreload).assertEqual(false);
          done();
        }

      })
        hilog.info(domain, tag, `${itName} end`);
      })
  })
}