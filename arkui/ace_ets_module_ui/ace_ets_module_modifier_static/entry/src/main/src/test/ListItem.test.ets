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

export default function listItemJsunit() {
  describe('listItemTest', () => {
     beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("listItemTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/listItem',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get list_item state success " + JSON.stringify(pages));
        if (!("listItem" == pages.name)) {
          console.info("get list_item state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testList_itemStatic00051
     * @tc.name     testList_itemStatic00051
     * @tc.desc     testList_itemStatic00051
     * @tc.level    Level.LEVEL0
     */
it('testList_itemStatic00051', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('select testList_itemStatic00051 START');
      let driver = Driver.create();
      let item = await (driver.findComponent(ON.id('ListItemKey1')) as Promise<Component>);
      let re = await item.isSelected();
      expect(re).assertEqual(true);
      console.info('select testList_itemStatic00051 END');
      done();
    });

    
    
    /**
     * @tc.number   testList_itemStatic00052
     * @tc.name     testList_itemStatic00052
     * @tc.desc     testList_itemStatic00052
     * @tc.level    Level.LEVEL0
     */
it('testList_itemStatic00052', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('select testList_itemStatic00052 START');
      let strJson = inspector.getInspectorByKey('ListItemKey1');
      console.info("[testList_itemStatic00052] obj " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('selectable')).assertEqual(true);
      console.info('select testList_itemStatic00052 END');
      done();
    });

    
    
    /**
     * @tc.number   testList_itemStatic00053
     * @tc.name     testList_itemStatic00053
     * @tc.desc     testList_itemStatic00053
     * @tc.level    Level.LEVEL0
     */
it('testList_itemStatic00053', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testList_itemStatic00053 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('ListItemKey1'); //测试组件的key名称
      console.info("testList_itemStatic00053 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getBoolean('selectable')).assertEqual(false);
      console.info('testList_itemStatic00053 END');
      done();
    });
  })
}
