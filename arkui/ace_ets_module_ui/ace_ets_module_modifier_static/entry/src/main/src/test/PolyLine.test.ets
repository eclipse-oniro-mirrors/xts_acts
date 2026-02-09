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

export default function polyLineJsunit() {
  describe('polyLineTest', () => {
     beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polyLine',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get polyLine state success " + JSON.stringify(pages));
        if (!("polyLine" == pages.name)) {
          console.info("get polyLine state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push polyLine page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testpolyLineStaticStatic
     * @tc.name     testpolyLineStaticStatic
     * @tc.desc     testpolyLineStaticStatic
     * @tc.level    Level.LEVEL0
     */
it('testpolyLineStaticStatic', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testpolyLineStaticStatic] START');
      let strJson = inspector.getInspectorByKey('polyLine');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testpolyLineStaticStatic] obj is : " + JSON.stringify(obj.getElement('$attrs')));

      //原生数据
      let strJson1 = inspector.getInspectorByKey('polyLine1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[testpolyLineStaticStatic] obj is : " + JSON.stringify(obj1.getElement('$attrs')));

      //与原生做对比
      expect(obj.getElement('$attrs').getBoolean('points')).assertEqual(obj1.getElement('$attrs').getBoolean('points'));

      console.info('[testpolyLineStaticStatic] END');
      done();
    });

    
    
    /**
     * @tc.number   testpolyLineStatic_001
     * @tc.name     testpolyLineStatic_001
     * @tc.desc     testpolyLineStatic_001
     * @tc.level    Level.LEVEL0
     */
it('testpolyLineStatic_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testpolyLineStatic_001 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('polyLine'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);

      let strJsonNew2 = inspector.getInspectorByKey('polyLine2'); //测试组件的key名称
      let objNew2 = JSON.parseJsonElement(strJsonNew2);

      console.info("testpolyLineStatic_001 objNew component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      console.info("testpolyLineStatic_001 objNew2 component  is: " + JSON.stringify(objNew2.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getBoolean('points')).assertEqual(objNew2.getElement('$attrs').getBoolean('points')); //
      console.info('testpolyLineStatic_001 END');
      done();
    });
  })
}
