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

export default function menuItemJsunit() {
  describe('menuItemTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
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
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push menuItem page error: " + err);
      }
    })


    
    
    /**
     * @tc.number   menuItemJsunitStatic01
     * @tc.name     menuItemJsunitStatic01
     * @tc.desc     menuItemJsunitStatic01
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunitStatic01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunitStatic01] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunitStatic01] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('contentFont').getString('size')).assertEqual("10.00fp");
      console.info('[menuItemJsunitStatic01] END');
      done();
    });

    
    
    /**
     * @tc.number   menuItemJsunitStatic02
     * @tc.name     menuItemJsunitStatic02
     * @tc.desc     menuItemJsunitStatic02
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunitStatic02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunitStatic02] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunitStatic02] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentFontColor')).assertEqual("#FF0000FF");
      console.info('[menuItemJsunitStatic02] END');
      done();
    });

    
    
    /**
     * @tc.number   menuItemJsunitStatic03
     * @tc.name     menuItemJsunitStatic03
     * @tc.desc     menuItemJsunitStatic03
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunitStatic03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunitStatic03] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunitStatic03] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('labelFont')?.getString('size')).assertEqual("15.00fp");
      console.info('[menuItemJsunitStatic03] END');
      done();
    });

    
    
    /**
     * @tc.number   menuItemJsunitStatic04
     * @tc.name     menuItemJsunitStatic04
     * @tc.desc     menuItemJsunitStatic04
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunitStatic04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunitStatic04] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunitStatic04] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('labelFontColor')).assertEqual("#FFFF0000");
      console.info('[menuItemJsunitStatic04] END');
      done();
    });

    
    
    /**
     * @tc.number   menuItemJsunitStatic05
     * @tc.name     menuItemJsunitStatic05
     * @tc.desc     menuItemJsunitStatic05
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunitStatic05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunitStatic05] START');
      let driver = Driver.create();
      let menuItem = await (driver.findComponent(ON.id('menuItem_options1')) as Promise<Component>);
      let re = await menuItem.isSelected();
      expect(re).assertEqual(true);
      console.info('[menuItemJsunitStatic05] END');
      done();
    });

    
    
    /**
     * @tc.number   menuItemJsunitStatic06
     * @tc.name     menuItemJsunitStatic06
     * @tc.desc     menuItemJsunitStatic06
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunitStatic06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[menuItemJsunitStatic06] START');
      let strJson = inspector.getInspectorByKey('menuItem_options1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemJsunitStatic06] obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('selectIcon')).assertEqual("true");
      console.info('[menuItemJsunitStatic06] END');
      done();
    });

    
    
    /**
     * @tc.number   menuItemJsunitStatic07
     * @tc.name     menuItemJsunitStatic07
     * @tc.desc     menuItemJsunitStatic07
     * @tc.level    Level.LEVEL0
     */
it('menuItemJsunitStatic07', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('menuItemJsunitStatic07 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('menuItem_options1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("menuItemJsunitStatic07 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('labelFontColor')).assertEqual("#FFFFA500");
      console.info('menuItemJsunitStatic07 END');
      done();
    });

  })
}
