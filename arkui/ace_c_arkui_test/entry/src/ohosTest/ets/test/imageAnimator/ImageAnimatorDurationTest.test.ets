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

export default function imageAnimatorDurationTest() {

  describe('ImageAnimatorDurationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_DURATION_0100
     * @tc.name: testImageAnimatorDuration001
     * @tc.desc: testing duration for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorDuration001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorDuration001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_DURATION_0200
     * @tc.name: testImageAnimatorDuration002
     * @tc.desc: testing duration for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorDuration002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorDuration002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_DURATION_0300
     * @tc.name: testImageAnimatorDuration003
     * @tc.desc: testing duration for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorDuration003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorDuration003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_DURATION_0400
     * @tc.name: testImageAnimatorDuration004
     * @tc.desc: testing duration for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorDuration004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorDuration004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_DURATION_0500
     * @tc.name: testImageAnimatorDuration005
     * @tc.desc: testing duration for imageAnimator with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageAnimatorDuration005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAnimatorDuration005()).assertEqual(0)
      done()
    })

  })
}
