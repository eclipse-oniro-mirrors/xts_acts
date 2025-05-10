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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';


export default function SegBtnItemTest0010() {
  describe('SegBtnItemTest0010', () => {
    beforeEach(async (done: Function) => {
      console.info("SegBtnItemTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segbtn/SegBtnItem0010',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SegBtnItemTest0010 state pages: " + JSON.stringify(pages));
        if (!('SegBtnItem0010' == pages.name)) {
          console.info("get SegBtnItemTest0010 pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegBtnItemTest0010 page result successful");
        }
      }
      catch (err) {
        console.error("push SegBtnItemTest0010 page error: " + err);
        expect().assertFail();
      }
      await CommonFunc.sleep(1000);
      console.info('SegBtnItemTest0010 beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SegBtnItemTest0010 after each called');
    });

    /**
     * @tc.number SegmentButton single direction
     * @tc.name SegBtnItemTest0010_0100
     * @tc.desc Test SegmentButton page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('SegBtnItemTest0010_0100', 0, async (done: Function) => {
      console.log("SegBtnItemTest0010_0100 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick= await driver.findComponent(ON.text("a"));
      await CommonFunc.sleep(500);
      await textClick.click();
      await CommonFunc.sleep(500);

      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]

      console.info("[SegBtnItemTest0010_0100] component btn0 is: " + JSON.stringify(btn0));
      expect(btn0.$attrs.content).assertEqual('a');
      expect(btn0.$attrs.backgroundColor).assertEqual('#00000000');
      expect(btn0.$attrs.padding).assertEqual('10.00vp');

      await CommonFunc.sleep(500);

      console.log("SegBtnItemTest0010_0100 ", "END");
      done();
    });
    /**
     * @tc.number SegmentButton single direction
     * @tc.name SegBtnItemTest0010_000
     * @tc.desc Test SegmentButton page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('SegBtnItemTest0010_0200', 0, async (done: Function) => {
      console.log("SegBtnItemTest0010_0200 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick= await driver.findComponent(ON.text("b"));
      await CommonFunc.sleep(500);
      await textClick.click();
      await CommonFunc.sleep(500);

      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegBtnItemTest0010_0200] component btn0 is: " + JSON.stringify(btn0));
      expect(btn0.$attrs.content).assertEqual('b');
      expect(btn0.$attrs.fontColor).assertEqual('#FFF7F7F7');
      expect(btn0.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.NONE');
      await CommonFunc.sleep(500);

      let btn1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegBtnItemTest0010_0200_1] component btn1 is: " + JSON.stringify(btn1));
      expect(btn1.$attrs.content).assertEqual('f');
      expect(btn1.$attrs.fontColor).assertEqual('#FF004AAF');
      await CommonFunc.sleep(500);

      console.log("SegBtnItemTest0010_0200 ", "END");
      done();
    });
    /**
     * @tc.number SegmentButton single direction
     * @tc.name SegBtnItemTest0010_0300
     * @tc.desc Test SegmentButton page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('SegBtnItemTest0010_0300', 0, async (done: Function) => {
      console.log("SegBtnItemTest0010_0300 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      await CommonFunc.sleep(500);

      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[2]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegBtnItemTest0010_0300] component btn0 is: " + JSON.stringify(btn0));
      expect(btn0.$attrs.content).assertEqual('c');
      expect(btn0.$attrs.fontSize).assertEqual('18.00fp');
      expect(btn0.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      await CommonFunc.sleep(500);
      let btn1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[2]
        .$children[2]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegBtnItemTest0010_0300_1] component btn0 is: " + JSON.stringify(btn1));
      expect(btn1.$attrs.content).assertEqual('h');
      expect(btn1.$attrs.fontSize).assertEqual('18.00fp');
      expect(btn1.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      await CommonFunc.sleep(500);

      console.log("SegBtnItemTest0010_0300 ", "END");
      done();
    });
    /**
     * @tc.number SegmentButton single direction
     * @tc.name SegBtnItemTest0010_0300
     * @tc.desc Test SegmentButton page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('SegBtnItemTest0010_0400', 0, async (done: Function) => {
      console.log("SegBtnItemTest0010_0400 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[3]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegBtnItemTest0010_0400] component btn0 is: " + JSON.stringify(btn0));
      expect(btn0.$attrs.size.width).assertEqual('40.00vp');
      expect(btn0.$attrs.size.height).assertEqual('40.00vp');

      await CommonFunc.sleep(500);

      console.log("SegBtnItemTest0010_0400 ", "END");
      done();
    });
  })
}