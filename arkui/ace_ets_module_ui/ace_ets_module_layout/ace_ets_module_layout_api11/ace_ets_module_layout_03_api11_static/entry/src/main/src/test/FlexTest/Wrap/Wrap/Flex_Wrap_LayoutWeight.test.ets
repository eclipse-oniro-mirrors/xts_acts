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
export default function flex_Wrap_LayoutWeightTest() {
  describe('Flex_Wrap_LayoutWeightTest', () => {
    beforeAll(() => {
      console.info("Flex_Wrap_LayoutWeightTest beforeEach start");
      
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_Wrap_LayoutWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_LayoutWeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_Wrap_LayoutWeightTest state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_LayoutWeight" == pages.name)) {
          console.info("get Flex_Wrap_LayoutWeightTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_Wrap_LayoutWeightTest page error:" + err);
      }
      console.info("Flex_Wrap_LayoutWeightTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_LayoutWeight after each called");
    });
    
    
    /**
     * @tc.number   testWrapWrapTextLayoutWeight_static
     * @tc.name     testWrapWrapTextLayoutWeight_static
     * @tc.desc     testWrapWrapTextLayoutWeight_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapWrapTextLayoutWeight_static', Level.LEVEL0, async () => {
      console.info('[testWrapWrapTextLayoutWeight] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'firstTextLayoutWeight', value: 2
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'secondTextLayoutWeight', value: 1
      })
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'thirdTextLayoutWeight', value: 1
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_LayoutWeight01');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_LayoutWeight02');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_LayoutWeight03');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_layoutWeight_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_Wrap_layoutWeight_Container01');
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');

      expect(Math.abs(firstText.left - flexContainer.left) <= 1).assertTrue()
      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue()
      expect(Math.abs(firstText.right - secondText.left) <= 1).assertTrue()
      expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue()
      expect(Math.abs(firstText.top - secondText.top) <= 1).assertTrue()
      expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue()

      expect(Math.abs(firstText.bottom - firstText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(firstText.right - firstText.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(secondText.right - secondText.left - (thirdText.right - thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((flexContainer.right - thirdText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - flexContainer.bottom) <= 1).assertTrue();
      console.info('[testWrapWrapTextLayoutWeight] END');

    });
  })
}
