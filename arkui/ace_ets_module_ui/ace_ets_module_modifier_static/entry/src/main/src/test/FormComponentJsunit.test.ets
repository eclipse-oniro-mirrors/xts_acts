'use static';
/*
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';
import bundle from '@ohos.bundle.bundleManager';

export default function formComponentJsunitJsunit() {
  describe('formComponentTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });
    
    beforeEach(async () => {
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
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push formComponentJsunit page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   test_formComponentJsunitStatic001
     * @tc.name     test_formComponentJsunitStatic001
     * @tc.desc     test_formComponentJsunitStatic001
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunitStatic001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunitStatic001] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunitStatic001] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('allowUpdate')).assertEqual(undefined);
      done();
    });

    
    
    /**
     * @tc.number   test_formComponentJsunitStatic002
     * @tc.name     test_formComponentJsunitStatic002
     * @tc.desc     test_formComponentJsunitStatic002
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunitStatic002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunitStatic002] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunitStatic002] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('dimension')).assertEqual(undefined);
      console.info('[test_formComponentJsunitStatic002] END');
      done();
    });

    
    
    /**
     * @tc.number   test_formComponentJsunitStatic003
     * @tc.name     test_formComponentJsunitStatic003
     * @tc.desc     test_formComponentJsunitStatic003
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunitStatic003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunitStatic003] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunitStatic003] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('moduleName')).assertEqual(undefined);
      console.info('[test_formComponentJsunitStatic003] END');
      done();
    });

    
    
    /**
     * @tc.number   test_formComponentJsunitStatic004
     * @tc.name     test_formComponentJsunitStatic004
     * @tc.desc     test_formComponentJsunitStatic004
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunitStatic004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunitStatic004] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunitStatic004] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('size')?.getString('width')).assertEqual("200.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('size')?.getString('height')).assertEqual("300.00vp");
      console.info('[test_formComponentJsunitStatic004] END');
      done();
    });

    
    
    /**
     * @tc.number   test_formComponentJsunitStatic005
     * @tc.name     test_formComponentJsunitStatic005
     * @tc.desc     test_formComponentJsunitStatic005
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunitStatic005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_formComponentJsunitStatic005] START');
      let strJson = inspector.getInspectorByKey('FormComponentKey1');

      console.info("[test_formComponentJsunitStatic005] JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('FormComponentKey2');
      console.info("[test_formComponentJsunitStatic005] JSON.parseJsonElement(strJson)1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)
        .getElement('$attrs')));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('visibility'));
      console.info('[test_formComponentJsunitStatic005] END');
      done();
    });

    
    
    /**
     * @tc.number   test_formComponentJsunitStatic006
     * @tc.name     test_formComponentJsunitStatic006
     * @tc.desc     test_formComponentJsunitStatic006
     * @tc.level    Level.LEVEL0
     */
it('test_formComponentJsunitStatic006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('test_formComponentJsunitStatic006 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('FormComponentKey1');
      console.info("test_formComponentJsunitStatic006 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('size')?.getString('width')).assertEqual("100.00vp");
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('size')?.getString('height')).assertEqual("200.00vp");
      console.info('test_formComponentJsunitStatic006 END ');
      done();
    });

  })
}
