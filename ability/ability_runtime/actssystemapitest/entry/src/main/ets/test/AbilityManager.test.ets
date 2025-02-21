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

import { describe, it, expect } from '@ohos/hypium'
import abilityManager from "@ohos.app.ability.abilityManager"

let ERROR_CODE = 202;
export default function abilityManagerTest() {
  describe('abilityManagerTest', function () {

    /**
     * @tc.number: System_API_Test_Ability_Manager_0100
     * @tc.name: callback form updateConfiguration system interface interception test
     * @tc.desc:  Test the third-party application call updateConfiguration will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0100', 0, function (done) {
      let TAG = 'System_API_Test_Ability_Manager_0100';
      let configInit = {
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
     * @tc.desc:  Test the third-party application call updateConfiguration will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0200', 0, function (done) {
      let TAG = 'System_API_Test_Ability_Manager_0200';
      let configInit = {
        language: 'english'
      }
      abilityManager.updateConfiguration(configInit)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0300
     * @tc.name: callback form getAbilityRunningInfos system interface interception test
     * @tc.desc:  Test the third-party application call getAbilityRunningInfos will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0300', 0, function (done) {
      let TAG = 'System_API_Test_Ability_Manager_0300';
      abilityManager.getAbilityRunningInfos((err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0400
     * @tc.name: promise form getAbilityRunningInfos system interface interception test
     * @tc.desc:  Test the third-party application call getAbilityRunningInfos will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0400', 0, function (done) {
      let TAG = 'System_API_Test_Ability_Manager_0400';
      abilityManager.getAbilityRunningInfos()
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0500
     * @tc.name: callback form getExtensionRunningInfos system interface interception test
     * @tc.desc:  Test the third-party application call getExtensionRunningInfos will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0500', 0, function (done) {
      let TAG = 'System_API_Test_Ability_Manager_0500';
      let upperLimit = 10;
      abilityManager.getExtensionRunningInfos(upperLimit, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0600
     * @tc.name: promise form getExtensionRunningInfos system interface interception test
     * @tc.desc:  Test the third-party application call getExtensionRunningInfos will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0600', 0, function (done) {
      let TAG = 'System_API_Test_Ability_Manager_0600';
      let upperLimit = 10;
      abilityManager.getExtensionRunningInfos(upperLimit)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch(err => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_Ability_Manager_0700
     * @tc.name: callback form getTopAbility system interface interception test
     * @tc.desc:  Test the third-party application call getTopAbility will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0700', 0, function (done) {
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
     * @tc.desc:  Test the third-party application call getTopAbility will be blocked
     * @tc.level   3
     */
    it('System_API_Test_Ability_Manager_0800', 0, function (done) {
      let TAG = 'System_API_Test_Ability_Manager_0800';
      try {
        abilityManager.getTopAbility().then().catch();
      } catch (error) {
        console.log(TAG + "  err.code: " + error.code);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })
  })
}