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

export default function MultiSegmentButtonV2UndefinedPageTest() {
  describe('MultiSegmentButtonV2UndefinedPageTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("MultiSegmentButtonV2UndefinedPageTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/MultiSegmentButtonV2UndefinedPage",
      }
      try {
        const pageRouter = AppStorage.get<Router>("router") as Router
        pageRouter.clear();
        let pages = pageRouter.getState();
        console.info("get MultiSegmentButtonV2UndefinedPageTest state pages: " + JSON.stringify(pages));
        if (!("MultiSegmentButtonV2UndefinedPage" == pages.name)) {
          console.info("get MultiSegmentButtonV2UndefinedPageTest state pages.name: " + JSON.stringify(pages.name));
          pageRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MultiSegmentButtonV2UndefinedPageTest page error:" + err);
      }
      console.info("MultiSegmentButtonV2UndefinedPageTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("MultiSegmentButtonV2UndefinedPageTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0100
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0100
     * @tc.desc   Test MultiSegmentButtonV2 itemBackgroundColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0100] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];

      let common1 = column.getArray("$children")[1];
      let flex1 = common1.getArray("$children")[0];
      let itemBtn01 = flex1.getArray("$children")[1];
      expect(itemBtn0.getElement('$attrs').getString('backgroundColor')).assertEqual(itemBtn01.getElement('$attrs').getString('backgroundColor'));
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0100] END");
      done();
    })

    /**
     * @tc.name SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0200
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0200
     * @tc.desc Test MultiSegmentButtonV2 itemBackgroundEffect
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0200] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      let radius = JSON.stringify(itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getLong('radius'))
      console.info(`radius: ${radius}`)
      expect(radius).assertEqual("0")
      let saturation = JSON.stringify(itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getLong('saturation'))
      console.info(`saturation: ${saturation}`)
      expect(saturation).assertEqual("1")
      let policy = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('policy')
      console.info(`policy: ${policy}`)
      expect(policy).assertEqual("BlurStyleActivePolicy.ALWAYS_ACTIVE")
      let blurOption = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('blurOption')
      console.info(`blurOption: ${blurOption}`)
      expect(blurOption).assertEqual("[0,0]")
      let color = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('color')
      console.info(`color: ${color}`)
      expect(color).assertEqual("#00000000")
      let brightness = JSON.stringify(itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getDouble('brightness'))
      console.info(`brightness: ${brightness}`)
      expect(brightness).assertEqual("1")
      let adaptiveColor = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('adaptiveColor')
      console.info(`adaptiveColor: ${adaptiveColor}`)
      expect(adaptiveColor).assertEqual("AdaptiveColor.Default")
      let type = itemBtn0.getElement('$attrs')
        .getElement('backgroundEffect')
        .getElement('options')
        .getString('type')
      console.info(`type: ${type}`)
      expect(type).assertEqual("WITHIN_WINDOW")
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0200] END");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0300
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0300
     * @tc.desc   Test MultiSegmentButtonV2 itemBackgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0300] START");
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
      expect(value).assertEqual("BlurStyle.NONE")
      let inactiveColor = common1.getElement('$attrs')
        .getElement('backgroundBlurStyle')
        .getElement('options')
        .getString('inactiveColor')
      console.info(`inactiveColor: ${inactiveColor}`)
      expect(inactiveColor).assertEqual("#00000000")
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0300] END");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0400
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0400
     * @tc.desc   Test MultiSegmentButtonV2 itemBackgroundBlurStyleOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0400] START");
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
      expect(policy).assertEqual("BlurStyleActivePolicy.ALWAYS_ACTIVE")
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0400] END");
      done();
    })


    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0500
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0500
     * @tc.desc   Test MultiSegmentButtonV2 languageDirection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0500] START");
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
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0500] END");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0600
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0600
     * @tc.desc   Test MultiSegmentButtonV2 itemFontColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0600] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontColor'));
      expect(jsonOption).assertEqual('"#FFFFFFFF"');
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0600] END");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0700
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0700
     * @tc.desc   Test MultiSegmentButtonV2 itemFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0700] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[0];
      let jsonOption: string = JSON.stringify(itemBtn0.getArray("$children")[0].getArray("$children")[0].getArray("$children")[0].getElement('$attrs').getString('fontSize'));
      expect(jsonOption).assertEqual('"14.00fp"');
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0700] END");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0800
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0800
     * @tc.desc   Test MultiSegmentButtonV2 itemFontWeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0800] START");
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let scroll = tree.getArray("$children")[0];
      let column = scroll.getArray("$children")[0];
      let common = column.getArray("$children")[3];
      let flex = common.getArray("$children")[0];
      let itemBtn0 = flex.getArray("$children")[1];
      let jsonOption: string = JSON.stringify(itemBtn0.getElement('$attrs').getString('fontWeight'));
      expect(jsonOption).assertEqual('"FontWeight.Medium"');
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0800] END");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0900
     * @tc.number SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0900
     * @tc.desc   Test MultiSegmentButtonV2 itemPadding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0900] START");
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
      console.log("[SUB_ARKUI_MULTISEGMENTBUTTONV2_UNDEFINED_0900] END");
      done();
    })
  })
}