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
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function flexWrapReverse_fixedParentPadding() {
  describe('FlexWrapReverse_fixedParentPadding', () => {
    beforeAll(() => {
      console.info("flexWrapReverse_fixedParentPadding beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexWrapReverse_fixedParentPadding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexWrapReverse_fixedParentPadding state pages:" + JSON.stringify(pages));
        if (!("FlexWrapReverse_fixedParentPadding" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentPadding pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentPadding page error:" + err);
      }
      console.info("FlexWrapReverse_fixedParentPadding beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentPadding afterEach called");
    });

    
    
    /**
     * @tc.number   testWrapReverseParentfixedPaddingChildPadding_static
     * @tc.name     testWrapReverseParentfixedPaddingChildPadding_static
     * @tc.desc     testWrapReverseParentfixedPaddingChildPadding_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapReverseParentfixedPaddingChildPadding_static', Level.LEVEL0, async () => {
      console.info('new testWrapReverseParentfixedPaddingChildPadding START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 20
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 0
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexWrapReverseTest10');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest28');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest29');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest30');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest10');
      expect(Math.floor(Math.abs((locationFlex.right - locationText1.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText1.left - locationText2.right)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText2.left - locationFlex.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.left - locationText1.left)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationText3.right - locationText1.right)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationText1.top - locationText2.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText2.top - locationFlex.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.top - locationText2.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedPaddingChildPadding END');

    });

    
    
    /**
     * @tc.number   testWrapReverseParentfixedPaddingChildMargin_static
     * @tc.name     testWrapReverseParentfixedPaddingChildMargin_static
     * @tc.desc     testWrapReverseParentfixedPaddingChildMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapReverseParentfixedPaddingChildMargin_static', Level.LEVEL0, async () => {
      console.info('new testWrapReverseParentfixedPaddingChildMargin START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 0
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexWrapReverseTest10');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest28');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest29');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest30');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest10');
      expect(Math.floor(Math.abs(Math.round(locationFlex.right - locationText1.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(70)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Math.round(locationText1.left - locationText2.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Math.round(locationText2.left - locationFlex.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(110)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Math.round(locationText3.left - locationText1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Math.round(locationFlex.right - locationText3.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Math.round(locationText1.top - locationText2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Math.round(locationText2.top - locationFlex.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(locationText3.top - locationText2.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(locationFlex.bottom - locationText3.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedPaddingChildMargin END');

    });

    
    
    /**
     * @tc.number   testWrapReverseParentfixedPaddingChildPaddingAndMargin_static
     * @tc.name     testWrapReverseParentfixedPaddingChildPaddingAndMargin_static
     * @tc.desc     testWrapReverseParentfixedPaddingChildPaddingAndMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapReverseParentfixedPaddingChildPaddingAndMargin_static', Level.LEVEL0, async () => {
      console.info('new testWrapReverseParentfixedPaddingChildPaddingAndMargin START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 30
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexWrapReverseTest10');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest28');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest29');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest30');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest10');
      expect(Math.floor(Math.abs((locationFlex.right - locationText1.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(80)))) <= 2).assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationText2.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationFlex.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(90)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationText1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationFlex.right - locationText3.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationText2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationFlex.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.top - locationText2.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 2).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationFlex.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 2).assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - (locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedPaddingChildPaddingAndMargin END');

    });
  })
}