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

export default function customComponentOpacityTest() {

  describe('CustomComponentOpacityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_OPACITY_0100
     * @tc.name       : testCustomComponentOpacity001
     * @tc.desc       : testing opacity for checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentOpacity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentOpacity001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_OPACITY_0200
     * @tc.name       : testCustomComponentOpacity002
     * @tc.desc       : testing opacity for checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentOpacity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentOpacity002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_OPACITY_0300
     * @tc.name       : testCustomComponentOpacity003
     * @tc.desc       : testing opacity for checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentOpacity003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentOpacity003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_OPACITY_0400
     * @tc.name       : testCustomComponentOpacity004
     * @tc.desc       : testing opacity for checkbox with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentOpacity004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentOpacity004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_OPACITY_0500
     * @tc.name       : testCustomComponentOpacity005
     * @tc.desc       : testing opacity for checkbox with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentOpacity005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentOpacity005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_OPACITY_0600
     * @tc.name       : testCustomComponentOpacity006
     * @tc.desc       : testing opacity for checkbox with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentOpacity006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentOpacity006()).assertEqual(0)
      done()
    })

  })
}
