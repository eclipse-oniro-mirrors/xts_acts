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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function list_itemOnSelectJsunit() {
  describe('list_itemOnSelectTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/list_item',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get list_item state success " + JSON.stringify(pages));
        if (!("list_item" == pages.name)) {
          console.info("get list_item state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push list_item page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list_item page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("list_itemOnSelect after each called");
    });


    
    /**
     * @tc.number   testlist_itemOnSelect_static_0001
     * @tc.name     testlist_itemOnSelect_static_0001
     * @tc.desc     testlist_itemOnSelect_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testlist_itemOnSelect_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectOnSelect testlist_itemOnSelect_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect_static_0001] component border strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('ListItem');
      // 废弃属性
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('editable')).assertTrue();
      console.info("[testlist_itemOnSelect_static_0001] editable value :" + 
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('editable'));
      done()
    });


    
    /**
     * @tc.number   testlist_itemOnSelect_static_0002
     * @tc.name     testlist_itemOnSelect_static_0002
     * @tc.desc     testlist_itemOnSelect_static_0002
     * @tc.level    Level.LEVEL1
     */
it('testlist_itemOnSelect_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectOnSelect testlist_itemOnSelect_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect_static_0002] component border strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('ListItem');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('selectable')).assertFalse();
      console.info("[testlist_itemOnSelect_static_0002] selectable value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectable'));
      done()
    });


    
    /**
     * @tc.number   testlist_itemOnSelect_static_0003
     * @tc.name     testlist_itemOnSelect_static_0003
     * @tc.desc     testlist_itemOnSelect_static_0003
     * @tc.level    Level.LEVEL1
     */
it('testlist_itemOnSelect_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectOnSelect testlist_itemOnSelect_static_0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ListItem');
      console.info("[testlist_itemOnSelect_static_0003] component border strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('ListItem');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sticky')).assertEqual("Sticky.None");
      console.info("[testlist_itemOnSelect_static_0003] sticky value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sticky'));
      done()
    });


    
    /**
     * @tc.number   testlist_itemSwipeAction_static_0004
     * @tc.name     testlist_itemSwipeAction_static_0004
     * @tc.desc     testlist_itemSwipeAction_static_0004
     * @tc.level    Level.LEVEL1
     */
it('testlist_itemSwipeAction_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectOnSelect testlist_itemSwipeAction_static_0004 START');
      await CommonFunc.sleep(2000);
      let obj = JSON.stringify(inspector.sendEventByKey('Del', 10, ""))
      expect(obj).assertEqual('true');
      done()
    });
  })
}
