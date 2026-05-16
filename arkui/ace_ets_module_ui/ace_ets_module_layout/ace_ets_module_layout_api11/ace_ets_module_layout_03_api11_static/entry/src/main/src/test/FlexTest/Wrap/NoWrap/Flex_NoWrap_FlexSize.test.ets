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
export default function flex_NoWrap_FlexSizeTest() {
  describe('flex_NoWrap_FlexSizeTest', () => {
    beforeAll(() => {
      console.info("flex_NoWrap_FlexSizeTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex_NoWrap_FlexSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_FlexSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flex_NoWrap_FlexSizeTest state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_FlexSize" == pages.name)) {
          console.info("get flex_NoWrap_FlexSizeTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push flex_NoWrap_FlexSizeTest page error:" + err);
      }
      console.info("flex_NoWrap_FlexSizeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("flex_NoWrap_FlexSizeTest after each called");
    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexSizeMeet_static
     * @tc.name     testWrapNoWrapFlexSizeMeet_static
     * @tc.desc     testWrapNoWrapFlexSizeMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexSizeMeet_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexSizeMeet] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 500
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexSize_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexSizeMeet] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexSizeMainAxisOverflow_static
     * @tc.name     testWrapNoWrapFlexSizeMainAxisOverflow_static
     * @tc.desc     testWrapNoWrapFlexSizeMainAxisOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexSizeMainAxisOverflow_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexSizeMainAxisOverflow] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 400
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexSize_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(400)) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((thirdText.right) - (flexContainer.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexSizeMainAxisOverflow] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapFlexSizeAllAxisOverflow_static
     * @tc.name     testWrapNoWrapFlexSizeAllAxisOverflow_static
     * @tc.desc     testWrapNoWrapFlexSizeAllAxisOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapFlexSizeAllAxisOverflow_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapFlexSizeAllAxisOverflow] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 500
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 100
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flexSize_Text3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexSize_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexSizeAllAxisOverflow] END');

    });
  })
}
