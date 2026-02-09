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
import { ListItemAlign } from '@ohos.arkui.component'
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

export default function List_alignListItem() {

  describe('List_alignListItem', () => {
    beforeAll(() => {
      console.log("List_alignListItem beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_alignListItem beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_alignListItem',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get List_alignListItem state pages:" + JSON.stringify(pages));
        if (!("List_alignListItem" == pages.name)) {
          console.info("get List_alignListItem state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push List_alignListItem page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_alignListItem beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_alignListItem after each called");
    });

    
    
    



/**
     * @tc.number   testListAlignListItemStart_static
     * @tc.name     testListAlignListItemStart_static
     * @tc.desc     testListAlignListItemStart_static
     * @tc.level    Level.LEVEL0
     */
it('testListAlignListItemStart_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListAlignListItemStart START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List_alignListItem_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_alignListItem_011: RectValue = CommonFunc.getComponentRect('List_alignListItem_011');
      let List_alignListItem_012: RectValue = CommonFunc.getComponentRect('List_alignListItem_012');
      let List_alignListItem_013: RectValue = CommonFunc.getComponentRect('List_alignListItem_013');
      let List_alignListItem_014: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      let List_alignListItem_01: RectValue = CommonFunc.getComponentRect('List_alignListItem_01');
      expect(Math.abs(List_alignListItem_011.left - List_alignListItem_01.left) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_012.left - List_alignListItem_01.left) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_013.left - List_alignListItem_01.left) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_014.left - List_alignListItem_01.left) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_011.top - List_alignListItem_01.top) <= 1).assertTrue();

      console.info('testListAlignListItemStart_1: ');
	  expect(Math.abs(Math.round(List_alignListItem_012.top - List_alignListItem_011.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.top - List_alignListItem_012.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.top - List_alignListItem_013.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_01.bottom - List_alignListItem_014.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();

      console.info('testListAlignListItemStart_2: ');
	  expect(Math.abs(Math.round(List_alignListItem_011.right - List_alignListItem_011.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_012.right - List_alignListItem_012.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.right - List_alignListItem_013.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.right - List_alignListItem_014.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();

      console.info('testListAlignListItemStart_3: ');
	  expect(Math.abs(Math.round(List_alignListItem_011.bottom - List_alignListItem_011.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_012.bottom - List_alignListItem_012.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.bottom - List_alignListItem_013.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.bottom - List_alignListItem_014.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        (Math.round(List_alignListItem_013.left + ((List_alignListItem_013.right - List_alignListItem_013.left) / 2))).toInt(),
        (Math.round(List_alignListItem_013.bottom)).toInt(),
        (Math.round(List_alignListItem_012.left + ((List_alignListItem_012.right - List_alignListItem_012.left) / 2))).toInt(),
        (Math.round(List_alignListItem_012.bottom)).toInt());
      await CommonFunc.sleep(1000);
      let List_alignListItem_024: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
	  expect(Math.abs(Math.round(List_alignListItem_01.bottom - List_alignListItem_024.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();

      console.info('testListAlignListItemStart END');
      done();
    });

    
    
    



/**
     * @tc.number   testListAlignListItemCenter_static
     * @tc.name     testListAlignListItemCenter_static
     * @tc.desc     testListAlignListItemCenter_static
     * @tc.level    Level.LEVEL0
     */
it('testListAlignListItemCenter_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListAlignListItemCenter START');
      AppStorage.get<MessageManager<ListItemAlign>>('messageManager')?.notify({
        name: 'addAlignListItem', value: ListItemAlign.Center
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List_alignListItem_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_alignListItem_011: RectValue = CommonFunc.getComponentRect('List_alignListItem_011');
      let List_alignListItem_012: RectValue = CommonFunc.getComponentRect('List_alignListItem_012');
      let List_alignListItem_013: RectValue = CommonFunc.getComponentRect('List_alignListItem_013');
      let List_alignListItem_014: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      let List_alignListItem_01: RectValue = CommonFunc.getComponentRect('List_alignListItem_01');
      expect(Math.abs(Math.round(List_alignListItem_011.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_alignListItem_012.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_alignListItem_013.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_alignListItem_014.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_014.right)) <= 1)
        .assertTrue();
      expect(Math.abs(List_alignListItem_011.top - List_alignListItem_01.top) <= 1).assertTrue();

      console.info('testListAlignListItemCenter_1: ');
	  expect(Math.abs(Math.round(List_alignListItem_012.top - List_alignListItem_011.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.top - List_alignListItem_012.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.top - List_alignListItem_013.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_01.bottom - List_alignListItem_014.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();

      console.info('testListAlignListItemCenter_2: ');
	  expect(Math.abs(Math.round(List_alignListItem_011.right - List_alignListItem_011.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_012.right - List_alignListItem_012.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.right - List_alignListItem_013.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.right - List_alignListItem_014.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();

      console.info('testListAlignListItemCenter_3: ');
	  expect(Math.abs(Math.round(List_alignListItem_011.bottom - List_alignListItem_011.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_012.bottom - List_alignListItem_012.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.bottom - List_alignListItem_013.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.bottom - List_alignListItem_014.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        (Math.round(List_alignListItem_013.left + ((List_alignListItem_013.right - List_alignListItem_013.left) / 2))).toInt(),
        (Math.round(List_alignListItem_013.bottom)).toInt(),
        (Math.round(List_alignListItem_012.left + ((List_alignListItem_012.right - List_alignListItem_012.left) / 2))).toInt(),
        (Math.round(List_alignListItem_012.bottom)).toInt());
      await CommonFunc.sleep(1000);
      let List_alignListItem_024: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
	  expect(Math.abs(Math.round(List_alignListItem_01.bottom - List_alignListItem_024.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();

      console.info('testListAlignListItemCenter END');
      done();
    });
    
    
    



/**
     * @tc.number   testListAlignListItemEnd_static
     * @tc.name     testListAlignListItemEnd_static
     * @tc.desc     testListAlignListItemEnd_static
     * @tc.level    Level.LEVEL0
     */
it('testListAlignListItemEnd_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListAlignListItemEnd START');
      AppStorage.get<MessageManager<ListItemAlign>>('messageManager')?.notify({
        name: 'addAlignListItem', value: ListItemAlign.End
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List_alignListItem_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_alignListItem_011: RectValue = CommonFunc.getComponentRect('List_alignListItem_011');
      let List_alignListItem_012: RectValue = CommonFunc.getComponentRect('List_alignListItem_012');
      let List_alignListItem_013: RectValue = CommonFunc.getComponentRect('List_alignListItem_013');
      let List_alignListItem_014: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      let List_alignListItem_01: RectValue = CommonFunc.getComponentRect('List_alignListItem_01');
      expect(Math.abs(List_alignListItem_011.right - List_alignListItem_01.right) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_012.right - List_alignListItem_01.right) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_013.right - List_alignListItem_01.right) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_014.right - List_alignListItem_01.right) <= 1).assertTrue();
      expect(Math.abs(List_alignListItem_011.top - List_alignListItem_01.top) <= 1).assertTrue();

      console.info('testListAlignListItemEnd_1: ');
	  expect(Math.abs(Math.round(List_alignListItem_012.top - List_alignListItem_011.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.top - List_alignListItem_012.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.top - List_alignListItem_013.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_01.bottom - List_alignListItem_014.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();

      console.info('testListAlignListItemEnd_2: ');
	  expect(Math.abs(Math.round(List_alignListItem_011.right - List_alignListItem_011.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_012.right - List_alignListItem_012.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.right - List_alignListItem_013.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.right - List_alignListItem_014.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();

      console.info('testListAlignListItemEnd_3: ');
	  expect(Math.abs(Math.round(List_alignListItem_011.bottom - List_alignListItem_011.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_012.bottom - List_alignListItem_012.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_013.bottom - List_alignListItem_013.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_alignListItem_014.bottom - List_alignListItem_014.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        (Math.round(List_alignListItem_013.left + ((List_alignListItem_013.right - List_alignListItem_013.left) / 2))).toInt(),
        (Math.round(List_alignListItem_013.bottom)).toInt(),
        (Math.round(List_alignListItem_012.left + ((List_alignListItem_012.right - List_alignListItem_012.left) / 2))).toInt(),
        (Math.round(List_alignListItem_012.bottom)).toInt());
      await CommonFunc.sleep(1000);
      let List_alignListItem_024: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
	  expect(Math.abs(Math.round(List_alignListItem_01.bottom - List_alignListItem_024.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();
      console.info('testListAlignListItemEnd END');
      done();
    });
  })
}