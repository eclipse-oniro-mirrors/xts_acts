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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '../../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
import { Visibility } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function row_TextVisibilityTest() {
  describe('Row_TextVisibilityTest', () => {
    beforeAll(() => {
      console.info("Row_TextVisibilityTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_TextVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextVisibility',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_TextVisibility state pages:" + "");
        if (!("Row_TextVisibility" == pages.name)) {
          console.info("get Row_TextPosition pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Row_TextVisibility page error:" + err);
      }
      console.info("Row_TextVisibilityTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("Row_TextVisibilityTest after each called");
    });
    
    
    

/**
     * @tc.number   testRowTextVisibilityNone_static_01
     * @tc.name     testRowTextVisibilityNone_static_01
     * @tc.desc     testRowTextVisibilityNone_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRowTextVisibilityNone_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowTextVisibilityNone_static_01] START');
      try {
        AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
          name: 'secondTextVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = inspector.getInspectorByKey('Row_TextVisibility_Container01');

       expect(JSON.parseJsonElement(rowContainerStrJson).getString('$type')).assertEqual('Row');

        let secondTextStrJson = inspector.getInspectorByKey('Row_TextVisibility2');
       expect(JSON.parseJsonElement(secondTextStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");

        expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
          .assertTrue();

        expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - firstText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(thirdText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - thirdText.bottom))) <= 1)
          .assertTrue();

        expect(Math.abs((firstText.left) - (rowContainer.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.left - firstText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();

        expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140))))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testRowTextVisibilityNone_static_01] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityNone_static_01] END');
      done();
    });
    
    
    

/**
     * @tc.number   testRowTextVisibilityHidden_static_02
     * @tc.name     testRowTextVisibilityHidden_static_02
     * @tc.desc     testRowTextVisibilityHidden_static_02
     * @tc.level    Level.LEVEL0
     */
it('testRowTextVisibilityHidden_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowTextVisibilityHidden_static_02] START');
      try {
        AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
          name: 'secondTextVisibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = inspector.getInspectorByKey('Row_TextVisibility_Container01');

       expect(JSON.parseJsonElement(rowContainerStrJson).getString('$type')).assertEqual('Row');

        let secondTextStrJson = inspector.getInspectorByKey('Row_TextVisibility2');
       expect(JSON.parseJsonElement(secondTextStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
          .assertTrue();

        expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - firstText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(thirdText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - thirdText.bottom))) <= 1)
          .assertTrue();

        expect(Math.abs((firstText.left) - (rowContainer.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.left - firstText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(120))))) <= 1).assertTrue();

        expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testRowTextVisibilityHidden_static_02] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityHidden_static_02] END');
      done();
    });
    
    
    

/**
     * @tc.number   testRowTextVisibilityVisible_static_03
     * @tc.name     testRowTextVisibilityVisible_static_03
     * @tc.desc     testRowTextVisibilityVisible_static_03
     * @tc.level    Level.LEVEL0
     */
it('testRowTextVisibilityVisible_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowTextVisibilityVisible_static_03] START');
      try {
        AppStorage.get<MessageManager<Visibility>>('messageManager')?.notify({
          name: 'secondTextVisibility', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let firstText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility1');
        let secondText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility2');
        let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextVisibility3');
        let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextVisibility_Container01');
        let rowContainerStrJson = inspector.getInspectorByKey('Row_TextVisibility_Container01');

       expect(JSON.parseJsonElement(rowContainerStrJson).getString('$type')).assertEqual('Row');

        let secondTextStrJson = inspector.getInspectorByKey('Row_TextVisibility2');
       expect(JSON.parseJsonElement(secondTextStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");

        expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
          .assertTrue();


        expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - firstText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(secondText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - secondText.bottom))) <= 1)
          .assertTrue();
        expect(Math.abs((Math.round(thirdText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - thirdText.bottom))) <= 1)
          .assertTrue();

        expect(Math.abs((firstText.left) - (rowContainer.left)) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(thirdText.left - secondText.right))) <= 1)
          .assertTrue();

        expect(Math.abs(
          (Math.round(rowContainer.right - thirdText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testRowTextVisibilityVisible_static_03] failed');
        expect().assertFail();
      }
      console.info('[testRowTextVisibilityVisible_static_03] END');
      done();
    });
  })
}
