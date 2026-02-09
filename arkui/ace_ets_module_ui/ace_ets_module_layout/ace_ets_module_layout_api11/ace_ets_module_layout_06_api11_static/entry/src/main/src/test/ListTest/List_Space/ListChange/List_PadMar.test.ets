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


export default function List_PadMar() {

  describe('List_PadMar', () => {
    beforeAll(() => {
      console.log("List_PadMar beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_PadMar beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_PadMar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get List_PadMar state pages:" + JSON.stringify(pages));
        if (!("List_PadMar" == pages.name)) {
          console.info("get List_PadMar state pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push List_PadMar page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_PadMar beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_PadMar after each called");
    });

    
    
    



/**
     * @tc.number   testListPadMar_static
     * @tc.name     testListPadMar_static
     * @tc.desc     testListPadMar_static
     * @tc.level    Level.LEVEL0
     */
it('testListPadMar_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testListPadMar START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List_PadMar_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let List_PadMar_011: RectValue = CommonFunc.getComponentRect('List_PadMar_011');
      let List_PadMar_012: RectValue = CommonFunc.getComponentRect('List_PadMar_012');
      let List_PadMar_013: RectValue = CommonFunc.getComponentRect('List_PadMar_013');
      let List_PadMar_014: RectValue = CommonFunc.getComponentRect('List_PadMar_014');
      let List_PadMar_01: RectValue = CommonFunc.getComponentRect('List_PadMar_01');
      let List_PadMar_01_Box: RectValue = CommonFunc.getComponentRect('List_PadMar_01_Box');

      expect(Math.abs(Math.round(List_PadMar_011.left - List_PadMar_01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.left - List_PadMar_01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.left - List_PadMar_01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.left - List_PadMar_01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_011.top - List_PadMar_01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.top - List_PadMar_011.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.top - List_PadMar_012.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.top - List_PadMar_013.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_PadMar_01.top - List_PadMar_01_Box.top) * 10) / 10 - Math.round(UIContext.resolveUIContext()!.vp2px(5) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_PadMar_01.left - List_PadMar_01_Box.left) * 10) / 10 - Math.round(UIContext.resolveUIContext()!.vp2px(5) * 10) / 10) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_PadMar_011.right - List_PadMar_011.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.right - List_PadMar_012.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.right - List_PadMar_013.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.right - List_PadMar_014.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_PadMar_011.bottom - List_PadMar_011.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.bottom - List_PadMar_012.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.bottom - List_PadMar_013.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.bottom - List_PadMar_014.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_PadMar_01.bottom - List_PadMar_01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(520))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_01.right - List_PadMar_01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1)
        .assertTrue();
      let driver = Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let List_PadMar_014Again: RectValue = CommonFunc.getComponentRect('List_PadMar_014');
      expect(Math.abs(List_PadMar_014.top - List_PadMar_014Again.top) <= 1).assertTrue();
      console.info('testListPadMar END');
      done();
    });
  })
}