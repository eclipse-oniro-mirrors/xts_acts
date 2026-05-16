'use static';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function checkBoxUndefinedTest() {
  describe('checkBoxUndefinedTest', () => {
    beforeAll(async () => {
      console.info("checkBoxUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("checkBoxUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CheckBox/checkBoxUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get checkBoxUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("checkBoxUndefined" == pages.name)) {
          console.info("get checkBoxUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push checkBoxUndefinedTest page error:" + err);
      }
      console.info("checkBoxUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   CheckBoxUndefinedTest_static_0100
     * @tc.name     CheckBoxUndefinedTest_static_0100
     * @tc.desc     Test CheckBox select property
     * @tc.level    Level.LEVEL1
     */
    it('CheckBoxUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CheckBoxUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let changeBtn2 = await driver.findComponent(ON.id('select_true'));
      await (changeBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[CheckBoxUndefinedTest_static_0100] click select_true");
      let strJsonBox = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(1000);
      console.info("[CheckBoxUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonBox).getElement('$attrs').getElement('isOn')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonBox).getElement('$attrs').getElement('isOn')))
        .assertEqual('\"true\"');

      console.info("[CheckBoxUndefinedTest_static_0100] click CheckBox_OnChange");
      let changeBtn = await driver.findComponent(ON.id('CheckBox_OnChange'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJsonBox1 = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(1000);
      console.info("[CheckBoxUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonBox1).getElement('$attrs').getElement('isOn')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonBox1).getElement('$attrs').getElement('isOn')))
        .assertEqual('\"false\"');
      console.info('[CheckBoxUndefinedTest_static_0100] END');
      done();
    });

    /**
      * @tc.number   CheckBoxUndefinedTest_static_0200
      * @tc.name     CheckBoxUndefinedTest_static_0200
      * @tc.desc     Test CheckBox selectedColor property
      * @tc.level    Level.LEVEL1
      */
    it('CheckBoxUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CheckBoxUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(1000);

      let originSelectedColor =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedColor'));
      console.info("[CheckBoxUndefinedTest_static_0200] selectedColor: " + originSelectedColor);

      let changeBtn = await driver.findComponent(ON.id('selectedColor_flag'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(2000);
      console.info("[CheckBoxUndefinedTest_static_0200] selectedColor: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedColor')));

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('selectedColor')))
        .assertEqual('\"#FF0000FF\"');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(2000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedColor')))
        .assertEqual(originSelectedColor);

      await CommonFunc.sleep(1000);
      console.info('[CheckBoxUndefinedTest_static_0200] END');
      done();
    });

    /**
      * @tc.number   CheckBoxUndefinedTest_static_0300
      * @tc.name     CheckBoxUndefinedTest_static_0300
      * @tc.desc     Test CheckBox unselectedColor property
      * @tc.level    Level.LEVEL1
      */
    it('CheckBoxUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CheckBoxUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(1000);

      let originUnSelectedColor =
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('unselectedColor'));
      console.info("[CheckBoxUndefinedTest_static_0300] unSelectedColor: " + originUnSelectedColor);

      let changeBtn = await driver.findComponent(ON.id('selectedColor_flag02'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(2000);
      console.info("[CheckBoxUndefinedTest_static_0300] unselectedColor: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('unselectedColor')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('unselectedColor')))
        .assertEqual('\"#FF0000FF\"');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(2000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('unselectedColor')))
        .assertEqual(originUnSelectedColor);

      await CommonFunc.sleep(1000);
      console.info('[CheckBoxUndefinedTest_static_0300] END');
      done();
    });

    /**
      * @tc.number   CheckBoxUndefinedTest_static_0400
      * @tc.name     CheckBoxUndefinedTest_static_0400
      * @tc.desc     Test CheckBox mark property
      * @tc.level    Level.LEVEL1
      */
    it('CheckBoxUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CheckBoxUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(1000);
      let changeBtn2 = await driver.findComponent(ON.id('select_true'));
      await (changeBtn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[CheckBoxUndefinedTest_static_0400] click select_true");


      console.info("[CheckBoxUndefinedTest_static_0400] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[CheckBoxUndefinedTest_static_0400] mark: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mark')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('mark')))
        .assertEqual('\"{\\"strokeColor\\":\\"#FFFF0000\\",\\"size\\":\\"80.00vp\\",\\"strokeWidth\\":\\"15.00vp\\"}\"');

      let changeBtn = await driver.findComponent(ON.id('CheckBox_Mark'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info("[CheckBoxUndefinedTest_static_0400] click CheckBox_Mark");
      strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(2000);
      console.info("[CheckBoxUndefinedTest_static_0400] mark: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mark')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('mark')))
        .assertEqual('\"{\\"strokeColor\\":\\"#FFFFFFFF\\",\\"size\\":\\"20.00vp\\",\\"strokeWidth\\":\\"2.00vp\\"}\"');
      await CommonFunc.sleep(1000);
      console.info('[CheckBoxUndefinedTest_static_0400] END');
      done();
    });

    /**
      * @tc.number   CheckBoxUndefinedTest_static_0500
      * @tc.name     CheckBoxUndefinedTest_static_0500
      * @tc.desc     Test CheckBox shape property
      * @tc.level    Level.LEVEL1
      */
    it('CheckBoxUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CheckBoxUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(1000);
      console.info("[CheckBoxUndefinedTest_static_0500] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[CheckBoxUndefinedTest_static_0500] shape: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shape')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('shape')))
        .assertEqual('\"1\"');

      let changeBtn = await driver.findComponent(ON.id('CheckBox_Shape'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info("[CheckBoxUndefinedTest_static_0500] click CheckBox_Shape");
      strJson = inspector.getInspectorByKey('MyCheckBox');
      await CommonFunc.sleep(2000);
      console.info("[CheckBoxUndefinedTest_static_0500] shape: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('shape')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('shape')))
        .assertEqual('\"0\"');
      await CommonFunc.sleep(1000);
      console.info('[CheckBoxUndefinedTest_static_0500] END');
      done();
    });
  })
}