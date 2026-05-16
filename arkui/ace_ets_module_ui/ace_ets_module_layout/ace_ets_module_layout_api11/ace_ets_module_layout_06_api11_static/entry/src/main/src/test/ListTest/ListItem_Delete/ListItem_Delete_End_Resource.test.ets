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
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function ListItem_Delete_End_Resource() {
  describe('ListItem_Delete_End_Resource', () => {
    beforeAll(() => {
      console.log("ListItem_Delete_End_Resource beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    })
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_Delete_End_Resource beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListItem_Delete/ListItem_Delete_End_Resource',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ListItem_Delete_End_Resource state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ListItem_Delete_End_Resource pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListItem_Delete_End_Resource page error:" + err);
      }
      console.info("ListItem_Delete_End_Resource beforeEach end");
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_Resource_button1'));
      await btn!.click();
      await CommonFunc.sleep(3000);

    });

/**
     * @tc.number   SUB_ACE_ListItem_Delete_End_Resource_static_0100
     * @tc.name     SUB_ACE_ListItem_Delete_End_Resource_static_0100
     * @tc.desc     SUB_ACE_ListItem_Delete_End_Resource_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_End_Resource_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_End_Resource_0100] START');
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_Resource_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_Resource_ListItem_01');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_ListItem_Delete_End_Resource_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);

      console.log('slide ')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + right - UIContext.resolveUIContext()!.vp2px(5))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(5))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(2000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_End_Resource_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_End_Resource_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_End_Resource_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('4');

      console.info('[SUB_ACE_ListItem_Delete_End_Resource_0100] END');
      done();
    });

/**
     * @tc.number   SUB_ACE_ListItem_Delete_End_Resource_static_0200
     * @tc.name     SUB_ACE_ListItem_Delete_End_Resource_static_0200
     * @tc.desc     SUB_ACE_ListItem_Delete_End_Resource_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_End_Resource_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_End_Resource_0200] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_Resource_button1'));
      await btn!.click();
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_Resource_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_Resource_ListItem_01');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_ListItem_Delete_End_Resource_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);

      console.log('slide ')
      await driver.swipe(
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number + top + height/2)).toInt(),
        (Math.round((AppStorage.get<number>('winLeft')) as number + left + UIContext.resolveUIContext()!.vp2px(30))).toInt(),
        (Math.round((AppStorage.get<number>('winTop')) as number  + top + height/2)).toInt()
      );
      await CommonFunc.sleep(2000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_End_Resource_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('not enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_End_Resource_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_End_Resource_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_Resource_0200] END');
      done();
    });
  })
}
