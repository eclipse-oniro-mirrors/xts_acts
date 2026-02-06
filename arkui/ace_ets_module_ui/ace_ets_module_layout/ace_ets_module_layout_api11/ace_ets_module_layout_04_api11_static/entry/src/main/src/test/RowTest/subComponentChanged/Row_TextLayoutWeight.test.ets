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
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
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

export default function row_TextLayoutWeightTest() {
  describe('Row_TextLayoutWeightTest', () => {
    beforeAll(() => {
      console.info("Row_TextLayoutWeightTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_TextLayoutWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextLayoutWeight',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_TextLayoutWeight state pages:" + "");
        if (!("Row_TextLayoutWeight" == pages.name)) {
          console.info("get Row_TextLayoutWeight pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Row_TextLayoutWeight page error:" + err);
      }
      console.info("Row_TextLayoutWeightTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Row_TextLayoutWeightTest after each called");
    });
    
    
    

/**
     * @tc.number   testRowTextLayoutWeight_static_01
     * @tc.name     testRowTextLayoutWeight_static_01
     * @tc.desc     testRowTextLayoutWeight_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRowTextLayoutWeight_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowTextLayoutWeight_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'firstTextLayoutWeight', value: 1
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'secondTextLayoutWeight', value: 1
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'thirdTextLayoutWeight', value: 1
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextLayoutWeight1');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextLayoutWeight2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextLayoutWeight3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextLayoutWeight_Container01');
      let rowContainerStrJson = inspector.getInspectorByKey('Row_TextLayoutWeight_Container01');

  let obj = JSON.parseJsonElement(rowContainerStrJson);
  expect(obj.getString('$type')).assertEqual('Row');
      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(110))))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.right - secondText.left) - Math.round(firstText.right - firstText.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.right - thirdText.left) - Math.round(secondText.right - secondText.left)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(secondText.top - rowContainer.top) - Math.round(rowContainer.bottom - secondText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(firstText.left - rowContainer.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left - firstText.right) - Math.round(thirdText.left - secondText.right)) <= 1)
        .assertTrue();

      expect(Math.abs(rowContainer.right - thirdText.right) <= 1).assertTrue();
      console.info('[testRowTextLayoutWeight_static_01] END');
      done();
    });
  })
}
