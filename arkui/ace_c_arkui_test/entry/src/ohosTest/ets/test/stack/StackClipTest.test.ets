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

export default function stackClipTest() {

  describe('StackClipTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testStackClip001
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0100
     * @tc.desc   testing clip for stack with normal rect value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip002
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0200
     * @tc.desc   testing clip for stack with abnormal rect value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip003
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0300
     * @tc.desc   testing clip for stack with large rect value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip004
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0400
     * @tc.desc   testing clip for stack with normal circle value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip005
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0500
     * @tc.desc   testing clip for stack with abnormal circle value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip006
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0600
     * @tc.desc   testing clip for stack with large circle value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip007
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0700
     * @tc.desc   testing clip for stack with normal ellipse value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip008
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0800
     * @tc.desc   testing clip for stack with abnormal ellipse value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip009
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_0900
     * @tc.desc   testing clip for stack with large ellipse value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip010
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_1000
     * @tc.desc   testing clip for stack with normal path value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip011
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_1100
     * @tc.desc   testing clip for stack with abnormal path value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip012
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_1200
     * @tc.desc   testing clip for stack with large path value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip013
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_1300
     * @tc.desc   testing clip for stack with normal bool value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip014
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_1400
     * @tc.desc   testing clip for stack with normal bool value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testStackClip015
     * @tc.number SUB_ARKUI_CAPI_STACK_CLIP_1500
     * @tc.desc   testing clip for stack with abnormal bool value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackClip015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackClip015()).assertEqual(0)
      done()
    })

  })
}
