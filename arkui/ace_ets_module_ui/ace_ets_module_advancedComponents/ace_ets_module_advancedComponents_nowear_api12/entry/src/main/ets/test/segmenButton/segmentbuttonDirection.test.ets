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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';


export default function segmentButtonDirectionTest() {
  describe('segmentButtonDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("segmentButtonDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/SegmentButtonDirection',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get segmentButtonDirectionTest state pages: " + JSON.stringify(pages));
        if (!('SegmentButtonDirection' == pages.name)) {
          console.info("get segmentButtonDirectionTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push segmentButtonDirectionTest page result successful");
        }
      }
      catch (err) {
        console.error("push segmentButtonDirectionTest page error: " + err);
        expect().assertFail();
      }
      await Utils.sleep(1000);
      console.info('segmentButtonDirectionTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('segmentButtonDirectionTest after each called');
    });

    /**
     * @tc.number SegmentButton single direction
     * @tc.name testSegmentButtonDirection_0100
     * @tc.desc Test SegmentButton page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSegmentButtonDirection_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.log("testSegmentButtonDirection_0100 ", "START");
      const driver = await Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await buttonAuto.click();
      await driver.delayMs(1000);
      console.log("testSegmentButtonDirection_0100 ", "click Auto");
      const tab1 = await driver.findComponent(ON.text("页签按钮1"));
      const single1 = await driver.findComponent(ON.text("单选按钮a"));
      const tabRect1 = await tab1.getBounds();
      const singleRect1 = await single1.getBounds();
      console.log("testSegmentButtonDirection_0100 ", "tabRect1 :" + JSON.stringify(tabRect1));
      console.log("testSegmentButtonDirection_0100 ", "singleRect1 :" + JSON.stringify(singleRect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await buttonRtl.click();
      console.log("testSegmentButtonDirection_0100 ", "click Rtl");
      await driver.delayMs(1000);
      const tab2 = await driver.findComponent(ON.text("页签按钮1"));
      const single2 = await driver.findComponent(ON.text("单选按钮a"));
      const tabRect2 = await tab2.getBounds();
      const singleRect2 = await single2.getBounds();
      console.log("testSegmentButtonDirection_0100 ", "tabRect2 :" + JSON.stringify(tabRect2));
      console.log("testSegmentButtonDirection_0100 ", "singleRect2 :" + JSON.stringify(singleRect2));
      expect(tabRect1.left == tabRect2.left).assertFalse();
      expect(singleRect1.left == singleRect2.left).assertFalse();
      console.log("testSegmentButtonDirection_0100 ", "END");
      done();
    });

    /**
     * @tc.number SegmentButton multi direction
     * @tc.name testSegmentButtonDirection_0200
     * @tc.desc Test SegmentButton page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testSegmentButtonDirection_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.log("testSegmentButtonDirection_0200 ", "START");
      const driver = await Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await buttonAuto.click();
      await driver.delayMs(1000);
      console.log("[testSegmentButtonDirection_0200]", "click Auto");
      const multi1 = await driver.findComponent(ON.text("多选按钮1"));
      const icon1 = await driver.findComponent(ON.text("图标1"));
      const multiRect1 = await multi1.getBounds();
      const iconRect1 = await icon1.getBounds();
      console.log("[testSegmentButtonDirection_0200]", "multiRect1 :" + JSON.stringify(multiRect1));
      console.log("[testSegmentButtonDirection_0200]", "iconRect1 :" + JSON.stringify(iconRect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await buttonRtl.click();
      console.log("[testSegmentButtonDirection_0200]", "click Rtl");
      await driver.delayMs(1000);
      const multi2 = await driver.findComponent(ON.text("多选按钮1"));
      const icon2 = await driver.findComponent(ON.text("图标1"));
      const multiRect2 = await multi2.getBounds();
      const iconRect2 = await icon2.getBounds();
      console.log("[testSegmentButtonDirection_0200]", "multiRect2 :" + JSON.stringify(multiRect2));
      console.log("[testSegmentButtonDirection_0200]", "iconRect2 :" + JSON.stringify(iconRect2));
      expect(iconRect1.left == iconRect2.left).assertFalse();
      expect(iconRect1.left == iconRect2.left).assertFalse();
      console.log("[testSegmentButtonDirection_0200]", "END");
      done();
    });
  })
}
