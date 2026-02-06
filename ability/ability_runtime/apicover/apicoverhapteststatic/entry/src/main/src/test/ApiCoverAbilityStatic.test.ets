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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import contextConstant from "@ohos.app.ability.contextConstant";
import appManager from '@ohos.app.ability.appManager'
import { ProcessInformation } from 'application.ProcessInformation'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import insightIntent from '@ohos.app.ability.insightIntent'

let domain: number = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext
let array: string[] = new Array<string>();

export default function ApiCoverStaticTest() {
  describe('ApiCoverStaticTestTest', () => {

    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.apicoverhaptest.static")
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'beforeAll end');
    })

    /*
     * @tc.number  SUB_AA_ABILITY_Extension_API_Static_012
     * @tc.name    SUB_AA_ABILITY_Extension_API_Static_012
     * @tc.desc    killProcessesBySelf with invalid param.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_ABILITY_Extension_API_Static_012', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el1 start`);
        let el1 = contextConstant.AreaMode.EL1;
        expect((String(el1))).assertEqual("0");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el2 start`);
        let el2 = contextConstant.AreaMode.EL2;
        expect((String(el2))).assertEqual("1");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el3 start`);
        let el3 = contextConstant.AreaMode.EL3;
        expect((String(el3))).assertEqual("2");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el4 start`);
        let el4 = contextConstant.AreaMode.EL4;
        expect((String(el4))).assertEqual("3");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `el5 start`);
        let el5 = contextConstant.AreaMode.EL5;
        expect((String(el5))).assertEqual("4");
        hilog.info(0x0000, 'SUB_AA_ABILITY_Extension_API_Static_012', `AreaMode end`);
        done()
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', `catch code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_AA_Test_InsightIntent_Static_0100
     * @tc.name    SUB_AA_Test_InsightIntent_Static_0100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test insightIntent.ExecuteMode
     * @tc.level   3
     */
    it('SUB_AA_Test_InsightIntent_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND + '');
      expect('1').assertEqual(insightIntent.ExecuteMode.UI_ABILITY_BACKGROUND + '');
      expect('2').assertEqual(insightIntent.ExecuteMode.UI_EXTENSION_ABILITY + '');
      done();
    })

    /*
     * @tc.number  SUB_AA_AbilityAppManager_Static_0100
     * @tc.name    SUB_AA_AbilityAppManager_Static_0100
     * @tc.desc    The form of a promise getRunningProcessInformation
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_AbilityAppManager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "SUB_AA_AbilityAppManager_Static_0100 begin");
      await Utils.msSleep(1000);
      appManager.getRunningProcessInformation()
        .then((data: Array<ProcessInformation>) => {
          hilog.info(domain, tag, "SUB_AA_AbilityAppManager_Static_0100 success");
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data.length:' + data.length);
          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.pid: ' + data[i].pid);
            expect(typeof (data[i].pid)).assertEqual("number");
            expect(data[i].pid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.uid: ' + data[i].uid);
            expect(typeof (data[i].uid)).assertEqual("number");
            expect(data[i].uid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.processName: ' + data[i].processName);
            expect(typeof (data[i].processName)).assertEqual("string");
            expect(data[i].processName.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.bundleNames: ' + data[i].bundleNames);
            expect(Array.isArray(data[i].bundleNames)).assertEqual(true);
            expect(data[i].bundleNames.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.bundleType: ' + data[i]?.bundleType);
            expect(typeof (data[i]?.bundleType)).assertEqual("number");
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation data' + i + '.appCloneIndex: ' + data[i]?.appCloneIndex);
            expect(typeof (data[i]?.appCloneIndex)).assertEqual("number");
          }
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation done');
          done();
        })
        .catch<void>((err: BusinessError): void => {
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0100 getRunningProcessInformation err: ' + err);
          expect().assertFail();
          done();
        })
    })

    /*
     * @tc.number  SUB_AA_AbilityAppManager_Static_0200
     * @tc.name    SUB_AA_AbilityAppManager_Static_0200
     * @tc.desc    The form of a callback getRunningProcessInformation
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   3
     */
    it('SUB_AA_AbilityAppManager_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "SUB_AA_AbilityAppManager_Static_0200 begin");
      await Utils.msSleep(1000);
      appManager.getRunningProcessInformation((err: BusinessError | null, data: Array<ProcessInformation> | undefined) => {
        if (err != null && data !== undefined) {
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data.length: ' + data!.length);
          for (let i = 0; i < data!.length; i++) {
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.pid: ' + data![i].pid);
            expect(typeof (data![i].pid)).assertEqual("number");
            expect(data![i].pid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.uid: ' + data![i].uid);
            expect(typeof (data![i].uid)).assertEqual("number");
            expect(data![i].uid).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.processName: ' + data![i].processName);
            expect(typeof (data![i].processName)).assertEqual("string");
            expect(data![i].processName.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.bundleNames: ' + data![i].bundleNames);
            expect(Array.isArray(data![i].bundleNames)).assertEqual(true);
            expect(data![i].bundleNames.length).assertLarger(0.0);
            hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation data' + i + '.state: ' + data![i].state);
            expect(typeof data![i].state).assertEqual("number");
            expect(data![i].state >= -1 && data![i].state <= 5).assertTrue();
          }
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation done');
          done();
        } else {
          hilog.info(domain, tag, 'SUB_AA_AbilityAppManager_Static_0200 getRunningProcessInformation err: ' + err);
          expect().assertFail();
          done();
        }
      })
    })
  })
}