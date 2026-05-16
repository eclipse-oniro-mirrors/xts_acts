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
export default function flex_Wrap_FlexPad_TextMarPadTest() {
  describe('Flex_Wrap_FlexPad_TextMarPadTest', () => {
    beforeAll(() => {
      console.info("Flex_Wrap_FlexPad_TextMarPadTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_Wrap_FlexPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_FlexPad_TextMarPad',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_Wrap_FlexPad_TextMarPadTest state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_FlexPad_TextMarPad" == pages.name)) {
          console.info("get Flex_Wrap_FlexPad_TextMarPadTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_Wrap_FlexPad_TextMarPadTest page error:" + err);
      }
      console.info("Flex_Wrap_FlexPad_TextMarPadTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextMargin', value: 0
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextMargin', value: 0
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextMargin', value: 0
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_FlexPad_TextMarPadText after each called");
    });
    
    
    /**
     * @tc.number   testWrapWrapFlexPadTextPad_static
     * @tc.name     testWrapWrapFlexPadTextPad_static
     * @tc.desc     testWrapWrapFlexPadTextPad_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapWrapFlexPadTextPad_static', Level.LEVEL0, async () => {
      console.info('[testWrapWrapFlexPadTextPad] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextPadding', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextPadding', value: 20
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextPadding', value: 30
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Wrap_FlexPad_TextMarPad_Container01');
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - firstText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(170)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1)
        .assertTrue();
      console.info('[testWrapWrapFlexPadTextPad] END');

    });
    
    
    /**
     * @tc.number   testWrapWrapFlexPadTextMargin_static
     * @tc.name     testWrapWrapFlexPadTextMargin_static
     * @tc.desc     testWrapWrapFlexPadTextMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapWrapFlexPadTextMargin_static', Level.LEVEL0, async () => {
      console.info('[testWrapWrapFlexPadTextMargin] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextMargin', value: 20
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Wrap_FlexPad_TextMarPad_Container01');
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');

      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - thirdText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1)
        .assertTrue();
      console.info('[testWrapWrapFlexPadTextMargin] END');

    });
    
    
    /**
     * @tc.number   testWrapWrapFlexPadTextMarPad_static
     * @tc.name     testWrapWrapFlexPadTextMarPad_static
     * @tc.desc     testWrapWrapFlexPadTextMarPad_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapWrapFlexPadTextMarPad_static', Level.LEVEL0, async () => {
      console.info('[testWrapWrapFlexPadTextMarPad] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextMargin', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextMargin', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextMargin', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextPadding', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextPadding', value: 20
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextPadding', value: 30
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Wrap_FlexPad_TextMarPad_Container01');
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');

      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - secondText.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - firstText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140)))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - flexContainer.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 2)
        .assertTrue();
      console.info('[testWrapWrapFlexPadTextMarPad] END');

    });
  })
}