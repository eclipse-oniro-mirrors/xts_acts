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


export default function List_ListSize() {

  describe('List_ListSizeTest', () => {
    beforeAll(() => {
      console.log("List_ListSizeTest beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_ListSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_ListSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get List_ListSize state pages:" + JSON.stringify(pages));
        if (!("List_ListSize" == pages.name)) {
          console.info("get List_ListSize state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push List_ListSize page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_ListSizeTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListSizeTest after each called");
    });

    
    
    



/**
     * @tc.number   testListListSizeMeet_static
     * @tc.name     testListListSizeMeet_static
     * @tc.desc     testListListSizeMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testListListSizeMeet_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListListSizeMeet START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List_ListSize_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_ListSize_011: RectValue = CommonFunc.getComponentRect('List_ListSize_011');
      let List_ListSize_012: RectValue = CommonFunc.getComponentRect('List_ListSize_012');
      let List_ListSize_013: RectValue = CommonFunc.getComponentRect('List_ListSize_013');
      let List_ListSize_014: RectValue = CommonFunc.getComponentRect('List_ListSize_014');
      let List_ListSize_01: RectValue = CommonFunc.getComponentRect('List_ListSize_01');
      expect(List_ListSize_011.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_012.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_013.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_014.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_011.top).assertEqual(List_ListSize_01.top);

      expect(Math.abs(Math.floor((List_ListSize_012.top - List_ListSize_011.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_ListSize_013.top - List_ListSize_012.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_ListSize_014.top - List_ListSize_013.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.floor((List_ListSize_01.bottom - List_ListSize_014.bottom) - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();

      expect(Math.round(List_ListSize_011.right - List_ListSize_011.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(300)));
      expect(Math.round(List_ListSize_012.right - List_ListSize_012.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(300)));
      expect(Math.round(List_ListSize_013.right - List_ListSize_013.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(300)));
      expect(Math.round(List_ListSize_014.right - List_ListSize_014.left)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(300)));

      expect(Math.round(List_ListSize_011.bottom - List_ListSize_011.top)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(100)));
      expect(Math.round(List_ListSize_012.bottom - List_ListSize_012.top)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(100)));
      expect(Math.round(List_ListSize_013.bottom - List_ListSize_013.top)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(100)));
      expect(Math.round(List_ListSize_014.bottom - List_ListSize_014.top)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(100)));

      let driver = Driver.create();
      await driver.swipe(
        (Math.round(List_ListSize_013.left + ((List_ListSize_013.right - List_ListSize_013.left) / 2))).toInt(),
        (Math.round(List_ListSize_013.bottom)).toInt(),
        (Math.round(List_ListSize_012.left + ((List_ListSize_012.right - List_ListSize_012.left) / 2))).toInt(),
        (Math.round(List_ListSize_012.bottom)).toInt());
      await CommonFunc.sleep(1000);
      let List_ListSize_024: RectValue = CommonFunc.getComponentRect('List_ListSize_014');
      expect(Math.abs(Math.floor((List_ListSize_01.bottom - List_ListSize_024.bottom) - UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();
      console.info('testListListSizeMeet END');
      done();
    });
  })
}