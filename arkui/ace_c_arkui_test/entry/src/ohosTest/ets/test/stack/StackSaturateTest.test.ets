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

export default function stackSaturateTest() {

  describe('StackSaturateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_SATURATE_0100
     * @tc.name       : testStackSaturate001
     * @tc.desc       : testing saturate for stack with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackSaturate001', 0, async (done: Function) => {
      expect(nativeFunc.testStackSaturate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_SATURATE_0200
     * @tc.name       : testStackSaturate002
     * @tc.desc       : testing saturate for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackSaturate002', 0, async (done: Function) => {
      expect(nativeFunc.testStackSaturate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_SATURATE_0300
     * @tc.name       : testStackSaturate003
     * @tc.desc       : testing saturate for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackSaturate003', 0, async (done: Function) => {
      expect(nativeFunc.testStackSaturate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_SATURATE_0400
     * @tc.name       : testStackSaturate004
     * @tc.desc       : testing saturate for stack with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackSaturate004', 0, async (done: Function) => {
      expect(nativeFunc.testStackSaturate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_SATURATE_0500
     * @tc.name       : testStackSaturate005
     * @tc.desc       : testing saturate for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackSaturate005', 0, async (done: Function) => {
      expect(nativeFunc.testStackSaturate005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_SATURATE_0600
     * @tc.name       : testStackSaturate006
     * @tc.desc       : testing saturate for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackSaturate006', 0, async (done: Function) => {
      expect(nativeFunc.testStackSaturate006()).assertEqual(0)
      done()
    })

  })
}
