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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function waterFlowView() {
  describe('waterFlowViewJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlowViewJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlowView',
      }
      // let result;
      try {
        const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get WaterFlowView state pages: " + JSON.stringify(pages));
        if (!("waterFlowView" == pages.name)) {
          console.info("get WaterFlowView state pages.name: " + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowView page error: " + err);
      }
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0100
     * @tc.name     waterFlowViewJsunit_static_0100
     * @tc.desc     waterFlowViewJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RectJsunit_0100] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(true).assertEqual(true);
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0200
     * @tc.name     waterFlowViewJsunit_static_0200
     * @tc.desc     waterFlowViewJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0200] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0200] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(Math.abs(obj.getElement('$attrs').getDouble('friction') - 0.6) < 0.000001).assertTrue();
      console.info('[waterFlowViewJsunit_static_0200] END');
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0300
     * @tc.name     waterFlowViewJsunit_static_0300
     * @tc.desc     waterFlowViewJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0300] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0300] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);
      console.info('[waterFlowViewJsunit_static_0300] END');
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0400
     * @tc.name     waterFlowViewJsunit_static_0400
     * @tc.desc     waterFlowViewJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0400] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0400] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('columnsTemplate')).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_static_0400] END');
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0500
     * @tc.name     waterFlowViewJsunit_static_0500
     * @tc.desc     waterFlowViewJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0500] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0500] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('itemConstraintSize'))
        .assertEqual('{"minWidth":"1.00vp","minHeight":"1.00vp","maxWidth":"10.00vp","maxHeight":"10.00vp"}');

      console.info('[waterFlowViewJsunit_static_0500] END');
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0600
     * @tc.name     waterFlowViewJsunit_static_0600
     * @tc.desc     waterFlowViewJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0600] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0600] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_static_0600] END');
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0700
     * @tc.name     waterFlowViewJsunit_static_0700
     * @tc.desc     waterFlowViewJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0700] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0700] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('rowsTemplate')).assertEqual("1fr 1fr 1fr 1fr");
      console.info('[waterFlowViewJsunit_static_0700] END');
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0800
     * @tc.name     waterFlowViewJsunit_static_0800
     * @tc.desc     waterFlowViewJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0800] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0800] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual("1.00vp");
      console.info('[waterFlowViewJsunit_static_0800] END');
      done();
    });

    
    
/**
     * @tc.number   waterFlowViewJsunit_static_0900
     * @tc.name     waterFlowViewJsunit_static_0900
     * @tc.desc     waterFlowViewJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('waterFlowViewJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[waterFlowViewJsunit_static_0900] START');
      let strJson = inspector.getInspectorByKey('WaterFlowKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowViewJsunit_static_0900] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("[waterFlowViewJsunit_static_0900] ['layoutDirection']: " + JSON.stringify(obj.getElement('$attrs').getString('layoutDirection')));
      expect(obj.getElement('$attrs').getString('layoutDirection')).assertEqual("FlexDirection.Column");
      console.info('[waterFlowViewJsunit_static_0900] END');
      done();
    });
  
  })
}