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
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import {GlobalContext} from '../../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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
export default function AlignContentFlexP_Fixed_Offset() {

  describe('AlignContentFlexP_Fixed_Offset', () => {
    beforeAll(() => {
      console.info("AlignContentFlexP_Fixed_Offset beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContentFlexP_Fixed_Offset_Margin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContentFlexP_Fixed_Offset',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContentFlexP_Fixed_Offset_Margin state pages:" + JSON.stringify(pages));
        if (!("AlignContentFlexP_Fixed_Offset" == pages.name)) {
          console.info("get AlignContentFlexP_Fixed_Offset_Margin pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlignContentFlexP_Fixed_Offset_Margin page error:" + err);
      }
      console.info("AlignContentFlexP_Fixed_Offset_Margin beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlexP_Fixed_Offset after each called");
    });

    

    
    /**
     * @tc.number   testAlignContentSpaceEvenlyFlexPfixedOffset_static
     * @tc.name     testAlignContentSpaceEvenlyFlexPfixedOffset_static
     * @tc.desc     testAlignContentSpaceEvenlyFlexPfixedOffset_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentSpaceEvenlyFlexPfixedOffset_static', Level.LEVEL0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexPfixedOffset START');
      let strJson = inspector.getInspectorByKey('AlignContentFlexP_fixed_Offset_flex');
      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor')));
      let AlignContentFlexSpaceEvenly_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Offset_flex');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Offset_flex_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Offset_flex_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Offset_flex_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexP_fixed_Offset_flex_4');

      console.log('AlignContentFlexP_fixed_Offset_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));

      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));
      const uiContext = new UIContext();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue();


      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.SpaceEvenly");

      expect(Math.abs((AlignContentFlexSpaceEvenly_2.left - AlignContentFlexSpaceEvenly_flex001.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50 / 3))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_2.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(15))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom) - (AlignContentFlexSpaceEvenly_2.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();
      expect(Math.abs((AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_3.bottom) - (AlignContentFlexSpaceEvenly_2.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();

      console.info('testAlignContentSpaceEvenlyFlexPfixedOffset END');

    });
  })
}
