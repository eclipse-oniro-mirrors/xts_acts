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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function scrollXOffsetJsunit() {
  describe('scrollXOffsetJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollXOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollXOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollXOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollXOffset" == pages.name)) {
          console.info("get scrollXOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollXOffsetJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollXOffsetJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_SCROLL_scrollXOffsetJsunit_0100
     * @tc.name: scrollXOffsetJsunit_0100
     * @tc.desc: Trigger onWillScroll and onDidScroll callbacks
     * @tc.level: Level 1
     * @tc.type:
     * @tc.size:
     */
    it('scrollXOffsetJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('scrollXOffsetJsunit_0100 START');

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scroll_x'));
      await button.click();
      await CommonFunc.sleep(2000);
      console.info("[scrollXOffsetJsunit_0100] scroll x success");

      let strJson = getInspectorByKey('scroll_mess');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollXOffsetJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('x:10');
      console.info('[scrollXOffsetJsunit_0100] END');
      done();
    });
  })
}

