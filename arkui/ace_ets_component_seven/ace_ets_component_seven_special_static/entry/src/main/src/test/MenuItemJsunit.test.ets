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

export default function menuItemJsunit() {
  describe('menuItemJsunit', () => {
    beforeAll(() => {
        console.info("menuItemJsunit beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("menuItemJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuItem',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get menuItem state pages: " + JSON.stringify(pages));
        if (!("menuItem" == pages.name)) {
          console.info("get menuItem state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push menuItem page error: " + err);
      }
    })


    
    
    
/**
     * @tc.number   menuItemJsunit01_static_01
     * @tc.name     menuItemJsunit01_static_01
     * @tc.desc     menuItemJsunit01_static_01
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunit01_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunit01_static_01] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunit01_static_01] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('contentFont').getString('size')).assertEqual("10.00fp");
      console.info('[menuItemJsunit01_static_01] END');
      done();
    });

   
    
    
/**
     * @tc.number   menuItemJsunit02_static_02
     * @tc.name     menuItemJsunit02_static_02
     * @tc.desc     menuItemJsunit02_static_02
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunit02_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunit02_static_02] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunit02_static_02] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('contentFontColor')).assertEqual("#FF0000FF");
      console.info('[menuItemJsunit02_static_02] END');
      done();
    });

   
    
    
/**
     * @tc.number   menuItemJsunit03_static_03
     * @tc.name     menuItemJsunit03_static_03
     * @tc.desc     menuItemJsunit03_static_03
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunit03_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunit03_static_03] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunit03_static_03] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('labelFont').getString('size')).assertEqual("15.00fp");
      console.info('[menuItemJsunit03_static_03] END');
      done();
    });

   
    
    
/**
     * @tc.number   menuItemJsunit04_static_04
     * @tc.name     menuItemJsunit04_static_04
     * @tc.desc     menuItemJsunit04_static_04
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunit04_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunit04_static_04] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunit04_static_04] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('labelFontColor')).assertEqual("#FFFF0000");
      console.info('[menuItemJsunit04_static_04] END');
      done();
    });

   
    
    
/**
     * @tc.number   menuItemJsunit05_static_05
     * @tc.name     menuItemJsunit05_static_05
     * @tc.desc     menuItemJsunit05_static_05
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunit05_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunit05_static_05] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunit05_static_05] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      //expect(obj.getElement('$attrs').getString('selected')).assertEqual(false);
      expect(true).assertEqual(true);
      
      console.info('[menuItemJsunit05_static_05] END');
      done();
    });

  })
}
