/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = 'AbilityDelegatorFATest';
const domain = 0x0000;
const TEST_SUITE_NAME = 'ActsAbilityToolAbilityDelegatorFATest';
const BUNDLE_NAME = 'com.ohos.abilitytoolabilitydelegatorfatest';
const ABILITY_NAME = 'FirstAbility';
let abilityDelegatorArguments = undefined;

export default function abilityToolAbilityDelegatorFATest() {
  describe('ActsAbilityToolAbilityDelegatorFATest', function () {

    async function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    function fail(done) {
      expect().assertFail();
      done();
    }

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_FA_0900
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_FA_0900
     * @tc.desc   Get unit test parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_FA_0900', Level.LEVEL3, async (done) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityTools_AbilityDelegator_FA_0900';
      try {
        let delegatorArguments = AbilityDelegatorRegistry.getArguments();
        let testAbilityName = delegatorArguments.parameters['-p'] + '.SecondAbility'
        let cmd = 'aa start -d 0 -a ' + testAbilityName + ' -b ' + delegatorArguments.bundleName
        delegatorArguments.parameters = {
          'test': 'refine'
        }
        let timeout = 100
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityProxy = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityProxy.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${JSON.stringify(err)} , data= ${JSON.stringify(data)}`);
          expect(delegatorArguments.bundleName).assertEqual(BUNDLE_NAME);
          expect(delegatorArguments.testRunnerClassName).assertEqual('OpenHarmonyTestRunner');
          expect(delegatorArguments.parameters.test).assertEqual('refine');
          done();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        fail(done);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_FA_0600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_FA_0600
     * @tc.desc   Call the operation finishTest with the following parameters:
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_FA_0600', Level.LEVEL3, (done) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityTools_AbilityDelegator_FA_0600';
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        let code = 'ABCD';
        // @ts-ignore
        abilityDelegator.finishTest(msg, code).then(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} finishTest promise}`);
          fail(done);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${error}`);
        expect(error.message).assertContain('parameters')
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_FA_0700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_FA_0700
     * @tc.desc   Get the AbilityDelegator object successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_FA_0700', Level.LEVEL1, (done) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityTools_AbilityDelegator_FA_0700';
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} abilityDelegator}`);
        expect(abilityDelegator !== null || abilityDelegator !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        fail(done);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_FA_0800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_FA_0800
     * @tc.desc   Call getArguments to get the unit test parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_FA_0800', Level.LEVEL3, (done) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityTools_AbilityDelegator_FA_0800';
      try {
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getArguments}`);
        expect(abilityDelegatorArguments.bundleName).assertEqual(BUNDLE_NAME);
        done();
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        fail(done);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_FA_0300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_FA_0300
     * @tc.desc   Call the executeShellCommand operation, where the shell command parameter is aa help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_FA_0300', Level.LEVEL3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityTools_AbilityDelegator_FA_0300';
      try {
        let cmd = 'aa help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        fail(done);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_FA_0400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_FA_0400
     * @tc.desc   Call the executeShellCommand operation, where the shell command parameter:
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_FA_0400', Level.LEVEL3, function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityTools_AbilityDelegator_FA_0400';
      try {
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
        let testAbilityName = abilityDelegatorArguments.parameters['-p'] + '.' + ABILITY_NAME
        let cmd = 'aa start -d 0 -a ' + testAbilityName + ' -b ' + abilityDelegatorArguments.bundleName
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {

          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        fail(done);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_FA_0500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_FA_0500
     * @tc.desc   Call the operation finishTest with the following parameters:
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_FA_0500', Level.LEVEL3, (done) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityTools_AbilityDelegator_FA_0500';
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start-----`);
        let flag = false;
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146';
        let code = 1
        abilityDelegator.finishTest(msg, code, (err, data) => {
          if (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} err ${JSON.stringify(err)}`);
            fail(done);
            return;
          }
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          flag = true;
          expect(flag).assertTrue();
          done();
        })
      } catch (error) {
        hilog.error(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        fail(done);
      }
    })
  })
}

