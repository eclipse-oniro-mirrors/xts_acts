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

export default function row_TextSizeTest() {
  describe('Row_TextSizeTest', () => {
    beforeAll(() => {
      console.info("Row_TextSizeTest beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_TextSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextSize',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_TextSize state pages:" + "");
        if (!("Row_TextSize" == pages.name)) {
          console.info("get Row_TextSize pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Row_TextSize page error:" + err);
      }
      console.info("Row_TextSizeTest beforeEach end");
    });
    afterEach(async () => {
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 100
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 50
      });
      await CommonFunc.sleep(1000);
      console.info("Row_TextSizeTest after each called");
    });
    
    
    

/**
     * @tc.number   testRowTextSizeHeight_static_01
     * @tc.name     testRowTextSizeHeight_static_01
     * @tc.desc     testRowTextSizeHeight_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRowTextSizeHeight_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowTextSizeHeight_static_01] START');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextSize2');
      let secondTextTop: number = secondText.top;
      let secondTextLeft: number = secondText.left;
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 130
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextSize1');
      secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextSize3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextSize_Container01');
      let rowContainerStrJson = inspector.getInspectorByKey('Row_TextSize_Container01');
  let obj = JSON.parseJsonElement(rowContainerStrJson);
  expect(obj.getString('$type')).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(130)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(firstText.left - rowContainer.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(secondText.top - secondTextTop)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - secondTextLeft)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - (thirdText.left - secondText.right))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((rowContainer.right - thirdText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      console.info('[testRowTextSizeHeight_static_01] END');
      done();
    });
    
    
    

/**
     * @tc.number   testRowTextSizeWidth_static_02
     * @tc.name     testRowTextSizeWidth_static_02
     * @tc.desc     testRowTextSizeWidth_static_02
     * @tc.level    Level.LEVEL0
     */
it('testRowTextSizeWidth_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowTextSizeWidth_static_02] START');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextSize2');
      let secondTextTop: number = secondText.top;
      let secondTextLeft: number = secondText.left;
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 130
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextSize1');
      secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextSize3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextSize_Container01');
      let rowContainerStrJson = inspector.getInspectorByKey('Row_TextSize_Container01');

  let obj = JSON.parseJsonElement(rowContainerStrJson);
  expect(obj.getString('$type')).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(130)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(firstText.left - rowContainer.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(secondText.top - secondTextTop)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - (secondTextLeft + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - (thirdText.left - secondText.right))) <= 2)
        .assertTrue();

      expect(Math.floor(Math.abs(rowContainer.right - thirdText.right)) <= 1).assertTrue();
      console.info('[testRowTextSizeWidth_static_02] END');
      done();
    });
  })
}
