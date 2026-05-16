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

export default function gridItemJsunit() {
  describe('gridItemTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("gridItem beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridItem',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gridItem state success " + JSON.stringify(pages));
        if (!("gridItem" == pages.name)) {
          console.info("get gridItem state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push gridItem page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testGridItem_static_0100
     * @tc.name     testGridItem_static_0100
     * @tc.desc     testGridItem_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0100] START');
      let driver = Driver.create();
      let item = await (driver.findComponent(ON.id('GridItemKey1')) as Promise<Component>);
      let re = await item.isSelected();
      expect(re).assertEqual(true);
      console.info('[testGridItem_static_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   testGridItem_static_0101
     * @tc.name     testGridItem_static_0101
     * @tc.desc     testGridItem_static_0101
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0101] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_static_0101] JSON.parseJsonElement(strJson) selected is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowStart')).assertEqual("1");
      console.info('[testGridItem_static_0101] END');
      done();
    });

    
    
    /**
     * @tc.number   testGridItem_static_0102
     * @tc.name     testGridItem_static_0102
     * @tc.desc     testGridItem_static_0102
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0102] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_static_0102] JSON.parseJsonElement(strJson) selected is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowEnd')).assertEqual("12");
      console.info('[testGridItem_static_0102] END');
      done();
    });

    
    
    /**
     * @tc.number   testGridItem_static_0103
     * @tc.name     testGridItem_static_0103
     * @tc.desc     testGridItem_static_0103
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0103] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_static_0103] JSON.parseJsonElement(strJson) selected is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnStart')).assertEqual("1");
      console.info('[testGridItem_static_0103] END');
      done();
    });

    
    
    /**
     * @tc.number   testGridItem_static_0104
     * @tc.name     testGridItem_static_0104
     * @tc.desc     testGridItem_static_0104
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0104', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0104] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_static_0104] JSON.parseJsonElement(strJson) selected is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnEnd')).assertEqual("12");
      console.info('[testGridItem_static_0104] END');
      done();
    });

    
    
    /**
     * @tc.number   testGridItem_static_0105
     * @tc.name     testGridItem_static_0105
     * @tc.desc     testGridItem_static_0105
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0105', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridItem_static_0105] START');
      let strJson = inspector.getInspectorByKey('GridItemKey1');

      console.info("[testGridItem_static_0105] JSON.parseJsonElement(strJson) selected is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectable')).assertEqual("true");
      console.info('[testGridItem_static_0105] END');
      done();
    });

    
    
    /**
     * @tc.number   testGridItem_static_0106
     * @tc.name     testGridItem_static_0106
     * @tc.desc     testGridItem_static_0106
     * @tc.level    Level.LEVEL0
     */
it('testGridItem_static_0106', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGridItem_static_0106 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('GridItemKey1'); //测试组件的key名称
      console.info("testGridItem_static_0106 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('rowStart')).assertEqual('2'); //
      console.info('testGridItem_static_0106 END');
      done();
    });
  })
}
