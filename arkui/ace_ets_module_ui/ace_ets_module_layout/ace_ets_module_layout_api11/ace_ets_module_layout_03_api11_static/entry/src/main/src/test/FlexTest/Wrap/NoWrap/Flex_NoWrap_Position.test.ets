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
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { Visibility,Position } from '@ohos.arkui.component';
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

export default function flex_NoWrap_PositionTest() {
  describe('Flex_NoWrap_PositionTest', () => {
    beforeAll(() => {
      console.info("Flex_NoWrap_PositionTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_NoWrap_PositionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_Position',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_NoWrap_PositionTest state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_Position" == pages.name)) {
          console.info("get Flex_NoWrap_PositionTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_NoWrap_PositionTest page error:" + err);
      }
      console.info("Flex_NoWrap_PositionTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_Position after each called");
    });
    
    
    /**
     * @tc.number   testWrapNoWrapTextPosition_static
     * @tc.name     testWrapNoWrapTextPosition_static
     * @tc.desc     testWrapNoWrapTextPosition_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapTextPosition_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextPosition] START');
      AppStorage.get<MessageManager<Position>>("messageManager")?.notify({
        name: 'position', value: {
          x: 20, y: 40
        }
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_Position01');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_Position02');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_Position03');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_NoWrap_Position_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_NoWrap_Position_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1).assertTrue();

      expect(Math.abs((secondText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1)
        .assertTrue();
      expect(Math.abs((thirdText.bottom) - (flexContainer.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.top - flexContainer.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(40))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))))) <= 1).assertTrue();
      console.info('[testWrapNoWrapTextPosition] END');

    });
  })
}
