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

import { beforeEach, expect, describe, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function imageAnimatorImageFrameInfoTest() {

  describe('ImageAnimatorImageFrameInfoTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0100
    * @tc.name       : testImageAniMatorImageFramelnfo001
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAniMatorImageFramelnfo001', 0, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo001()).assertEqual(1)
        done()
    })
        
    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0200
    * @tc.name       : testImageAniMatorImageFramelnfo002
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAniMatorImageFramelnfo002', 0, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo002()).assertEqual(0)
        done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0300
    * @tc.name       : testImageAniMatorImageFramelnfo003
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAniMatorImageFramelnfo003', 0, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo003()).assertEqual(1)
        done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_FRAMEINFO_0140
    * @tc.name       : testImageAniMatorImageFramelnfo004
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAniMatorImageFramelnfo004', 0, async (done: Function) => {
        expect(nativeFunc.testImageAniMatorImageFramelnfo004()).assertEqual(1)
        done()
    })
  })
}
