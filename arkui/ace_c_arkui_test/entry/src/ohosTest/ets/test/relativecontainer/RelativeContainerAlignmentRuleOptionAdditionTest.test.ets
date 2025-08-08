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

export default function relativecontaineAlignmentRuleOptionAdditionTest() {

  describe('RelativecontaineAlignmentRuleOptionAdditionTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_CREATE_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionCreate001
     * @tc.desc       : create alignmentRuleOption
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionCreate001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionCreate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_DISPOSE_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionDispose001
     * @tc.desc       : dispose alignmentRuleOption
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionDispose001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionDispose001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_START_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetStart001
     * @tc.desc       : set alignmentRuleOption start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetStart001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetStart001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_START_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetStart002
     * @tc.desc       : set alignmentRuleOption start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetStart002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetStart002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_START_0300
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetStart003
     * @tc.desc       : set alignmentRuleOption start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetStart003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetStart003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_END_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetEnd001
     * @tc.desc       : set alignmentRuleOption end
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetEnd001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetEnd001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_END_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetEnd002
     * @tc.desc       : set alignmentRuleOption end
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetEnd002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetEnd002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_END_0300
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetEnd003
     * @tc.desc       : set alignmentRuleOption end
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetEnd003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetEnd003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_CENTER_HORIZONTAL_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetCenterHorizontal001
     * @tc.desc       : set alignmentRuleOption centerHorizontal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetCenterHorizontal001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetCenterHorizontal001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_CENTER_HORIZONTAL_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetCenterHorizontal002
     * @tc.desc       : set alignmentRuleOption centerHorizontal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetCenterHorizontal002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetCenterHorizontal002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_CENTER_HORIZONTAL_0300
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetCenterHorizontal003
     * @tc.desc       : set alignmentRuleOption centerHorizontal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetCenterHorizontal003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetCenterHorizontal003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_TOP_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetTop001
     * @tc.desc       : set alignmentRuleOption top
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetTop001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetTop001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_TOP_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetTop002
     * @tc.desc       : set alignmentRuleOption top
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetTop002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetTop002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_TOP_0300
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetTop003
     * @tc.desc       : set alignmentRuleOption top
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetTop003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetTop003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_BOTTOM_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetBottom001
     * @tc.desc       : set alignmentRuleOption bottom
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetBottom001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetBottom001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_BOTTOM_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetBottom002
     * @tc.desc       : set alignmentRuleOption bottom
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetBottom002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetBottom002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_BOTTOM_0300
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetBottom003
     * @tc.desc       : set alignmentRuleOption bottom
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetBottom003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetBottom003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_CENTER_VERTICAL_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetCenterVertical001
     * @tc.desc       : set alignmentRuleOption centerVertical
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetCenterVertical001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetCenterVertical001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_CENTER_VERTICAL_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetCenterVertical002
     * @tc.desc       : set alignmentRuleOption centerVertical
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetCenterVertical002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetCenterVertical002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_CENTER_VERTICAL_0300
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetCenterVertical003
     * @tc.desc       : set alignmentRuleOption centerVertical
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetCenterVertical003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetCenterVertical003()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_BIAS_HORIZONTAL_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetBiasHorizontal001
     * @tc.desc       : set alignmentRuleOption biasHorizontal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetBiasHorizontal001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetBiasHorizontal001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_BIAS_HORIZONTAL_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetBiasHorizontal002
     * @tc.desc       : set alignmentRuleOption biasHorizontal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetBiasHorizontal002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetBiasHorizontal002()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_BIAS_VERTICAL_0100
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetBiasVertical001
     * @tc.desc       : set alignmentRuleOption biasVertical
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetBiasVertical001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetBiasVertical001()).assertEqual(0);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ALIGNMENT_RULE_OPTION_SET_BIAS_VERTICAL_0200
     * @tc.name       : testRelativeContaineAlignmentRuleOptionSetBiasVertical002
     * @tc.desc       : set alignmentRuleOption biasVertical
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContaineAlignmentRuleOptionSetBiasVertical002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContaineAlignmentRuleOptionSetBiasVertical002()).assertEqual(0);
      done();
    });

  })
}