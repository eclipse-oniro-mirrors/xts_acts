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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function scrollReachJsunit() {
  describe('scrollReachJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollReachJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scrollCallback/scrollReach',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollReachJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollReach" == pages.name)) {
          console.info("get scrollReachJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollReachJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollReachJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   scrollReachJsunit_0100
     * @tc.number SUB_ACE_SCROLL_scrollReachJsunit_0100
     * @tc.desc   Trigger onWillScroll and onDidScroll callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scrollReachJsunit_0100', Level.LEVEL2, async (done: Function) => {
      console.info('scrollReachJsunit_0100 START');
      let driver = await Driver.create();
      let onReachStartText = await driver.findComponent(ON.id('scroll_reachStart'));
      let text1 = await onReachStartText.getText();
      console.info('[waterFlowStart1_0100] onReachStartText' + text1);
      expect(text1).assertEqual('onReachStart:succ');
      await CommonFunc.sleep(1000);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scrollEdge_btn'));
      await button.click();
      await CommonFunc.sleep(3000);
      console.info('[scrollReachJsunit_0100] ScrollBottom success');

      let onReachEndText = await driver.findComponent(ON.id('scroll_reachEnd'));
      let text2 = await onReachEndText.getText();
      console.info('[scrollReachJsunit_0100] onReachEndText: ' + text2);
      expect(text2).assertEqual('onReachEnd:succ');
      
      let onScrollEdgeText = await driver.findComponent(ON.id('scroll_edge'));
      let text3 = await onScrollEdgeText.getText();
      console.info('[scrollReachJsunit_0100] onScrollEdgeText: ' + text3);
      expect(text3).assertEqual('onScrollEdge:succ');
      await CommonFunc.sleep(1000);

      console.info('[scrollReachJsunit_0100] END');
      done();
    });
  })
}

