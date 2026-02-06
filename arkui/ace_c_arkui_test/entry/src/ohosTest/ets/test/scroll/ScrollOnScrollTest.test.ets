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

export default function scrollOnScrollTest() {

  describe('ScrollOnScrollTest', () => {

    let PAGE_TAG = 'ScrollOnScrollTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scroll/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_ONSCROLL_0100
    * @tc.name       : testScrollOnScroll001
    * @tc.desc       : test OnScroll event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollOnScroll001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let rect = Utils.getComponentRect("scrollCalled");
      let height = rect.bottom - rect.top;
      console.info("testScrollOnScroll001 height is" + height);
      let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y1 = Math.round(globalThis.winTop + rect.top + height*0.2);
      let y2 = Math.round(globalThis.winTop + rect.bottom - height*0.2);
      console.info("testScrollOnScroll001  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.swipe(centerX, y2, centerX, y1);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('scrollCalled').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_ONSCROLL_0200
     * @tc.name       : testScrollOnScroll002
     * @tc.desc       : test OnScroll event not callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollOnScroll002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let rect = Utils.getComponentRect("scrollNotCalled");
      let width = rect.right - rect.left;
      console.info("testScrollOnScroll002 width is" + width);
      let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect))
      let x1 = Math.round(globalThis.winLeft + rect.left + width*0.2);
      let x2 = Math.round(globalThis.winLeft + rect.right - width*0.2);
      console.info("testScrollOnScroll002  x1= " +  x1  + ", x2 = " + x2  + ", centerY = " + centerY);
      await driver.swipe(x2, centerY, x1, centerY);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('scrollNotCalled').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })
  })
}
