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
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
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
export default function flex_AlignContent_SpaceBetween_FlexPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexPadTest', () => {
    beforeAll(() => {
      console.info("flex_AlignContent_SpaceBetween_FlexPadTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexPad",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexPadTest state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexPadTest" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexPadTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexPadTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({url:"MainAbility/pages/index/index"});
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest after each called");
    });
    
    
    /**
     * @tc.number   testAlignContentSpaceAroundFlexPadOverflow_static
     * @tc.name     testAlignContentSpaceAroundFlexPadOverflow_static
     * @tc.desc     testAlignContentSpaceAroundFlexPadOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentSpaceAroundFlexPadOverflow_static', Level.LEVEL0, async () => {
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 50
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');
      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - fourthText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - fourthText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - flexContainer.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] END');

    });
    
    
    /**
     * @tc.number   testAlignContentSpaceAroundFlexPadMeet_static
     * @tc.name     testAlignContentSpaceAroundFlexPadMeet_static
     * @tc.desc     testAlignContentSpaceAroundFlexPadMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testAlignContentSpaceAroundFlexPadMeet_static', Level.LEVEL0, async () => {
      console.info('[testAlignContentSpaceAroundFlexPadMeet] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(1000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - fourthText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();
  console.info('[testAlignContentSpaceAroundFlexPadMeet] firstText1',JSON.stringify(firstText));
  console.info('[testAlignContentSpaceAroundFlexPadMeet] flexContainer1',JSON.stringify(flexContainer));
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
  console.info('[testAlignContentSpaceAroundFlexPadMeet] flexContainer',JSON.stringify(flexContainer));
  console.info('[testAlignContentSpaceAroundFlexPadMeet] fourthText',JSON.stringify(fourthText));
  console.info('[testAlignContentSpaceAroundFlexPadMeet] vp2px(10)',AppStorage.get<UIContext>('uiContext')?.vp2px(10));
  console.info('[testAlignContentSpaceAroundFlexPadMeet] flexContainer.bottom - fourthText.bottom',flexContainer.bottom - fourthText.bottom);
  console.info('[testAlignContentSpaceAroundFlexPadMeet] flexContainer.bottom2 - fourthText.bottom',Math.floor(Math.abs((flexContainer.bottom - fourthText.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))));
      expect(Math.floor(Math.abs((flexContainer.bottom - fourthText.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.top - firstText.bottom) - (thirdText.top - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - secondText.bottom) - (fourthText.top - thirdText.bottom))) <= 1)
        .assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] END');

    });
  })
}
