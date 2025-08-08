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
import { Driver } from '@ohos.UiTest';

async function doIt(pageTag: string, testType: number, X: number, Y: number) {
  Utils.emitEvent(pageTag, testType, 6600)
  Utils.clickComponent('resetButton')
  await Utils.sleep(2000)
  Utils.clickComponent('clearDataButton')
  await Utils.sleep(2000)
  let driver = Driver.create();
  if (testType > 4) {
    await driver.swipe(Math.round(globalThis.winLeft + X), Math.round(globalThis.winTop + Y - vp2px(33.33)), Math.round(globalThis.winLeft + X), Math.round(globalThis.winTop + Y + vp2px(33.33)));
  } else {
    await driver.swipe(Math.round(globalThis.winLeft + X), Math.round(globalThis.winTop + Y + vp2px(33.33)), Math.round(globalThis.winLeft + X), Math.round(globalThis.winTop + Y - vp2px(33.33)));
  }
  await Utils.sleep(2000)
  Utils.clickComponent('compareButton')
  await Utils.sleep(2000)
}

export default function scrollNestedScrollTest() {

  describe('ScrollNestedScrollTest', () => {

    let PAGE_TAG = 'ScrollNestedScrollTest';
    let X = 0;
    let Y = 0;

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scroll/${PAGE_TAG}`, done);
      let webRect = Utils.getComponentRect('nestedScrollRoot');
      X = Utils.getRectHorizontalCenterX(webRect)
      Y = Utils.getRectVerticalCenterY(webRect)
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0100
    * @tc.name       : testScrollNestedScroll001
    * @tc.desc       : test nestedScroll scrollForward:ARKUI_SCROLL_NESTED_MODE_SELF_ONLY
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll001', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 1, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0200
    * @tc.name       : testScrollNestedScroll002
    * @tc.desc       : test nestedScroll scrollForward:ARKUI_SCROLL_NESTED_MODE_SELF_FIRST
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll002', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 2, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0300
    * @tc.name       : testScrollNestedScroll003
    * @tc.desc       : test nestedScroll scrollForward:ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll003', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 3, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0400
    * @tc.name       : testScrollNestedScroll004
    * @tc.desc       : test nestedScroll scrollBackward:ARKUI_SCROLL_NESTED_MODE_PARALLEL
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll004', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 4, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0500
    * @tc.name       : testScrollNestedScroll005
    * @tc.desc       : test nestedScroll scrollBackward:ARKUI_SCROLL_NESTED_MODE_SELF_ONLY
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll005', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 5, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0600
    * @tc.name       : testScrollNestedScroll006
    * @tc.desc       : test nestedScroll scrollBackward:ARKUI_SCROLL_NESTED_MODE_SELF_FIRST
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll006', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 6, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0700
    * @tc.name       : testScrollNestedScroll007
    * @tc.desc       : test nestedScroll scrollBackward:ARKUI_SCROLL_NESTED_MODE_PARENT_FIRST
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll007', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 7, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_NESTEDSCROLL_0800
    * @tc.name       : testScrollNestedScroll008
    * @tc.desc       : test nestedScroll scrollForward:ARKUI_SCROLL_NESTED_MODE_PARALLEL
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollNestedScroll008', Level.LEVEL1, async (done: Function) => {
      await doIt(PAGE_TAG, 8, X, Y)
      expect(Utils.getComponentInfoByKey('compareButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
