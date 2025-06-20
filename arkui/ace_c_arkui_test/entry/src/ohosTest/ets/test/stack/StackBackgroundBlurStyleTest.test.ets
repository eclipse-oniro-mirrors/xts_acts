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

export default function stackBackgroundBlurStyleTest() {

  describe('StackBackgroundBlurStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0100
     * @tc.name       : testStackBackgroundBlurStyle001
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0200
     * @tc.name       : testStackBackgroundBlurStyle002
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0300
     * @tc.name       : testStackBackgroundBlurStyle003
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0400
     * @tc.name       : testStackBackgroundBlurStyle004
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0500
     * @tc.name       : testStackBackgroundBlurStyle005
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0600
     * @tc.name       : testStackBackgroundBlurStyle006
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0700
     * @tc.name       : testStackBackgroundBlurStyle007
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0800
     * @tc.name       : testStackBackgroundBlurStyle008
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_0900
     * @tc.name       : testStackBackgroundBlurStyle009
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_1000
     * @tc.name       : testStackBackgroundBlurStyle010
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_1100
     * @tc.name       : testStackBackgroundBlurStyle011
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_1200
     * @tc.name       : testStackBackgroundBlurStyle012
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_1300
     * @tc.name       : testStackBackgroundBlurStyle013
     * @tc.desc       : testing backgroundBlurStyle for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBackgroundBlurStyle013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BACKGROUNDBLURSTYLE_1400
     * @tc.name       : testStackBackgroundBlurStyle014
     * @tc.desc       : testing backgroundBlurStyle for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testStackBackgroundBlurStyle014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBackgroundBlurStyle014()).assertEqual(0)
      done()
    })

  })
}
