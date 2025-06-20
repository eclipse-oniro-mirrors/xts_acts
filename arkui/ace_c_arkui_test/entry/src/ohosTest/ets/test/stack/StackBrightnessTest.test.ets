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

export default function stackBrightnessTest() {

  describe('StackBrightnessTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BRIGHTNESS_0100
     * @tc.name       : testStackBrightness001
     * @tc.desc       : testing brightness for stack with negative value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBrightness001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBrightness001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BRIGHTNESS_0200
     * @tc.name       : testStackBrightness002
     * @tc.desc       : testing brightness for stack with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBrightness002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBrightness002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BRIGHTNESS_0300
     * @tc.name       : testStackBrightness003
     * @tc.desc       : testing brightness for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBrightness003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBrightness003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BRIGHTNESS_0400
     * @tc.name       : testStackBrightness004
     * @tc.desc       : testing brightness for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBrightness004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBrightness004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BRIGHTNESS_0500
     * @tc.name       : testStackBrightness005
     * @tc.desc       : testing brightness for stack with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBrightness005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBrightness005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BRIGHTNESS_0600
     * @tc.name       : testStackBrightness006
     * @tc.desc       : testing brightness for stack with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBrightness006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBrightness006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_BRIGHTNESS_0700
     * @tc.name       : testStackBrightness007
     * @tc.desc       : testing brightness for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackBrightness007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackBrightness007()).assertEqual(0)
      done()
    })

  })
}
