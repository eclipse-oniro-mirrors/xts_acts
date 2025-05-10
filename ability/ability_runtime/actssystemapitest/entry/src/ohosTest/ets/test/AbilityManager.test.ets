/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import abilityManager from "@ohos.app.ability.abilityManager"
import { Configuration } from '@ohos.app.ability.Configuration'
import { BusinessError } from '@ohos.base';

let ERROR_CODE = 202;

export default function abilityManagerTest() {
  describe('abilityManagerTest', () => {

    /**
     * @tc.number: System_API_Test_Ability_Manager_0100
     * @tc.name: callback form updateConfiguration system interface interception test
     * @tc.desc: Test the third-party application call updateConfiguration will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0100';
      let configInit: Configuration = {
        language: 'english'
      }
      abilityManager.updateConfiguration(configInit, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0200
     * @tc.name: promise form updateConfiguration system interface interception test
     * @tc.desc: Test the third-party application call updateConfiguration will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0200', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0200';
      let configInit: Configuration = {
        language: 'english'
      }
      abilityManager.updateConfiguration(configInit)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0300
     * @tc.name: callback form getAbilityRunningInfos public interface interception test
     * @tc.desc: Test the third-party application without permission call getAbilityRunningInfos only get self info
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0300', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0300';
      abilityManager.getAbilityRunningInfos((err, data) => {
        console.log(TAG + "  err: " + JSON.stringify(err) + "  data: " + JSON.stringify(data));
        expect(data.length).assertEqual(1);
        expect(data[0].ability.bundleName).assertEqual("com.acts.systemapitest");
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0400
     * @tc.name: promise form getAbilityRunningInfos public interface interception test
     * @tc.desc: Test the third-party application without permission call getAbilityRunningInfos only get self info
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0400', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0400';
      abilityManager.getAbilityRunningInfos()
        .then((data) => {
          console.log(`${TAG}, data: ${JSON.stringify(data)}`);
          expect(data.length).assertEqual(1);
          expect(data[0].ability.bundleName).assertEqual('com.acts.systemapitest');
          expect(data[0].pid).assertLargerOrEqual(0);
          expect(data[0].uid).assertLargerOrEqual(0);
          expect(data[0].processName).assertEqual("com.acts.systemapitest");
          expect(data[0].abilityState).assertLargerOrEqual(abilityManager.AbilityState.INITIAL);
          expect(data[0].startTime).assertLarger(0);
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + ' err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0500
     * @tc.name: callback form getExtensionRunningInfos system interface interception test
     * @tc.desc: Test the third-party application call getExtensionRunningInfos will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0500', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0500';
      let upperLimit: number = 10;
      abilityManager.getExtensionRunningInfos(upperLimit, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0600
     * @tc.name: promise form getExtensionRunningInfos system interface interception test
     * @tc.desc: Test the third-party application call getExtensionRunningInfos will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0600', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0600';
      let upperLimit: number = 10;
      abilityManager.getExtensionRunningInfos(upperLimit)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0700
     * @tc.name: callback form getTopAbility system interface interception test
     * @tc.desc: Test the third-party application call getTopAbility will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0700', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0700';
      try {
        abilityManager.getTopAbility((data) => {

        });
      } catch (error) {
        console.log(TAG + "  err.code: " + error.code);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0800
     * @tc.name: promise form getTopAbility system interface interception test
     * @tc.desc: Test the third-party application call getTopAbility will be blocked
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0800', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Ability_Manager_0800';
      try {
        abilityManager.getTopAbility().then().catch();
      } catch (error) {
        console.log(TAG + "  err.code: " + error.code);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0900
     * @tc.name: abilityState cover
     * @tc.desc: cover all value of abilityState
     * @tc.level 3
     */
    it('System_API_Test_Ability_Manager_0900', Level.LEVEL0, (done: Function) => {
      let tag = `System_API_Test_Ability_Manager_0900`;
      console.log(`${tag}, test begin`);
      try {
        expect(abilityManager.AbilityState.INITIAL).assertEqual(0);
        expect(abilityManager.AbilityState.FOCUS).assertEqual(2);
        expect(abilityManager.AbilityState.FOREGROUND).assertEqual(9);
        expect(abilityManager.AbilityState.BACKGROUND).assertEqual(10);
        expect(abilityManager.AbilityState.FOREGROUNDING).assertEqual(11);
        expect(abilityManager.AbilityState.BACKGROUNDING).assertEqual(12);
        console.log(`${tag}, test end`);
        done();
      } catch (error) {
        console.log(`${tag}, failed: ${JSON.stringify(error)}`);
        expect().assertFail()
      }
    })
  })
}