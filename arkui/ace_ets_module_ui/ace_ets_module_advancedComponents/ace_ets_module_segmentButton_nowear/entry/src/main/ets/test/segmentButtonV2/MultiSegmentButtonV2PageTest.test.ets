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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function MultiSegmentButtonV2PageTest() {
  describe('MultiSegmentButtonV2PageTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiSegmentButtonV2PageTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/MultiSegmentButtonV2Page",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("MultiSegmentButtonV2Page" == pages.name)) {
          console.info("get MultiSegmentButtonV2PageTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiSegmentButtonV2PageTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiSegmentButtonV2PageTest page error:" + err);
      }
      console.info("MultiSegmentButtonV2PageTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MultiSegmentButtonV2PageTest after each called");
    });

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_001
     * @tc.number MultiSegmentButtonV2PageTest_001
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_001', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_001] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId001'));
      await button.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('0');
      console.log("[MultiSegmentButtonV2PageTest_001] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_002
     * @tc.number MultiSegmentButtonV2PageTest_002
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_002', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_002] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId002'));
      await button.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('1');
      console.log("[MultiSegmentButtonV2PageTest_002] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_003
     * @tc.number MultiSegmentButtonV2PageTest_003
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_003', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_003] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId003'));
      await button.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('2');
      console.log("[MultiSegmentButtonV2PageTest_003] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_004
     * @tc.number MultiSegmentButtonV2PageTest_004
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_004', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_004] START");
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('SelectedIndexesId004'));
      await button.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('3');

      const button5 = await driver.findComponent(ON.id('SelectedIndexesId005'));
      await button5.click();
      await driver.delayMs(1000);
      console.log("[MultiSegmentButtonV2PageTest_004] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_005
     * @tc.number MultiSegmentButtonV2PageTest_005
     * @tc.desc   Test MultiSegmentButtonV2 $selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_005', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_005] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("a"));
      await segmentItem.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('0');
      console.log("[MultiSegmentButtonV2PageTest_005] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_006
     * @tc.number MultiSegmentButtonV2PageTest_006
     * @tc.desc   Test MultiSegmentButtonV2 $selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_006', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_006] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("b"));
      await segmentItem.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('0,1');
      console.log("[MultiSegmentButtonV2PageTest_006] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_007
     * @tc.number MultiSegmentButtonV2PageTest_007
     * @tc.desc   Test MultiSegmentButtonV2 $selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_007', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_007] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("c"));
      await segmentItem.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('0,1,2');
      console.log("[MultiSegmentButtonV2PageTest_007] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_008
     * @tc.number MultiSegmentButtonV2PageTest_008
     * @tc.desc   Test MultiSegmentButtonV2 $selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_008', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_008] START");
      const driver = Driver.create();
      let segmentItem = await driver.findComponent(ON.text("d"));
      await segmentItem.click();
      await driver.delayMs(1000);

      let textJ = getInspectorByKey('selectedIndexesTest001');
      let text: ESObject = JSON.parse(textJ);

      expect(text.$attrs.content).assertEqual('0,1,2,3');
      console.log("[MultiSegmentButtonV2PageTest_008] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_009
     * @tc.number MultiSegmentButtonV2PageTest_009
     * @tc.desc   Test MultiSegmentButtonV2 itemBackgroundColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_009', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_009] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[3];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[1];

      expect(itemBtn0.$attrs.backgroundColor).assertEqual('#FFFF0000');
      console.log("[MultiSegmentButtonV2PageTest_009] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_010
     * @tc.number MultiSegmentButtonV2PageTest_010
     * @tc.desc   Test MultiSegmentButtonV2 itemBackgroundEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_010', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_010] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[1];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[0];

      let jsonOption: string = JSON.stringify(itemBtn0.$attrs.backgroundEffect);

      expect(jsonOption)
        .assertEqual('{"options":{"radius":10,"saturation":25,"brightness":1.5,"color":"#FFFF00FF","adaptiveColor":"AdaptiveColor.Average","policy":"BlurStyleActivePolicy.ALWAYS_INACTIVE","type":"WITHIN_WINDOW","inactiveColor":"#FF0000FF","blurOption":"[20.000000,40.000000]"}}');
      console.log("[MultiSegmentButtonV2PageTest_010] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_011
     * @tc.number MultiSegmentButtonV2PageTest_011
     * @tc.desc   Test MultiSegmentButtonV2 itemBackgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_011', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_011] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[3];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[0];
      let common1: ESObject = itemBtn0.$children[0];

      let blurStyle = JSON.stringify(common1.$attrs.backgroundBlurStyle.value);
      expect(blurStyle).assertEqual('"BlurStyle.Thin"');
      let jsonOption: string = JSON.stringify(common1.$attrs.backgroundBlurStyle);

      expect(jsonOption)
        .assertEqual('{"value":"BlurStyle.Thin","options":{"colorMode":"ThemeColorMode.System","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_INACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#FFCCCCCC","scale":1}}');
      console.log("[MultiSegmentButtonV2PageTest_011] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_012
     * @tc.number MultiSegmentButtonV2PageTest_012
     * @tc.desc   Test MultiSegmentButtonV2 itemBackgroundBlurStyleOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_012', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_012] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[3];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[0];
      let common1: ESObject = itemBtn0.$children[0];
      let jsonOption: string = JSON.stringify(common1.$attrs.backgroundBlurStyle);

      expect(jsonOption)
        .assertEqual('{"value":"BlurStyle.Thin","options":{"colorMode":"ThemeColorMode.System","adaptiveColor":"AdaptiveColor.Default","policy":"BlurStyleActivePolicy.ALWAYS_INACTIVE","type":"BlurType.WITHIN_WINDOW","inactiveColor":"#FFCCCCCC","scale":1}}');
      console.log("[MultiSegmentButtonV2PageTest_012] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_015
     * @tc.number MultiSegmentButtonV2PageTest_015
     * @tc.desc   Test MultiSegmentButtonV2 languageDirection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_015', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_022] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[3];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[0];
      let common1: ESObject = itemBtn0.$children[0];
      let jsonOption: string = JSON.stringify(common1.$attrs.direction);
      expect(jsonOption).assertEqual('"Direction.Auto"');
      console.log("[MultiSegmentButtonV2PageTest_015] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_016
     * @tc.number MultiSegmentButtonV2PageTest_016
     * @tc.desc   Test MultiSegmentButtonV2 itemFontColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_016', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_016] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[3];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[1];
      let jsonOption: string = JSON.stringify(itemBtn0.$attrs.fontColor);

      expect(jsonOption).assertEqual('"#FF000000"');
      console.log("[MultiSegmentButtonV2PageTest_016] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_017
     * @tc.number MultiSegmentButtonV2PageTest_017
     * @tc.desc   Test MultiSegmentButtonV2 itemFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_017', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_017] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[1];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[0];
      let jsonOption: string = JSON.stringify(itemBtn0.$attrs.fontSize);

      expect(jsonOption).assertEqual('"0.00px"');
      console.log("[MultiSegmentButtonV2PageTest_017] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_018
     * @tc.number MultiSegmentButtonV2PageTest_018
     * @tc.desc   Test MultiSegmentButtonV2 itemFontWeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_018', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_018] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[3];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[1];
      let jsonOption: string = JSON.stringify(itemBtn0.$attrs.fontWeight);

      expect(jsonOption).assertEqual('"FontWeight.Medium"');
      console.log("[MultiSegmentButtonV2PageTest_018] END");
      done();
    })

    /**
     * @tc.name   MultiSegmentButtonV2PageTest_019
     * @tc.number MultiSegmentButtonV2PageTest_019
     * @tc.desc   Test MultiSegmentButtonV2 itemPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_019', Level.LEVEL0, async (done: Function) => {
      console.log("[MultiSegmentButtonV2PageTest_019] START");
      const driver = Driver.create();
      await driver.delayMs(1000);

      let tree: ESObject = await getInspectorTree();
      let scroll: ESObject = tree.$children[0];
      let column: ESObject = scroll.$children[0];
      let common: ESObject = column.$children[3];
      let flex: ESObject = common.$children[0];
      let itemBtn0: ESObject = flex.$children[0];
      let common1: ESObject = itemBtn0.$children[0];
      let jsonOption: string = JSON.stringify(common1.$attrs.padding);

      expect(jsonOption).assertEqual('"0.00vp"');
      console.log("[MultiSegmentButtonV2PageTest_019] END");
      done();
    })
  })
}