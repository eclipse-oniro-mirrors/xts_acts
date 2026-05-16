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
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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
import { UtilsTest } from '../../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function flex_AlignContent_SpaceBetween_FlexMarPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexMarPadTest', () => {
    beforeAll(() => {
      console.info("flex_AlignContent_SpaceBetween_FlexMarPadTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceBetween_FlexMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexMarPad',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexMarPadTest state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexMarPad" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexMarPadTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexMarPadTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_FlexMarPadTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexMarPadTest after each called");
    });
    
    
    /**
     * @tc.number   testFlexAlignContentSpaceAroundFlexMarPadMeet_static
     * @tc.name     testFlexAlignContentSpaceAroundFlexMarPadMeet_static
     * @tc.desc     testFlexAlignContentSpaceAroundFlexMarPadMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignContentSpaceAroundFlexMarPadMeet_static', Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadMeet] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 50
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 20
      });

      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_FlexMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');
	  expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();

      expect(Math.abs(firstText.bottom - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - fourthText.top) <= 1).assertTrue();
	  expect(Math.abs(Math.round(fourthText.bottom - flexContainer.bottom) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadMeet] END');

    });
    
    
    /**
     * @tc.number   testFlexAlignContentSpaceAroundFlexMarPadOverflow_static
     * @tc.name     testFlexAlignContentSpaceAroundFlexMarPadOverflow_static
     * @tc.desc     testFlexAlignContentSpaceAroundFlexMarPadOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignContentSpaceAroundFlexMarPadOverflow_static', Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'margin', value: 30
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMarPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_FlexMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');
	  expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
	  expect(Math.abs(Math.round(flexContainer.bottom - fourthText.bottom) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1)
        .assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] END');

    });
  })
}
