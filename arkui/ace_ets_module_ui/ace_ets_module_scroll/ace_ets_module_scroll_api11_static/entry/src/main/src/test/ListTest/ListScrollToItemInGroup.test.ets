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
import RectValue from '../../../ets/MainAbility/common/Rect';
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

export default function ListScrollToItemInGroup() {
  const SUITE: string = 'ListScrollToItemInGroup'
  const waitUiReadyMs: int = 2000;

  describe('ListScrollToItemInGroup', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListScrollToItemInGroup",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ListScrollToItemInGroup" == pages.name)) {
          router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: Error) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await UtilsTest.msSleep(4000)
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(waitUiReadyMs);
      console.info("ListScrollToItemInGroup after each called");
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0001
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0001
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0001
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_0_0')) as Component;
      await btn.click();
      await CommonFunc.sleep(1500);
      let List: RectValue = CommonFunc.getComponentRect('MyList1');
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group0_Index0');
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_0001] List' + JSON.stringify(List));
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_0001] ListItem' + JSON.stringify(ListItem));
      expect(Math.abs(ListItem.top - List.top) <= 1).assertEqual(true);
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0001] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0100
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0100
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0100] START');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_0_1')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let List: RectValue = CommonFunc.getComponentRect('MyList1');
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group0_Index1');
      expect(Math.abs(ListItem.top - List.top) <= 1).assertEqual(true); // 1 px error is alllowed
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0200
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0200
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0200] START');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_1_2')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let center: RectValue = CommonFunc.getComponentRect('CenterLine');
      console.info("center.top: " + center.top);
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group1_Index2');
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      let middle = (ListItem.top + ListItem.bottom) / 2 - uiContext.vp2px(0.5);
      console.info("ListItem.top: " + ListItem.top + " " + "ListItem.bottom: " + ListItem.bottom);
      expect(Math.abs(center.top - middle) <= 1).assertEqual(true); // 1 px error is alllowed
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0200] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0300
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0300
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0300] START');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_2_2')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let List: RectValue = CommonFunc.getComponentRect('MyList1');
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group2_Index2');
      console.info("ListItem.top: " + ListItem.top + " " + "ListItem.bottom: " + ListItem.bottom);
      expect(Math.abs(List.bottom - ListItem.bottom) <= 1).assertEqual(true); // 1 px error is alllowed
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0300] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0400
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0400
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0400] START');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_3_1')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let List: RectValue = CommonFunc.getComponentRect('MyList1');
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group3_Index1');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertEqual(true); // 1 px error is alllowed
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0400] END');
      done();
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0500
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0500
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0500] START');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_3_11')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let List: RectValue = CommonFunc.getComponentRect('MyList1');
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group3_Index11');
      expect(Math.abs(ListItem.bottom - List.bottom) <= 1).assertEqual(true); // 1 px error is alllowed
      done();
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0600
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0600
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0600] START');
      let OldListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group3_Index11');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_Err_Group')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group3_Index11');
      expect(Math.abs(OldListItem.bottom - ListItem.bottom) <= 1).assertEqual(true); // 1 px error is alllowed
      done();
    });

    
    /**
     * @tc.number   ArkUI_List_Scroll_To_Item_In_Group_static_0700
     * @tc.name     ArkUI_List_Scroll_To_Item_In_Group_static_0700
     * @tc.desc     ArkUI_List_Scroll_To_Item_In_Group_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_List_Scroll_To_Item_In_Group_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_List_Scroll_To_Item_In_Group_static_0700] START');
      let OldListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group3_Index11');
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Btn_Err_Group')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let ListItem: RectValue = CommonFunc.getComponentRect('ListItem_Group3_Index11');
      expect(Math.abs(OldListItem.bottom - ListItem.bottom) <= 1).assertEqual(true); // 1 px error is alllowed
      done();
    });
  })
}
