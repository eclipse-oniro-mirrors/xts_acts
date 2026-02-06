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
import Utils from '../common/Utils';

export default function scrollHitTestBehaviorTest() {

  describe('ScrollHitTestBehaviorTest', () => {
    /**
     * @tc.name   testScrollHitTestBehavior001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_HITTESTBEHAVIOR_0100
     * @tc.desc   test scroll hitTestBehavior with event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollHitTestBehavior001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollHitTestBehaviorDefaultTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('Default')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ScrollDefault').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('ScrollBrotherDefault').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('ColumnDefault').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })

    /**
     * @tc.name   testScrollHitTestBehavior002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_HITTESTBEHAVIOR_0200
     * @tc.desc   test scroll hitTestBehavior with event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollHitTestBehavior002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollHitTestBehaviorBlockTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('Block')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ScrollBlock').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('ScrollBrotherBlock').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('ColumnBlock').$attrs.backgroundColor)
        .assertEqual('#FFFF11FF')
      done();
    })

    /**
     * @tc.name   testScrollHitTestBehavior003
     * @tc.number SUB_ARKUI_CAPI_SCROLL_HITTESTBEHAVIOR_0300
     * @tc.desc   test scroll hitTestBehavior with event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollHitTestBehavior003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollHitTestBehaviorTransparentTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('Transparent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ScrollTransparent').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('ScrollBrotherTransparent').$attrs.backgroundColor)
        .assertEqual('#FF00FFFF')
      expect(Utils.getComponentInfoByKey('ColumnTransparent').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })

    /**
     * @tc.name   testScrollHitTestBehavior004
     * @tc.number SUB_ARKUI_CAPI_SCROLL_HITTESTBEHAVIOR_0400
     * @tc.desc   test scroll hitTestBehavior with event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollHitTestBehavior004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollHitTestBehaviorNoneTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.clickComponent('None')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('ScrollNone').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('ScrollBrotherNone').$attrs.backgroundColor)
        .assertEqual('#FF00FFFF')
      expect(Utils.getComponentInfoByKey('ColumnNone').$attrs.backgroundColor)
        .assertEqual('#FFFFFFFF')
      done();
    })
  })
}