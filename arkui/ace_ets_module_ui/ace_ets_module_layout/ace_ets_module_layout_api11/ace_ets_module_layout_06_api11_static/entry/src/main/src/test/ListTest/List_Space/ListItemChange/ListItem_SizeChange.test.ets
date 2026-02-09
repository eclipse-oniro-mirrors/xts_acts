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


export default function listItem_SizeChange() {

  describe('ListItem_SizeChangeTest', () => {
    beforeAll(() => {
      console.log("ListItem_SizeChangeTest beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_SizeChange beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_SizeChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get ListItem_SizeChange state pages:" + JSON.stringify(pages));
        if (!("ListItem_SizeChange" == pages.name)) {
          console.info("get ListItem_SizeChange state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push ListItem_SizeChange page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListItem_SizeChange afterEach called");
    });

    
    
    



/**
     * @tc.number   testListItemSizeChangeHeight120Width300_static
     * @tc.name     testListItemSizeChangeHeight120Width300_static
     * @tc.desc     testListItemSizeChangeHeight120Width300_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight120Width300_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight120Width300 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 120
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 300
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
      (Math.round((AppStorage.get<number>('winTop')) as number+(bottom-top)/2 + top)).toInt(),
      (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight120Width300 END');
      done();
    });

    
    
    



/**
     * @tc.number   testListItemSizeChangeHeight160Width300_static
     * @tc.name     testListItemSizeChangeHeight160Width300_static
     * @tc.desc     testListItemSizeChangeHeight160Width300_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight160Width300_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight160Width300 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 160
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 300
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
  console.log('locationText4.top = ' + locationText4.top + ', locationText3.bottom = ' + locationText3.bottom)
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
  console.log('locationList.bottom = ' + locationList.bottom + ', locationText4.bottom = ' + locationText4.bottom)
  console.log('Math.round(locationList.bottom - locationText4.bottom) = ' + Math.round(locationText4.bottom - locationList.bottom))
  console.log('Math.round(UIContext.resolveUIContext()!.vp2px(20)) = ' + Math.round(UIContext.resolveUIContext()!.vp2px(20)))
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
  console.log('locationText4Again.bottom =')

    await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number+(bottom-top)/2 + top)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      console.log('locationText4Again.bottom = ' + locationText4Again.bottom + ', locationList.bottom = ' + locationList.bottom)
      expect(Math.floor(Math.abs(locationText4Again.bottom - locationList.bottom)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight160Width300 END');
      done();
    });


    
    



/**
     * @tc.number   testListItemSizeChangeHeight100Width100_static
     * @tc.name     testListItemSizeChangeHeight100Width100_static
     * @tc.desc     testListItemSizeChangeHeight100Width100_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight100Width100_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight100Width100 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 100
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 100
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;

      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
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
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number+(bottom-top)/2 + top)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
    await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight100Width100 END');
      done();
    });







/**
     * @tc.number   testListItemSizeChangeHeight100Width380_static
     * @tc.name     testListItemSizeChangeHeight100Width380_static
     * @tc.desc     testListItemSizeChangeHeight100Width380_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight100Width380_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight100Width380 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 100
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 380
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(380))) <= 1).assertTrue();
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
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number+(bottom-top)/2 + top)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight100Width380 END');
      done();
    });







/**
     * @tc.number   testListItemSizeChangeHeight160Width380_static
     * @tc.name     testListItemSizeChangeHeight160Width380_static
     * @tc.desc     testListItemSizeChangeHeight160Width380_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight160Width380_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight160Width380 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 160
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 380
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      let left:number = locationList.left;
      let top:number = locationList.top;
      let right:number = locationList.right;
      let bottom:number = locationList.bottom;
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(380))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number+(bottom-top)/2 + top)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4Again.bottom - locationList.bottom)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight160Width380 END');
      done();
    });
  })
}