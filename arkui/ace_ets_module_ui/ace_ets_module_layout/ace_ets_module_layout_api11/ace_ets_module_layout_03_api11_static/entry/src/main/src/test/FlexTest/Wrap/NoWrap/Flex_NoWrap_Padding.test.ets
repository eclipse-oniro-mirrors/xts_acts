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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
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
export default function flex_NoWrap_PaddingTest() {
  describe('Flex_NoWrap_PaddingTest', () => {
    beforeAll(() => {
      console.info("Flex_NoWrap_PaddingTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_NoWrap_PaddingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_Padding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_NoWrap_PaddingTest state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_Padding" == pages.name)) {
          console.info("get Flex_NoWrap_PaddingTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_NoWrap_PaddingTest page error:" + err);
      }
      console.info("Flex_NoWrap_PaddingTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexMargin', value: 0
      })
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_Padding after each called");
    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexPaddingOverflow_static
     * @tc.name     testWrapNoWrapFlexPaddingOverflow_static
     * @tc.desc     testWrapNoWrapFlexPaddingOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexPaddingOverflow_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexPaddingOverflow] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 60
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60))))) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(380)) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexPaddingOverflow] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexPaddingMeet_static
     * @tc.name     testWrapNoWrapFlexPaddingMeet_static
     * @tc.desc     testWrapNoWrapFlexPaddingMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexPaddingMeet_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexPaddingMeet] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(450)) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40))))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexPaddingMeet] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexMargin_static
     * @tc.name     testWrapNoWrapFlexMargin_static
     * @tc.desc     testWrapNoWrapFlexMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexMargin_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexMargin] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexMargin', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();

      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(firstText.top - columnContainer.top))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(450)) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexMargin] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexMarPad_static
     * @tc.name     testWrapNoWrapFlexMarPad_static
     * @tc.desc     testWrapNoWrapFlexMarPad_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexMarPad_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexMarPad] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexMargin', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.top - columnContainer.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440)) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexMarPad] END');

    });
  })
}
