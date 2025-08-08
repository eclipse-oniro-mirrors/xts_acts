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

export default function stackOpacityTest() {

  describe('StackOpacityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_OPACITY_0100
     * @tc.name       : testStackOpacity001
     * @tc.desc       : testing opacity for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackOpacity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackOpacity001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_OPACITY_0200
     * @tc.name       : testStackOpacity002
     * @tc.desc       : testing opacity for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackOpacity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackOpacity002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_OPACITY_0300
     * @tc.name       : testStackOpacity003
     * @tc.desc       : testing opacity for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackOpacity003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackOpacity003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_OPACITY_0400
     * @tc.name       : testStackOpacity004
     * @tc.desc       : testing opacity for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackOpacity004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackOpacity004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_OPACITY_0500
     * @tc.name       : testStackOpacity005
     * @tc.desc       : testing opacity for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackOpacity005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackOpacity005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_OPACITY_0600
     * @tc.name       : testStackOpacity006
     * @tc.desc       : testing opacity for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackOpacity006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackOpacity006()).assertEqual(0)
      done()
    })

  })
}
