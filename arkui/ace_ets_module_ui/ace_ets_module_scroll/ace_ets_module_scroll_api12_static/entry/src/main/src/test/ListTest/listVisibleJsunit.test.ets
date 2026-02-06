'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listVisibleJsunit() {
  describe('listVisibleJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("listVisibleJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listVisible',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listVisibleJsunit state pages: " + JSON.stringify(pages));
        if (!("listVisible" == pages.name)) {
          console.info("get listVisibleJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
        }
      } catch (err) {
        console.error("push listVisibleJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" listVisibleJsunit after each called");
    });


    
    /**
     * @tc.number   listVisibleJsunit_static_0100
     * @tc.name     listVisibleJsunit_static_0100
     * @tc.desc     listVisibleJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('listVisibleJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('listVisibleJsunit_static_0100 START');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('listVisible_mess');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listVisibleJsunit_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content'))
        .assertEqual('ListItemGroupArea.IN_HEADER_AREA'); //IN_HEADER_AREA
      console.info("[listVisibleJsunit_static_0100] IN_HEADER_AREA success");

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('listVisible_1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('listVisible_mess');
      let strJson2 = inspector.getInspectorByKey('itemVisible_mess');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[listVisibleJsunit_static_0100] component obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[listVisibleJsunit_static_0100] component obj2 is: " + JSON.stringifyJsonElement(obj2));
      expect(obj1.getElement('$attrs').getString('content'))
        .assertEqual('ListItemGroupArea.IN_LIST_ITEM_AREA'); //IN_LIST_ITEM_AREA
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('itemIndexInGroup: 0');
      console.info("[listVisibleJsunit_static_0100] IN_LIST_ITEM_AREA success");


      let button2 = await driver.findComponent(ON.id('listVisible_2')) as Component;
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('listVisible_mess');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[listVisibleJsunit_static_0100] component obj3 is: " + JSON.stringifyJsonElement(obj3));
      expect(obj3.getElement('$attrs').getString('content'))
        .assertEqual('ListItemGroupArea.IN_FOOTER_AREA'); //IN_FOOTER_AREA
      console.info("[listVisibleJsunit_static_0100] IN_FOOTER_AREA success");

      console.info('[listVisibleJsunit_static_0100] END');
      done();
    });

  })
}

