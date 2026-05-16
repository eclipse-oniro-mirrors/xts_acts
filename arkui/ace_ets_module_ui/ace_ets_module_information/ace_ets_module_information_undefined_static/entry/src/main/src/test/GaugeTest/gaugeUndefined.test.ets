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

export default function GaugeUndefinedTest() {
  describe('GaugeUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("GaugeUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GaugeUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gauge/gaugeUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get GaugeUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gaugeUndefined" == pages.name)) {
          console.info("get GaugeUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(4000);
        }
      } catch (err) {
        console.error("push GaugeEventPage page error:" + err);
      }
      console.info("GaugeUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });


    /**
     * @tc.number   GaugeUndefinedTest_static_0100
     * @tc.name     GaugeUndefinedTest_static_0100
     * @tc.desc     GaugeUndefinedTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('GaugeUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GaugeUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);

      console.info("[GaugeUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GaugeUndefinedTest_static_0100] startAngle: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('startAngle')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('startAngle')))
        .assertEqual('\"210.00\"');

      let changeBtn = await driver.findComponent(ON.id('Gauge_StartAngle'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0100] click Gauge_StartAngle");
      strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('startAngle')))
        .assertEqual('\"0.00\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GaugeUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   GaugeUndefinedTest_static_0200
     * @tc.name     GaugeUndefinedTest_static_0200
     * @tc.desc     GaugeUndefinedTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('GaugeUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GaugeUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);

      console.info("[GaugeUndefinedTest_static_0200] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GaugeUndefinedTest_static_0200] endAngle: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('endAngle')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('endAngle')))
        .assertEqual('\"150.00\"');

      let changeBtn = await driver.findComponent(ON.id('Gauge_EndAngle'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0200] click Gauge_EndAngle");
      strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('endAngle')))
        .assertEqual('\"360.00\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GaugeUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   GaugeUndefinedTest_static_0300
     * @tc.name     GaugeUndefinedTest_static_0300
     * @tc.desc     GaugeUndefinedTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('GaugeUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GaugeUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);

      console.info("[GaugeUndefinedTest_static_0300] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GaugeUndefinedTest_static_0300] colors: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('colors')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('colors')))
        .assertEqual('\"#FFFF0000\"');

      let changeBtn = await driver.findComponent(ON.id('Gauge_Colors'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0300] click Gauge_Colors");
      strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('colors')))
        .assertEqual('\"[\\"#FF64BB5C\\",\\"#FFF7CE00\\",\\"#FFE84026\\"]\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GaugeUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   GaugeUndefinedTest_static_0400
     * @tc.name     GaugeUndefinedTest_static_0400
     * @tc.desc     GaugeUndefinedTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('GaugeUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GaugeUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);

      console.info("[GaugeUndefinedTest_static_0400] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GaugeUndefinedTest_static_0400] strokeWidth: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeWidth')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeWidth')))
        .assertEqual('\"18.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('Gauge_StrokeWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0400] click Gauge_StrokeWidth");
      strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeWidth')))
        .assertEqual('\"\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GaugeUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   GaugeUndefinedTest_static_0500
     * @tc.name     GaugeUndefinedTest_static_0500
     * @tc.desc     GaugeUndefinedTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('GaugeUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GaugeUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);

      console.info("[GaugeUndefinedTest_static_0500] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GaugeUndefinedTest_static_0500] trackShadow: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackShadow')))
        .assertEqual('{"radius":"7.000000","offsetX":"15.000000","offsetY":"15.000000"}');

      let changeBtn = await driver.findComponent(ON.id('Gauge_TrackShadow'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0500] click Gauge_TrackShadow");
      strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('trackShadow')))
        .assertEqual('{"radius":"20.000000","offsetX":"5.000000","offsetY":"5.000000"}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GaugeUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   GaugeUndefinedTest_static_0600
     * @tc.name     GaugeUndefinedTest_static_0600
     * @tc.desc     GaugeUndefinedTest_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('GaugeUndefinedTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GaugeUndefinedTest_static_0600] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);

      console.info("[GaugeUndefinedTest_static_0600] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GaugeUndefinedTest_static_0600] privacySensitive: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('privacySensitive')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('privacySensitive')))
        .assertEqual('\"true\"');

      let changeBtn = await driver.findComponent(ON.id('Gauge_PrivacySensitive'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0600] click Gauge_PrivacySensitive");
      strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('privacySensitive')))
        .assertEqual('\"false\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GaugeUndefinedTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   GaugeUndefinedTest_static_0700
     * @tc.name     GaugeUndefinedTest_static_0700
     * @tc.desc     GaugeUndefinedTest_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('GaugeUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[GaugeUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);

      let changeBtn1 = await driver.findComponent(ON.id('Gauge_PrivacySensitive'));
      await (changeBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0700] click Gauge_PrivacySensitive");

      console.info("[GaugeUndefinedTest_static_0700] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[GaugeUndefinedTest_static_0700] value: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('value')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('value')))
        .assertEqual('\"80.00\"');

      let changeBtn = await driver.findComponent(ON.id('Gauge_Value'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[GaugeUndefinedTest_static_0700] click Gauge_Value");
      strJson = inspector.getInspectorByKey('MyGauge');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('value')))
        .assertEqual('\"0.00\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[GaugeUndefinedTest_static_0700] END');
      done();
    });
  })
}
