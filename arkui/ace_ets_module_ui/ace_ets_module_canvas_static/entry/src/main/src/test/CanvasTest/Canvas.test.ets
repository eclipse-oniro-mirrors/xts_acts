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

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import {
  CanvasParams,
  LengthMetricsUnit,
  RenderingContextSettings,
  RenderingContextOptions
} from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function CanvasTest() {
  describe('CanvasTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('CanvasTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.canvas.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('CanvasTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/CanvasIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('CanvasTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'CanvasIndex') {
          routerInstance.replaceUrl(options);
          await Utils.sleep(1500);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('CanvasTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info('CanvasTest after each called');
    });

    /**
     * @tc.number CanvasTest_001
     * @tc.name canvas2dBoundNotNull
     * @tc.desc Test CanvasRenderingContext2D.canvas getter returns non-null when bound to Canvas component
     */
    it('canvas2dBoundNotNull', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: canvas2dBoundNotNull START');
      try {
        // Wait for onReady to fire and update the @State label
        await CommonFunc.sleep(2000);
        let mText = inspector.getInspectorByKey('btnCtxBound');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: canvas2dBoundNotNull label = ' + label);
        expect(label).assertEqual('ctx_bound:notNull');
        done();
      } catch (error) {
        console.error('CanvasTest execute: canvas2dBoundNotNull error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_002
     * @tc.name drawingContextBoundNotNull
     * @tc.desc Test DrawingRenderingContext.canvas getter returns non-null when bound to Canvas component
     */
    it('drawingContextBoundNotNull', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: drawingContextBoundNotNull START');
      try {
        await CommonFunc.sleep(2000);
        let mText = inspector.getInspectorByKey('btnDrcBound');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: drawingContextBoundNotNull label = ' + label);
        expect(label).assertEqual('drc_bound:notNull');
        done();
      } catch (error) {
        console.error('CanvasTest execute: drawingContextBoundNotNull error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_003
     * @tc.name renderingContextSettings_antialias_default
     * @tc.desc Test RenderingContextSettings default constructor returns boolean antialias
     */
    it('renderingContextSettings_antialias_default', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_default START');
      try {
        await CommonFunc.sleep(200);
        let settings = new RenderingContextSettings();
        let antialias = settings.antialias;
        console.info('CanvasTest: antialias_default value = ' + antialias);
        expect(antialias === true || antialias === false).assertEqual(true);
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_default error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_004
     * @tc.name renderingContextSettings_antialias_ctor_true
     * @tc.desc Test RenderingContextSettings constructor with antialias=true getter returns true
     */
    it('renderingContextSettings_antialias_ctor_true', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_ctor_true START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnAntiAliasCtor'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnAntiAliasCtor');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: antialias_ctor label = ' + label);
        expect(label).assertEqual('antialias_ctor:true');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_ctor_true error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_005
     * @tc.name renderingContextSettings_antialias_setter_true
     * @tc.desc Test RenderingContextSettings antialias setter = true
     */
    it('renderingContextSettings_antialias_setter_true', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_setter_true START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnAntiAliasSetTrue'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnAntiAliasSetTrue');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: antialias_set_true label = ' + label);
        expect(label).assertEqual('antialias_set_true:true');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_setter_true error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_006
     * @tc.name renderingContextSettings_antialias_setter_false
     * @tc.desc Test RenderingContextSettings antialias setter = false (overrides ctor true)
     */
    it('renderingContextSettings_antialias_setter_false', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_setter_false START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnAntiAliasSetFalse'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnAntiAliasSetFalse');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: antialias_set_false label = ' + label);
        expect(label).assertEqual('antialias_set_false:false');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_setter_false error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_007
     * @tc.name canvasRenderingContext2D_canvas_null_unbound
     * @tc.desc Test CanvasRenderingContext2D.canvas getter returns null when not bound to Canvas
     */
    it('canvasRenderingContext2D_canvas_null_unbound', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: canvasRenderingContext2D_canvas_null_unbound START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnCtx2dCanvasNull'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnCtx2dCanvasNull');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: ctx2d_canvas_null label = ' + label);
        expect(label).assertEqual('ctx2d_canvas:null');
        done();
      } catch (error) {
        console.error('CanvasTest execute: canvasRenderingContext2D_canvas_null_unbound error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_008
     * @tc.name canvasRenderingContext2D_with_unit
     * @tc.desc Test CanvasRenderingContext2D constructor with LengthMetricsUnit creates valid instance
     */
    it('canvasRenderingContext2D_with_unit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: canvasRenderingContext2D_with_unit START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnCtx2dUnit'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnCtx2dUnit');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: ctx2d_unit label = ' + label);
        expect(label).assertEqual('ctx2d_unit:ok');
        done();
      } catch (error) {
        console.error('CanvasTest execute: canvasRenderingContext2D_with_unit error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_009
     * @tc.name drawingRenderingContext_size_getter
     * @tc.desc Test DrawingRenderingContext.size getter returns non-null Size object
     */
    it('drawingRenderingContext_size_getter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: drawingRenderingContext_size_getter START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnDrcSize'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnDrcSize');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: drc_size label = ' + label);
        expect(label).assertEqual('drc_size:notNull');
        done();
      } catch (error) {
        console.error('CanvasTest execute: drawingRenderingContext_size_getter error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_010
     * @tc.name drawingRenderingContext_canvas_null_unbound
     * @tc.desc Test DrawingRenderingContext.canvas getter returns null when not bound to Canvas
     */
    it('drawingRenderingContext_canvas_null_unbound', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: drawingRenderingContext_canvas_null_unbound START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnDrcCanvas'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnDrcCanvas');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: drc_canvas label = ' + label);
        expect(label).assertEqual('drc_canvas:null');
        done();
      } catch (error) {
        console.error('CanvasTest execute: drawingRenderingContext_canvas_null_unbound error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_011
     * @tc.name drawingRenderingContext_with_unit
     * @tc.desc Test DrawingRenderingContext constructor with LengthMetricsUnit creates valid instance
     */
    it('drawingRenderingContext_with_unit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: drawingRenderingContext_with_unit START');
      try {
        await CommonFunc.sleep(500);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnDrcUnit'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnDrcUnit');
        let label = JSON.parseJsonElement(mText).getElement('$attrs').getString('label');
        console.info('CanvasTest: drc_unit label = ' + label);
        expect(label).assertEqual('drc_unit:ok');
        done();
      } catch (error) {
        console.error('CanvasTest execute: drawingRenderingContext_with_unit error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_012
     * @tc.name canvasParams_unit_default
     * @tc.desc Test CanvasParams.unit property with LengthMetricsUnit.DEFAULT
     */
    it('canvasParams_unit_default', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: canvasParams_unit_default START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let params: CanvasParams = { unit: LengthMetricsUnit.DEFAULT };
        expect(params.unit).assertEqual(LengthMetricsUnit.DEFAULT);
        done();
      } catch (error) {
        console.error('CanvasTest execute: canvasParams_unit_default error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_013
     * @tc.name renderingContextOptions_antialias_true
     * @tc.desc Test RenderingContextOptions.antialias stores true
     */
    it('renderingContextOptions_antialias_true', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextOptions_antialias_true START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: RenderingContextOptions = { antialias: true };
        expect(opts.antialias).assertEqual(true);
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextOptions_antialias_true error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_014
     * @tc.name renderingContextOptions_antialias_false
     * @tc.desc Test RenderingContextOptions.antialias stores false
     */
    it('renderingContextOptions_antialias_false', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextOptions_antialias_false START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: RenderingContextOptions = { antialias: false };
        expect(opts.antialias).assertEqual(false);
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextOptions_antialias_false error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_015
     * @tc.name renderingContextOptions_antialias_trueVsFalse
     * @tc.desc Test RenderingContextOptions.antialias true and false differ
     */
    it('renderingContextOptions_antialias_trueVsFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextOptions_antialias_trueVsFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let optsTrue: RenderingContextOptions = { antialias: true };
        let optsFalse: RenderingContextOptions = { antialias: false };
        expect(optsTrue.antialias).assertEqual(true);
        expect(optsFalse.antialias).assertEqual(false);
        expect(optsTrue.antialias === optsFalse.antialias).assertEqual(false);
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextOptions_antialias_trueVsFalse error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
