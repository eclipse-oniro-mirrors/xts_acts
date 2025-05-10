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

export default function stackAlignTest() {

  describe('StackAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0100
     * @tc.name       : testStackAlign001
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign001', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0200
     * @tc.name       : testStackAlign002
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign002', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0300
     * @tc.name       : testStackAlign003
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign003', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0400
     * @tc.name       : testStackAlign004
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign004', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0500
     * @tc.name       : testStackAlign005
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign005', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0600
     * @tc.name       : testStackAlign006
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign006', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0700
     * @tc.name       : testStackAlign007
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign007', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0800
     * @tc.name       : testStackAlign008
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign008', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_0900
     * @tc.name       : testStackAlign009
     * @tc.desc       : testing align for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackAlign009', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1000
     * @tc.name       : testStackAlign010
     * @tc.desc       : testing align for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackAlign010', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1100
     * @tc.name       : testStackAlign011
     * @tc.desc       : testing align for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackAlign011', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1200
     * @tc.name       : testStackAlign012
     * @tc.desc       : testing align for stack with NULL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackAlign012', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1300
     * @tc.name       : testStackAlign013
     * @tc.desc       : testing align for stack with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackAlign013', 0, async (done: Function) => {
      expect(nativeFunc.testStackAlign013()).assertEqual(0)
      done()
    })

  })
}
