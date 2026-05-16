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

export default function DataPanelUndefinedTest() {
  describe('DataPanelUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("DataPanelUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("DataPanelUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/dataPanelUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get DataPanelUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("dataPanelUndefined" == pages.name)) {
          console.info("get DataPanelUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push DataPanelEventPage page error:" + err);
      }
      console.info("DataPanelUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   DataPanelUndefinedTest_static_0001
     * @tc.name     DataPanelUndefinedTest_static_0001
     * @tc.desc     DataPanelUndefinedTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelUndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelUndefinedTest_static_0001] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelUndefinedTest_static_0001] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelUndefinedTest_static_0001] strokeWidth: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeWidth')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeWidth')))
        .assertEqual('\"10.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('DataPanel_StrokeWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[DataPanelUndefinedTest_static_0001] click DataPanel_StrokeWidth");
      strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeWidth')))
        .assertEqual('\"24.00vp\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelUndefinedTest_static_0001] END');
      done();
    });


    /**
     * @tc.number   DataPanelUndefinedTest_static_0003
     * @tc.name     DataPanelUndefinedTest_static_0003
     * @tc.desc     DataPanelUndefinedTest_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelUndefinedTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelUndefinedTest_static_0003] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelUndefinedTest_static_0003] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelUndefinedTest_static_0003] valueColors: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('valueColors')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('valueColors')))
        .assertEqual('[[{"color":"#65EEC9A3","offset":"0.000000"},{"color":"#FFEF629F","offset":"1.000000"}],[{"color":"#FF67F9D4","offset":"0.000000"},{"color":"#FFFF9554","offset":"1.000000"}],[{"color":"#FF00FF00","offset":"0.000000"},{"color":"#FF00FF00","offset":"1.000000"}],[{"color":"#20FF0000","offset":"0.000000"},{"color":"#20FF0000","offset":"1.000000"}]]');

      let changeBtn = await driver.findComponent(ON.id('DataPanel_ValueColors'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[DataPanelUndefinedTest_static_0003] click DataPanel_ValueColors");
      strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('valueColors')))
        .assertEqual('[[{"color":"#FFF7CE00","offset":"0.000000"},{"color":"#FFF99B11","offset":"1.000000"}],[{"color":"#FFF76223","offset":"0.000000"},{"color":"#FFF2400A","offset":"1.000000"}],[{"color":"#FFF772AC","offset":"0.000000"},{"color":"#FFE65392","offset":"1.000000"}],[{"color":"#FFA575EB","offset":"0.000000"},{"color":"#FFA12DF7","offset":"1.000000"}],[{"color":"#FF7B79F7","offset":"0.000000"},{"color":"#FF4B48F7","offset":"1.000000"}],[{"color":"#FF4B8AF3","offset":"0.000000"},{"color":"#FF007DFF","offset":"1.000000"}],[{"color":"#FF73C1E6","offset":"0.000000"},{"color":"#FF4FB4E3","offset":"1.000000"}],[{"color":"#FFA5D61D","offset":"0.000000"},{"color":"#FF69D14F","offset":"1.000000"}],[{"color":"#FFA2A2B0","offset":"0.000000"},{"color":"#FF8E8E93","offset":"1.000000"}]]');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelUndefinedTest_static_0003] END');
      done();
    });

    /**
     * @tc.number   DataPanelUndefinedTest_static_0004
     * @tc.name     DataPanelUndefinedTest_static_0004
     * @tc.desc     DataPanelUndefinedTest_static_0004
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelUndefinedTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelUndefinedTest_static_0004] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelUndefinedTest_static_0004] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelUndefinedTest_static_0004] trackBackgroundColor: " +
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
      console.info("[DataPanelUndefinedTest_static_0004] click DataPanel_TrackBackgroundColor");
      let defJson = inspector.getInspectorByKey('MyDataPanel1');
      await CommonFunc.sleep(1000);
      let defColor = JSON.stringifyJsonElement(JSON.parseJsonElement(defJson)
        .getElement('$attrs')
        .getElement('trackBackgroundColor'));
      strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackBackgroundColor')))
        .assertEqual(defColor);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelUndefinedTest_static_0004] END');
      done();
    });

    /**
     * @tc.number   DataPanelUndefinedTest_static_0005
     * @tc.name     DataPanelUndefinedTest_static_0005
     * @tc.desc     DataPanelUndefinedTest_static_0005
     * @tc.level    Level.LEVEL1
     */
    it('DataPanelUndefinedTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[DataPanelUndefinedTest_static_0005] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);

      console.info("[DataPanelUndefinedTest_static_0005] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[DataPanelUndefinedTest_static_0005] trackShadow: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackShadow')))
        .assertEqual('{"radius":"5.000000","offsetX":"15.000000","offsetY":"15.000000","colors":[[{"color":"#65EEC9A3","offset":"0.000000"},{"color":"#FFEF629F","offset":"1.000000"}],[{"color":"#FF67F9D4","offset":"0.000000"},{"color":"#FFFF9554","offset":"1.000000"}],[{"color":"#FF00FF00","offset":"0.000000"},{"color":"#FF00FF00","offset":"1.000000"}],[{"color":"#20FF0000","offset":"0.000000"},{"color":"#20FF0000","offset":"1.000000"}]]}');

      let changeBtn = await driver.findComponent(ON.id('DataPanel_TrackShadow'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[DataPanelUndefinedTest_static_0005] click DataPanel_TrackShadow");
      strJson = inspector.getInspectorByKey('MyDataPanel');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackShadow')))
        .assertEqual('{"radius":"20.000000","offsetX":"5.000000","offsetY":"5.000000","colors":[[{"color":"#65EEC9A3","offset":"0.000000"},{"color":"#FFEF629F","offset":"1.000000"}],[{"color":"#FF67F9D4","offset":"0.000000"},{"color":"#FFFF9554","offset":"1.000000"}],[{"color":"#FF00FF00","offset":"0.000000"},{"color":"#FF00FF00","offset":"1.000000"}],[{"color":"#20FF0000","offset":"0.000000"},{"color":"#20FF0000","offset":"1.000000"}]]}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[DataPanelUndefinedTest_static_0005] END');
      done();
    });


  })
}
