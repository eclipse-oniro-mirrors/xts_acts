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

export default function commonAttrsBlendModeTest() {

  describe('CommonAttrsBlendModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsBlendMode001
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode002
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode003
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode004
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode005
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode006
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode007
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode008
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode009
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode010
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode011
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode012
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode013
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode014
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode015
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode016
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode017
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode018
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode019
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode020
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode021
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode022
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode023
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode024
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode025
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode026
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode027
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode028
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode029
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode030
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode031
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode032
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode032()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode033
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode033()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode034
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode034()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode035
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode035()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode036
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode036()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode037
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode037()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode038
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode038()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode039
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode039()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode040
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode040()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode041
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode041()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode042
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode042()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode043
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode043()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode044
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode044', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode044()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode045
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode045', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode045()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode046
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode046', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode046()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode047
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode047', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode047()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode048
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode048', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode048()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode049
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode049', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode049()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode050
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode050', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode050()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode051
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5100
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode051', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode051()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode052
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5200
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode052', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode052()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode053
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5300
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode053', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode053()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode054
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5400
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode054', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode054()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode055
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5500
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode055', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode055()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode056
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5600
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode056', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode056()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode057
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5700
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode057', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode057()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode058
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5800
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode058', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode058()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode059
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5900
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode059', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode059()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode060
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_6000
     * @tc.desc   testing transform for common with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode060', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode060()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsBlendMode061
     * @tc.number SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_6100
     * @tc.desc   testing transform for common with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsBlendMode061', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode061()).assertEqual(0)
      done()
    })



  })
}
