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
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { describe, beforeEach, it, expect, Level, afterEach, beforeAll,Level } from '../../../../../../hypium/index'
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import {Alignment } from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AlignSpaceEvenly_AddOneWidth() {
  describe('AlignSpaceEvenly_AddOneWidth', () => {

    beforeAll(() => {
      console.info("AlignSpaceEvenly_AddOneWidth beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("AlignSpaceEvenly_AddOneWidth beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddOneWidth',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignSpaceEvenly_AddOneWidth state pages:" + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddOneWidth" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddOneWidth pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddOneWidth page error:" + err);
      }
      console.info("AlignSpaceEvenly_AddOneWidth beforeEach end");
    });


    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddOneWidth after each called");
    });

    
    
/**
     * @tc.number   testFlexAlignSpaceEvenlyTextWidth_static
     * @tc.name     testFlexAlignSpaceEvenlyTextWidth_static
     * @tc.desc     testFlexAlignSpaceEvenlyTextWidth_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignSpaceEvenlyTextWidth_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('[testFlexAlignSpaceEvenlyTextWidth] START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'OneWidth', value: 160
        });
      }
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('SpaceEvenly_AddOneWidth_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddOneWidth_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneWidth_011');
      let SpaceEvenly_AddOneWidth_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneWidth_012');
      let SpaceEvenly_AddOneWidth_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneWidth_013');
      let SpaceEvenly_AddOneWidth_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddOneWidth_01');
      expect(Math.abs(SpaceEvenly_AddOneWidth_012.left - SpaceEvenly_AddOneWidth_011.right - SpaceEvenly_AddOneWidth_013.left + SpaceEvenly_AddOneWidth_012.right) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_012.left - SpaceEvenly_AddOneWidth_011.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_011.top - SpaceEvenly_AddOneWidth_012.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_013.top - SpaceEvenly_AddOneWidth_012.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_011.top - SpaceEvenly_AddOneWidth_01.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_011.left - SpaceEvenly_AddOneWidth_01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_01.right - SpaceEvenly_AddOneWidth_013.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_011.right - SpaceEvenly_AddOneWidth_011.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(160))) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_012.right - SpaceEvenly_AddOneWidth_012.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_013.right - SpaceEvenly_AddOneWidth_013.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_011.bottom - SpaceEvenly_AddOneWidth_011.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_012.bottom - SpaceEvenly_AddOneWidth_012.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1)
        .assertTrue()
      expect(Math.abs(SpaceEvenly_AddOneWidth_013.bottom - SpaceEvenly_AddOneWidth_013.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue()
      console.info('[testFlexAlignSpaceEvenlyTextWidth] END');

    });
  })
}
