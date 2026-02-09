'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function shape() {
  describe("shapeJsunit", () => {
    beforeAll(() => {
      console.info("shapeJsunit beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("shapeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/shape',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get shape state pages: " + JSON.stringify(pages));
        if (!("shape" == pages.name)) {
          console.info("get shape state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push panel page error: " + err);
      }
    });


    
    /**
     * @tc.number   ShapeJsunit_static_001
     * @tc.name     ShapeJsunit_static_001
     * @tc.desc     ShapeJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_001] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_001] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('viewPort').getString('x')).assertEqual("1.00vp");
      expect(obj.getElement('$attrs').getElement('viewPort').getString('y')).assertEqual("-2.00vp");
      expect(obj.getElement('$attrs').getElement('viewPort').getString('width')).assertEqual("100.00vp");
      expect(obj.getElement('$attrs').getElement('viewPort').getString('height')).assertEqual("200.00vp");

      console.info('[ShapeJsunit_static_001] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_002
     * @tc.name     ShapeJsunit_static_002
     * @tc.desc     ShapeJsunit_static_002
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_002] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_002] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('stroke')).assertEqual("#FFFFC0CB");

      console.info('[ShapeJsunit_static_002] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_003
     * @tc.name     ShapeJsunit_static_003
     * @tc.desc     ShapeJsunit_static_003
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_003] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_003] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fill')).assertEqual("#FF317AF7");

      console.info('[ShapeJsunit_static_003] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_004
     * @tc.name     ShapeJsunit_static_004
     * @tc.desc     ShapeJsunit_static_004
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_004] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_004] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('strokeDashOffset')).assertEqual("15.00vp");

      console.info('[ShapeJsunit_static_004] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_005
     * @tc.name     ShapeJsunit_static_005
     * @tc.desc     ShapeJsunit_static_005
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_005] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_005] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getArray('strokeDashArray')[0].asString()).assertEqual('30.00vp');
      console.info('[ShapeJsunit_static_005] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_006
     * @tc.name     ShapeJsunit_static_006
     * @tc.desc     ShapeJsunit_static_006
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_006] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_006] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('strokeLineJoin')).assertEqual("LineJoinStyle.Round");

      console.info('[ShapeJsunit_static_006] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_007
     * @tc.name     ShapeJsunit_static_007
     * @tc.desc     ShapeJsunit_static_007
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_007] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_007] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('strokeLineCap')).assertEqual("LineCapStyle.Round");

      console.info('[ShapeJsunit_static_007] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_008
     * @tc.name     ShapeJsunit_static_008
     * @tc.desc     ShapeJsunit_static_008
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_008] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_008] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('strokeOpacity')).assertEqual("0.500000");

      console.info('[ShapeJsunit_static_008] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_009
     * @tc.name     ShapeJsunit_static_009
     * @tc.desc     ShapeJsunit_static_009
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_009] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_009] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('strokeMiterLimit')).assertEqual("5.000000");

      console.info('[ShapeJsunit_static_009] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_0010
     * @tc.name     ShapeJsunit_static_0010
     * @tc.desc     ShapeJsunit_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_0010] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_0010] obj  is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("[ShapeJsunit_static_0010] mesh  is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('mesh')));
      expect(obj.getElement('$attrs').getElement('mesh').getArray('value')[0].asString()).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('mesh').getDouble('row')).assertEqual(1);
      expect(obj.getElement('$attrs').getElement('mesh').getDouble('column')).assertEqual(1);

      console.info('[ShapeJsunit_static_0010] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_0011
     * @tc.name     ShapeJsunit_static_0011
     * @tc.desc     ShapeJsunit_static_0011
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_0011] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_0011] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getDouble('strokeWidth')).assertEqual(20);

      console.info('[ShapeJsunit_static_0011] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_0012
     * @tc.name     ShapeJsunit_static_0012
     * @tc.desc     ShapeJsunit_static_0012
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_0012] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_0012] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fillOpacity')).assertEqual("1.000000");

      console.info('[ShapeJsunit_static_0012] END');
      done();
    });


    
    /**
     * @tc.number   ShapeJsunit_static_0013
     * @tc.name     ShapeJsunit_static_0013
     * @tc.desc     ShapeJsunit_static_0013
     * @tc.level    Level.LEVEL0
     */
it('ShapeJsunit_static_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ShapeJsunit_static_0013] START');
      let strJson = inspector.getInspectorByKey('ShapeKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ShapeJsunit_static_0013] obj  is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('antiAlias')).assertEqual("true");
      console.info('[ShapeJsunit_static_0013] END');
      done();
    });


  })
}