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
import { UtilsTest } from '../../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function flex_AlignContent_SpaceBetween_TextVisibilityTest() {
  describe('Flex_AlignContent_SpaceBetween_TextVisibilityTest', () => {
    beforeAll(() => {
      console.info("flex_AlignContent_SpaceBetween_TextVisibilityTest beforeEach start");
     await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceBetween_TextVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextVisibilityTest state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_TextVisibility" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextVisibilityTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_TextVisibilityTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_TextVisibilityTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
        name: 'visibility', value: Visibility.Visible
      });
      console.info("Flex_AlignContent_SpaceBetween_TextVisibilityTest after each called");
    });
    
    
    /**
     * @tc.number   testFlexAlignContentSpaceAroundTextVisibilityHidden_static
     * @tc.name     testFlexAlignContentSpaceAroundTextVisibilityHidden_static
     * @tc.desc     testFlexAlignContentSpaceAroundTextVisibilityHidden_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignContentSpaceAroundTextVisibilityHidden_static', Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;
        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'visibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_TextVisibility_Container01');
        expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');

        let firstTextStrJson = inspector.getInspectorByKey('AlignContent_SpaceBetween_TextVisibility01');
        expect(JSON.parseJsonElement(firstTextStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");

	    expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();

        expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
        expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();
	    expect(Math.abs(Math.round(secondText.top - flexContainer.top) - Math.round(distanceBefore + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
        expect(Math.abs(fourthText.bottom - flexContainer.bottom) <= 1).assertTrue();

        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(distanceBefore)) <= 1).assertTrue();
      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] END');

    });
    
    
    /**
     * @tc.number   testFlexAlignContentSpaceAroundTextVisibilityNone_static
     * @tc.name     testFlexAlignContentSpaceAroundTextVisibilityNone_static
     * @tc.desc     testFlexAlignContentSpaceAroundTextVisibilityNone_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexAlignContentSpaceAroundTextVisibilityNone_static', Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;

        AppStorage.get<MessageManager<Visibility>>("messageManager")?.notify({
          name: 'visibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_TextVisibility_Container01');
        console.log('firstText rect_value is:' +JSON.stringify(firstText));
        console.log('secondText rect_value is:' +JSON.stringify(secondText));
        console.log('thirdText rect_value is:' +JSON.stringify(thirdText));

        expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');

        let firstTextStrJson = inspector.getInspectorByKey('AlignContent_SpaceBetween_TextVisibility01');
        expect(JSON.parseJsonElement(firstTextStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");

        console.info('testFlexAlignContentSpaceAroundTextVisibilityNone_1: ');
	    expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();

        console.info('testFlexAlignContentSpaceAroundTextVisibilityNone_2: ');
        expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
        expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();

        console.info('testFlexAlignContentSpaceAroundTextVisibilityNone_3: ');
        expect(Math.abs(secondText.top - flexContainer.top) <= 1).assertTrue();
        expect(Math.abs(fourthText.bottom - flexContainer.bottom) <= 1).assertTrue();
        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1)
          .assertTrue();
        expect(Math.round(thirdText.top - secondText.bottom)).assertLarger(Math.round(distanceBefore));
      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] END');

    });
  })
}
