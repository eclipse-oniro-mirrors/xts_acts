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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils'
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function listItemGroupJsunit() {
  describe('listItemGroupJsunit', () => {
    beforeAll(async (): Promise<void> => {
      console.info("listItemGroupJsunit beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

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
          routerInstance.pushUrl(options);;
          await Utils.sleep(5000);
        }
      } catch (err) {
        console.error("push list_item_group page error: " + err);
      }
    });

   
    
    
/**
     * @tc.number   testList_item_group0007_static_01
     * @tc.name     testList_item_group0007_static_01
     * @tc.desc     testList_item_group0007_static_01
     * @tc.level    Level.LEVEL0
     */
it('testList_item_group0007_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testList_item_group0007_static_01 START');
      let strJson = inspector.getInspectorByKey('ListItemGroupKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testList_item_group0007_static_01] obj value :" + JSON.stringify(obj.getElement('$attrs')));
      let divider = obj.getElement('$attrs').getElement('divider');
      console.info("[testList_item_group0007_static_01] obj divider value :" + JSON.stringify(divider));
      expect(divider.getString('strokeWidth')).assertEqual("12.00vp");
      expect(divider.getString('startMargin')).assertEqual("2.00vp");
      expect(divider.getString('endMargin')).assertEqual("2.00vp");
      expect(divider.getString('color')).assertEqual("#FF123456");
      console.info('testList_item_group0007_static_01 END');
      done();
    });
  })
}
