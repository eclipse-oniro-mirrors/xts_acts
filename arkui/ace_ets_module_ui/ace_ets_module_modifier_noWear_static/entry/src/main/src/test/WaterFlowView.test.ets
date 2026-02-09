'use static';
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
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
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import Utils from "../../ets/MainAbility/common/Utils";
import accessibility from '@ohos.accessibility';
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function waterFlowView() {
  describe('waterFlowTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.open.harmony.modifiernowear.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlowViewJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlowView',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WaterFlowView state pages:" + JSON.stringify(pages));
        if (!("WaterFlowView" == pages.name)) {
          console.info("get WaterFlowView pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowView page error: " + err);
      }
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0200
     * @tc.name     waterFlowViewJsunit_static_0200
     * @tc.desc     waterFlowViewJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0200] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0200] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getDouble('friction')).assertEqual(1);
      console.info('[waterFlowViewJsunit_0200] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0300
     * @tc.name     waterFlowViewJsunit_static_0300
     * @tc.desc     waterFlowViewJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0300] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0300] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);
      console.info('[waterFlowViewJsunit_0300] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0400
     * @tc.name     waterFlowViewJsunit_static_0400
     * @tc.desc     waterFlowViewJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0400] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0400] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('columnsTemplate')).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_0400] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0500
     * @tc.name     waterFlowViewJsunit_static_0500
     * @tc.desc     waterFlowViewJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0500] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0500] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('itemConstraintSize'))
        .assertEqual('{"minWidth":"1.00vp","minHeight":"1.00vp","maxWidth":"10.00vp","maxHeight":"10.00vp"}');
      console.info('[waterFlowViewJsunit_0500] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0600
     * @tc.name     waterFlowViewJsunit_static_0600
     * @tc.desc     waterFlowViewJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0600] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0600] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_0600] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0700
     * @tc.name     waterFlowViewJsunit_static_0700
     * @tc.desc     waterFlowViewJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0700] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0700] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('rowsTemplate')).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_0700] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0800
     * @tc.name     waterFlowViewJsunit_static_0800
     * @tc.desc     waterFlowViewJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0800] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0800] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_0800] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_0900
     * @tc.name     waterFlowViewJsunit_static_0900
     * @tc.desc     waterFlowViewJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_0900] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_0900] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("[waterFlowViewJsunit_0900] ['layoutDirection']: " + JSON.stringify(obj.getElement('$attrs')['layoutDirection']));
      expect(obj.getElement('$attrs').getString('layoutDirection')).assertEqual("FlexDirection.Column");
      console.info('[waterFlowViewJsunit_0900] END');
      done();
    });


    
    /**
     * @tc.number   waterFlowViewJsunit_static_1000
     * @tc.name     waterFlowViewJsunit_static_1000
     * @tc.desc     waterFlowViewJsunit_static_1000
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('waterFlowViewJsunit_1000 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJsonNew = inspector.getInspectorByKey('WaterFlowKey1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("waterFlowViewJsunit_1000 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('columnsGap')).assertEqual('2.00vp');
      console.info('waterFlowViewJsunit_1000 END');
      done();
    });
  })
}