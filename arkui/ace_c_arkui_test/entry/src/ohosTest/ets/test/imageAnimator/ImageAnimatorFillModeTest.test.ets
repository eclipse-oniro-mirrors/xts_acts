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

export default function imageAnimatorFillModeTest() {

  describe('ImageAnimatorFillModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0100
     * @tc.name: testImageAnimatorFillMode001
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode001', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0200
     * @tc.name: testImageAnimatorFillMode002
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode002', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0300
     * @tc.name: testImageAnimatorFillMode003
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode003', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0400
     * @tc.name: testImageAnimatorFillMode004
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode004', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0500
     * @tc.name: testImageAnimatorFillMode005
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode005', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0600
     * @tc.name: testImageAnimatorFillMode006
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode006', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0700
     * @tc.name: testImageAnimatorFillMode007
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode007', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FILL_MODE_0800
     * @tc.name: testImageAnimatorFillMode008
     * @tc.desc: testing fillMode for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorFillMode008', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorFillMode008()).assertEqual(0)
      done()
    })
  })
}
