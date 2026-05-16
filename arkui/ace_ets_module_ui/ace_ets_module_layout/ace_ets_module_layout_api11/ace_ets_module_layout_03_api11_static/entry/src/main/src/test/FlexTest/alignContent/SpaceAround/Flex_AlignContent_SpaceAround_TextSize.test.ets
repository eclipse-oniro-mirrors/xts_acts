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
export default function flex_AlignContent_SpaceAround_TextSizeTest() {
  describe('Flex_AlignContent_SpaceAround_TextSizeTest', () => {
    beforeAll(() => {
      console.info("flex_AlignContent_SpaceAround_TextSizeTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceAround_TextSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_TextSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceAround_TextSizeTest state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_TextSize" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_TextSizeTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_TextSizeTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_TextSizeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceAround_TextSizeTest after each called");
    });
    
    
    /**
     * @tc.number   testFlexAlignContentSpaceAroundTextSizeMeet_static
     * @tc.name     testFlexAlignContentSpaceAroundTextSizeMeet_static
     * @tc.desc     testFlexAlignContentSpaceAroundTextSizeMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignContentSpaceAroundTextSizeMeet_static', Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextSizeMeet] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 70
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceAround_TextSize_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceAround');
      expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(70))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();

      expect(Math.abs((secondText.top - firstText.bottom) - (thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs((thirdText.top - secondText.bottom) - (fourthText.top - thirdText.bottom)) <= 1).assertTrue()

      expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(flexContainer.bottom - fourthText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round((secondText.top - firstText.bottom) / 2)) <= 1)
        .assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextSizeMeet] END');

    });
    
    
    /**
     * @tc.number   testFlexAlignContentSpaceAroundTextSizeOverflow_static
     * @tc.name     testFlexAlignContentSpaceAroundTextSizeOverflow_static
     * @tc.desc     testFlexAlignContentSpaceAroundTextSizeOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignContentSpaceAroundTextSizeOverflow_static', Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextSizeOverflow] START');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 200
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextSize04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceAround_TextSize_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');

      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceAround');

      expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();

      expect(Math.abs(firstText.bottom - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - fourthText.top) <= 1).assertTrue();

      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();

      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - flexContainer.bottom) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextSizeOverflow] END');

    });
  })
}
