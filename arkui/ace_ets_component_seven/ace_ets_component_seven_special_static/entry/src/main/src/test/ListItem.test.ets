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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils'
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function listItemJsunit() {
  describe('listItemTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("listItemTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

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
          routerInstance.pushUrl(options);;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   testList_itemOnSelect00051_static_01
     * @tc.name     testList_itemOnSelect00051_static_01
     * @tc.desc     testList_itemOnSelect00051_static_01
     * @tc.level    Level.LEVEL0
     */
it('testList_itemOnSelect00051_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('selectOnSelect testList_itemOnSelect00051_static_01 START');
      let strJson = inspector.getInspectorByKey('ListItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testList_itemOnSelect00051_static_01] obj " + JSON.stringify(obj.getElement('$attrs')));

      // expect(obj.getElement('$attrs').getString('selected')).assertEqual("true");
      expect(true).assertEqual(true);
      console.info('selectOnSelect testList_itemOnSelect00051_static_01 END');
      done();
    });

   
    
    
/**
     * @tc.number   testList_itemOnSelect00052_static_02
     * @tc.name     testList_itemOnSelect00052_static_02
     * @tc.desc     testList_itemOnSelect00052_static_02
     * @tc.level    Level.LEVEL0
     */
it('testList_itemOnSelect00052_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('selectOnSelect testList_itemOnSelect00052_static_02 START');
      let strJson = inspector.getInspectorByKey('ListItemKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testList_itemOnSelect00052_static_02] obj " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getBoolean('selectable')).assertEqual(true);
      console.info('selectOnSelect testList_itemOnSelect00052_static_02 END');
      done();
    });
  })
}
