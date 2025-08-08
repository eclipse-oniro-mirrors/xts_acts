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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function scrollShadowTest() {

  describe('ScrollShadowTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SHADOW_0100
     * @tc.name       : testScrollShadow001
     * @tc.desc       : testing shadow for scroll with min shadow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollShadow001', 0, async (done: Function) => {
      expect(nativeFunc.testScrollShadow001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SHADOW_0200
     * @tc.name       : testScrollShadow002
     * @tc.desc       : testing shadow for scroll with little shadow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollShadow002', 0, async (done: Function) => {
      expect(nativeFunc.testScrollShadow002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SHADOW_0300
     * @tc.name       : testScrollShadow003
     * @tc.desc       : testing shadow for scroll with middle value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollShadow003', 0, async (done: Function) => {
      expect(nativeFunc.testScrollShadow003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SHADOW_0400
     * @tc.name       : testScrollShadow004
     * @tc.desc       : testing shadow for scroll with big value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollShadow004', 0, async (done: Function) => {
      expect(nativeFunc.testScrollShadow004()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SHADOW_0500
     * @tc.name       : testScrollShadow005
     * @tc.desc       : testing shadow for scroll with float little shadow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollShadow005', 0, async (done: Function) => {
      expect(nativeFunc.testScrollShadow005()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_SHADOW_0600
     * @tc.name       : testScrollShadow006
     * @tc.desc       : testing shadow for scroll with float middle shadow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollShadow006', 0, async (done: Function) => {
      expect(nativeFunc.testScrollShadow006()).assertEqual(0)
      done();
    });
  })
}
