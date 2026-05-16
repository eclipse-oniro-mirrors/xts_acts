/*
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
import { beforeAll, describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { RecordData } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import startupManager from '@ohos.app.appstartup.startupManager'
import StartupConfig from '@ohos.app.appstartup.StartupConfig';
import StartupListener from '@ohos.app.appstartup.StartupListener';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function StartupStaticTest() {
  beforeAll(async () => {
    hilog.info(domain, tag, '%{public}s', 'beforeAll start');
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    await abilityDelegator.startAbility({
      abilityName: 'EntryAbility', bundleName: 'com.example.startuptest.static'
    }).then(async (): Promise<void> => {
      hilog.info(domain, tag, 'startAbility success');
      await Utils.msSleep(2000);
    }).catch(() => {
      hilog.info(domain, tag, 'startAbility fail');
    })
  });

  describe('StartupStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0100
     * @tc.desc   the testing startup framework errorCode is 28800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0100';
        console.log(caseName + ' start');
        let onCompletedCallback = (error: BusinessError) => {
          console.log(`${caseName} onCompletedCallback`);
        }
        let startupListener: StartupListener = {
          onCompleted: onCompletedCallback
        }
        let config: StartupConfig = {
          timeoutMs: 5000,
          startupListener: startupListener
        }
        let context: common.AbilityStageContext = {} as common.AbilityStageContext;
        try {
          startupManager.run(['TaskNotExist'], context, config);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(28800001);
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0200
     * @tc.desc   the testing startupManager.run errorCode is 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0200';
        console.log(caseName + ' start');
        let onCompletedCallback = (error: BusinessError) => {
          console.log(`${caseName} onCompletedCallback`);
        }
        let startupListener: StartupListener = {
          onCompleted: onCompletedCallback
        }
        let config: StartupConfig = {
          timeoutMs: 5000,
          startupListener: startupListener
        }
        let context: common.AbilityStageContext = {} as common.AbilityStageContext;
        try {
          startupManager.run([], context, config);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(16000050);
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0300
     * @tc.desc   the testing startupManager.run errorCode is 28800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0300';
        console.log(caseName + ' start');
        let onCompletedCallback = (error: BusinessError) => {
          console.log(`${caseName} onCompletedCallback`);
        }
        let startupListener: StartupListener = {
          onCompleted: onCompletedCallback
        }
        let config: StartupConfig = {
          timeoutMs: 5000,
          startupListener: startupListener
        }
        let context: common.AbilityStageContext = {} as common.AbilityStageContext;
        try {
          startupManager.run([''], context, config);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(28800001);
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0400
     * @tc.desc   the testing startupManager.run errorCode is 28800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0400';
        console.log(caseName + ' start');
        let onCompletedCallback = (error: BusinessError) => {
          console.log(`${caseName} onCompletedCallback`);
        }
        let startupListener: StartupListener = {
          onCompleted: onCompletedCallback
        }
        let config: StartupConfig = {
          timeoutMs: 5000,
          startupListener: startupListener
        }
        try {
          startupManager.run(['taskNotExist'], config);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(28800001)
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0500
     * @tc.desc   the testing startup startupManager.run is 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0500', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0500';
        console.log(caseName + ' start');
        let onCompletedCallback = (error: BusinessError) => {
          console.log(`${caseName} onCompletedCallback`);
        }
        let startupListener: StartupListener = {
          onCompleted: onCompletedCallback
        }
        let config: StartupConfig = {
          timeoutMs: 5000,
          startupListener: startupListener
        }
        try {
          startupManager.run([], config);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(16000050);
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0600
     * @tc.desc   the testing startup startupManager.run is 28800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0600', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0600';
        console.log(caseName + ' start');
        let onCompletedCallback = (error: BusinessError) => {
          console.log(`${caseName} onCompletedCallback`);
        }
        let startupListener: StartupListener = {
          onCompleted: onCompletedCallback
        }
        let config: StartupConfig = {
          timeoutMs: 5000,
          startupListener: startupListener
        }
        try {
          startupManager.run([''], config);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(28800001);
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_1000
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_1000
     * @tc.desc   startupManager.removeAllStartupTaskResults
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_1000', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_1000';
        console.log(caseName + ' start');
        try {
          startupManager.removeAllStartupTaskResults();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.removeAllStartupTaskResults error: ${e.code}, ${e.message}`);
          expect().assertFail();
          done();
        }
      }
    )
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_1100
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_1100
     * @tc.desc   startupManager.getStartupTaskResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_1100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_1100';
        console.log(caseName + ' start');
        try {
          let result = startupManager.getStartupTaskResult('TaskNotExist');
          console.log(`${caseName} startupManager.getStartupTaskResult result: ${JSON.stringify(result)}`);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.removeAllStartupTaskResults error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(401);
          done();
        }
      }
    )
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_1200
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_1200
     * @tc.desc   startupManager.getStartupTaskResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_1200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_1200';
        console.log(caseName + ' start');
        try {
          let result = startupManager.getStartupTaskResult('');
          console.log(`${caseName} startupManager.getStartupTaskResult result: ${JSON.stringify(result)}`);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.removeAllStartupTaskResults error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(401);
          done();
        }
      }
    )
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_1300
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_1300
     * @tc.desc   startupManager.isStartupTaskInitialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_1300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_1300';
        console.log(caseName + ' start');
        try {
          let result: boolean = startupManager.isStartupTaskInitialized('TaskNotExist');
          console.log(`${caseName} startupManager.getStartupTaskResult result: ${JSON.stringify(result)}`);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.removeAllStartupTaskResults error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(401);
          done();
        }
      }
    )
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_1400
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_1400
     * @tc.desc   startupManager.isStartupTaskInitialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_1400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_1400';
        console.log(caseName + ' start');
        try {
          let result: boolean = startupManager.isStartupTaskInitialized('');
          console.log(`${caseName} startupManager.getStartupTaskResult result: ${JSON.stringify(result)}`);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.removeAllStartupTaskResults error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(401);
          done();
        }
      }
    )
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_1500
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_1500
     * @tc.desc   startupManager.removeStartupTaskResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_1500', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_1500';
        console.log(caseName + ' start');
        try {
          startupManager.removeStartupTaskResult('TaskNotExist');
          console.log(`${caseName} startupManager.getStartupTaskResult succeed`);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.removeAllStartupTaskResults error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(401);
          done();
        }
      }
    )
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_1600
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_1600
     * @tc.desc   startupManager.removeStartupTaskResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_1600', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_1600';
        console.log(caseName + ' start');
        try {
          startupManager.removeStartupTaskResult('');
          console.log(`${caseName} startupManager.getStartupTaskResult succeed`);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.removeAllStartupTaskResults error: ${e.code}, ${e.message}`);
          expect(e.code).assertEqual(401);
          done();
        }
      }
    )
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0700
     * @tc.desc   the testing startup startupManager.run
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0700', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0700';
        console.log(caseName + ' start');
        try {
          startupManager.run(['taskNotExist']);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          let result: boolean = e.code === 401 || e.code === 28800001;
          expect(result).assertTrue();
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0800
     * @tc.desc   the testing startup startupManager.run
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0800', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0800';
        console.log(caseName + ' start');
        try {
          startupManager.run(['']);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          let result: boolean = e.code === 401 || e.code === 16000050 || e.code === 28800001;
          expect(result).assertTrue();
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartUpFeature_Static_0900
     * @tc.number SUB_Ability_AbilityRuntime_StartUpFeature_Static_0900
     * @tc.desc   the testing startup startupManager.run
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartUpFeature_Static_0900', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_Ability_AbilityRuntime_StartUpFeature_Static_0900';
        console.log(caseName + ' start');
        try {
          startupManager.run([]);
          expect().assertFail();
          done();
        } catch (e) {
          console.log(`${caseName} startupManager.run error: ${e.code}, ${e.message}`);
          let result: boolean = e.code === 401 || e.code === 16000050;
          expect(result).assertTrue();
          done();
        }
      })
  })
}
