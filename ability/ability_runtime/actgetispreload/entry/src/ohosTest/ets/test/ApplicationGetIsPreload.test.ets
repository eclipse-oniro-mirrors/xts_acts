/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { appManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

let testAbilityContext: common.UIAbilityContext | null = null;

export default function abilityWMSTest() {
  describe('ApplicationGetIsPreload', () => {


    /**
     * @tc.name   SUB_Ability_applicationContext_getIsPreload_0100
     * @tc.number SUB_Ability_applicationContext_getIsPreload_0100
     * @tc.desc   Stage model applications query their own application processes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_applicationContext_getIsPreload_0100', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_applicationContext_getIsPreload_0100`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      let applicationContext = context.getApplicationContext();
      let isPreload: boolean = false;
      applicationContext.getRunningProcessInformation().then((data: Array<appManager.ProcessInformation>) => {
        for (let info of data) {
          hilog.info(0x0000, "testTag", `applicationContext.getRunningProcessInformation_promise success: ${JSON.stringify(info)}`);
          if(info.processName == "com.example.actgetispreload"){
            isPreload = info.isPreload!
          }
        }
        hilog.info(0x0000, "testTag", `isPreload is: ${JSON.stringify(isPreload)}`);
        expect(isPreload).assertEqual(false);
        done();
      }).catch((error: BusinessError) => {
        hilog.error(0x0000, "testTag", `error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.name   SUB_Ability_applicationContext_getIsPreload_0200
     * @tc.number SUB_Ability_applicationContext_getIsPreload_0200
     * @tc.desc   Stage model applications query their own application processes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_applicationContext_getIsPreload_0200', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_applicationContext_getIsPreload_0200`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      let isPreload: boolean = false;
      let applicationContext = context.getApplicationContext();
      applicationContext.getRunningProcessInformation((err: BusinessError|null, data: Array<appManager.ProcessInformation>|undefined) => {
        if (err?.code) {
          hilog.info(0x0000, "testTag", `applicationContext.getRunningProcessInformation failed, err: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        } else {
          for (let info of data!) {
            hilog.info(0x0000, "testTag", `applicationContext.getRunningProcessInformation_callback success: ${JSON.stringify(info)}`);
            if(info.processName == "com.example.actgetispreload"){
              isPreload = info.isPreload!
            }
          }
          hilog.info(0x0000, "testTag", `isPreload is: ${JSON.stringify(isPreload)}`);
          expect(isPreload).assertEqual(false);
          done();
        }
      })
    });

  })
}