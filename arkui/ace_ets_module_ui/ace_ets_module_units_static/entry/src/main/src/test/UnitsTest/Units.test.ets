/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import {
  AccessibilityOptions,
  AccessibilityActionOptions,
  CacheCountInfo
} from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function UnitsTest() {
  describe('UnitsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('UnitsTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.units.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('UnitsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Units/UnitsIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('UnitsTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'UnitsIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('UnitsTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info('UnitsTest after each called');
    });

    // ============================================================
    // LengthMetrics.vp() - value and unit via page button
    // ============================================================

    /**
     * @tc.number UnitsTest_001
     * @tc.name lengthMetricsVpValue
     * @tc.desc Test LengthMetrics.vp(10).value returns 10
     */
    it('lengthMetricsVpValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsVpValue START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsVpValue'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsVpValue');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: vp_value label = ' + label);
        expect(label).assertEqual('vp_val:10');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsVpValue error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_002
     * @tc.name lengthMetricsVpUnit
     * @tc.desc Test LengthMetrics.vp(10).unit returns LengthUnit.VP (1)
     */
    it('lengthMetricsVpUnit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsVpUnit START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsVpUnit'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsVpUnit');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: vp_unit label = ' + label);
        expect(label).assertEqual('vp_unit:1');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsVpUnit error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_003
     * @tc.name lengthMetricsPxValue
     * @tc.desc Test LengthMetrics.px(20).value returns 20
     */
    it('lengthMetricsPxValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsPxValue START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsPxValue'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsPxValue');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: px_value label = ' + label);
        expect(label).assertEqual('px_val:20');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsPxValue error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_004
     * @tc.name lengthMetricsPxUnit
     * @tc.desc Test LengthMetrics.px(20).unit returns LengthUnit.PX (0)
     */
    it('lengthMetricsPxUnit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsPxUnit START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsPxUnit'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsPxUnit');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: px_unit label = ' + label);
        expect(label).assertEqual('px_unit:0');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsPxUnit error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_005
     * @tc.name lengthMetricsFpValue
     * @tc.desc Test LengthMetrics.fp(14).value returns 14
     */
    it('lengthMetricsFpValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsFpValue START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsFpValue'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsFpValue');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: fp_value label = ' + label);
        expect(label).assertEqual('fp_val:14');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsFpValue error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_006
     * @tc.name lengthMetricsFpUnit
     * @tc.desc Test LengthMetrics.fp(14).unit returns LengthUnit.FP (2)
     */
    it('lengthMetricsFpUnit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsFpUnit START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsFpUnit'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsFpUnit');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: fp_unit label = ' + label);
        expect(label).assertEqual('fp_unit:2');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsFpUnit error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_007
     * @tc.name lengthMetricsPctValue
     * @tc.desc Test LengthMetrics.percent(0.5).value returns 0.5
     */
    it('lengthMetricsPctValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsPctValue START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsPctValue'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsPctValue');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: pct_value label = ' + label);
        expect(label).assertEqual('pct_val:0.5');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsPctValue error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_008
     * @tc.name lengthMetricsPctUnit
     * @tc.desc Test LengthMetrics.percent(0.5).unit returns LengthUnit.PERCENT (3)
     */
    it('lengthMetricsPctUnit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: lengthMetricsPctUnit START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnLengthMetricsPctUnit'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnLengthMetricsPctUnit');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: pct_unit label = ' + label);
        expect(label).assertEqual('pct_unit:3');
        done();
      } catch (error) {
        console.error('UnitsTest execute: lengthMetricsPctUnit error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_009
     * @tc.name colorMetricsRgba
     * @tc.desc Test ColorMetrics.rgba creates a valid instance
     */
    it('colorMetricsRgba', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: colorMetricsRgba START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnColorMetricsRgba'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnColorMetricsRgba');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: color_rgba label = ' + label);
        expect(label).assertEqual('rgba:ok');
        done();
      } catch (error) {
        console.error('UnitsTest execute: colorMetricsRgba error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number UnitsTest_010
     * @tc.name colorMetricsRedChannel
     * @tc.desc Test ColorMetrics.rgba red channel value is readable
     */
    it('colorMetricsRedChannel', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('UnitsTest execute: colorMetricsRedChannel START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnColorMetricsRed'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnColorMetricsRed');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('UnitsTest: color_red label = ' + label);
        expect(label).assertEqual('red:200');
        done();
      } catch (error) {
        console.error('UnitsTest execute: colorMetricsRedChannel error: ' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // Interface property tests (pure JS - no page needed)
    // ============================================================

    /**
     * @tc.number UnitsTest_011
     * @tc.name accessibilityOptionsStateControllerId
     * @tc.desc Test AccessibilityOptions.stateControllerId stores the assigned value
     */
    it('accessibilityOptionsStateControllerId', Level.LEVEL1, (done: () => void): void => {
      console.info('UnitsTest execute: accessibilityOptionsStateControllerId START');
      let opts: AccessibilityOptions = { stateControllerId: 'controllerA' };
      expect(opts.stateControllerId).assertEqual('controllerA');
      done();
    });

    /**
     * @tc.number UnitsTest_012
     * @tc.name accessibilityOptionsActionControllerId
     * @tc.desc Test AccessibilityOptions.actionControllerId stores the assigned value
     */
    it('accessibilityOptionsActionControllerId', Level.LEVEL1, (done: () => void): void => {
      console.info('UnitsTest execute: accessibilityOptionsActionControllerId START');
      let opts: AccessibilityOptions = { actionControllerId: 'controllerB' };
      expect(opts.actionControllerId).assertEqual('controllerB');
      done();
    });

    /**
     * @tc.number UnitsTest_013
     * @tc.name accessibilityActionOptionsScrollStep
     * @tc.desc Test AccessibilityActionOptions.scrollStep stores the assigned value
     */
    it('accessibilityActionOptionsScrollStep', Level.LEVEL1, (done: () => void): void => {
      console.info('UnitsTest execute: accessibilityActionOptionsScrollStep START');
      let opts: AccessibilityActionOptions = { scrollStep: 3 };
      expect(opts.scrollStep).assertEqual(3);
      done();
    });

    /**
     * @tc.number UnitsTest_014
     * @tc.name cacheCountInfoMinCount
     * @tc.desc Test CacheCountInfo.minCount stores the assigned value
     */
    it('cacheCountInfoMinCount', Level.LEVEL1, (done: () => void): void => {
      console.info('UnitsTest execute: cacheCountInfoMinCount START');
      let info: CacheCountInfo = { minCount: 2, maxCount: 10 };
      expect(info.minCount).assertEqual(2);
      done();
    });

    /**
     * @tc.number UnitsTest_015
     * @tc.name cacheCountInfoMaxCount
     * @tc.desc Test CacheCountInfo.maxCount stores the assigned value
     */
    it('cacheCountInfoMaxCount', Level.LEVEL1, (done: () => void): void => {
      console.info('UnitsTest execute: cacheCountInfoMaxCount START');
      let info: CacheCountInfo = { minCount: 2, maxCount: 10 };
      expect(info.maxCount).assertEqual(10);
      done();
    });

    /**
     * @tc.number UnitsTest_016
     * @tc.name cacheCountInfoMinMaxZero
     * @tc.desc Test CacheCountInfo.minCount and maxCount with zero values
     */
    it('cacheCountInfoMinMaxZero', Level.LEVEL1, (done: () => void): void => {
      console.info('UnitsTest execute: cacheCountInfoMinMaxZero START');
      let info: CacheCountInfo = { minCount: 0, maxCount: 0 };
      expect(info.minCount).assertEqual(0);
      expect(info.maxCount).assertEqual(0);
      done();
    });
  });
}
