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
import {MessageManager} from '../../../../../ets/MainAbility/common/MessageManager'
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
export default function flex_NoWrap_FlexPad_TextMarPadTest() {
  describe('Flex_NoWrap_FlexPad_TextMarPadTest', () => {
    beforeAll(() => {
      console.info("Flex_NoWrap_FlexPad_TextMarPadTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_NoWrap_FlexPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_FlexPad_TextMarPad',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_NoWrap_FlexPad_TextMarPadTest state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_FlexPad_TextMarPad" == pages.name)) {
          console.info("get Flex_NoWrap_FlexPad_TextMarPadTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_NoWrap_FlexPad_TextMarPadTest page error:" + err);
      }
      console.info("Flex_NoWrap_FlexPad_TextMarPadTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextMargin', value: 0
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextMargin', value: 0
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextMargin', value: 0
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextPadding', value: 0
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextPadding', value: 0
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextPadding', value: 0
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 0
      })
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_FlexPad_TextMarPadText after each called");
    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexPadTextPad_static
     * @tc.name     testWrapNoWrapFlexPadTextPad_static
     * @tc.desc     testWrapNoWrapFlexPadTextPad_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexPadTextPad_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexPadTextPad] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextPadding', value: 10
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextPadding', value: 20
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextPadding', value: 30
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 30
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexNoWrap_FlexPad_TextMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440)) / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - secondText.left - (thirdText.right - thirdText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexPadTextPad] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexPadTextMargin_static
     * @tc.name     testWrapNoWrapFlexPadTextMargin_static
     * @tc.desc     testWrapNoWrapFlexPadTextMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexPadTextMargin_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexPadTextMargin] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextMargin', value: 20
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 20
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexNoWrap_FlexPad_TextMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.top) - (thirdText.top))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((flexContainer.right - thirdText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - flexContainer.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexPadTextMargin] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexPadTextMarPad_static
     * @tc.name     testWrapNoWrapFlexPadTextMarPad_static
     * @tc.desc     testWrapNoWrapFlexPadTextMarPad_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexPadTextMarPad_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexPadTextMarPad] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextMargin', value: 10
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextMargin', value: 10
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextMargin', value: 10
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextPadding', value: 10
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextPadding', value: 20
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextPadding', value: 30
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'flexPadding', value: 30
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_TextMarPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexPad_TextMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexNoWrap_FlexPad_TextMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - firstText.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - secondText.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.right - firstText.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(380)) / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40)))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexPadTextMarPad] END');

    });
  })
}