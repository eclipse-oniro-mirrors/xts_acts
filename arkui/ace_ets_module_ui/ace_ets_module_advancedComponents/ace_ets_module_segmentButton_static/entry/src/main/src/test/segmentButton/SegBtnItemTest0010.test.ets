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

export default function SegBtnItemTest0010() {
  describe('SegBtnItemTest0010', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("SegBtnItemTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegBtnItem0010",
      }
      try {
        const pagesRouter = AppStorage.get<Router>("router") as Router
        pagesRouter.clear();
        let pages = pagesRouter.getState();
        console.info("get SegBtnItemTest0010 state pages: " + JSON.stringify(pages));
        if (!("SegBtnItem0010" == pages.name)) {
          console.info("get SegBtnItemTest0010 state pages.name: " + JSON.stringify(pages.name));
          pagesRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegBtnItemTest0010 page error:" + err);
      }
      console.info("SegBtnItemTest0010 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("SegBtnItemTest0010 after each called");
    });

    /**
     * @tc.name   SegBtnItemTest0010_001
     * @tc.number SegBtnItemTest0010_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegBtnItemTest0010_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegBtnItemTest0010_001] START');
      await CommonFunc.sleep(1000);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
      console.info("[SegBtnItemTest0010_001] btn0.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn0.getElement('$attrs').getString("accessibilityLevel")));
      console.info("[SegBtnItemTest0010_001] btn0.getElement('$attrs').getString(accessibilityDescription is: " +
      JSON.stringify(btn0.getElement('$attrs').getString("accessibilityDescription")));
      expect(btn0.getElement('$attrs').getString("accessibilityLevel")).assertEqual('auto');
      expect(btn0.getElement('$attrs').getString("accessibilityDescription")).assertEqual('tab1');
      await CommonFunc.sleep(500);
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[1]
      console.info("[SegBtnItemTest0010_001] btn1.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn1.getElement('$attrs').getString("accessibilityLevel")));
      expect(btn1.getElement('$attrs').getString("accessibilityLevel")).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[2]
      console.info("[SegBtnItemTest0010_001] btn2.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn2.getElement('$attrs').getString("accessibilityLevel")));
      expect(btn2.getElement('$attrs').getString("accessibilityLevel")).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[3]
      console.info("[SegBtnItemTest0010_001]  btn3.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn3.getElement('$attrs').getString("accessibilityLevel")));
      expect(btn3.getElement('$attrs').getString("accessibilityLevel")).assertEqual('no-hide-descendants');
      console.info('[SegBtnItemTest0010_001] END');
      done();
    });

    /**
     * @tc.name   SegBtnItemTest0010_002
     * @tc.number SegBtnItemTest0010_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegBtnItemTest0010_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegBtnItemTest0010_002] START');
      await CommonFunc.sleep(1000);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[2]
        .getArray("$children")[0]
      console.info("[SegBtnItemTest0010_002] btn0.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn0.getElement('$attrs').getString("accessibilityLevel")));
      console.info("[SegBtnItemTest0010_002] btn0.getElement('$attrs').getString(accessibilityDescription is: " +
      JSON.stringify(btn0.getElement('$attrs').getString("accessibilityDescription")));
      expect(btn0.getElement('$attrs').getString("accessibilityLevel")).assertEqual('auto');
      expect(btn0.getElement('$attrs').getString("accessibilityDescription")).assertEqual('email1');
      await CommonFunc.sleep(500);
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[2]
        .getArray("$children")[1]
      console.info("[SegBtnItemTest0010_002] btn1.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn1.getElement('$attrs').getString("accessibilityLevel")));
      expect(btn1.getElement('$attrs').getString("accessibilityLevel")).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[2]
        .getArray("$children")[2]
      console.info("[SegBtnItemTest0010_002] btn2.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn2.getElement('$attrs').getString("accessibilityLevel")));
      expect(btn2.getElement('$attrs').getString("accessibilityLevel")).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[2]
        .getArray("$children")[3]
      console.info("[SegBtnItemTest0010_002] btn3.getElement('$attrs').getString(accessibilityLevel is: " +
      JSON.stringify(btn3.getElement('$attrs').getString("accessibilityLevel")));
      expect(btn3.getElement('$attrs').getString("accessibilityLevel")).assertEqual('no-hide-descendants');
      await CommonFunc.sleep(500);
      let icon0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegBtnItemTest0010_002] icon0.getElement('$attrs').getString(selectedIcon is: " +
      JSON.stringify(icon0.getElement('$attrs').getString("src")));
      console.info("[SegBtnItemTest0010_002] icon0.getElement('$attrs').getString(accessibilityText is: " +
      JSON.stringify(icon0.getElement('$attrs').getString("accessibilityText")));
      expect(icon0.getElement('$attrs').getString("src")).assertEqual('resource:///125830169.svg');
      expect(icon0.getElement('$attrs').getString("accessibilityText")).assertEqual('email1');
      await CommonFunc.sleep(500);
      let icon1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[2]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegBtnItemTest0010_002] icon1.getElement('$attrs').getString(icon is: " +
      JSON.stringify(icon1.getElement('$attrs').getString("src")));
      console.info("[SegBtnItemTest0010_002] icon1.getElement('$attrs').getString(accessibilityText is: " +
      JSON.stringify(icon1.getElement('$attrs').getString("accessibilityText")));
      expect(icon1.getElement('$attrs').getString("src")).assertEqual('resource:///125830170.svg');
      expect(icon1.getElement('$attrs').getString("accessibilityText")).assertEqual('notSelect');
      console.info('[SegBtnItemTest0010_002] END');
      await CommonFunc.sleep(500);
      done();
    });
  })
}