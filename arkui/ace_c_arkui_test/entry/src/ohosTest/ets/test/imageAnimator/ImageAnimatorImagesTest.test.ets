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

export default function imageAnimatorImagesTest() {

  describe('ImageAnimatorImagesTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_IMAGES_0100
    * @tc.name       : testImageAnimatorImages001
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAnimatorImages001', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAnimatorImages001()).assertEqual(0)
        done()
    })
        
    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_IMAGES_0200
    * @tc.name       : testImageAnimatorImages002
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAnimatorImages002', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAnimatorImages002()).assertEqual(0)
        done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_IMAGES_0300
    * @tc.name       : testImageAnimatorImages003
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAnimatorImages003', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAnimatorImages003()).assertEqual(0)
        done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_IMAGES_0400
    * @tc.name       : testImageAnimatorImages004
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAnimatorImages004', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAnimatorImages004()).assertEqual(0)
        done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_IMAGES_0500
    * @tc.name       : testImageAnimatorImages005
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAnimatorImages005', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAnimatorImages005()).assertEqual(0)
        done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ANIMATOR_IMAGES_0600
    * @tc.name       : testImageAnimatorImages006
    * @tc.desc       : testing testImageAnimator interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAnimatorImages006', Level.LEVEL1, async (done: Function) => {
        expect(nativeFunc.testImageAnimatorImages006()).assertEqual(0)
        done()
    })
  })
}
