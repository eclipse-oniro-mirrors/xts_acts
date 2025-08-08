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

export default function imageAnimatorStateTest() {

  describe('ImageAnimatorStateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0100
     * @tc.name: testImageAnimatorState001
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState001', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0200
     * @tc.name: testImageAnimatorState002
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState002', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0300
     * @tc.name: testImageAnimatorState003
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState003', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0400
     * @tc.name: testImageAnimatorState004
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState004', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0500
     * @tc.name: testImageAnimatorState005
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState005', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0600
     * @tc.name: testImageAnimatorState006
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState006', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0700
     * @tc.name: testImageAnimatorState007
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState007', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_STATE_0800
     * @tc.name: testImageAnimatorState008
     * @tc.desc: testing state for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorState008', 0, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorState008()).assertEqual(0)
      done()
    })
  })
}
