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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function stackTransitionTest() {

  describe('StackTransitionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0100
     * @tc.name       : testStackTransition001
     * @tc.desc       : testing move transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition001', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0200
     * @tc.name       : testStackTransition002
     * @tc.desc       : testing move transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition002', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0300
     * @tc.name       : testStackTransition003
     * @tc.desc       : testing move transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition003', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0400
     * @tc.name       : testStackTransition004
     * @tc.desc       : testing move transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition004', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0500
     * @tc.name       : testStackTransition005
     * @tc.desc       : testing move transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition005', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0600
     * @tc.name       : testStackTransition006
     * @tc.desc       : testing opacity transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition006', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0700
     * @tc.name       : testStackTransition007
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition007', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0800
     * @tc.name       : testStackTransition008
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition008', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_0900
     * @tc.name       : testStackTransition009
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition009', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1000
     * @tc.name       : testStackTransition010
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition010', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1100
     * @tc.name       : testStackTransition011
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition011', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1200
     * @tc.name       : testStackTransition012
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition012', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1300
     * @tc.name       : testStackTransition013
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition013', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1400
     * @tc.name       : testStackTransition014
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition014', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1500
     * @tc.name       : testStackTransition015
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition015', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1600
     * @tc.name       : testStackTransition016
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition016', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1700
     * @tc.name       : testStackTransition017
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition017', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1800
     * @tc.name       : testStackTransition018
     * @tc.desc       : testing opacity transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition018', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_1900
     * @tc.name       : testStackTransition019
     * @tc.desc       : testing opacity transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition019', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2000
     * @tc.name       : testStackTransition020
     * @tc.desc       : testing opacity transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition020', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2100
     * @tc.name       : testStackTransition021
     * @tc.desc       : testing rotate transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition021', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2200
     * @tc.name       : testStackTransition022
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition022', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2300
     * @tc.name       : testStackTransition023
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition023', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2400
     * @tc.name       : testStackTransition024
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition024', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2500
     * @tc.name       : testStackTransition025
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition025', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2600
     * @tc.name       : testStackTransition026
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition026', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2700
     * @tc.name       : testStackTransition027
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition027', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2800
     * @tc.name       : testStackTransition028
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition028', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_2900
     * @tc.name       : testStackTransition029
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition029', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3000
     * @tc.name       : testStackTransition030
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition030', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3100
     * @tc.name       : testStackTransition031
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition031', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3200
     * @tc.name       : testStackTransition032
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition032', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3300
     * @tc.name       : testStackTransition033
     * @tc.desc       : testing rotate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition033', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition033()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3400
     * @tc.name       : testStackTransition034
     * @tc.desc       : testing rotate transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition034', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition034()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3500
     * @tc.name       : testStackTransition035
     * @tc.desc       : testing rotate transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition035', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition035()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3600
     * @tc.name       : testStackTransition036
     * @tc.desc       : testing scale transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition036', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition036()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3700
     * @tc.name       : testStackTransition037
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition037', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition037()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3800
     * @tc.name       : testStackTransition038
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition038', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition038()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_3900
     * @tc.name       : testStackTransition039
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition039', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition039()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4000
     * @tc.name       : testStackTransition040
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition040', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4100
     * @tc.name       : testStackTransition041
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition041', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition041()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4200
     * @tc.name       : testStackTransition042
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition042', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition042()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4300
     * @tc.name       : testStackTransition043
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition043', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition043()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4400
     * @tc.name       : testStackTransition044
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition044', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition044()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4500
     * @tc.name       : testStackTransition045
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition045', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition045()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4600
     * @tc.name       : testStackTransition046
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition046', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition046()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4700
     * @tc.name       : testStackTransition047
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition047', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition047()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4800
     * @tc.name       : testStackTransition048
     * @tc.desc       : testing scale transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition048', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition048()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_4900
     * @tc.name       : testStackTransition049
     * @tc.desc       : testing scale transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition049', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition049()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5000
     * @tc.name       : testStackTransition050
     * @tc.desc       : testing scale transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition050', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition050()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5100
     * @tc.name       : testStackTransition051
     * @tc.desc       : testing translate transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition051', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition051()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5200
     * @tc.name       : testStackTransition052
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition052', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition052()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5300
     * @tc.name       : testStackTransition053
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition053', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition053()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5400
     * @tc.name       : testStackTransition054
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition054', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition054()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5500
     * @tc.name       : testStackTransition055
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition055', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition055()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5600
     * @tc.name       : testStackTransition056
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition056', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition056()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5700
     * @tc.name       : testStackTransition057
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition057', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition057()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5800
     * @tc.name       : testStackTransition058
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition058', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition058()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_5900
     * @tc.name       : testStackTransition059
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition059', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition059()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_6000
     * @tc.name       : testStackTransition060
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition060', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition060()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_6100
     * @tc.name       : testStackTransition061
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition061', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition061()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_6200
     * @tc.name       : testStackTransition062
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition062', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition062()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_6300
     * @tc.name       : testStackTransition063
     * @tc.desc       : testing translate transition for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTransition063', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition063()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_6400
     * @tc.name       : testStackTransition064
     * @tc.desc       : testing translate transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition064', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition064()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSITION_6500
     * @tc.name       : testStackTransition065
     * @tc.desc       : testing translate transition for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackTransition065', 0, async (done: Function) => {
      expect(nativeFunc.testStackTransition065()).assertEqual(0)
      done()
    })

  })
}
