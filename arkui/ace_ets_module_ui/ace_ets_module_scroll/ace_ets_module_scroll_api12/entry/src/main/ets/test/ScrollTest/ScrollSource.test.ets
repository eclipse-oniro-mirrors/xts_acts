/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ScrollSource() {
  describe('ScrollSource', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollSource beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollSource",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollSource state pages: " + JSON.stringify(pages));
        if (!("ScrollSource" == pages.name)) {
          console.info("get ScrollSource state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollSource success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollSource page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    ScrollSource_0100
     * @tc.name      ScrollSource_0100
     * @tc.desc      frameNode: ScrollSourceToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ScrollSource_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ScrollSource_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scrollSource'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scrollSource');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ScrollSource_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollSource_0100] content obj is: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('ScrollSource.SCROLLER_ANIMATION'); //SCROLLER_ANIMATION
      console.info('[ScrollSource_0100] END');
      done();
    });

    /**
     * @tc.number    ScrollSource_0200
     * @tc.name      ScrollSource_0200
     * @tc.desc      frameNode: ScrollSourceToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ScrollSource_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ScrollSource_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scrollSourceOther'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scrollSourceOther');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ScrollSource_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollSource_0200] content obj is: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('ScrollSource.SCROLLER'); //SCROLLER
      console.info('[ScrollSource_0200] END');
      done();
    });

  })
}

