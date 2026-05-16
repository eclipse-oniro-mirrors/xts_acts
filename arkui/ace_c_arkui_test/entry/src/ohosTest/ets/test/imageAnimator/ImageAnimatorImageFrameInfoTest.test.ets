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

import { beforeEach, expect, describe, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function imageAnimatorImageFrameInfoTest() {

  describe('ImageAnimatorImageFrameInfoTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageAniMatorImageFramelnfo001
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0100
     * @tc.desc   testing testImageAnimator interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAniMatorImageFramelnfo001', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo001()).assertEqual(1)
        done()
    })
        
    /**
     * @tc.name   testImageAniMatorImageFramelnfo002
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0200
     * @tc.desc   testing testImageAnimator interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAniMatorImageFramelnfo002', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo002()).assertEqual(0)
        done()
    })

    /**
     * @tc.name   testImageAniMatorImageFramelnfo003
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0300
     * @tc.desc   testing testImageAnimator interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAniMatorImageFramelnfo003', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo003()).assertEqual(1)
        done()
    })

    /**
     * @tc.name   testImageAniMatorImageFramelnfo004
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0400
     * @tc.desc   testing testImageAnimator interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAniMatorImageFramelnfo004', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo004()).assertEqual(1)
        done()
    })

    /**
     * @tc.name   testImageAniMatorImageFramelnfo005
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0500
     * @tc.desc   testing testImageAnimator interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAniMatorImageFramelnfo005', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo005()).assertEqual(0)
        done()
    })

    /**
     * @tc.name   testImageAniMatorImageFramelnfo006
     * @tc.number SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0600
     * @tc.desc   testing testImageAnimator interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAniMatorImageFramelnfo006', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo006()).assertEqual(0)
        done()
    })
  })
}
