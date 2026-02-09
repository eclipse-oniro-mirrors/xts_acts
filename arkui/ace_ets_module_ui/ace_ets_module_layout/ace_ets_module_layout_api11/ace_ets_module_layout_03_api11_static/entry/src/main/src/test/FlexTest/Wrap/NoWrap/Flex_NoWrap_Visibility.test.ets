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
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
import { Visibility } from '@ohos.arkui.component';
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
export default function flex_NoWrap_VisibilityTest() {
  describe('Flex_NoWrap_VisibilityTest', () => {
    beforeAll(() => {
      console.info("Flex_NoWrap_VisibilityTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_NoWrap_VisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_Visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_NoWrap_VisibilityTest state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_Visibility" == pages.name)) {
          console.info("get Flex_NoWrap_VisibilityTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_NoWrap_VisibilityTest page error:" + err);
      }
      console.info("Flex_NoWrap_VisibilityTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_Visibility after each called");
    });
    
    
    /**
     * @tc.number   testWrapNoWrapTextVisibilityNoneOverflow_static
     * @tc.name     testWrapNoWrapTextVisibilityNoneOverflow_static
     * @tc.desc     testWrapNoWrapTextVisibilityNoneOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapTextVisibilityNoneOverflow_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextVisibilityNoneOverflow] START');
      try {
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'firstTextWidth', value: 250
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'secondTextWidth', value: 350
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'thirdTextWidth', value: 350
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'visibility', value: 2
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility3');
        let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_NoWrap_Visibility_Container01');
        let flexContainerStrJson = inspector.getInspectorByKey('Flex_NoWrap_Visibility_Container01');

        expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
        expect(Math.abs((secondText.top) - (flexContainer.top)) <= 1).assertTrue();
        expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

        expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
          .assertTrue();

        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(250))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
          .assertTrue();

        expect(Math.abs((secondText.left) - (flexContainer.left)) <= 1).assertTrue();
        expect(Math.abs((thirdText.right) - (flexContainer.right)) <= 1).assertTrue();
        expect(Math.abs((thirdText.bottom) - (flexContainer.bottom)) <= 1).assertTrue();
      } catch (err) {
        console.error('[testWrapNoWrapTextVisibilityNoneOverflow] failed');
        expect().assertFail();
      }
      console.info('[testWrapNoWrapTextVisibilityNoneOverflow] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapTextVisibilityNoneMeet_static
     * @tc.name     testWrapNoWrapTextVisibilityNoneMeet_static
     * @tc.desc     testWrapNoWrapTextVisibilityNoneMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapTextVisibilityNoneMeet_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextVisibilityNoneMeet] START');
      try {
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'firstTextWidth', value: 250
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'secondTextWidth', value: 150
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'thirdTextWidth', value: 150
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'visibility', value: 2
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility3');
        let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_NoWrap_Visibility_Container01');
        let flexContainerStrJson = inspector.getInspectorByKey('Flex_NoWrap_Visibility_Container01');

        expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
        expect(Math.abs(flexContainer.left - secondText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue();
        expect(Math.abs(flexContainer.top - thirdText.top) <= 1).assertTrue();

        expect(Math.abs(secondText.bottom - secondText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - thirdText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();

        expect(Math.abs(secondText.right - secondText.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs(thirdText.right - thirdText.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

        expect(Math.abs(flexContainer.right - thirdText.right - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - flexContainer.bottom) <= 1).assertTrue();
      } catch (err) {
        console.error('[testWrapNoWrapTextVisibilityNoneMeet] failed');
        expect().assertFail();
      }
      console.info('[testWrapNoWrapTextVisibilityNoneMeet] END');

    });
    
    
    /**
     * @tc.number   testWrapNoWrapTextVisibilityHidden_static
     * @tc.name     testWrapNoWrapTextVisibilityHidden_static
     * @tc.desc     testWrapNoWrapTextVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testWrapNoWrapTextVisibilityHidden_static', Level.LEVEL0, async () => {
      console.info('[testWrapNoWrapTextVisibilityHidden] START');
      try {
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'firstTextWidth', value: 150
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'secondTextWidth', value: 150
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'thirdTextWidth', value: 150
        });
        AppStorage.get<MessageManager<number>>("messageManager")?.notify({
          name: 'visibility', value: 1
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_Text_Visibility3');
        let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_NoWrap_Visibility_Container01');
        let flexContainerStrJson = inspector.getInspectorByKey('Flex_NoWrap_Visibility_Container01');

        expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
        expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue();
        expect(Math.abs(flexContainer.top - thirdText.top) <= 1).assertTrue();

        expect(Math.abs(secondText.bottom - secondText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - thirdText.top - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200)))) <= 1).assertTrue();

        expect(Math.abs(secondText.right - secondText.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs(thirdText.right - thirdText.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

        expect(Math.abs(thirdText.bottom - flexContainer.bottom) <= 1).assertTrue();
        expect(Math.abs(flexContainer.right - thirdText.right - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
        console.info('[testWrapNoWrapTextVisibilityHidden] secondText',JSON.stringify(secondText));
        console.info('[testWrapNoWrapTextVisibilityHidden] flexContainer',JSON.stringify(flexContainer));
        console.info('[testWrapNoWrapTextVisibilityHidden] vp2px(150)',AppStorage.get<UIContext>('uiContext')?.vp2px(150));
        expect(Math.abs(secondText.left - flexContainer.left - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      } catch (err) {
        console.error('[testWrapNoWrapTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testWrapNoWrapTextVisibilityHidden] END');

    });
  })
}
