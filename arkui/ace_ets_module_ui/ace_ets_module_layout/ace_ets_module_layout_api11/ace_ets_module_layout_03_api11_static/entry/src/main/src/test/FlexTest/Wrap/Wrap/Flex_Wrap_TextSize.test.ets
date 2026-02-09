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
export default function flex_Wrap_TextSizeTest() {
  describe('Flex_Wrap_TextSizeTest', () => {
    beforeAll(() => {
      console.info("Flex_Wrap_TextSizeTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_Wrap_TextSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_TextSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_Wrap_TextSizeTest state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_TextSize" == pages.name)) {
          console.info("get Flex_Wrap_TextSizeTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_Wrap_TextSizeTest page error:" + err);
      }
      console.info("Flex_Wrap_TextSizeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_TextSizeTest after each called");
    });
    
    
    /**
     * @tc.number   testWrapWrapTextSizeMeet_static
     * @tc.name     testWrapWrapTextSizeMeet_static
     * @tc.desc     testWrapWrapTextSizeMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapWrapTextSizeMeet_static', Level.LEVEL0, async () => {
      console.info('[testWrapWrapTextSizeMeet] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 150
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_TextSize1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_TextSize3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_TextSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_Wrap_TextSize_Container01');
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');

      expect(Math.abs(firstText.left - flexContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue();
      expect(Math.abs(firstText.right - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(firstText.top - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue();

      expect(Math.abs(firstText.bottom - firstText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs(firstText.right - firstText.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs(firstText.right - firstText.left - Math.round(secondText.right - secondText.left)) <= 1)
        .assertTrue();
      expect(Math.abs(firstText.right - firstText.left - Math.round(thirdText.right - thirdText.left)) <= 1)
        .assertTrue();

      expect(Math.abs(flexContainer.right - thirdText.right - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs(flexContainer.bottom - thirdText.bottom - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      console.info('[testWrapWrapTextSizeMeet] END');

    });
    
    
    /**
     * @tc.number   testWrapWrapTextSizeOverflow_static
     * @tc.name     testWrapWrapTextSizeOverflow_static
     * @tc.desc     testWrapWrapTextSizeOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapWrapTextSizeOverflow_static', Level.LEVEL0, async () => {
      console.info('[testWrapWrapTextSizeOverflow] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_TextSize1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_TextSize3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_TextSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_Wrap_TextSize_Container01');
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');

      expect(Math.abs(firstText.bottom - firstText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs(firstText.right - firstText.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs(firstText.right - firstText.left - Math.round(secondText.right - secondText.left)) <= 1)
        .assertTrue();
      expect(Math.abs(firstText.right - firstText.left - Math.round(thirdText.right - thirdText.left)) <= 1)
        .assertTrue();

      expect(Math.abs(firstText.top - secondText.top) <= 1).assertTrue();
      expect(Math.abs(firstText.right - secondText.left) <= 1).assertTrue();
      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue();
      expect(Math.abs(firstText.left - flexContainer.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.right) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - thirdText.top) <= 1).assertTrue();

      expect(Math.abs(flexContainer.right - secondText.right - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(flexContainer.bottom - thirdText.bottom - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      console.info('[testWrapWrapTextSizeOverflow] END');

    });
  })
}
