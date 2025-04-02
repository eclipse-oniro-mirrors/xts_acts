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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function NavigationBindToNestedScrollable() {
  describe('NavigationBindToNestedScrollable', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationBindToNestedScrollable beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindToScrollable/NavigationBindToNestedScrollable',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationBindToNestedScrollable state pages:" + JSON.stringify(pages));
        if (!("NavigationBindToNestedScrollable" == pages.name)) {
          console.info("get NavigationBindToNestedScrollable pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationBindToNestedScrollable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationBindToNestedScrollable page error:" + err);
      }
      console.info("NavigationBindToNestedScrollable beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationBindToNestedScrollable after each called");
    });


    /**
     * @tc.number    NavigationBindToNestedScrollable_0100
     * @tc.name      NavigationBindToNestedScrollable_0100
     * @tc.desc      Test NavigationBindToNestedScrollable
     * @tc.level     Level 2
     */
    it('NavigationBindToNestedScrollable_0100', 0, async (done: Function) => {
      console.info('NavigationBindToNestedScrollable_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.text('push pageOne'));
      await btn1.click()
      console.info('[NavigationBindToNestedScrollable_0100] click push pageOne');
      await CommonFunc.sleep(1000);

      await driver.assertComponentExist(ON.type('TitleBar'));
      await driver.assertComponentExist(ON.type('ToolBar'));

      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(5000);

      await driver.assertComponentExist(ON.type('TitleBar'));
      await driver.assertComponentExist(ON.type('ToolBar'));

      await scrollBar.scrollSearch(ON.text('Child_item_0'));
      let scrollBar2 = await scrollBar.scrollSearch(ON.type('List'));
      await scrollBar2.scrollToBottom();
      await CommonFunc.sleep(5000);

      let component1: Component = await driver.findComponent(ON.type('TitleBar').text('pageOne'));
      let point = await component1.getBoundsCenter();
      let x = point.x;
      let y = point.y;
      console.info('NavigationBindToNestedScrollable_0100 x', x);
      console.info('NavigationBindToNestedScrollable_0100 x', y);

      let nav: Component = await driver.findComponent(ON.id('navId'));
      let rect = await nav.getBounds();
      let windowTop = rect.top;
      console.info('NavigationBindToNestedScrollable_0100 windowTop', windowTop);
      expect(y < windowTop).assertTrue();
     
	  let component2: Component  = await driver.findComponent(ON.type('ToolBar'));
      expect(component2).assertEqual(null);

      console.info('NavigationBindToNestedScrollable_0100 END');
      done();
    });
  })
}