'use static'
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function MultiSegmentButtonV2PageTest() {
  describe('MultiSegmentButtonV2PageTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("MultiSegmentButtonV2PageTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/MultiSegmentButtonV2Page",
      }
      try {
        const pageRouter = AppStorage.get<Router>("router") as Router
        pageRouter.clear();
        let pages = pageRouter.getState();
        console.info("get MultiSegmentButtonV2PageTest state pages: " + JSON.stringify(pages));
        if (!("MultiSegmentButtonV2Page" == pages.name)) {
          console.info("get MultiSegmentButtonV2PageTest state pages.name: " + JSON.stringify(pages.name));
          pageRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MultiSegmentButtonV2PageTest page error:" + err);
      }
      console.info("MultiSegmentButtonV2PageTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
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
    it('MultiSegmentButtonV2PageTest_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_001] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      const button = await driver.findComponent(ON.id('SelectedIndexesId001'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('0');
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
    it('MultiSegmentButtonV2PageTest_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_002] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      const button = await driver.findComponent(ON.id('SelectedIndexesId002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('1');
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
    it('MultiSegmentButtonV2PageTest_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_003] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      const button = await driver.findComponent(ON.id('SelectedIndexesId003'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('2');
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
    it('MultiSegmentButtonV2PageTest_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_004] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      const button = await driver.findComponent(ON.id('SelectedIndexesId004'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('3');
      const button5 = await driver.findComponent(ON.id('SelectedIndexesId005'));
      await (button5?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
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
    it('MultiSegmentButtonV2PageTest_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_005] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      let segmentItem = await driver.findComponent(ON.text("a"));
      await (segmentItem?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('0');
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
    it('MultiSegmentButtonV2PageTest_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_006] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      let segmentItem = await driver.findComponent(ON.text("b"));
      await (segmentItem?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('0,1');
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
    it('MultiSegmentButtonV2PageTest_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_007] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      let segmentItem = await driver.findComponent(ON.text("c"));
      await (segmentItem?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('0,1,2');
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
    it('MultiSegmentButtonV2PageTest_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_008] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      let segmentItem = await driver.findComponent(ON.text("d"));
      await (segmentItem?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textJ = inspector.getInspectorByKey('selectedIndexesTest001');
      let text = JSON.parseJsonElement(textJ);
      expect(text.getElement('$attrs').getString('content')).assertEqual('0,1,2,3');
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
    it('MultiSegmentButtonV2PageTest_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_009] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      expect(itemBtn0.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');
      console.log("[MultiSegmentButtonV2PageTest_009] END");
      done();
    })

    /**
     * @tc.name MultiSegmentButtonV2PageTest_010
     * @tc.number MultiSegmentButtonV2PageTest_010
     * @tc.desc Test MultiSegmentButtonV2 itemBackgroundEffect
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiSegmentButtonV2PageTest_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_010] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[1];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let radius = JSON.stringify(itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getLong('radius'))
      console.info(`radius: ${radius}`)
      expect(radius).assertEqual("10")
      let saturation = JSON.stringify(itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getLong('saturation'))
      console.info(`saturation: ${saturation}`)
      expect(saturation).assertEqual("25")
      let policy = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('policy')
      console.info(`policy: ${policy}`)
      expect(policy).assertEqual("BlurStyleActivePolicy.ALWAYS_INACTIVE")
      let inactiveColor = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('inactiveColor')
      console.info(`inactiveColor: ${inactiveColor}`)
      expect(inactiveColor).assertEqual("#FF0000FF")
      let blurOption = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('blurOption')
      console.info(`blurOption: ${blurOption}`)
      expect(blurOption).assertEqual("[20.000000,40.000000]")
      let color = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('color')
      console.info(`color: ${color}`)
      expect(color).assertEqual("#FFFF00FF")
      let brightness = JSON.stringify(itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getDouble('brightness'))
      console.info(`brightness: ${brightness}`)
      expect(brightness).assertEqual("1.5")
      let adaptiveColor = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('adaptiveColor')
      console.info(`adaptiveColor: ${adaptiveColor}`)
      expect(adaptiveColor).assertEqual("AdaptiveColor.Average")
      let type = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('type')
      console.info(`type: ${type}`)
      expect(type).assertEqual("WITHIN_WINDOW")
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
    it('MultiSegmentButtonV2PageTest_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_011] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];
      let value = common1.getElement('$attrs')
        .getElement('backgroundBlurStyle')
        .getString('value')
      console.info(`value: ${value}`)
      expect(value).assertEqual("BlurStyle.Thin")
      let inactiveColor = common1.getElement('$attrs')
        .getElement('backgroundBlurStyle')
        .getElement('options')
        .getString('inactiveColor')
      console.info(`inactiveColor: ${inactiveColor}`)
      expect(inactiveColor).assertEqual("#FFCCCCCC")
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
    it('MultiSegmentButtonV2PageTest_012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_012] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];
      let policy = common1.getElement('$attrs')
        .getElement('backgroundBlurStyle')
        .getElement('options')
        .getString('policy')
      console.info(`policy: ${policy}`)
      expect(policy).assertEqual("BlurStyleActivePolicy.ALWAYS_INACTIVE")
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
    it('MultiSegmentButtonV2PageTest_015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_022] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(common1.getElement('$attrs').getString('direction'));
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
    it('MultiSegmentButtonV2PageTest_016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_016] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontColor'));
      expect(jsonOption).assertEqual('"#FFFFFFFF"');
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
    it('MultiSegmentButtonV2PageTest_017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_017] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[1];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontSize'));

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
    it('MultiSegmentButtonV2PageTest_018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_018] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontWeight'));
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
    it('MultiSegmentButtonV2PageTest_019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[MultiSegmentButtonV2PageTest_019] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let common1 = itemBtn0.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(common1.getElement('$attrs').getString('padding'));
      expect(jsonOption).assertEqual('"0.00vp"');
      console.log("[MultiSegmentButtonV2PageTest_019] END");
      done();
    })
  })
}