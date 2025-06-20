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
import { commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';

import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';
let isEnabled:string;
export default function ndkTest() {
  describe('NdkWantTest', () => {
    beforeAll(() => {
      isEnabled = systemParameterEnhance.getSync('persist.sys.abilityms.start_options_with_animation');
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0100
     * @tc.name   : The input parameter want is null of OH_AbilityBase_DestroyWant.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0100();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0200
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_SetWantElement
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0200';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0200();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0300
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_GetWantElement
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0300';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0300();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0400
     * @tc.name   : The element is empty of OH_AbilityBase_CreateWant
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0400';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0400();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual("OH_AbilityBase_GetWantElement bundleName: OH_AbilityBase_GetWantElement " +
          "moduleName: OH_AbilityBase_GetWantElement abilityName:");
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0500
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_SetWantCharParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0500';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0500();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0600
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_SetWantCharParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0600';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0600();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0700
     * @tc.name   : The input parameter value is empty of OH_AbilityBase_SetWantCharParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0700';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0700();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0800
     * @tc.name   : Repeat set key with OH_AbilityBase_SetWantCharParam.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0800';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0800();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual("OH_AbilityBase_GetWantCharParam:set second value");
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_0900
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_GetWantCharParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_0900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_0900';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_0900();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1000
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_GetWantCharParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1000';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1000();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1100
     * @tc.name   : The input parameter ket is not exist of OH_AbilityBase_GetWantCharParam.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1100';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1100();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual("OH_AbilityBase_GetWantCharParam:");
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1200
     * @tc.name   : The input parameter value is empty of OH_AbilityBase_GetWantCharParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1200';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1200();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1300
     * @tc.name   : The input parameter want is empty of OH_AbilityRuntime_StartSelfUIAbility
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1300';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1300();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1400
     * @tc.name   : The input parameter valueSize is empty of OH_AbilityBase_GetWantCharParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1400';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1400();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1500
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_AddWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1500';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1500();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1600
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_AddWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1600';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1600();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1700
     * @tc.name   : The input parameter fds is empty of OH_AbilityBase_AddWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1700';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1700();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(0);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1800
     * @tc.name   : Set Many fd with OH_AbilityBase_AddWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1800';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1800();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual("fd1:1fd2:1fd3:1fd4:1fd5:1");
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_1900
     * @tc.name   : Repeat set key with OH_AbilityBase_AddWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_1900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_1900';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_1900();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual("fd1:5");
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_2000
     * @tc.name   : The input parameter fd is -1 of OH_AbilityBase_AddWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_2000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_2000';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_2000();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(16000050);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_2100
     * @tc.name   : The input parameter fd is 0 of OH_AbilityBase_AddWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_2100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_2100';
      if(isEnabled == "true"){
        let subscriber = commonEventManager.createSubscriberSync({
          events: ['OH_AbilityRuntime_StartSelfUIAbility_Result']
        });
        commonEventManager.subscribe(subscriber, (err, data) => {
          hilog.info(0x0000, TAG, '%{public}s',  ` ${TEST_SUITE_NAME} ========= subscribe ` + JSON.stringify(data));
          hilog.info(0x0000, TAG, '%{public}s',  ` ${TEST_SUITE_NAME} ========= subscribe ` +
          JSON.stringify(data?.parameters?.wantFd));
          try{expect(data?.parameters?.wantFd?.fd).assertLarger(-1)}catch (e){}
          commonEventManager.unsubscribe(subscriber,()=>{
            hilog.info(0x0000, TAG, '%{public}s',  ` ${TEST_SUITE_NAME} ========= unsubscribe callback`);
            done();
          });
        });
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_2100();
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_2200
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_GetWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_2200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_2200';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_2200();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_2300
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_GetWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_2300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_2300';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_2300();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(401);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_2400
     * @tc.name   : The input parameter key not exist of OH_AbilityBase_GetWantFd
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_2400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_2400';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_2400();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual(-1);
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
     * @tc.number : SUB_Ability_AbilityRuntime_WantNdk_2500
     * @tc.name   : The input parameter want is empty of OH_AbilityRuntime_StartSelfUIAbility
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_WantNdk_2500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_WantNdk_2500';
      if(isEnabled == "true"){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + isEnabled);
        let result = testNapi.wantNdk_2500();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
        expect(result).assertEqual("OH_AbilityBase_GetWantElement bundleName:com.example.myapplication " +
          "OH_AbilityBase_GetWantElement moduleName:entry OH_AbilityBase_GetWantElement abilityName:EntryAbility1");
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
  })
}