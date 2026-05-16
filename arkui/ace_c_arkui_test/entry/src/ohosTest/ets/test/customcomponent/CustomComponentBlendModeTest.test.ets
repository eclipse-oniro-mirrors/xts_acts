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

export default function customComponentBlendModeTest() {

  describe('CustomComponentBlendModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomComponentBlendMode001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode006
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode007
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode008
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode009
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_0900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode010
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode011
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode012
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode013
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode014
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode015
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode016
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode017
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode018
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode019
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_1900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode020
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode021
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode022
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode023
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode024
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode025
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode026
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode027
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode028
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode029
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_2900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode030
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode031
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode032
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode032()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode033
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode033()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode034
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode034()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode035
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode035()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode036
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode036()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode037
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode037()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode038
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode038()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode039
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_3900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode039()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode040
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode040()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode041
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode041()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode042
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode042()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode043
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode043()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode044
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode044', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode044()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode045
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode045', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode045()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode046
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode046', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode046()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode047
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode047', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode047()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode048
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode048', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode048()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode049
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_4900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode049', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode049()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode050
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode050', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode050()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode051
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode051', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode051()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode052
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode052', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode052()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode053
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode053', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode053()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode054
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode054', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode054()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode055
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode055', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode055()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode056
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode056', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode056()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode057
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode057', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode057()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode058
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode058', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode058()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode059
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_5900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode059', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode059()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode060
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_6000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode060', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode060()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomComponentBlendMode061
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BLENDMODE_6100
     * @tc.desc   testing transform for common with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentBlendMode061', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBlendMode061()).assertEqual(0)
      done()
    })



  })
}
