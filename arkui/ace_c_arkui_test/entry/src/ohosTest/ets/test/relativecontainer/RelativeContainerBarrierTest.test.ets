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

export default function relativeContainerBarrierTest() {

  describe('RelativeContainerBarrierTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0100
     * @tc.name       : testRelativeContainerBarrierOptionCreate001
     * @tc.desc       : testing BarrierOptionCreate for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionCreate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionCreate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0200
     * @tc.name       : testRelativeContainerBarrierOptionDispose001
     * @tc.desc       : testing BarrierOptionDispose for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionDispose001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionDispose001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0300
     * @tc.name       : testRelativeContainerBarrierOptionSetId001
     * @tc.desc       : testing BarrierOptionSetId for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetId001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetId001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0400
     * @tc.name       : testRelativeContainerBarrierOptionSetId002
     * @tc.desc       : testing BarrierOptionSetId for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetId002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetId002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0500
     * @tc.name       : testRelativeContainerBarrierOptionSetId003
     * @tc.desc       : testing BarrierOptionSetId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetId003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetId003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0600
     * @tc.name       : testRelativeContainerBarrierOptionSetId004
     * @tc.desc       : testing BarrierOptionSetId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetId004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetId004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0700
     * @tc.name       : testRelativeContainerBarrierOptionGetId001
     * @tc.desc       : testing BarrierOptionGetId for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetId001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetId001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0800
     * @tc.name       : testRelativeContainerBarrierOptionGetId002
     * @tc.desc       : testing BarrierOptionGetId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetId002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetId002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_0900
     * @tc.name       : testRelativeContainerBarrierOptionSetDirection001
     * @tc.desc       : testing BarrierOptionSetDirection for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetDirection001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetDirection001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1000
     * @tc.name       : testRelativeContainerBarrierOptionSetDirection002
     * @tc.desc       : testing BarrierOptionSetDirection for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetDirection002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetDirection002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1100
     * @tc.name       : testRelativeContainerBarrierOptionSetDirection003
     * @tc.desc       : testing BarrierOptionSetDirection for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetDirection003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetDirection003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1200
     * @tc.name       : testRelativeContainerBarrierOptionSetDirection004
     * @tc.desc       : testing BarrierOptionSetDirection for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetDirection004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetDirection004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1300
     * @tc.name       : testRelativeContainerBarrierOptionSetDirection005
     * @tc.desc       : testing BarrierOptionSetDirection for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetDirection005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetDirection005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1400
     * @tc.name       : testRelativeContainerBarrierOptionSetDirection006
     * @tc.desc       : testing BarrierOptionSetDirection for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetDirection006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetDirection006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1500
     * @tc.name       : testRelativeContainerBarrierOptionGetDirection001
     * @tc.desc       : testing BarrierOptionGetDirection for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetDirection001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetDirection001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1600
     * @tc.name       : testRelativeContainerBarrierOptionGetDirection002
     * @tc.desc       : testing BarrierOptionGetDirection for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetDirection002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetDirection002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1700
     * @tc.name       : testRelativeContainerBarrierOptionSetReferencedId001
     * @tc.desc       : testing BarrierOptionSetPositionStart for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetReferencedId001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetReferencedId001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1800
     * @tc.name       : testRelativeContainerBarrierOptionSetReferencedId002
     * @tc.desc       : testing BarrierOptionSetPositionStart for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetReferencedId002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetReferencedId002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_1900
     * @tc.name       : testRelativeContainerBarrierOptionSetReferencedId003
     * @tc.desc       : testing BarrierOptionSetPositionStart for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionSetReferencedId003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionSetReferencedId003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_2000
     * @tc.name       : testRelativeContainerBarrierOptionGetReferencedId001
     * @tc.desc       : testing BarrierOptionGetReferencedId for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetReferencedId001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetReferencedId001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_2100
     * @tc.name       : testRelativeContainerBarrierOptionGetReferencedId002
     * @tc.desc       : testing BarrierOptionGetReferencedId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetReferencedId002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetReferencedId002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_2200
     * @tc.name       : testRelativeContainerBarrierOptionGetReferencedId003
     * @tc.desc       : testing BarrierOptionGetReferencedId for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetReferencedId003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetReferencedId003()).assertEqual(0)
      done()
    })

   /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_2300
     * @tc.name       : testRelativeContainerBarrierOptionGetReferencedSize001
     * @tc.desc       : testing BarrierOptionGetReferencedSize for RelativeContainer with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetReferencedSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetReferencedSize001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_BARRIER_2400
     * @tc.name       : testRelativeContainerBarrierOptionGetReferencedSize002
     * @tc.desc       : testing BarrierOptionGetReferencedSize for RelativeContainer with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRelativeContainerBarrierOptionGetReferencedSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRelativeContainerBarrierOptionGetReferencedSize002()).assertEqual(0)
      done()
    })
  })
}