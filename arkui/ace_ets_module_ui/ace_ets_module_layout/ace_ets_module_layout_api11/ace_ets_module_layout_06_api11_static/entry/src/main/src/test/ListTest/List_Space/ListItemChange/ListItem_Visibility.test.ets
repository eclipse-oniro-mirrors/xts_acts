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

import { Visibility } from '@ohos.arkui.component'
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


export default function listItem_Visibility() {

  describe('ListItem_VisibilityTest', () => {
    beforeAll(() => {
      console.log("ListItem_VisibilityTest beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_Visibility beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_Visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get ListItem_Visibility state pages:" + JSON.stringify(pages));
        if (!("ListItem_Visibility" == pages.name)) {
          console.info("get ListItem_Visibility state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push ListItem_Visibility page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListItem_Visibility afterEach called");
    });

/**
     * @tc.number   testListItemVisibilityFirstNone_static
     * @tc.name     testListItemVisibilityFirstNone_static
     * @tc.desc     testListItemVisibilityFirstNone_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemVisibilityFirstNone_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemVisibilityFirstNone START');
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilityFirst', value: Visibility.None
      })
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilitySecond', value: Visibility.Visible
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemVisibility1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let strJson2 = inspector.getInspectorByKey('ListItemTest41');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemVisibility1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);
      expect(locationText1.left).assertEqual(locationText1.right);
      expect(locationText1.top).assertEqual(locationText1.bottom);

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.top - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(80))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + (bottom-top)/2 + top )).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top )).toInt());
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemVisibilityFirstNone END');
      done();
    });







/**
     * @tc.number   testListItemVisibilitySecondNone_static
     * @tc.name     testListItemVisibilitySecondNone_static
     * @tc.desc     testListItemVisibilitySecondNone_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemVisibilitySecondNone_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemVisibilitySecondNone START');
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilityFirst', value: Visibility.Visible
      })
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilitySecond', value: Visibility.None
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemVisibility1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let strJson2 = inspector.getInspectorByKey('ListItemTest42');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemVisibility1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);
      expect(locationText2.left).assertEqual(locationText2.right);
      expect(locationText2.top).assertEqual(locationText2.bottom);

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.top - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(80))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number) + (bottom-top)/2 + top).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round( (AppStorage.get<number>('winTop')) as number)+ top ).toInt());
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4.top).assertEqual(locationText4Again.top);
      console.info('new testListItemVisibilitySecondNone END');
      done();
    });

    
    
    



/**
     * @tc.number   testListItemVisibilityFirstHidden_static
     * @tc.name     testListItemVisibilityFirstHidden_static
     * @tc.desc     testListItemVisibilityFirstHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemVisibilityFirstHidden_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemVisibilityFirstHidden START');
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilityFirst', value: Visibility.Hidden
      })
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilitySecond', value: Visibility.Visible
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemVisibility1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let strJson2 = inspector.getInspectorByKey('ListItemTest41');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Hidden');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemVisibility1');
      
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + (bottom-top)/2 + top)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      await CommonFunc.sleep(2000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4Again.bottom).assertEqual(locationList.bottom);
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(50))).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + (bottom-top)/2 + top )).toInt());
      await CommonFunc.sleep(2000);
      console.info('new testListItemVisibilityFirstHidden END');
      done();
    });

    
    
    



/**
     * @tc.number   testListItemVisibilityFirstVisibile_static
     * @tc.name     testListItemVisibilityFirstVisibile_static
     * @tc.desc     testListItemVisibilityFirstVisibile_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemVisibilityFirstVisibile_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemVisibilityFirstVisibile START');
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilityFirst', value: Visibility.Visible
      })
      AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
        name: 'testVisibilitySecond', value: Visibility.Visible
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemVisibility1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let strJson2 = inspector.getInspectorByKey('ListItemTest41');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest41');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest42');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest43');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemVisibility1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(locationText1.left).assertEqual(locationText2.left);
      expect(locationText2.left).assertEqual(locationText3.left);
      expect(locationText3.left).assertEqual(locationText4.left);
      expect(locationText4.left).assertEqual(locationList.left);
      expect(locationText1.top).assertEqual(locationList.top);

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + (bottom-top)/2 + top )).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      await CommonFunc.sleep(2000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest44');
      expect(locationText4Again.bottom).assertEqual(locationList.bottom);
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + UIContext.resolveUIContext()!.vp2px(50))).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + (bottom-top)/2 + top )).toInt());
      await CommonFunc.sleep(1000);
      console.info('new testListItemVisibilityFirstVisibile END');
      done();
    });
  })
}