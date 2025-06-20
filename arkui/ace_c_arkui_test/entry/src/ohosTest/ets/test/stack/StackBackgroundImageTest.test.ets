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

export default function stackBackgroundImageTest() {

  describe('StackBackgroundImageTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGE_0100
     * @tc.name       : testStackBackgroundImage001
     * @tc.desc       : testing backgroundImage for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundImage001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImage001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGE_0200
     * @tc.name       : testStackBackgroundImage002
     * @tc.desc       : testing backgroundImage for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundImage002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImage002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGE_0300
     * @tc.name       : testStackBackgroundImage003
     * @tc.desc       : testing backgroundImage for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundImage003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImage003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGE_0400
     * @tc.name       : testStackBackgroundImage004
     * @tc.desc       : testing backgroundImage for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundImage004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImage004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGE_0500
     * @tc.name       : testStackBackgroundImage005
     * @tc.desc       : testing backgroundImage for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackBackgroundImage005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImage005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGE_0600
     * @tc.name       : testStackBackgroundImage006
     * @tc.desc       : testing backgroundImage for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackBackgroundImage006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImage006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDIMAGE_0700
     * @tc.name       : testStackBackgroundImage007
     * @tc.desc       : testing default values of backgroundImage property of the stack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundImage007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundImage007()).assertEqual(0)
      done()
    })

  })
}
