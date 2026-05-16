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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function DataPanelAttrsModifierUndefinedTest() {
  describe('DataPanelAttrsModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("DataPanelAttrsModifierUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("DataPanelAttrsModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/dataPanelAttrsModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get DataPanelAttrsModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("dataPanelAttrsModifierUndefined" == pages.name)) {
          console.info("get DataPanelAttrsModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push DataPanelEventPage page error:" + err);
      }
      console.info("DataPanelAttrsModifierUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   DataPanelAttrsModifierUndefinedTest_static_0100
     * @tc.name     DataPanelAttrsModifierUndefinedTest_static_0100
     * @tc.desc     DataPanelAttrsModifierUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelAttrsModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelAttrsModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0100] strokeWidth: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeWidth')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeWidth')))
        .assertEqual('\"10.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('DataPanel_StrokeWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0100] click DataPanel_StrokeWidth");
      strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeWidth')))
        .assertEqual('\"24.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   DataPanelAttrsModifierUndefinedTest_static_0300
     * @tc.name     DataPanelAttrsModifierUndefinedTest_static_0300
     * @tc.desc     DataPanelAttrsModifierUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelAttrsModifierUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelAttrsModifierUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0300] valueColors: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('valueColors')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('valueColors')))
        .assertEqual('[[{"color":"#65EEC9A3","offset":"0.000000"},{"color":"#FFEF629F","offset":"1.000000"}],[{"color":"#FF67F9D4","offset":"0.000000"},{"color":"#FFFF9554","offset":"1.000000"}],[{"color":"#FF00FF00","offset":"0.000000"},{"color":"#FF00FF00","offset":"1.000000"}],[{"color":"#20FF0000","offset":"0.000000"},{"color":"#20FF0000","offset":"1.000000"}]]');

      let changeBtn = await driver.findComponent(ON.id('DataPanel_ValueColors'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0300] click DataPanel_ValueColors");
      strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('valueColors')))
        .assertEqual('[[{"color":"#FFF7CE00","offset":"0.000000"},{"color":"#FFF99B11","offset":"1.000000"}],[{"color":"#FFF76223","offset":"0.000000"},{"color":"#FFF2400A","offset":"1.000000"}],[{"color":"#FFF772AC","offset":"0.000000"},{"color":"#FFE65392","offset":"1.000000"}],[{"color":"#FFA575EB","offset":"0.000000"},{"color":"#FFA12DF7","offset":"1.000000"}],[{"color":"#FF7B79F7","offset":"0.000000"},{"color":"#FF4B48F7","offset":"1.000000"}],[{"color":"#FF4B8AF3","offset":"0.000000"},{"color":"#FF007DFF","offset":"1.000000"}],[{"color":"#FF73C1E6","offset":"0.000000"},{"color":"#FF4FB4E3","offset":"1.000000"}],[{"color":"#FFA5D61D","offset":"0.000000"},{"color":"#FF69D14F","offset":"1.000000"}],[{"color":"#FFA2A2B0","offset":"0.000000"},{"color":"#FF8E8E93","offset":"1.000000"}]]');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   DataPanelAttrsModifierUndefinedTest_static_0400
     * @tc.name     DataPanelAttrsModifierUndefinedTest_static_0400
     * @tc.desc     DataPanelAttrsModifierUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelAttrsModifierUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelAttrsModifierUndefinedTest_static_0400] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0400] trackBackgroundColor: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackBackgroundColor')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackBackgroundColor')))
        .assertEqual('\"#FF008000\"');

      let changeBtn = await driver.findComponent(ON.id('DataPanel_TrackBackgroundColor'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0400] click DataPanel_TrackBackgroundColor");
      let defJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier1');
      await CommonFunc.sleep(1000);
      let defColor = JSON.stringifyJsonElement(JSON.parseJsonElement(defJson)
        .getElement('$attrs')
        .getElement('trackBackgroundColor'));
      strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackBackgroundColor')))
        .assertEqual(defColor);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   DataPanelAttrsModifierUndefinedTest_static_0500
     * @tc.name     DataPanelAttrsModifierUndefinedTest_static_0500
     * @tc.desc     DataPanelAttrsModifierUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelAttrsModifierUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelAttrsModifierUndefinedTest_static_0500] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0500] trackShadow: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackShadow')))
        .assertEqual('{"radius":"5.000000","offsetX":"15.000000","offsetY":"15.000000","colors":[[{"color":"#65EEC9A3","offset":"0.000000"},{"color":"#FFEF629F","offset":"1.000000"}],[{"color":"#FF67F9D4","offset":"0.000000"},{"color":"#FFFF9554","offset":"1.000000"}],[{"color":"#FF00FF00","offset":"0.000000"},{"color":"#FF00FF00","offset":"1.000000"}],[{"color":"#20FF0000","offset":"0.000000"},{"color":"#20FF0000","offset":"1.000000"}]]}');

      let changeBtn = await driver.findComponent(ON.id('DataPanel_TrackShadow'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[DataPanelAttrsModifierUndefinedTest_static_0500] click DataPanel_TrackShadow");
      strJson = inspector.getInspectorByKey('MyDataPanelAttrsModifier');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackShadow')))
        .assertEqual('{"radius":"20.000000","offsetX":"5.000000","offsetY":"5.000000","colors":[[{"color":"#65EEC9A3","offset":"0.000000"},{"color":"#FFEF629F","offset":"1.000000"}],[{"color":"#FF67F9D4","offset":"0.000000"},{"color":"#FFFF9554","offset":"1.000000"}],[{"color":"#FF00FF00","offset":"0.000000"},{"color":"#FF00FF00","offset":"1.000000"}],[{"color":"#20FF0000","offset":"0.000000"},{"color":"#20FF0000","offset":"1.000000"}]]}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelAttrsModifierUndefinedTest_static_0500] END');
      done();
    });


  })
}
