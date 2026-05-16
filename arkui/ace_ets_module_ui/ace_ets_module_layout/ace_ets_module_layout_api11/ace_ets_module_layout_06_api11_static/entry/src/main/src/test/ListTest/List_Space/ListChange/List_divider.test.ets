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


export default function List_divider() {

  describe('List_divider', () => {
    beforeAll(() => {
      console.log("List_divider beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_divider beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_divider',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get List_divider state pages:" + JSON.stringify(pages));
        if (!("List_divider" == pages.name)) {
          console.info("get List_divider state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push List_divider page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_divider beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_divider after each called");
    });

    
    
    



/**
     * @tc.number   testListDividerStrokeWidthToTen_static
     * @tc.name     testListDividerStrokeWidthToTen_static
     * @tc.desc     testListDividerStrokeWidthToTen_static
     * @tc.level    Level.LEVEL0
     */
it('testListDividerStrokeWidthToTen_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListDividerStrokeWidthToTen START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'strokeWidth', value: 10
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('List_divider_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_divider_011: RectValue = CommonFunc.getComponentRect('List_divider_011');
      let List_divider_012: RectValue = CommonFunc.getComponentRect('List_divider_012');
      let List_divider_013: RectValue = CommonFunc.getComponentRect('List_divider_013');
      let List_divider_014: RectValue = CommonFunc.getComponentRect('List_divider_014');
      let List_divider_01: RectValue = CommonFunc.getComponentRect('List_divider_01');
      let left:number = List_divider_01.left;
      let top:number = List_divider_01.top;
      let right:number = List_divider_01.right;
      let bottom:number = List_divider_01.bottom;
	  expect(Math.abs(Math.round(List_divider_011.right - List_divider_011.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_012.right - List_divider_012.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_013.right - List_divider_013.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_014.right - List_divider_014.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(List_divider_011.bottom - List_divider_011.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_012.bottom - List_divider_012.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_013.bottom - List_divider_013.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_014.bottom - List_divider_014.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(List_divider_011.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_012.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_013.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_014.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_011.top - List_divider_01.top)) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_012.top - List_divider_011.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_013.top - List_divider_012.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_014.top - List_divider_013.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_01.bottom - List_divider_014.bottom) - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_01.bottom - List_divider_01.top) - UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_01.right - List_divider_01.left) - UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + (bottom-top)/2 + top)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      await CommonFunc.sleep(3000);
      let List_divider_014Again: RectValue = CommonFunc.getComponentRect('List_divider_014');
      expect(Math.floor(Math.abs(List_divider_014.top - List_divider_014Again.top)) <= 1).assertTrue();
      console.info('testListDividerStrokeWidthToTen END');
      done();
    });

    
    
    



/**
     * @tc.number   testListDividerStrokeWidthToForty_static
     * @tc.name     testListDividerStrokeWidthToForty_static
     * @tc.desc     testListDividerStrokeWidthToForty_static
     * @tc.level    Level.LEVEL0
     */
it('testListDividerStrokeWidthToForty_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListDividerStrokeWidthToForty START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'strokeWidth', value: 40
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('List_divider_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_divider_011: RectValue = CommonFunc.getComponentRect('List_divider_011');
      let List_divider_012: RectValue = CommonFunc.getComponentRect('List_divider_012');
      let List_divider_013: RectValue = CommonFunc.getComponentRect('List_divider_013');
      let List_divider_014: RectValue = CommonFunc.getComponentRect('List_divider_014');
      let List_divider_01: RectValue = CommonFunc.getComponentRect('List_divider_01');
      let left:number = List_divider_01.left;
      let top:number = List_divider_01.top;
      let right:number = List_divider_01.right;
      let bottom:number = List_divider_01.bottom;
	  expect(Math.abs(Math.round(List_divider_011.right - List_divider_011.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_012.right - List_divider_012.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_013.right - List_divider_013.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_014.right - List_divider_014.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(List_divider_011.bottom - List_divider_011.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_012.bottom - List_divider_012.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_013.bottom - List_divider_013.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List_divider_014.bottom - List_divider_014.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(List_divider_011.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_012.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_013.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_014.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_011.top - List_divider_01.top)) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_014.bottom - List_divider_01.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_012.top - List_divider_011.bottom) - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_013.top - List_divider_012.bottom) - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_014.top - List_divider_013.bottom) - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_01.bottom - List_divider_01.top) - UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
	  expect(Math.floor(Math.abs((List_divider_01.right - List_divider_01.left) - UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe((Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + (bottom-top)/2 + top)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + (right -left)/2)).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top)).toInt());
      await CommonFunc.sleep(3000);
      let List_divider_014Again: RectValue = CommonFunc.getComponentRect('List_divider_014');
      expect(Math.floor(Math.abs(List_divider_01.bottom - List_divider_014Again.bottom)) <= 1)
        .assertTrue();
      console.info('testListDividerStrokeWidthToForty END');
      done();
    });
  })
}