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

export default function maxDownRefresh() {
  describe('maxDownRefresh', () => {
    beforeEach(async (done: Function) => {
      console.info("maxDownRefresh beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Refresh/maxDownRefresh",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get maxDownRefresh state pages:" + JSON.stringify(pages));
        if (!("maxDownRefresh" == pages.name)) {
          console.info("get maxDownRefresh pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push maxDownRefresh page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push maxDownRefresh page error:" + err);
      }
      console.info("maxDownRefresh beforeEach end");
      done();
    });

    /**
     * @tc.number    maxDownRefresh_001
     * @tc.name      maxDownRefresh_0100
     * @tc.desc      Set the value of the maxPullDownDistance property to the normal value of 64.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('maxDownRefresh_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[maxDownRefresh_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_64 = await driver.findComponent(ON.id('maxPull_text_z'));
      await btn_64.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height/6),Math.round(left + width/2),Math.round(bottom - height/6));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[maxDownRefresh_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onRefreshing');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset'));
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_0100] END');
      done();
    });

    /**
     * @tc.number    maxDownRefresh_002
     * @tc.name      maxDownRefresh_0200
     * @tc.desc      Set the value of the maxPullDownDistance property to an outlier of -1.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('maxDownRefresh_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[maxDownRefresh_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_out = await driver.findComponent(ON.id('maxPull_text_fu'));
      await btn_out.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height/6),Math.round(left + width/2),Math.round(bottom - height/6));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[maxDownRefresh_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('start');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset'));
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_0200] END');
      done();
    });

    /**
     * @tc.number    maxDownRefresh_003
     * @tc.name      maxDownRefresh_0300
     * @tc.desc      Set the value of the maxPullDownDistance property to null.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('maxDownRefresh_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[maxDownRefresh_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_64 = await driver.findComponent(ON.id('maxPull_text_null'));
      await btn_64.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_0300 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height/6),Math.round(left + width/2),Math.round(bottom - height/6));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[maxDownRefresh_0300] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onRefreshing');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset'));
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_0300] END');
      done();
    });

    /**
     * @tc.number    maxDownRefresh_004
     * @tc.name      maxDownRefresh_0400
     * @tc.desc      Set the value of the maxPullDownDistance property to undefined.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('maxDownRefresh_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[maxDownRefresh_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_64 = await driver.findComponent(ON.id('maxPull_text_ude'));
      await btn_64.click();
      await CommonFunc.sleep(1500);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('maxPull_down_refresh');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("maxDownRefresh_0400 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height/6),Math.round(left + width/2),Math.round(bottom - height/6));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('onState_text');
      console.info("[maxDownRefresh_0400] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[maxDownRefresh_0400] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onRefreshing');
      let btn_reset = await driver.findComponent(ON.id('maxPull_text_reset'));
      await btn_reset.click();
      await CommonFunc.sleep(1500);
      console.info('[maxDownRefresh_0400] END');
      done();
    });
  })
}
