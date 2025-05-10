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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function scrollOffsetJsunit() {
  describe('scrollOffsetJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollOffset" == pages.name)) {
          console.info("get scrollOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollOffsetJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollOffsetJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_SCROLL_scrollOffsetJsunit_0100
    * @tc.name: scrollOffsetJsunit_0100
    * @tc.desc: Set initial rolling offset.
    * @tc.level: Level 2
    * @tc.type:
    * @tc.size:
    */
    it('scrollOffsetJsunit_0100', 0, async (done: Function) => {
      console.info('scrollOffsetJsunit_0100 START');

      let strJson = getInspectorByKey('Scroll_Offset');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollOffsetJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[scrollOffsetJsunit_0100] initialOffset: " + JSON.stringify(obj.$attrs.initialOffset));
      expect(obj.$attrs.initialOffset.xOffset).assertEqual("0.00vp");
      expect(obj.$attrs.initialOffset.yOffset).assertEqual("250.00vp");
      console.info('[scrollOffsetJsunit_0100] END');
      done();
    });
    /**
     * @tc.number: SUB_ACE_SCROLL_scrollOffsetJsunit_0200
     * @tc.name: scrollOffsetJsunit_0200
     * @tc.desc: Trigger onWillScroll and onDidScroll callbacks
     * @tc.level: Level 2
     * @tc.type:
     * @tc.size:
     */
    it('scrollOffsetJsunit_0200', 0, async (done: Function) => {
      console.info('scrollOffsetJsunit_0200 START');

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('canOver_scroll'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_0100] canOverScroll success");

      let strJson = getInspectorByKey('scroll_mess1');
      let strJson1 = getInspectorByKey('scroll_mess2');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[scrollOffsetJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[scrollOffsetJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.$attrs.content).assertEqual('onWillScroll');
      expect(obj1.$attrs.content).assertEqual('onDidScroll');
      console.info('[scrollOffsetJsunit_0200] END');
      done();
    });
  })
}

