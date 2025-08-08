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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getAttributeScroll() {
  describe('getAttributeScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("getAttributeScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/getAttributeScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getAttributeScroll state pages:" + JSON.stringify(pages));
        if (!("getAttributeScroll" == pages.name)) {
          console.info("get getAttributeScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getAttributeScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getAttributeScroll page error:" + err);
      }
      console.info("getAttributeScroll beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getAttributeScroll after each called");
    });

    /**
     * @tc.number    getAttributeScroll_001
     * @tc.name      getAttributeScroll_0100
     * @tc.desc      Bind the controller Scroll to the Scroll node and obtain node properties.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('getAttributeScroll_0100', 0, async (done: Function) => {
      console.info('[getAttributeScroll_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scroll_get_click'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('typeNode_scroll');
      console.info("[getAttributeScroll_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getAttributeScroll_0100]: scrollBarWidth: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarWidth));
      expect(JSON.parse(strJson).$attrs.scrollBarWidth).assertEqual("30.00vp");
      console.info('[getAttributeScroll_0100] END');
      done();
    });

    /**
     * @tc.number    getAttributeScroll_002
     * @tc.name      getAttributeScroll_0200
     * @tc.desc      Bind the controller Scroll to the Scroll node and obtain node properties.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('getAttributeScroll_0200', 0, async (done: Function) => {
      console.info('[getAttributeScroll_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scroll_bind_click'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2: Component = await driver.findComponent(ON.id('scroll_fling_text'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('scroll_fling_text');
      console.info("[getAttributeScroll_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[getAttributeScroll_0200]: content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content !== 'ScrollFling: 0').assertTrue();
      console.info('[getAttributeScroll_0200] END');
      done();
    });
  })
}