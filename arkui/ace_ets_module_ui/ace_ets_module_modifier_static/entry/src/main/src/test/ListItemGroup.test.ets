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

export default function listItemGroupJsunit() {
  describe('listItemGroupTest', () => {
     beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");


      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/listItemGroup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get list_item_group state success " + JSON.stringify(pages));
        if (!("listItemGroup" == pages.name)) {
          console.info("get list_item_group state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(5000);
        }
      } catch (err) {
        console.error("push list_item_group page error: " + err);
      }
    });

    
    
    /**
     * @tc.number   testList_item_group_static_0007
     * @tc.name     testList_item_group_static_0007
     * @tc.desc     testList_item_group_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testList_item_group_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testList_item_group_static_0007 START');
      let strJson = inspector.getInspectorByKey('ListItemGroupKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testList_item_group_static_0007] obj value :" + JSON.stringify(obj.getElement('$attrs')));
      let divider = obj.getElement('$attrs').getElement('divider');
      console.info("[testList_item_group_static_0007] obj divider value :" + JSON.stringify(divider));
      expect(divider.getString('strokeWidth')).assertEqual("12.00vp");
      expect(divider.getString('startMargin')).assertEqual("2.00vp");
      expect(divider.getString('endMargin')).assertEqual("2.00vp");
      expect(divider.getString('color')).assertEqual("#FF123456");
      console.info('testList_item_group_static_0007 END');
      done();
    });

    
    
    /**
     * @tc.number   testList_item_group_static_0008
     * @tc.name     testList_item_group_static_0008
     * @tc.desc     testList_item_group_static_0008
     * @tc.level    Level.LEVEL0
     */
it('testList_item_group_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testList_item_group_static_0008 START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)

      let strJsonNew = inspector.getInspectorByKey('ListItemGroupKey1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testList_item_group_static_0008 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getElement('divider').getString('strokeWidth')).assertEqual("13.00vp");
      console.info('testList_item_group_static_0008 END');
      done();
    });
  })
}
