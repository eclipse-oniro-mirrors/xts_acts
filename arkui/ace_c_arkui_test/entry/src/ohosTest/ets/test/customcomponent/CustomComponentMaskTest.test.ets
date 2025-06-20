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

export default function customComponentMaskTest() {

  describe('CustomComponentMaskTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0100
     * @tc.name       : testCustomComponentMask001
     * @tc.desc       : testing transform for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0200
     * @tc.name       : testCustomComponentMask002
     * @tc.desc       : testing transform for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0300
     * @tc.name       : testCustomComponentMask003
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentMask003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0400
     * @tc.name       : testCustomComponentMask004
     * @tc.desc       : testing mask for common with
     *           'The width of the rectangular corner is greater than the width of
     * the rectangle'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0500
     * @tc.name       : testCustomComponentMask005
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0600
     * @tc.name       : testCustomComponentMask006
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentMask006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0700
     * @tc.name       : testCustomComponentMask007
     * @tc.desc       : testing mask for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask007', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0800
     * @tc.name       : testCustomComponentMask008
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask008', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_0900
     * @tc.name       : testCustomComponentMask009
     * @tc.desc       : testing mask for common with ’zero‘ value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask009', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_1000
     * @tc.name       : testCustomComponentMask010
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentMask010', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_1100
     * @tc.name       : testCustomComponentMask011
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask011', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_1200
     * @tc.name       : testCustomComponentMask012
     * @tc.desc       : testing mask for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask012', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_1300
     * @tc.name       : testCustomComponentMask013
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentMask013', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_1400
     * @tc.name       : testCustomComponentMask014
     * @tc.desc       : testing mask for common with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask014', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_1500
     * @tc.name       : testCustomComponentMask015
     * @tc.desc       : testing mask for common with 'zero' value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentMask015', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_MASK_1600
     * @tc.name       : testCustomComponentMask016
     * @tc.desc       : testing mask for common with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentMask016', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentMask016()).assertEqual(0)
      done()
    })


  })
}
