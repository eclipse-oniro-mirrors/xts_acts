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

export default function relativeContainerGuidelineTest() {

  describe('RelativeContainerGuidelineTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0100
     * @tc.name       : testRelativeContainerGuidelineOptionCreate001
     * @tc.desc       : testing BarrierOptionCreate for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionCreate001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionCreate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0200
     * @tc.name       : testRelativeContainerGuidelineOptionDispose001
     * @tc.desc       : testing GuideLineOptionDispose for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionDispose001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionDispose001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0300
     * @tc.name       : testRelativeContainerGuidelineOptionSetId001
     * @tc.desc       : testing GuideLineOptionSetId for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetId001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetId001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0400
     * @tc.name       : testRelativeContainerBarrierOptionSetId002
     * @tc.desc       : testing GuideLineOptionSetId for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetId002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetId002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0500
     * @tc.name       : testRelativeContainerGuidelineOptionSetId003
     * @tc.desc       : testing GuideLineOptionSetId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetId003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetId003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0600
     * @tc.name       : testRelativeContainerGuidelineOptionSetId004
     * @tc.desc       : testing GuideLineOptionSetId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetId004', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetId004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0700
     * @tc.name       : testRelativeContainerGuidelineOptionGetId001
     * @tc.desc       : testing GuideLineOptionGetId for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetId001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetId001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0800
     * @tc.name       : testRelativeContainerGuidelineOptionGetId002
     * @tc.desc       : testing GuideLineOptionGetId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetId002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetId002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_0900
     * @tc.name       : testRelativeContainerGuidelineOptionSetDirection001
     * @tc.desc       : testing GuideLineOptionSetDirection for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetDirection001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetDirection001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1000
     * @tc.name       : testRelativeContainerGuidelineOptionSetDirection002
     * @tc.desc       : testing GuideLineOptionSetDirection for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetDirection002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetDirection002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1100
     * @tc.name       : testRelativeContainerGuidelineOptionGetDirection001
     * @tc.desc       : testing GuideLineOptionGetDirection for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetDirection001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetDirection001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1200
     * @tc.name       : testRelativeContainerGuidelineOptionGetDirection002
     * @tc.desc       : testing GuideLineOptionGetDirection for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetDirection002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetDirection002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1300
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionStart001
     * @tc.desc       : testing GuideLineOptionSetPositionStart for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionStart001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionStart001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1400
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionStart002
     * @tc.desc       : testing GuideLineOptionSetPositionStart for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionStart002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionStart002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1500
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionStart003
     * @tc.desc       : testing GuideLineOptionSetPositionStart for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionStart003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionStart003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1600
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionStart004
     * @tc.desc       : testing GuideLineOptionSetPositionStart for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionStart004', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionStart004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1700
     * @tc.name       : testRelativeContainerGuidelineOptionGetPositionStart001
     * @tc.desc       : testing GuideLineOptionGetPositionStart for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetPositionStart001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetPositionStart001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1800
     * @tc.name       : testRelativeContainerGuidelineOptionGetPositionStart002
     * @tc.desc       : testing GuideLineOptionGetPositionStart for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetPositionStart002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetPositionStart002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_1900
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionEnd001
     * @tc.desc       : testing GuideLineOptionSetPositionEnd for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionEnd001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionEnd001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_2000
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionEnd002
     * @tc.desc       : testing GuideLineOptionSetPositionEnd for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionEnd002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionEnd002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_2100
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionEnd003
     * @tc.desc       : testing GuideLineOptionSetPositionEnd for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionEnd003', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionEnd003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_2200
     * @tc.name       : testRelativeContainerGuidelineOptionSetPositionEnd004
     * @tc.desc       : testing GuideLineOptionSetPositionEnd for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionSetPositionEnd004', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionSetPositionEnd004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_2300
     * @tc.name       : testRelativeContainerGuidelineOptionGetPositionEnd001
     * @tc.desc       : testing GuideLineOptionGetPositionEnd for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetPositionEnd001', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetPositionEnd001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_GUIDELINE_2400
     * @tc.name       : testRelativeContainerGuidelineOptionGetPositionEnd002
     * @tc.desc       : testing GuideLineOptionGetPositionEnd for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerGuidelineOptionGetPositionEnd002', 0, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerGuidelineOptionGetPositionEnd002()).assertEqual(0)
      done()
    })
  })
}