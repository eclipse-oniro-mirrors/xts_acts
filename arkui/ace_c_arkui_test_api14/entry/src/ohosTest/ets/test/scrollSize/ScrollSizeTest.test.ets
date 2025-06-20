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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
// import nativeFunc from 'libnativefunc.so'

export default function ScrollSizeTest(){

  describe('ScrollSizeTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_SCROLL_SIZE_0100
     * @tc.name       : testGetScrollSizeTest001
     * @tc.desc       : testing NODE_SCROLL_SIZE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetScrollSizeTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ScrollSizeTest';
      await Utils.pushPage(`scrollSize/${PAGE_TAG}`);
      await Utils.sleep(1000)
      console.info("testGetScrollSizeTest001  START");
      let driver = Driver.create();
      let rect = Utils.getComponentRect("scrollSizeCalled");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("testGetScrollSizeTest001  x= " +  x  + ", y = " + y);
      await driver.swipe(x, Math.round(y + vp2px(40)), x, Math.round(y - vp2px(40)));
      await Utils.sleep(2000);
      console.info("testGetScrollSizeTest001  swipe");
      expect(Utils.getComponentInfoByKey('scrollSizeCalled').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}