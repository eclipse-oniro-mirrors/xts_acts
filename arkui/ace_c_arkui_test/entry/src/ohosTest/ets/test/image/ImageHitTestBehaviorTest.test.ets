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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';

export default function imageHitTestBehaviorTest() {

  describe('ImageHitTestBehaviorTest', () => {

    let PAGE_TAG = 'ImageHitTestBehaviorTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`image/${PAGE_TAG}`, done);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_HITTESTBEHAVIOR_0100
     * @tc.name       : testImageHitTestBehavior001
     * @tc.desc       : test image hitTestBehavior with event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageHitTestBehavior001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackDefault')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestImageDefault').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestImageBrotherDefault').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackBlock')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestImageBlock').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestImageBrotherBlock').$attrs.backgroundColor).assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackTransparent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestImageTransparent').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestImageBrotherTransparent').$attrs.backgroundColor).assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackNone')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestImageNone').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestImageBrotherNone').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')

      await Utils.clickComponent('OnTouchTestStackExceptBelow')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestImageExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestImageBrotherExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackExceptAbove')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestImageExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestImageBrotherExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      done()
    })

  })
}