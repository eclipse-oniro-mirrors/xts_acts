/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function AbilityStageMonitor2Test() {
  const factoryWant = (bundleName: string, abilityName: string, moduleName: string) => {
    return {
      bundleName: bundleName,
      abilityName: abilityName,
      moduleName: moduleName
    }
  }
  describe('AbilityStageMonitor2Test', function () {
    beforeAll(function () {
      let want = {
        abilityName: 'Main4Ability',
        bundleName: 'com.example.delegatortest',
        moduleName: 'entry'
      };
      abilityDelegator.startAbility(want);
    })

    /**
         * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0100
         * @tc.name Phase2_AbilityStageMonitor_0100
         * @tc.desc Verify that StageMonitor listens to the abilitystage CallBack after the abilitystage starts
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
    it('PHASE2_ABILITY_STAGE_MONITOR_0100', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassista');
      let monitor = {
        moduleName: 'featureassista',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      abilityDelegator.waitAbilityStageMonitor(monitor, (err, data) => {
        try {
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0100 err code: ' + err.code);
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0100 data code: ' + JSON.stringify(data.context.currentHapModuleInfo.name));
          let moduleName = data.context.currentHapModuleInfo.name;
          expect(moduleName).assertEqual(monitor.moduleName)
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0100 pass');
        } catch (error) {
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0100 catch error:' + error);
        }
        done();
      });
      abilityDelegator.printSync('Phase2_AbilityStageMonitor_0100 startAbility ');
      setTimeout(() => {
        abilityDelegator.startAbility(want, (err: any) => {
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0100 err: ' + err);
        });
      }, 3000);
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0200
     * @tc.name Phase2_AbilityStageMonitor_0200
     * @tc.desc Verify that StageMonitor listens to the abilitystage (wait plus timeout) CallBack after the abilitystage starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0200', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassistb');
      let monitor = {
        moduleName: 'featureassistb',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      abilityDelegator.waitAbilityStageMonitor(monitor, 6000, (err, data) => {
        try {
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0200 err code: ' + err.code);
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0200 data code: ' + JSON.stringify(data.context.currentHapModuleInfo.name));
          let moduleName = data.context.currentHapModuleInfo.name;
          expect(moduleName).assertEqual(monitor.moduleName)
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0200 pass');
        } catch (error) {
          abilityDelegator.printSync('PHASE2_ABILITY_STAGE_MONITOR_0200 catch error:' + error);
        }
        done();
      });
      abilityDelegator.startAbility(want, (err: any) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0200 err: ' + err);
      });
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0300
     * @tc.name Phase2_AbilityStageMonitor_0300
     * @tc.desc Verify that StageMonitor listens for the abilitystage Promise after the abilitystage starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0300', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassistc');
      let monitor = {
        moduleName: 'featureassistc',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      abilityDelegator.waitAbilityStageMonitor(monitor).then((data) => {
        try {
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0300 pass data: ' + JSON.stringify(data.context.currentHapModuleInfo.name));
          let moduleName = data.context.currentHapModuleInfo.name;
          expect(moduleName).assertEqual(monitor.moduleName)
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0300 pass');
          done();
        } catch (error) {
          abilityDelegator.printSync('PHASE2_ABILITY_STAGE_MONITOR_0200 catch error:' + error);
          expect().assertFail();
          done();
        }

      }).catch((err) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0300 catch err' + err);
        expect(err != null).assertTrue();
        done();
      })
      abilityDelegator.startAbility(want, (err: any) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0300 err: ' + err);
      });
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0400
     * @tc.name Phase2_AbilityStageMonitor_0400
     * @tc.desc Verify that StageMonitor listens for the abilitystage(wait plus timeout) Promise after the abilitystage starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0400', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassistd');
      let monitor = {
        moduleName: 'featureassistd',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      abilityDelegator.waitAbilityStageMonitor(monitor, 6000).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0400 pass data: ' + JSON.stringify(data.context.currentHapModuleInfo.name));
        let moduleName = data.context.currentHapModuleInfo.name;
        expect(moduleName).assertEqual(monitor.moduleName)
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0400 pass');
        done();
      }).catch((err) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0400 error');
        expect(err != null).assertTrue();
        done();
      });
      abilityDelegator.startAbility(want)
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0500
     * @tc.name Phase2_AbilityStageMonitor_0500
     * @tc.desc After verifying that the StageMonitor add is removed again, starting the abilitystage cannot listen to the abilitystage CallBack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0500', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassista');
      let monitor = {
        moduleName: 'featureassista',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      abilityDelegator.addAbilityStageMonitor(monitor, (err, data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 addAbilityStageMonitor err: ' + JSON.stringify(err));
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 addAbilityStageMonitor data: ' + JSON.stringify(data));

      })
      abilityDelegator.waitAbilityStageMonitor(monitor, (err, data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 err code: ' + err.code);
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 waitAbilityStageMonitor data: ' + JSON.stringify(data));
        expect(err.code).assertEqual(16000100)
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 pass')
        done();
      });
      abilityDelegator.removeAbilityStageMonitor(monitor, (err, data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 removeAbilityStageMonitor err: ' + JSON.stringify(err))
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 removeAbilityStageMonitor data: ' + JSON.stringify(data))
      })
      setTimeout(() => {
        try {
          abilityDelegator.startAbility(want);
        } catch (error) {
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 catch error: ' + error)
        }
      }, 3000);
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0600
     * @tc.name Phase2_AbilityStageMonitor_0600
     * @tc.desc After verifying that the StageMonitor add is removed again, starting the abilitystage cannot listen to the abilitystage promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0600', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassistb');
      let monitor = {
        moduleName: 'featureassistb',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      abilityDelegator.addAbilityStageMonitor(monitor).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0600 addAbilityStageMonitor data: ' + JSON.stringify(data))

      })
      await abilityDelegator.waitAbilityStageMonitor(monitor).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0600 waitAbilityStageMonitor data: ' + JSON.stringify(data))
      }).catch((err) => {
        abilityDelegator.printSync("Phase2_AbilityStageMonitor_0600 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0600 pass')
        done();
      }).catch((err) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0600 error')
        expect().assertFail();
        done();
      })
      abilityDelegator.removeAbilityStageMonitor(monitor).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0600 removeAbilityStageMonitor data: ' + JSON.stringify(data))
      })
      await abilityDelegator.startAbility(want);
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0700
     * @tc.name Phase2_AbilityStageMonitor_0700
     * @tc.desc After verifying that the StageMonitor wait is removed again, go to start the abilitystage and cannot listen to the abilitystage CallBack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0700', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassistc');
      let monitor = {
        moduleName: 'featureassistc',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      abilityDelegator.waitAbilityStageMonitor(monitor, (err, data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0700 err code: ' + err.code);
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0700 waitAbilityStageMonitor data: ' + JSON.stringify(data));
        expect(err.code).assertEqual(16000100)
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0700 pass')
        done();
      });
      abilityDelegator.removeAbilityStageMonitor(monitor, (err, data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0700 removeAbilityStageMonitor err: ' + JSON.stringify(err))
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0700 removeAbilityStageMonitor data: ' + JSON.stringify(data))
      })
      setTimeout(() => {
        try {
          abilityDelegator.startAbility(want);
        } catch (error) {
          abilityDelegator.printSync('Phase2_AbilityStageMonitor_0500 catch error: ' + error)
        }
      }, 3000);
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0800
     * @tc.name Phase2_AbilityStageMonitor_0800
     * @tc.desc After verifying that the StageMonitor wait is removed again, starting the abilitystage cannot listen to the abilitystage promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0800', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassistd');
      let monitor = {
        moduleName: 'featureassistd',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      await abilityDelegator.waitAbilityStageMonitor(monitor).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0800 waitAbilityStageMonitor data: ' + JSON.stringify(data))
      }).catch((err) => {
        abilityDelegator.printSync("Phase2_AbilityStageMonitor_0800 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0800 pass')
        done();
      }).catch((err) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0800 error')
        expect().assertFail();
        done();
      })
      abilityDelegator.removeAbilityStageMonitor(monitor).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0800 removeAbilityStageMonitor data: ' + JSON.stringify(data))
      })
      await abilityDelegator.startAbility(want);
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_0900
     * @tc.name Phase2_AbilityStageMonitor_0900
     * @tc.desc Verify that the moduleName of the StageMonitor wait incoming error cannot listen to the abilitystage promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_0900', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'feature_error');
      let monitor = {
        moduleName: 'feature_error',
        srcEntrance: './ets/Application/AbilityStage.ts'
      };
      await abilityDelegator.waitAbilityStageMonitor(monitor).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0900 waitAbilityStageMonitor data: ' + JSON.stringify(data))
      }).catch((err) => {
        abilityDelegator.printSync("Phase2_AbilityStageMonitor_0900 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_0900 pass')
        done();
      })
      await abilityDelegator.startAbility(want);
    })

    /**
     * @tc.number PHASE2_ABILITY_STAGE_MONITOR_1000
     * @tc.name Phase2_AbilityStageMonitor_1000
     * @tc.desc srcEntrance that verifies that StageMonitor wait incoming errors cannot listen to abilitystage promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PHASE2_ABILITY_STAGE_MONITOR_1000', 0, async function (done) {
      const want = factoryWant('com.example.delegatortest', 'MainAbility', 'featureassista');
      let monitor = {
        moduleName: 'featureassista',
        srcEntrance: './ets/Application/AbilityStageerror.ts'
      };
      await abilityDelegator.waitAbilityStageMonitor(monitor).then((data) => {
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_1000 waitAbilityStageMonitor data: ' + JSON.stringify(data))
      }).catch((err) => {
        abilityDelegator.printSync("Phase2_AbilityStageMonitor_1000 waitAbilityStageMonitor err: " + JSON.stringify(err));
        expect(err.code).assertEqual(16000100)
        abilityDelegator.printSync('Phase2_AbilityStageMonitor_1000 pass')
        done();
      })
      await abilityDelegator.startAbility(want);
    })

  })
}


