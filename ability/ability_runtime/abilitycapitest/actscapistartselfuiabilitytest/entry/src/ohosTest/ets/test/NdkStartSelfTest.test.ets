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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { systemParameterEnhance } from '@kit.BasicServicesKit';

import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';

let isEnabled:string;
export default function ndkTest() {
  describe('ActsCapiAbilityRuntimeNDKTest', () => {
    beforeAll(() => {
      isEnabled = systemParameterEnhance.getSync('persist.sys.abilityms.start_options_with_animation');
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_0100
     * @tc.name   : The input parameter want is null of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_0100();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(401);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_0200
     * @tc.name   : The input parameter want has been destroyed of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_0200();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(401);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_0300
     * @tc.name   : The input parameter bundlename in want is not exist of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME} =========`);
        let result = testNapi.ndkStartAbility_0300();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000001);
          hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME} =========`);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_0400
     * @tc.name   : The input parameter moduleName in want is not exist is empty of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_0400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_0400();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000001);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_0500
     * @tc.name   : The input parameter abilityName in want is not exist is empty of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_0500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_0500();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000001);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_0900
     * @tc.name   : The input parameter bundlename in want is empty string of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_0900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_0900();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000001);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_1000
     * @tc.name   : The input parameter moduleName in want is empty string of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_1000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_1000();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000001);
          done();
        }
        done();
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_1100
     * @tc.name   : The input parameter abilityName in want is empty strig of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_1100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_1100();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000001);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_1200
     * @tc.name   : The input parameter abilityName is FormExtension in want of OH_AbilityRuntime_StartSelfUIAbility.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_1200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_1200();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000001);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_1500
     * @tc.name   : Use OH_AbilityRuntime_StartSelfUIAbility in not support device.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_1500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_1500';
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME} =========`);
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_1600();
        expect(result).assertEqual(801);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })
    
    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkStartAbility_1600
     * @tc.name   : Use OH_AbilityRuntime_StartSelfUIAbility start other application.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartAbility_1600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartAbility_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.ndkStartAbility_1600();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(16000018);
          done();
        }
      }else if(isEnabled == "false"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        done();
      }else{
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        expect().assertFail();
        done();
      }
    })

  })
}