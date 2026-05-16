'use static';
/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import { Driver, ON } from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function List_scrollToIndex1() {
  describe('List_scrollToIndex1', () => {
    beforeAll(() => {
      console.info("List_scrollToIndex1 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_scrollToIndex1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/List_scrollToIndex/List_scrollToIndex1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get List_scrollToIndex1 state pages:" + JSON.stringify(pages));
        if (!("List_scrollToIndex1" == pages.name)) {
          console.info("get List_scrollToIndex1 pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List_scrollToIndex1 page error:" + err);
      }
      console.info("List_scrollToIndex1 beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      routerInstance.back()
      console.info("List_scrollToIndex1 after each called");
    });

    
    
    



/**
     * @tc.number   List_scrollToIndex1_static_0100
     * @tc.name     List_scrollToIndex1_static_0100
     * @tc.desc     List_scrollToIndex1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('List_scrollToIndex1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[List_scrollToIndex1_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('List_scrollToIndex1_to5'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      let List: RectValue = CommonFunc.getComponentRect('List_scrollToIndex1_List');
      let ListItem: RectValue = CommonFunc.getComponentRect('List_scrollToIndex1_ListItem5');
  console.info('[List_scrollToIndex1_0100] ListItem.top = ' + ListItem.top + ", List.top = " + List.top);
      expect(Math.abs(ListItem.top - List.top) <= 1).assertTrue();
  console.info('[List_scrollToIndex1_0100] ListItem.bottom = ' + ListItem.bottom + ", List.top = " + List.top);
      expect(Math.abs(Math.round(ListItem.bottom) - Math.round(List.top + UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('[List_scrollToIndex1_0100] END');
      done();
    });

  })
}