/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';

export default function canOverScroll() {
  describe('canOverScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("canOverScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/canOverScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get canOverScroll state pages:" + JSON.stringify(pages));
        if (!("canOverScroll" == pages.name)) {
          console.info("get canOverScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push canOverScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push canOverScroll page error:" + err);
      }
      console.info("canOverScroll beforeEach end");
      done();
    });

    /**
     * @tc.name   canOverScroll_0100
     * @tc.number canOverScroll_001
     * @tc.desc   Set the canOverscroll property value to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('canOverScroll_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverScroll_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_scroll_true'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let scroll = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll');
      let scrollItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll_0');

      console.info(`[canOverScroll_0100] scroll.top=
        ${scroll.top}`);
      console.info(`[canOverScroll_0100] scrollItem0.top=
        ${scrollItem0.top}`);
      console.info(`[canOverList_0100] vp2px(30)=
        ${vp2px(30)}`);
      expect(Math.floor(Math.abs(scrollItem0.top - vp2px(30) - scroll.top)) <= 1).assertTrue();
      console.info('[canOverScroll_0100] END');
      done();
    });

    /**
     * @tc.name   canOverScroll_0200
     * @tc.number canOverScroll_002
     * @tc.desc   Set the canOverscroll property value to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('canOverScroll_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverScroll_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_scroll_false'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let scroll = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll');
      let scrollItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll_0');

      console.info(`[canOverScroll_0100] scroll.top=
        ${scroll.top}`);
      console.info(`[canOverScroll_0100] scrollItem0.top=
        ${scrollItem0.top}`);
      expect(Math.abs(Math.floor(scrollItem0.top - scroll.top)) <= 1).assertTrue();
      console.info('[canOverScroll_0200] END');
      done();
    });

    /**
     * @tc.name   canOverScroll_0300
     * @tc.number canOverScroll_003
     * @tc.desc   Set the canOverscroll property value to null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('canOverScroll_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverScroll_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_scroll_null'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let scroll = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll');
      let scrollItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll_0');

      console.info(`[canOverScroll_0100] scroll.top=
        ${scroll.top}`);
      console.info(`[canOverScroll_0100] scrollItem0.top=
        ${scrollItem0.top}`);
      expect(Math.abs(Math.floor(scrollItem0.top - scroll.top)) <= 1).assertTrue();
      console.info('[canOverScroll_0300] END');
      done();
    });

    /**
     * @tc.name   canOverScroll_0400
     * @tc.number canOverScroll_004
     * @tc.desc   Set the canOverscroll property value to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('canOverScroll_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[canOverScroll_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('canOver_scroll_ude'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let scroll = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll');
      let scrollItem0 = CommonFunc.getComponentRectOnScreen('canOverScroll_scroll_0');

      console.info(`[canOverScroll_0100] scroll.top=
        ${scroll.top}`);
      console.info(`[canOverScroll_0100] scrollItem0.top=
        ${scrollItem0.top}`);
      expect(Math.abs(Math.floor(scrollItem0.top - scroll.top)) <= 1).assertTrue();
      console.info('[canOverScroll_0400] END');
      done();
    });
  })
}
