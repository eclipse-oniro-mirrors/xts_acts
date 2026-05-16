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

export default function list_ListInitialIndex5Test() {
  describe('List_ListInitialIndex5Test', () => {
    beforeAll(() => {
      console.info("List_ListInitialIndex5Test beforeAll start");
            
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_ListInitialIndex5Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_initialIndex/List_ListInitialIndex5',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get List_ListInitialIndex5 state pages:" + JSON.stringify(pages));
        if (!("List_ListInitialIndex5" == pages.name)) {
          console.info("get List_ListInitialIndex5 pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List_ListInitialIndex5 page error:" + err);
      }
      console.info("List_ListInitialIndex5Test beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListInitialIndex5Test after each called");
    });
    
    
    



/**
     * @tc.number   testListInitialIndexToTwelveWithTwoLane_static
     * @tc.name     testListInitialIndexToTwelveWithTwoLane_static
     * @tc.desc     testListInitialIndexToTwelveWithTwoLane_static
     * @tc.level    Level.LEVEL0
     */
it('testListInitialIndexToTwelveWithTwoLane_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testListInitialIndexToTwelveWithTwoLane] START');
      let firstListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_1');
      let secondListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_2');
      let thirdListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_3');
      let fourthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_4');
      let fifthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_5');
      let sixthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_6');
      let seventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_7');
      let eighthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_8');
      let ninthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_9');
      let tenthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_10');
      let eleventhListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_11');
      let twelfthListItem: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_12');
      let listContainer: RectValue = CommonFunc.getComponentRect('List_ListInitialIndex5_Container01');
      let listContainerStrJson = inspector.getInspectorByKey('List_ListInitialIndex5_Container01');
      
      let listContainer_width = listContainer.right - listContainer.left
      let listContainer_height = listContainer.bottom - listContainer.top
      console.info('[testListInitialIndexToTwelveWithTwoLane] listContainer_width: ' + listContainer_width);
      console.info('[testListInitialIndexToTwelveWithTwoLane] listContainer_height: ' + listContainer_height);

      expect(JSON.parseJsonElement(listContainerStrJson).getString('$type')).assertEqual('List');

      expect(Math.abs(firstListItem.top - listContainer.top) <= 1).assertTrue();
      expect(Math.abs(firstListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.right - firstListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstListItem.bottom - firstListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(secondListItem.top - listContainer.top) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.left - firstListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.right - secondListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondListItem.bottom - secondListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdListItem.top - firstListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(thirdListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.right - thirdListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdListItem.bottom - thirdListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fourthListItem.top - secondListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.left - thirdListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.right - fourthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthListItem.bottom - fourthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(fifthListItem.top - thirdListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(fifthListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(fifthListItem.right - fifthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fifthListItem.bottom - fifthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(sixthListItem.top - fourthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.left - fifthListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.right - sixthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(sixthListItem.bottom - sixthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(seventhListItem.top - fifthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(seventhListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(seventhListItem.right - seventhListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(seventhListItem.bottom - seventhListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(eighthListItem.top - sixthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eighthListItem.left - seventhListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eighthListItem.right - eighthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eighthListItem.bottom - eighthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(ninthListItem.top - seventhListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(ninthListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(ninthListItem.right - ninthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ninthListItem.bottom - ninthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(tenthListItem.top - eighthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(tenthListItem.left - ninthListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(tenthListItem.right - tenthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(tenthListItem.bottom - tenthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(eleventhListItem.right - eleventhListItem.left) - UIContext.resolveUIContext()!.vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eleventhListItem.bottom - eleventhListItem.top) - UIContext.resolveUIContext()!.vp2px(0)) <= 1).assertTrue();

      expect(Math.abs(Math.round(twelfthListItem.right - twelfthListItem.left) - UIContext.resolveUIContext()!.vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.bottom - twelfthListItem.top) - UIContext.resolveUIContext()!.vp2px(0)) <= 1).assertTrue();


      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + listContainer.left + listContainer_width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + listContainer.bottom - listContainer_height / 6)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + listContainer.left + listContainer_width / 2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + listContainer.top + listContainer_height / 6)).toInt());
  await CommonFunc.sleep(2000);
      ninthListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_9');
      tenthListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_10');
      eleventhListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_11');
      twelfthListItem = CommonFunc.getComponentRect('List_ListInitialIndex5_12');

      expect(Math.abs(Math.round(eleventhListItem.top - ninthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(eleventhListItem.left - listContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(eleventhListItem.right - eleventhListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(eleventhListItem.bottom - eleventhListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();

      expect(Math.abs(Math.round(twelfthListItem.top - tenthListItem.bottom) - Math.round(listContainer_height*0.1)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.left - eleventhListItem.right) - Math.round(listContainer_width*0.2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.right - twelfthListItem.left) - Math.round(listContainer_width*0.3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(twelfthListItem.bottom - twelfthListItem.top) - Math.round(listContainer_height*0.12)) <= 1).assertTrue();
      console.info('[testListInitialIndexToTwelveWithTwoLane] END');
      done();
    });
  })
}
