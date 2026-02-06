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


export default function listItem_InSertChange() {

  describe('ListItem_InSertChangeTest', () => {
    beforeAll(() => {
      console.log("ListItem_InSertChangeTest beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_InSertChange beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_InSertChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get ListItem_InSertChange state pages:" + JSON.stringify(pages));
        if (!("ListItem_InSertChange" == pages.name)) {
          console.info("get ListItem_InSertChange state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push ListItem_InSertChange page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListItem_InSertChange afterEach called");
    });

    
    
    



/**
     * @tc.number   testListItemInSertChangeFiftyPercent_static
     * @tc.name     testListItemInSertChangeFiftyPercent_static
     * @tc.desc     testListItemInSertChangeFiftyPercent_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemInSertChangeFiftyPercent_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemInSertChangeFiftyPercent START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'width', value: '50%'
      })
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'height', value: '50%'
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemInSertChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest71');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest72');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest73');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest74');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemInSertChange1');
      let TextTest1: RectValue = CommonFunc.getComponentRect('InSertChangeText1');
      let TextTest2: RectValue = CommonFunc.getComponentRect('InSertChangeText2');
      let TextTest3: RectValue = CommonFunc.getComponentRect('InSertChangeText3');
      let TextTest4: RectValue = CommonFunc.getComponentRect('InSertChangeText4');
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

      expect(Math.abs(Math.round(TextTest1.left - locationText1.left) - Math.round(locationText1.right - TextTest1.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(TextTest1.top - locationText1.top) - Math.round(locationText1.bottom - TextTest1.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(TextTest1.right - TextTest1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(TextTest1.bottom - TextTest1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest74');
      expect(Math.abs(locationText4.top - locationText4Again.top) <= 1).assertTrue();
      console.info('new testListItemInSertChangeFiftyPercent END');
      done();
    });

    
    
    



/**
     * @tc.number   testListItemInSertChangeOneHundredAndTenPercent_static
     * @tc.name     testListItemInSertChangeOneHundredAndTenPercent_static
     * @tc.desc     testListItemInSertChangeOneHundredAndTenPercent_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemInSertChangeOneHundredAndTenPercent_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemInSertChangeOneHundredAndTenPercent START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'width', value: '110%'
      })
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'height', value: '110%'
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemInSertChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest71');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest72');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest73');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest74');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemInSertChange1');
      let TextTest1: RectValue = CommonFunc.getComponentRect('InSertChangeText1');
      let TextTest2: RectValue = CommonFunc.getComponentRect('InSertChangeText2');
      let TextTest3: RectValue = CommonFunc.getComponentRect('InSertChangeText3');
      let TextTest4: RectValue = CommonFunc.getComponentRect('InSertChangeText4');
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

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
      expect(locationText1.left).assertEqual(TextTest1.left);
      expect(locationText1.top).assertEqual(TextTest1.top);
      expect(Math.abs(Math.round(TextTest1.right - locationText1.right) - Math.round(UIContext.resolveUIContext()!.vp2px(30))) <= 1).assertTrue();
      expect(Math.abs(Math.round(TextTest1.bottom - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(TextTest1.right - TextTest1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(TextTest1.bottom - TextTest1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(110))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest74');
      expect(Math.abs(locationText4.top - locationText4Again.top) <= 1).assertTrue();
      console.info('new testListItemInSertChangeOneHundredAndTenPercent END');
      done();
    });
  })
}