/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function GridCallbackJsunit() {
  describe('GridCallbackJsunit', function () {
    beforeEach(async function (done) {
      console.info("GridCallbackJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/GridCallbackPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridCallbackJsunit state pages: " + JSON.stringify(pages));
        if (!("GridCallbackPage" == pages.name)) {
          console.info("get GridCallbackJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridCallbackJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridCallbackJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('GridCallbackJsunit_1000', 0, async function (done) {
      // Verify Neither rowsTemplate nor columnsTemplate is set
      console.info('[GridCallbackJsunit_1000] START');

      let grid2 = CommonFunc.getComponentRect('grid2');
      let top = grid2.top
      let bottom = grid2.bottom
      let left = grid2.left
      let right = grid2.right
      console.log('[GridCallbackJsunit_1000] grid 2 top:' + top +" bottom:" + bottom + "left: " + left + " right:" + right)
      let driver = await UiDriver.create()
      await driver.swipe(Math.round((right - left)), Math.round(bottom - 60), Math.round((right - left)), Math.round(top + 60));
      await CommonFunc.sleep(2000);
      let onReachStartText = await driver.findComponent(BY.key('onReachStartText'));

      let text5 = await onReachStartText.getText();
      console.info('[GridCallbackJsunit_1000] onReachStartText' + text5);
      expect(text5).assertEqual('onReachStart:succ');
      await CommonFunc.sleep(200);

      let onScrollText = await driver.findComponent(BY.key('onScrollText'));
      let text3 = await onScrollText.getText();
      console.info('[GridCallbackJsunit_1000] onScrollText' + text3);
      expect(text3).assertEqual('onScroll:succ');

      let onScrollIndexText = await driver.findComponent(BY.key('onScrollIndexText'));
      let text2 = await onScrollIndexText.getText();
      console.info('[GridCallbackJsunit_1000] onScrollIndexText' + text2);
      expect(text2).assertEqual('onScrollIndex:succ');

      let onScrollStartText = await driver.findComponent(BY.key('onScrollStartText'));
      let text4 = await onScrollStartText.getText();
      console.info('[GridCallbackJsunit_1000] onScrollStartText' + text4);
      expect(text4).assertEqual('onScrollStart:succ');
      await CommonFunc.sleep(200);


      let onScrollStopText = await driver.findComponent(BY.key('onScrollStopText'));
      let text6 = await onScrollStopText.getText();
      console.info('[GridCallbackJsunit_1000] onScrollStopText' + text6);
      expect(text6).assertEqual('onScrollStop:succ');
      await CommonFunc.sleep(200);

      let onScrollFrameBeginText = await driver.findComponent(BY.key('onScrollFrameBeginText'));
      let text7 = await onScrollFrameBeginText.getText();
      console.info('[GridCallbackJsunit_1000] nScrollFrameBeginText ' + text7);
      expect(text7).assertEqual('onScrollFrameBegin:succ');
      await CommonFunc.sleep(200);

      let bottomButton = await driver.findComponent(BY.key('bottom'));
      await bottomButton.click()
      await CommonFunc.sleep(2000)
      let onReachEndText = await driver.findComponent(BY.key('onReachEndText'));
      let text9 = await onReachEndText.getText();
      console.info("[GridCallbackJsunit_1000] onReachEndText: " + text9);

      expect(text9).assertEqual('onReachEnd:succ');
      await CommonFunc.sleep(1000);

      console.info('[GridCallbackJsunit_1000] END');
      done();
    });
  })
}
