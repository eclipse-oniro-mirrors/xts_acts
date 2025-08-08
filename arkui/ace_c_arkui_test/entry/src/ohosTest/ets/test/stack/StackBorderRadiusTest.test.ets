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

export default function stackBorderRadiusTest() {

  describe('StackBorderRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0100
     * @tc.name       : testStackBorderRadius001
     * @tc.desc       : testing borderRadius for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0200
     * @tc.name       : testStackBorderRadius002
     * @tc.desc       : testing borderRadius for stack with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0300
     * @tc.name       : testStackBorderRadius003
     * @tc.desc       : testing borderRadius for stack with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0400
     * @tc.name       : testStackBorderRadius004
     * @tc.desc       : testing borderRadius for stack with lower abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackBorderRadius004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0500
     * @tc.name       : testStackBorderRadius005
     * @tc.desc       : testing borderRadius for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderRadius005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0600
     * @tc.name       : testStackBorderRadius006
     * @tc.desc       : testing borderRadius for stack with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderRadius006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0700
     * @tc.name       : testStackBorderRadius007
     * @tc.desc       : testing borderRadius for stack with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderRadius007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BORDERRADIUS_0800
     * @tc.name       : testStackBorderRadius008
     * @tc.desc       : testing borderRadius for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBorderRadius008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBorderRadius008()).assertEqual(0)
      done()
    })

  })
}
