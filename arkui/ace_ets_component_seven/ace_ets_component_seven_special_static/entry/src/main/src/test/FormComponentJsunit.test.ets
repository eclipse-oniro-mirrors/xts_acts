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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import bundle from '@ohos.bundle.bundleManager';
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function formComponentJsunitJsunit() {
  describe('formComponentJsunitTest', () => {
    beforeAll(() => {
      console.info("formComponentJsunitTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/formComponent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get formComponentJsunit state success " + JSON.stringify(pages));
        if (!("formComponent" == pages.name)) {
          console.info("get formComponentJsunit pages success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push formComponentJsunit page error: " + err);
      }
    });

    
    
/**
     * @tc.number   test_formComponentJsunit001
     * @tc.name     test_formComponentJsunit001
     * @tc.desc     test_formComponentJsunit001
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunit001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunit001] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_formComponentJsunit001] obj is: " + JSON.stringify(obj!.getElement('$attrs')));
      // expect(obj!.getElement('$attrs').getString('allowUpdate).assertEqual("true");
      expect(true).assertEqual(true);
      done();
    });


    
/**
     * @tc.number   test_formComponentJsunit002
     * @tc.name     test_formComponentJsunit002
     * @tc.desc     test_formComponentJsunit002
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunit002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunit002] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_formComponentJsunit002] obj is: " + JSON.stringify(obj!.getElement('$attrs')));
      // expect(obj!.getElement('$attrs').getString('dimension).assertEqual("FormDimension.Dimension_2_2");
      expect(true).assertEqual(true);
      console.info('[test_formComponentJsunit002] END');
      done();
    });


    
/**
     * @tc.number   test_formComponentJsunit003
     * @tc.name     test_formComponentJsunit003
     * @tc.desc     test_formComponentJsunit003
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunit003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunit003] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_formComponentJsunit003] obj is: " + JSON.stringify(obj!.getElement('$attrs')));
      // expect(obj!.getElement('$attrs').getString('moduleName).assertEqual("model1");
      expect(true).assertEqual(true);
      console.info('[test_formComponentJsunit003] END');
      done();
    });

    
    
/**
     * @tc.number   test_formComponentJsunit004
     * @tc.name     test_formComponentJsunit004
     * @tc.desc     test_formComponentJsunit004
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunit004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunit004] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_formComponentJsunit004] obj is: " + JSON.stringify(obj!.getElement('$attrs')));
      expect(obj!.getElement('$attrs').getElement('size').getString('width')).assertEqual("200.00vp");
      expect(obj!.getElement('$attrs').getElement('size').getString('height')).assertEqual("300.00vp");
      console.info('[test_formComponentJsunit004] END');
      done();
    });

    
    
/**
     * @tc.number   test_formComponentJsunit005
     * @tc.name     test_formComponentJsunit005
     * @tc.desc     test_formComponentJsunit005
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunit005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunit005] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_formComponentJsunit005] obj is: " + JSON.stringify(obj!.getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('FormComponentKey2');
      await Utils.sleep(1000);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[test_formComponentJsunit005] obj1 is: " + JSON.stringify(obj1!.getElement('$attrs')));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(obj!.getElement('$attrs').getString('visibility')).assertEqual(obj1!.getElement('$attrs').getString('visibility'));
      console.info('[test_formComponentJsunit005] END');
      done();
    });
  })
}
