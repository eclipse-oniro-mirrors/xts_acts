'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { $r, Color } from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function list_itemOnSelectJsunit() {
  describe('list_itemOnSelectTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/list_item',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get list_item state success " + JSON.stringify(pages));
        if (!("list_item" == pages.name)) {
          console.info("get list_item state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("list_itemOnSelect after each called");
    });

    
    
    
    /**
     * @tc.number   testlist_itemOnSelect_static_0001
     * @tc.name     testlist_itemOnSelect_static_0001
     * @tc.desc     testlist_itemOnSelect_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testlist_itemOnSelect_static_0001', Level.LEVEL0, async () => {
      console.info('selectOnSelect testlist_itemOnSelect0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect0001] component border strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('ListItem');
      // expect(obj.getElement('$attrs').getBoolean('editable')).assertTrue();
      // console.info("[testlist_itemOnSelect0001] editable value :" + obj.getElement('$attrs').getBoolean('editable'));

    });

    
    
    
    /**
     * @tc.number   testlist_itemOnSelect_static_0002
     * @tc.name     testlist_itemOnSelect_static_0002
     * @tc.desc     testlist_itemOnSelect_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testlist_itemOnSelect_static_0002', Level.LEVEL0, async () => {
      console.info('selectOnSelect testlist_itemOnSelect0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect0002] component border strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('ListItem');
      expect(obj.getElement('$attrs').getBoolean('selectable')).assertFalse();
      console.info("[testlist_itemOnSelect0002] selectable value :" +
      obj.getElement('$attrs').getBoolean('selectable'));

    });

    
    
    
    /**
     * @tc.number   testlist_itemOnSelect_static_0003
     * @tc.name     testlist_itemOnSelect_static_0003
     * @tc.desc     testlist_itemOnSelect_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testlist_itemOnSelect_static_0003', Level.LEVEL0, async () => {
      console.info('selectOnSelect testlist_itemOnSelect0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect0003] component border strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('ListItem');
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual("Sticky.None");
      console.info("[testlist_itemOnSelect0003] sticky value :" + obj.getElement('$attrs').getString('sticky'));

    });

    
    
    
    /**
     * @tc.number   testlist_itemSwipeAction_static_0004
     * @tc.name     testlist_itemSwipeAction_static_0004
     * @tc.desc     testlist_itemSwipeAction_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testlist_itemSwipeAction_static_0004', Level.LEVEL0, async () => {
      console.info('selectOnSelect testlist_itemSwipeAction0004 START');
      await Utils.sleep(2000);
      let obj = JSON.stringify(inspector.sendEventByKey('Del', 10, ""))
      expect(obj).assertEqual('true');

    });
  })
}
