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

export default function customComponentHitTestBehaviorTest() {

  describe('CustomComponentHitTestBehaviorTest', () => {

    let PAGE_TAG = 'CustomComponentHitTestBehaviorTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testCustomComponentHitTestBehavior001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_HITTESTBEHAVIOR_0100
     * @tc.desc   test commonattrs hitTestBehavior with event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentHitTestBehavior001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackDefault')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentDefault').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentBrotherDefault').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnTouchTestColumnDefault').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackBlock')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentBlock').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentBrotherBlock').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnTouchTestColumnBlock').$attrs.backgroundColor)
        .assertEqual('#FFFF11FF')

      await Utils.clickComponent('OnTouchTestStackTransparent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentTransparent').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentBrotherTransparent').$attrs.backgroundColor)
        .assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('OnTouchTestColumnTransparent').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackNone')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentNone').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentBrotherNone').$attrs.backgroundColor)
        .assertEqual('#FF000000')
      expect(Utils.getComponentInfoByKey('OnTouchTestColumnNone').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackExceptBelow')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentBrotherExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnTouchTestColumnExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')

      await Utils.clickComponent('OnTouchTestStackExceptAbove')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestCustomComponentBrotherExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnTouchTestColumnExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done()
    })
  })
}