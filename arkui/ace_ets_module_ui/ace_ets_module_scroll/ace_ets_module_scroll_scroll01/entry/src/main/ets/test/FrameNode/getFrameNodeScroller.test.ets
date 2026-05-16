/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getFrameNodeScroller() {
  describe('getFrameNodeScroller', () => {
    beforeEach(async (done: Function) => {
      console.info("getFrameNodeScroller beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/getFrameNodeScroller",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getFrameNodeScroller state pages:" + JSON.stringify(pages));
        if (!("getFrameNodeScroller" == pages.name)) {
          console.info("get getFrameNodeScroller pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getFrameNodeScroller page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getFrameNodeScroller page error:" + err);
      }
      console.info("getFrameNodeScroller beforeEach end");
      done();
    });

    /**
     * @tc.name   getFrameNodeScroller_0100
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_TEST_0100
     * @tc.desc   Set getFrameNode for the scroller.getFrameNode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFrameNodeScroller_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[getFrameNodeScroller_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bind_grid_getFrameNode'));
      await btn.click();
      console.info("[getFrameNodeScroller_0100] Click getFrameNode.");
      await CommonFunc.sleep(1500);

      let strJson = getInspectorByKey('bind_gridNode_result');
      console.info('[getFrameNodeScroller_0100] content is: ' + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Bind success：Grid');
      console.info('[getFrameNodeScroller_0100] END');
      done();
    });

    /**
     * @tc.name   getFrameNodeScroller_0200
     * @tc.number SUB_ARKUI_SCROLLER_GETFRAMENODE_TEST_0200
     * @tc.desc   Set getFrameNode for the scroller.getFrameNode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFrameNodeScroller_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[getFrameNodeScroller_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bind_grid_offy'));
      await btn.click();
      console.info("[getFrameNodeScroller_0200] Click 120 offset.");
      await CommonFunc.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.id('bind_grid_offTop'));
      await btn2.click();
      console.info("[getFrameNodeScroller_0200] Click top offset.");
      await CommonFunc.sleep(1500);
      let btn3: Component = await driver.findComponent(ON.id('bind_grid_readOff'));
      await btn3.click();
      console.info("[getFrameNodeScroller_0200] Click read offset.");
      await CommonFunc.sleep(1500);

      let strJson = getInspectorByKey('bind_grid_offset_text');
      console.info('[getFrameNodeScroller_0200] content is: ' + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Grid default yOffset: 0');
      console.info('[getFrameNodeScroller_0200] END');
      done();
    });
  })
}