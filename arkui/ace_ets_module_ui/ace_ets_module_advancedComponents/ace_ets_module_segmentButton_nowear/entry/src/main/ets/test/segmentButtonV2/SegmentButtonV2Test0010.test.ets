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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonV2Test0010() {
  describe('SegmentButtonV2Test0010', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonV2Test0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/SegmentButtonV20010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonV20010" == pages.name)) {
          console.info("get SegmentButtonV2Test0010 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonV2Test0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonV2Test0010 page error:" + err);
      }
      console.info("SegmentButtonV2Test0010 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonV2Test0010 after each called");
    });

    /**
     * @tc.name   SegmentButtonV2Test0010_001
     * @tc.number SegmentButtonV2Test0010_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test0010_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonV2Test0010_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick: Component = await driver.findComponent(ON.text("share"));
      await CommonFunc.sleep(500);
      await textClick.click();
      await CommonFunc.sleep(500);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvIndex0'));
      console.info("[SegmentButtonV2Test0010] select index is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2');
      await CommonFunc.sleep(500);
      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_001] component btn0.attrs.accessibilityText is: " + JSON.stringify(btn0.$attrs.accessibilityText));
      expect(btn0.$attrs.accessibilityText).assertEqual('search');
      console.info("[SegmentButtonV2Test0010_001] component btn0.attrs.accessibilityLevel is: " + JSON.stringify(btn0.$attrs.accessibilityLevel));
      expect(btn0.$attrs.accessibilityLevel).assertEqual('auto');
      console.info("[SegmentButtonV2Test0010_001] component btn0.attrs.accessibilityDescription is: " + 
      JSON.stringify(btn0.$attrs.accessibilityDescription));
      expect(btn0.$attrs.accessibilityDescription).assertEqual('ButtonSearch');
      console.info("[SegmentButtonV2Test0010_001] component btn0.attrs.enabled is: " + JSON.stringify(btn0.$attrs.enabled));
      expect(btn0.$attrs.enabled).assertTrue();
      await CommonFunc.sleep(500);
      let btn1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[1]
      console.info("[SegmentButtonV2Test0010_001] component btn1.attrs.accessibilityLevel is: " + JSON.stringify(btn1.$attrs.accessibilityLevel));
      expect(btn1.$attrs.accessibilityLevel).assertEqual('no');
      console.info("[SegmentButtonV2Test0010_001] component btn1.attrs.enabled is: " + JSON.stringify(btn1.$attrs.enabled));
      expect(btn1.$attrs.enabled).assertFalse();
      await CommonFunc.sleep(500);
      let btn2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[2]
      console.info("[SegmentButtonV2Test0010_001] component btn2.$attrs.accessibilityLevel is: " + JSON.stringify(btn2.$attrs.accessibilityLevel));
      expect(btn2.$attrs.accessibilityLevel).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[3]
      console.info("[SegmentButtonV2Test0010_001] component btn3.$attrs.enabled is: " + JSON.stringify(btn3.$attrs.enabled));
      expect(btn3.$attrs.enabled).assertTrue();
      console.info("[SegmentButtonV2Test0010_001] component btn3.$attrs.accessibilityLevel is: " + JSON.stringify(btn3.$attrs.accessibilityLevel));
      expect(btn3.$attrs.accessibilityLevel).assertEqual('no-hide-descendants');
      let text0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[0]
        .$children[0]
        .$children[1]
      console.info("[SegmentButtonV2Test0010_001] component text0.$attrs.content is: " + JSON.stringify(text0.$attrs.content));
      expect(text0.$attrs.content).assertEqual('search');
      console.info("[SegmentButtonV2Test0010_001] component text0.$attrs.fontColor is: " + JSON.stringify(text0.$attrs.fontColor));
      expect(text0.$attrs.fontColor).assertEqual('#FFFFFF00');
      await CommonFunc.sleep(500);
      let text2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[2]
        .$children[0]
        .$children[1]
      console.info("[SegmentButtonV2Test0010_001] component text2.$attrs.content is: " + JSON.stringify(text2.$attrs.content));
      expect(text2.$attrs.content).assertEqual('share');
      await CommonFunc.sleep(500);
      let icon0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_001] component icon0.$attrs.src is: " + JSON.stringify(icon0.$attrs.src));
      expect(icon0.$attrs.src).assertEqual('resource:///125830097.svg');
      console.info("[SegmentButtonV2Test0010_001] component icon0.$attrs.backgroundColor is: " + JSON.stringify(icon0.$attrs.backgroundColor));
      expect(icon0.$attrs.backgroundColor).assertEqual('#FFFFA500');
      await CommonFunc.sleep(500);
      let icon1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[1]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_001] component icon1.$attrs.src is: " + JSON.stringify(icon1.$attrs.src));
      expect(icon1.$attrs.src).assertEqual('resource:///125830651.svg');
      console.info("[SegmentButtonV2Test0010_001] component icon1.$attrs.backgroundColor is: " + JSON.stringify(icon1.$attrs.backgroundColor));
      expect(icon1.$attrs.backgroundColor).assertEqual('#00000000');
      await CommonFunc.sleep(500);
      let symbol3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[2]
        .$children[0]
        .$children[5]
        .$children[3]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_001] component symbol3.$attrs.fontWeight is: " + JSON.stringify(symbol3.$attrs.fontWeight));
      expect(symbol3.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      console.info('[SegmentButtonV2Test0010_001] END');
      done();
    });

    /**
     * @tc.name   SegmentButtonV2Test0010_002
     * @tc.number SegmentButtonV2Test0010_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test0010_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonV2Test0010_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick: Component = await driver.findComponent(ON.text("close3"));
      await CommonFunc.sleep(500);
      await textClick.click();
      await CommonFunc.sleep(500);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvIndex1'));
      console.info("[SegmentButtonV2Test0010] select index is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('2');
      await CommonFunc.sleep(500);
      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_002] component btn0.$attrs.accessibilityText is: " + JSON.stringify(btn0.$attrs.accessibilityText));
      expect(btn0.$attrs.accessibilityText).assertEqual('close1');
      console.info("[SegmentButtonV2Test0010_002] component btn0.$attrs.accessibilityLevel is: " + JSON.stringify(btn0.$attrs.accessibilityLevel));
      expect(btn0.$attrs.accessibilityLevel).assertEqual('auto');
      console.info("[SegmentButtonV2Test0010_002] component btn0.$attrs.accessibilityDescription is: " + 
      JSON.stringify(btn0.$attrs.accessibilityDescription));
      expect(btn0.$attrs.accessibilityDescription).assertEqual('ButtonClose1');
      console.info("[SegmentButtonV2Test0010_002] component btn0.$attrs.enabled is: " + JSON.stringify(btn0.$attrs.enabled));
      expect(btn0.$attrs.enabled).assertTrue();
      await CommonFunc.sleep(500);
      let btn1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[1]
      console.info("[SegmentButtonV2Test0010_002] component btn1.$attrs.accessibilityLevel is: " + JSON.stringify(btn1.$attrs.accessibilityLevel));
      expect(btn1.$attrs.accessibilityLevel).assertEqual('no-hide-descendants');
      console.info("[SegmentButtonV2Test0010_002] component btn1.$attrs.enabled is: " + JSON.stringify(btn1.$attrs.enabled));
      expect(btn1.$attrs.enabled).assertFalse();
      await CommonFunc.sleep(500);
      let btn2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[2]
      console.info("[SegmentButtonV2Test0010_002] component btn2.$attrs.accessibilityLevel is: " + JSON.stringify(btn2.$attrs.accessibilityLevel));
      expect(btn2.$attrs.accessibilityLevel).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[3]
      console.info("[SegmentButtonV2Test0010_002] component btn3.$attrs.enabled is: " + JSON.stringify(btn3.$attrs.enabled));
      expect(btn3.$attrs.enabled).assertTrue();
      expect(btn3.$attrs.accessibilityLevel).assertEqual('yes');
      let text0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[0]
        .$children[0]
        .$children[1]
      console.info("[SegmentButtonV2Test0010_002] component text0.$attrs.content is: " + JSON.stringify(text0.$attrs.content));
      expect(text0.$attrs.content).assertEqual('close1');
      console.info("[SegmentButtonV2Test0010_002] component text0.$attrs.fontColor is: " + JSON.stringify(text0.$attrs.fontColor));
      expect(text0.$attrs.fontColor).assertEqual('#FFFFFF00');
      await CommonFunc.sleep(500);
      let text2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[2]
        .$children[0]
        .$children[1]
      console.info("[SegmentButtonV2Test0010_002] component text2.$attrs.content is: " + JSON.stringify(text2.$attrs.content));
      expect(text2.$attrs.content).assertEqual('close3');
      await CommonFunc.sleep(500);
      let icon0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_002] component icon0.$attrs.src is: " + JSON.stringify(icon0.$attrs.src));
      expect(icon0.$attrs.src).assertEqual('resource:///125830852.svg');
      console.info("[SegmentButtonV2Test0010_002] component icon0.$attrs.backgroundColor is: " + JSON.stringify(icon0.$attrs.backgroundColor));
      expect(icon0.$attrs.backgroundColor).assertEqual('#FFFFA500');
      await CommonFunc.sleep(500);
      let icon1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[1]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_002] component icon1.$attrs.src is: " + JSON.stringify(icon1.$attrs.src));
      expect(icon1.$attrs.src).assertEqual('resource:///125830852.svg');
      console.info("[SegmentButtonV2Test0010_002] component icon1.$attrs.backgroundColor is: " + JSON.stringify(icon1.$attrs.backgroundColor));
      expect(icon1.$attrs.backgroundColor).assertEqual('#00000000');
      await CommonFunc.sleep(500);
      let symbol3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[5]
        .$children[3]
        .$children[0]
        .$children[0]
      console.info("[SegmentButtonV2Test0010_002] component symbol3.$attrs.fontWeight is: " + JSON.stringify(symbol3.$attrs.fontWeight));
      expect(symbol3.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      console.info('[SegmentButtonV2Test0010_002] END');
      done();
    });
  })
}