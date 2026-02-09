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

import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';

export default function ndkTest() {
  describe('ActsNdkStartSelfOptionsTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME} =========`);
      let result = testNapi.ndkStartAbilityWithOptions_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME} =========`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_0400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_0500();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_0600();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_0700();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_0800();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1300
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1500();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1600();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1700();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_1800();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME} =========`);
      let result = testNapi.ndkStartAbilityWithOptions_1900();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME} =========`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2000();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2500();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2600();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2700();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);        if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2800();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_2900();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3000();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME} =========`);
      let result = testNapi.ndkStartAbilityWithOptions_3500();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME} =========`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3600();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3700();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3800();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_3900();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_4000();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkStartAbilityWithOptions_4100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      if(result == 801){
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
        done();
      }else{
        expect(result).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200
     * @tc.number SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200';
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
        let result = testNapi.ndkStartAbilityWithOptions_4200();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(401);
          done();
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NdkStartVisibility_0100
     * @tc.number SUB_Ability_AbilityRuntime_NdkStartVisibility_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartVisibility_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartVisibility_0100';
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
        let result = testNapi.ndkStartVisibility_0100();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(401);
          done();
        }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NdkStartVisibility_0200
     * @tc.number SUB_Ability_AbilityRuntime_NdkStartVisibility_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_NdkStartVisibility_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkStartVisibility_0200';
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
        let result = testNapi.ndkStartVisibility_0200();
        hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
        if(result == 801){
          hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} current device not support.`);
          done();
        }else{
          expect(result).assertEqual(401);
          done();
        }
    })
  })
}