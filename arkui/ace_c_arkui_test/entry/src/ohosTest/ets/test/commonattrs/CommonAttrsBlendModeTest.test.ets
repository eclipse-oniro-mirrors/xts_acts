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

export default function commonAttrsBlendModeTest() {

  describe('CommonAttrsBlendModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0100
     * @tc.name       : testCommonAttrsBlendMode001
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_NONE, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0200
     * @tc.name       : testCommonAttrsBlendMode002
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_NONE, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0300
     * @tc.name       : testCommonAttrsBlendMode003
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_CLEAR, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0400
     * @tc.name       : testCommonAttrsBlendMode004
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_CLEAR, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0500
     * @tc.name       : testCommonAttrsBlendMode005
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0600
     * @tc.name       : testCommonAttrsBlendMode006
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0700
     * @tc.name       : testCommonAttrsBlendMode007
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0800
     * @tc.name       : testCommonAttrsBlendMode008
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_0900
     * @tc.name       : testCommonAttrsBlendMode009
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_OVER, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1000
     * @tc.name       : testCommonAttrsBlendMode010
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_OVER, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1100
     * @tc.name       : testCommonAttrsBlendMode011
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_OVER, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1200
     * @tc.name       : testCommonAttrsBlendMode012
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_OVER, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1300
     * @tc.name       : testCommonAttrsBlendMode013
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_IN, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode013', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1400
     * @tc.name       : testCommonAttrsBlendMode014
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_IN, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode014', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1500
     * @tc.name       : testCommonAttrsBlendMode015
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_IN, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode015', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1600
     * @tc.name       : testCommonAttrsBlendMode016
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_IN, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode016', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1700
     * @tc.name       : testCommonAttrsBlendMode017
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_OUT, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode017', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1800
     * @tc.name       : testCommonAttrsBlendMode018
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_OUT, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode018', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_1900
     * @tc.name       : testCommonAttrsBlendMode019
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_OUT, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode019', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2000
     * @tc.name       : testCommonAttrsBlendMode020
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_OUT, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode020', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2100
     * @tc.name       : testCommonAttrsBlendMode021
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_ATOP, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode021', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2200
     * @tc.name       : testCommonAttrsBlendMode022
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SRC_ATOP, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode022', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2300
     * @tc.name       : testCommonAttrsBlendMode023
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_ATOP, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode023', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2400
     * @tc.name       : testCommonAttrsBlendMode024
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DST_ATOP, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode024', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2500
     * @tc.name       : testCommonAttrsBlendMode025
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_XOR, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode025', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2600
     * @tc.name       : testCommonAttrsBlendMode026
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_XOR, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode026', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2700
     * @tc.name       : testCommonAttrsBlendMode027
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_PLUS, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode027', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2800
     * @tc.name       : testCommonAttrsBlendMode028
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_PLUS, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode028', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_2900
     * @tc.name       : testCommonAttrsBlendMode029
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_MODULATE, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode029', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3000
     * @tc.name       : testCommonAttrsBlendMode030
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_MODULATE, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode030', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3100
     * @tc.name       : testCommonAttrsBlendMode031
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SCREEN, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode031', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3200
     * @tc.name       : testCommonAttrsBlendMode032
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SCREEN, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode032', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3300
     * @tc.name       : testCommonAttrsBlendMode033
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_OVERLAY, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode033', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode033()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3400
     * @tc.name       : testCommonAttrsBlendMode034
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_OVERLAY, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode034', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode034()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3500
     * @tc.name       : testCommonAttrsBlendMode035
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DARKEN, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode035', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode035()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3600
     * @tc.name       : testCommonAttrsBlendMode036
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DARKEN, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode036', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode036()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3700
     * @tc.name       : testCommonAttrsBlendMode037
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_LIGHTEN, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode037', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode037()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3800
     * @tc.name       : testCommonAttrsBlendMode038
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_LIGHTEN, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode038', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode038()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_3900
     * @tc.name       : testCommonAttrsBlendMode039
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_COLOR_DODGE, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode039', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode039()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4000
     * @tc.name       : testCommonAttrsBlendMode040
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_COLOR_DODGE, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode040', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4100
     * @tc.name       : testCommonAttrsBlendMode041
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_HARD_LIGHT, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode041', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode041()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4200
     * @tc.name       : testCommonAttrsBlendMode042
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_HARD_LIGHT, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode042', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode042()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4300
     * @tc.name       : testCommonAttrsBlendMode043
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SOFT_LIGHT, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode043', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode043()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4400
     * @tc.name       : testCommonAttrsBlendMode044
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SOFT_LIGHT, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode044', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode044()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4500
     * @tc.name       : testCommonAttrsBlendMode045
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DIFFERENCE, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode045', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode045()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4600
     * @tc.name       : testCommonAttrsBlendMode046
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_DIFFERENCE, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode046', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode046()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4700
     * @tc.name       : testCommonAttrsBlendMode047
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_EXCLUSION, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode047', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode047()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4800
     * @tc.name       : testCommonAttrsBlendMode048
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_EXCLUSION, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode048', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode048()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_4900
     * @tc.name       : testCommonAttrsBlendMode049
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_MULTIPLY, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode049', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode049()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5000
     * @tc.name       : testCommonAttrsBlendMode050
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_MULTIPLY, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode050', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode050()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5100
     * @tc.name       : testCommonAttrsBlendMode051
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_HUE, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode051', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode051()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5200
     * @tc.name       : testCommonAttrsBlendMode052
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_HUE, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode052', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode052()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5300
     * @tc.name       : testCommonAttrsBlendMode053
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SATURATION, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode053', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode053()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5400
     * @tc.name       : testCommonAttrsBlendMode054
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_SATURATION, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode054', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode054()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5500
     * @tc.name       : testCommonAttrsBlendMode055
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_COLOR, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode055', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode055()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5600
     * @tc.name       : testCommonAttrsBlendMode056
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_COLOR, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode056', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode056()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5700
     * @tc.name       : testCommonAttrsBlendMode057
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_LUMINOSITY, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode057', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode057()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5800
     * @tc.name       : testCommonAttrsBlendMode058
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_LUMINOSITY, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode058', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode058()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_5900
     * @tc.name       : testCommonAttrsBlendMode059
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_COLOR_BURN, blendModeApplyType =
     * BLEND_APPLY_TYPE_FAST'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode059', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode059()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_6000
     * @tc.name       : testCommonAttrsBlendMode060
     * @tc.desc       : testing transform for common with
     *           'blendMode = ARKUI_BLEND_MODE_COLOR_BURN, blendModeApplyType =
     * BLEND_APPLY_TYPE_OFFSCREEN'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode060', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode060()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_BLENDMODE_6100
     * @tc.name       : testCommonAttrsBlendMode061
     * @tc.desc       : testing transform for common with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsBlendMode061', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsBlendMode061()).assertEqual(0)
      done()
    })



  })
}
