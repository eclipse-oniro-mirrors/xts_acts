/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function stackTransitionTest() {

  describe('StackTransitionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testStackTransition001
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0100
     * @tc.desc   testing move transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition002
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0200
     * @tc.desc   testing move transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition003
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0300
     * @tc.desc   testing move transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition004
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0400
     * @tc.desc   testing move transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition005
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0500
     * @tc.desc   testing move transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition006
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0600
     * @tc.desc   testing opacity transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition007
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0700
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition008
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0800
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition009
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_0900
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition010
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1000
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition011
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1100
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition012
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1200
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition013
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1300
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition014
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1400
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition015
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1500
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition016
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1600
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition017
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1700
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition018
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1800
     * @tc.desc   testing opacity transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition019
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_1900
     * @tc.desc   testing opacity transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition020
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2000
     * @tc.desc   testing opacity transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition021
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2100
     * @tc.desc   testing rotate transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition022
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2200
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition023
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2300
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition024
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2400
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition025
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2500
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition026
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2600
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition027
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2700
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition028
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2800
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition029
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_2900
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition030
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3000
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition031
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3100
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition032
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3200
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition032()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition033
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3300
     * @tc.desc   testing rotate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition033()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition034
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3400
     * @tc.desc   testing rotate transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition034()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition035
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3500
     * @tc.desc   testing rotate transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition035()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition036
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3600
     * @tc.desc   testing scale transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition036()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition037
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3700
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition037()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition038
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3800
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition038()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition039
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_3900
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition039()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition040
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4000
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition040()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition041
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4100
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition041()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition042
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4200
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition042()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition043
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4300
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition043()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition044
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4400
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition044', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition044()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition045
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4500
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition045', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition045()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition046
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4600
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition046', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition046()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition047
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4700
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition047', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition047()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition048
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4800
     * @tc.desc   testing scale transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition048', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition048()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition049
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_4900
     * @tc.desc   testing scale transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition049', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition049()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition050
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5000
     * @tc.desc   testing scale transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition050', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition050()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition051
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5100
     * @tc.desc   testing translate transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition051', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition051()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition052
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5200
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition052', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition052()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition053
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5300
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition053', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition053()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition054
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5400
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition054', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition054()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition055
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5500
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition055', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition055()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition056
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5600
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition056', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition056()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition057
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5700
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition057', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition057()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition058
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5800
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition058', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition058()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition059
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_5900
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition059', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition059()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition060
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_6000
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition060', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition060()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition061
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_6100
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition061', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition061()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition062
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_6200
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition062', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition062()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition063
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_6300
     * @tc.desc   testing translate transition for stack with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition063', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition063()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition064
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_6400
     * @tc.desc   testing translate transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition064', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition064()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackTransition065
     * @tc.number SUB_ARKUI_CAPI_STACK_TRANSITION_6500
     * @tc.desc   testing translate transition for stack with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackTransition065', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTransition065()).assertEqual(0)
      done()
    })

  })
}
