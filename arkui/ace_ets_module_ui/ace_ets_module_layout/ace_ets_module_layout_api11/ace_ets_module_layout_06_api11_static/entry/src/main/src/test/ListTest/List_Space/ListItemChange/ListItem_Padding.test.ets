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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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
import { UtilsTest } from '../../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function listItem_Padding() {

  describe('ListItem_PaddingTest', () => {
    beforeAll(() => {
      console.log("ListItem_PaddingTest beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_Padding beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_Padding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get ListItem_Padding state pages:" + JSON.stringify(pages));
        if (!("ListItem_Padding" == pages.name)) {
          console.info("get ListItem_Padding state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push ListItem_Padding page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListItem_Padding afterEach called");
    });

    
    
    



/**
     * @tc.number   testListItemPadding_static
     * @tc.name     testListItemPadding_static
     * @tc.desc     testListItemPadding_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemPadding_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemPadding START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemPadding1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest21');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest22');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest23');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest24');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemPadding1');
      let TextTest1: RectValue = CommonFunc.getComponentRect('PaddingText1');
      let TextTest2: RectValue = CommonFunc.getComponentRect('PaddingText2');
      let TextTest3: RectValue = CommonFunc.getComponentRect('PaddingText3');
      let TextTest4: RectValue = CommonFunc.getComponentRect('PaddingText4');
      expect(Math.abs(locationText1.left - locationText2.left) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText3.left) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText4.left) <= 1).assertTrue();
      expect(Math.abs(locationText4.left - locationList.left) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationList.top) <= 1).assertTrue();

      expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();

      expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      expect(Math.abs(Math.round(TextTest1.left - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(TextTest1.top - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.right - TextTest1.right)- Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.bottom - TextTest1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest24');
      expect(Math.abs(locationText4.top - locationText4Again.top) <= 1).assertTrue();
      console.info('new testListItemPadding END');
      done();
    });
  })
}