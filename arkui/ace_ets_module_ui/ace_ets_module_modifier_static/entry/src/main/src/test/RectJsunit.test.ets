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

export default function rectJsunit() {
  describe('rectTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rect',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get rect state success " + JSON.stringify(pages));
        if (!("rect" == pages.name)) {
          console.info("get rect state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push rect page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testrect_static_radiusHeight
     * @tc.name     testrect_static_radiusHeight
     * @tc.desc     testrect_static_radiusHeight
     * @tc.level    Level.LEVEL0
     */
it('testrect_static_radiusHeight', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testrect_static_radiusHeight] START');
      let strJson = inspector.getInspectorByKey('Rect1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testrect_static_radiusHeight] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('Rect11');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testrect_static_radiusHeight] obj1 is : " + JSON.stringify(obj1.getElement('$attrs')));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj.getElement('$attrs').getDouble('radiusHeight')).assertEqual(obj1.getElement('$attrs').getDouble('radiusHeight'));
      console.info('[testrect_static_radiusHeight] END');
      done();
    });

    
    
    /**
     * @tc.number   testrect_static_radius
     * @tc.name     testrect_static_radius
     * @tc.desc     testrect_static_radius
     * @tc.level    Level.LEVEL0
     */
it('testrect_static_radius', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testrect_static_radius] START');
      let strJson = inspector.getInspectorByKey('Rect2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testrect_static_radius] obj2 is : " + JSON.stringify(obj.getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('Rect22');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testrect_static_radius] obj22 is : " + JSON.stringify(obj1.getElement('$attrs')));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('radius'))).assertEqual(JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('radius')));
      console.info('[testrect_static_radius] END');
      done();
    });

    
    
    /**
     * @tc.number   testrect_static_radiusWidth
     * @tc.name     testrect_static_radiusWidth
     * @tc.desc     testrect_static_radiusWidth
     * @tc.level    Level.LEVEL0
     */
it('testrect_static_radiusWidth', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testrect_static_radiusWidth] START');
      let strJson = inspector.getInspectorByKey('Rect3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testrect_static_radiusWidth] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      let strJson1 = inspector.getInspectorByKey('Rect33');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testrect_static_radiusWidth] obj1 is : " + JSON.stringify(obj1.getElement('$attrs')));
      //json返回值与设置值不统一，所以使用与原生返回做对比验证
      expect(obj.getElement('$attrs').getDouble('radiusWidth')).assertEqual(obj1.getElement('$attrs').getDouble('radiusWidth'));
      console.info('[testrect_static_radiusWidth] END');
      done();
    });

    
    
    /**
     * @tc.number   testrect_static_001
     * @tc.name     testrect_static_001
     * @tc.desc     testrect_static_001
     * @tc.level    Level.LEVEL0
     */
it('testrect_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testrect_static_001 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew1 = inspector.getInspectorByKey('Rect1');
      let objNew1 = JSON.parseJsonElement(strJsonNew1);
      let strJsonNew3 = inspector.getInspectorByKey('Rect44');
      let objNew3 = JSON.parseJsonElement(strJsonNew3);
      console.info("testrect_static_001 component objNew1  is: " + JSON.stringify(objNew1.getElement('$attrs')));
      console.info("testrect_static_001 component objNew3  is: " + JSON.stringify(objNew3.getElement('$attrs')));
      expect(objNew1.getElement('$attrs').getDouble('radiusHeight')).assertEqual(objNew3.getElement('$attrs').getDouble('radiusHeight'));
      console.info('testrect_static_001 END');
      done();
    });
  })
}
