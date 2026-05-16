'use static'
/*
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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import { DateTimeOptions } from '@ohos.arkui.component';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function checkboxGroupUndefined() {
  describe('checkboxGroupUndefined', () => {
    beforeAll(async ():Promise<void> => {
      console.info("checkboxGroupUndefined beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("checkboxGroupUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CheckBoxGroup/checkboxGroupUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get checkboxGroupUndefined state pages:" + JSON.stringify(pages));
        if (!("checkboxGroupUndefined" == pages.name)) {
          console.info("get checkboxGroupUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push checkboxGroupUndefined page error:" + err);
      }
      console.info("checkboxGroupUndefined beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.number   checkboxGroupUndefined_static_0001
     * @tc.name     checkboxGroupUndefined_static_0001
     * @tc.desc     test checkboxGroupUndefined selectAll undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectAll');
      console.info("[checkboxGroupUndefined_static_0001] selectAll : " + res);
      expect(res).assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupSelectAll_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectAll');
      console.info("[checkboxGroupUndefined_static_0001] selectAll : " + res);
      expect(res).assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectAll');
      console.info("[checkboxGroupUndefined_static_0001] selectAll : " + res);
      expect(res).assertEqual('false');
      console.info('[checkboxGroupUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupUndefined_static_0002
     * @tc.name     checkboxGroupUndefined_static_0002
     * @tc.desc     test checkboxGroupUndefined selectedColor undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupUndefined_static_0002] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      let originSelectedColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor');
      console.info("[checkboxGroupUndefined_static_0002] selectedColor : " + originSelectedColor);

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupSelectedColor_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupUndefined_static_0002] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor');
      console.info("[checkboxGroupUndefined_static_0002] selectedColor : " + res);
      expect(res).assertEqual('#FF00FFEA');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupUndefined_static_0002] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor');
      console.info("[checkboxGroupUndefined_static_0002] selectedColor : " + res);
      expect(res).assertEqual(originSelectedColor);
      console.info('[checkboxGroupUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupUndefined_static_0003
     * @tc.name     checkboxGroupUndefined_static_0003
     * @tc.desc     test checkboxGroupUndefined unselectedColor undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupUndefined_static_0003] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      let unselectedColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('unselectedColor');
      console.info("[checkboxGroupUndefined_static_0003] unselectedColor : " + unselectedColor);

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupUnSelectedColor_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('unselectedColor');
      console.info("[checkboxGroupUndefined_static_0003] unselectedColor : " + res);
      expect(res).assertEqual('#FFA600FF');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('unselectedColor');
      console.info("[checkboxGroupUndefined_static_0003] unselectedColor : " + res);
      expect(res).assertEqual(unselectedColor);
      console.info('[checkboxGroupUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupUndefined_static_0004
     * @tc.name     checkboxGroupUndefined_static_0004
     * @tc.desc     test checkboxGroupUndefined checkboxShape undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupUndefined_static_0004] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('checkboxShape');
      console.info("[checkboxGroupUndefined_static_0004] checkboxShape : " + res);
      expect(res).assertEqual('0');

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupCheckboxShape_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('checkboxShape');
      console.info("[checkboxGroupUndefined_static_0004] checkboxShape : " + res);
      expect(res).assertEqual('1');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('checkboxShape');
      console.info("[checkboxGroupUndefined_static_0004] checkboxShape : " + res);
      expect(res).assertEqual('0');
      console.info('[checkboxGroupUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupUndefined_static_0005
     * @tc.name     checkboxGroupUndefined_static_0005
     * @tc.desc     test checkboxGroupUndefined mark undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupUndefined_static_0005] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      let res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mark'));
      console.info("[checkboxGroupUndefined_static_0005] mark : " + res);
      expect(res).assertEqual(JSON.stringify('{"strokeColor":"#FFFFFFFF","size":"0.00vp","strokeWidth":"2.00vp"}'));

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupMark_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupUndefined_static_0005] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_id1');
      res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mark'));
      console.info("[checkboxGroupUndefined_static_0005] mark : " + res);
      expect(res).assertEqual(JSON.stringify('{"strokeColor":"#FFFF0000","size":"80.00vp","strokeWidth":"15.00vp"}'));
      console.info('[checkboxGroupUndefined_static_0005] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupUndefined_static_0006
     * @tc.name     checkboxGroupUndefined_static_0006
     * @tc.desc     test checkboxGroupUndefined onChange undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupUndefined_static_0006] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('checkboxGroupOnChange_Btn'));
      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('checkboxGroupOnChange_Text'));
      let checkBox1 = await driver.findComponent(ON.id('checkboxGroup_checkbox1'));
      await (checkBox1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onChange Text is onChange');
      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);
      let resetBtn = await driver.findComponent(ON.id('checkboxGroup_text_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      console.info("[checkboxGroupUndefined_static_0006] click resetBtn");
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onChange Text is -1');
      console.info('[checkboxGroupUndefined_static_0006] END');
      done();
    });

  })
}