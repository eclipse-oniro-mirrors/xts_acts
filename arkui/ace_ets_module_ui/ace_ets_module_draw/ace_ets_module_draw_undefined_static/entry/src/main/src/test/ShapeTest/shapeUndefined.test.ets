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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function ShapeUndefinedTest() {
  describe('ShapeUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ShapeUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.draw.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ShapeUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Shape/shapeUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ShapeUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("shapeUndefined" == pages.name)) {
          console.info("get shapeUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ShapePage page error:" + err);
      }
      console.info("ShapeUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0100
     * @tc.name      ShapeUndefinedTest_static_0100
     * @tc.desc      ShapeUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stroke')))
        .assertEqual('\"#FF2787D9\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_stroke'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('stroke')))
        .assertEqual('\"#FF000000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0200
     * @tc.name      ShapeUndefinedTest_static_0200
     * @tc.desc      ShapeUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('antiAlias')))
        .assertEqual('\"false\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_antiAlias'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('antiAlias')))
        .assertEqual('\"true\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0200] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0300
     * @tc.name      ShapeUndefinedTest_static_0300
     * @tc.desc      ShapeUndefinedTest_static_0300
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeWidth')))
        .assertEqual('8');

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeWidth'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeWidth')))
        .assertEqual('0');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0300] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0400
     * @tc.name      ShapeUndefinedTest_static_0400
     * @tc.desc      ShapeUndefinedTest_static_0400
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeDashOffset')))
        .assertEqual('\"100.00vp\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeDashOffset'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeDashOffset')))
        .assertContain('"0.00');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0400] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0500
     * @tc.name      ShapeUndefinedTest_static_0500
     * @tc.desc      ShapeUndefinedTest_static_0500
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeMiterLimit')))
        .assertEqual('\"14.000000\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeMiterLimit'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeMiterLimit')))
        .assertEqual('\"4.000000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0500] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0600
     * @tc.name      ShapeUndefinedTest_static_0600
     * @tc.desc      ShapeUndefinedTest_static_0600
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0600] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeLineCap')))
        .assertEqual('\"LineCapStyle.Round\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeLineCap'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeLineCap')))
        .assertEqual('\"LineCapStyle.Butt\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0600] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0700
     * @tc.name      ShapeUndefinedTest_static_0700
     * @tc.desc      ShapeUndefinedTest_static_0700
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0700] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeDashArray'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeDashArray')))
        .assertEqual('["20.00vp","20.00vp"]');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeDashArray')))
        .assertEqual('[]');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0700] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0800
     * @tc.name      ShapeUndefinedTest_static_0800
     * @tc.desc      ShapeUndefinedTest_static_0800
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0800] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeOpacity')))
        .assertEqual('\"0.100000\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeOpacity'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('strokeOpacity')))
        .assertEqual('\"1.000000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0800] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_0900
     * @tc.name      ShapeUndefinedTest_static_0900
     * @tc.desc      ShapeUndefinedTest_static_0900
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_0900] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeLineJoin')))
        .assertEqual('\"LineJoinStyle.Round\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeLineJoin'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('strokeLineJoin')))
        .assertEqual('\"LineJoinStyle.Miter\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_0900] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_1000
     * @tc.name      ShapeUndefinedTest_static_1000
     * @tc.desc      ShapeUndefinedTest_static_1000
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_1000] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fill')))
        .assertEqual('\"#FFBBF17F\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_strokeLineJoin'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fill')))
        .assertEqual('\"#FFBBF17F\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_1000] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_1100
     * @tc.name      ShapeUndefinedTest_static_1100
     * @tc.desc      ShapeUndefinedTest_static_1100
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_1100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fillOpacity')))
        .assertEqual('\"0.100000\"');

      let changeBtn = await driver.findComponent(ON.id('Shape_fillOpacity'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('fillOpacity')))
        .assertEqual('\"1.000000\"');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_1100] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_1200
     * @tc.name      ShapeUndefinedTest_static_1200
     * @tc.desc      ShapeUndefinedTest_static_1200
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_1200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape3');
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mesh').getDouble('row'))
        .assertEqual(2);

      let changeBtn = await driver.findComponent(ON.id('Shape_mesh'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape3');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mesh').getDouble('row'))
        .assertEqual(0);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_1200] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_1300
     * @tc.name      ShapeUndefinedTest_static_1300
     * @tc.desc      ShapeUndefinedTest_static_1300
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_1300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Shape4');
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mesh').getDouble('column'))
        .assertEqual(2);

      let changeBtn = await driver.findComponent(ON.id('Shape_mesh'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Shape4');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mesh').getDouble('column'))
        .assertEqual(0);
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_1300] END');
      done();
    });

    /**
     * @tc.number    ShapeUndefinedTest_static_1400
     * @tc.name      ShapeUndefinedTest_static_1400
     * @tc.desc      ShapeUndefinedTest_static_1400
     * @tc.level     Level.LEVEL1
     */
    it('ShapeUndefinedTest_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ShapeUndefinedTest_static_1400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Shape2');
      await CommonFunc.sleep(2000);

      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('viewPort')))
        .assertEqual('\{"x":"1.00vp","y":"-2.00vp","width":"100.00vp","height":"200.00vp"\}');

      let changeBtn = await driver.findComponent(ON.id('Shape_viewPort'));
      let changeBtn_show = await driver.findComponent(ON.id('Shape_show'));
      await (changeBtn_show?.click() as Promise<void>);
      await (changeBtn?.click() as Promise<void>);
      await (changeBtn_show?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      strJson = inspector.getInspectorByKey('Shape2');
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('viewPort')))
        .assertEqual('\{\}');
      await CommonFunc.sleep(2000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[ShapeUndefinedTest_static_1400] END');
      done();
    });

  })
}