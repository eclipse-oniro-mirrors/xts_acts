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
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function list_SpaceChangeTest() {
  describe('list_SpaceChangeTest', () => {
    beforeAll(() => {
      console.log("list_SpaceChangeTest beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("list_SpaceChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_SpaceChange/List_SpaceChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get List_SpaceChange state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get List_SpaceChange pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List_SpaceChange page error:" + err);
      }
      console.info("list_SpaceChangeTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("list_SpaceChangeTest after each called");
    });
    
    
    



/**
     * @tc.number   testListSpaceChangeUnfill_static
     * @tc.name     testListSpaceChangeUnfill_static
     * @tc.desc     testListSpaceChangeUnfill_static
     * @tc.level    Level.LEVEL0
     */
it('testListSpaceChangeUnfill_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testListSpaceChangeUnfill] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'Space', value: 20
      });
      await CommonFunc.sleep(1000);
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange01');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange02');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange03');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange04');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      let listContainerStrJson = inspector.getInspectorByKey('List_SpaceChange_Container01');
      let listWidth: number = listContainer.right - listContainer.left;
      let listHeight: number = listContainer.bottom - listContainer.top;
      let listItemHeight: number = firstListItem.bottom - firstListItem.top;
      let listItemHeight2: number = secondListItem.bottom - secondListItem.top;

      expect(JSON.parseJsonElement(listContainerStrJson).getString('$type')).assertEqual('List');

      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondListItem.top - firstListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - secondListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - thirdListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(fourthListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      console.info(`[testListSpaceChangeUnfill](listContainer.bottom - fourthListItem.bottom)=
        ${(listContainer.bottom - fourthListItem.bottom)}`);
      console.info(`[testListSpaceChangeUnfill](listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(60))=
        ${(listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(60))}`);
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(60)))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + fourthListItem.left + ((fourthListItem.right - fourthListItem.left) / 2))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + fourthListItem.bottom)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + thirdListItem.bottom)).toInt());
      await CommonFunc.sleep(1000);

      fourthListItem = CommonFunc.getComponentRect('List_SpaceChange04');
      listContainer = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(60)))) <= 1).assertTrue();

      console.info('[testListSpaceChangeUnfill] END');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'Space', value: 0
      });
      await CommonFunc.sleep(2000);
      done();
    });
    
    
    



/**
     * @tc.number   testListSpaceChangeFill_static
     * @tc.name     testListSpaceChangeFill_static
     * @tc.desc     testListSpaceChangeFill_static
     * @tc.level    Level.LEVEL0
     */
it('testListSpaceChangeFill_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testListSpaceChangeFill] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'Space', value: 40
      });
      await CommonFunc.sleep(1000);
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange01');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange02');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange03');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange04');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      let listContainerStrJson = inspector.getInspectorByKey('List_SpaceChange_Container01');
      let listWidth: number = listContainer.right - listContainer.left;
      let listHeight: number = listContainer.bottom - listContainer.top;
      let listItemHeight: number = firstListItem.bottom - firstListItem.top;
      let listItemHeight2: number = secondListItem.bottom - secondListItem.top;

      expect(JSON.parseJsonElement(listContainerStrJson).getString('$type')).assertEqual('List');

      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondListItem.top - firstListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - secondListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - thirdListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      expect(fourthListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      console.info(`[testListSpaceChangeFill](listContainer.bottom - fourthListItem.bottom)=
        ${(listContainer.bottom - fourthListItem.bottom)}`);
      console.info(`[testListSpaceChangeFill](listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(120))=
        ${(listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(120))}`);
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(120)))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + fourthListItem.left + ((fourthListItem.right - fourthListItem.left) / 2))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + fourthListItem.bottom - 10)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + thirdListItem.bottom)).toInt());
      await CommonFunc.sleep(2000);

      fourthListItem = CommonFunc.getComponentRect('List_SpaceChange04');
      listContainer = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      if (fourthListItem.bottom < listContainer.bottom ){
       expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(120)))) <= 1).assertTrue();
      } else {
       expect(listContainer.bottom <= fourthListItem.bottom).assertTrue();
      }

      console.info('[testListSpaceChangeFill] END');
      
      
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'Space', value: 0
      });
      await CommonFunc.sleep(2000);
      done();
    });
    
    
    



/**
     * @tc.number   testListSpaceChangeOverflow_static
     * @tc.name     testListSpaceChangeOverflow_static
     * @tc.desc     testListSpaceChangeOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testListSpaceChangeOverflow_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testListSpaceChangeOverflow] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'Space', value: 60
      });
      await CommonFunc.sleep(1000);
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange01');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange02');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange03');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_SpaceChange04');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      let listContainerStrJson = inspector.getInspectorByKey('List_SpaceChange_Container01');
      let listWidth: number = listContainer.right - listContainer.left;
      let listHeight: number = listContainer.bottom - listContainer.top;
      let listItemHeight: number = firstListItem.bottom - firstListItem.top;
      let listItemHeight2: number = secondListItem.bottom - secondListItem.top;

      expect(JSON.parseJsonElement(listContainerStrJson).getString('$type')).assertEqual('List');

      expect(firstListItem.top).assertEqual(listContainer.top);
      expect(firstListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondListItem.top - firstListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();
      expect(secondListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - secondListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();
      expect(thirdListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - thirdListItem.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(60))) <= 1).assertTrue();
      expect(fourthListItem.left).assertEqual(listContainer.left);
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listWidth * 0.4)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listHeight * 0.18)) <= 1).assertTrue();

      console.info(`[testListSpaceChangeOverflow](listContainer.bottom - fourthListItem.bottom)=
        ${(listContainer.bottom - fourthListItem.bottom)}`);
      console.info(`[testListSpaceChangeOverflow](listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(180))=
        ${(listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(180))}`);
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(180)))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + thirdListItem.left + ((thirdListItem.right - thirdListItem.left) / 2))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + thirdListItem.bottom)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + secondListItem.left + ((secondListItem.right - secondListItem.left) / 2))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + secondListItem.bottom)).toInt());
      await CommonFunc.sleep(1000);
      fourthListItem = CommonFunc.getComponentRect('List_SpaceChange04');
      listContainer = CommonFunc.getComponentRect('List_SpaceChange_Container01');
      if (fourthListItem.bottom < listContainer.bottom ){
      expect(Math.floor(Math.abs((listContainer.bottom - fourthListItem.bottom) - (listHeight - 2 * listItemHeight - 2 * listItemHeight2 - UIContext.resolveUIContext()!.vp2px(180)))) <= 1).assertTrue();
      } else {
       expect(listContainer.bottom <= fourthListItem.bottom).assertTrue();
      }
      console.info('[testListSpaceChangeOverflow] END');

      
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'Space', value: 0
      });
      await CommonFunc.sleep(2000);
      done();
    });
  })
}