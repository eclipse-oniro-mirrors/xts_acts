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
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
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

export default function CalcJsunit01() {
  describe('CalcJsunit01', () => {
    beforeAll(() => {
      console.info("CalcJsunit01 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("CalcJsunit01 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Calc/Calc01',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CalcJsunit01 state pages:" + "");
        if (!("Calc01" == pages.name)) {
          console.info("get CalcJsunit01 pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CalcJsunit01 page error:" + err);
      }
      console.info("CalcJsunit01 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      const router = AppStorage.get<Router>("router") as Router
      router.back()
      console.info("CalcJsunit01 after each called");
    });

/**
     * @tc.number   CalcJsunit01_static_0100
     * @tc.name     CalcJsunit01_static_0100
     * @tc.desc     CalcJsunit01_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CalcJsunit01_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CalcJsunit01_static_0100] START');
      await CommonFunc.sleep(4000);
      let calc2: RectValue = CommonFunc.getComponentRect('calc01key2');
      let calc3: RectValue = CommonFunc.getComponentRect('calc01key3');
      let calc4: RectValue = CommonFunc.getComponentRect('calc01key4');
      let calc5: RectValue = CommonFunc.getComponentRect('calc01key5');
      let calc6: RectValue = CommonFunc.getComponentRect('calc01key6');
      let calc7: RectValue = CommonFunc.getComponentRect('calc01key7');
      let calc8: RectValue = CommonFunc.getComponentRect('calc01key8');
      let calc9: RectValue = CommonFunc.getComponentRect('calc01key9');
      let calc10: RectValue = CommonFunc.getComponentRect('calc01key10');
      await CommonFunc.sleep(2000);
      console.log('11111', calc2.right, calc2.left, calc2.right - calc2.left)
      console.log('22222', calc3.top, calc3.bottom, calc3.bottom - calc3.top)
      console.log('33333', calc4.right, calc4.left, calc4.right - calc4.left)
      console.log('44444', calc5.top, calc5.bottom, calc5.bottom - calc5.top)
      console.log('55555', calc6.right, calc6.left, calc6.right - calc6.left)
      console.log('66666', calc7.right, calc7.left, calc7.right - calc7.left)
      console.log('77777', calc8.right, calc8.left, calc8.right - calc8.left)
      console.log('88888', calc9.right, calc9.left, calc9.right - calc9.left)
      console.log('99999', calc10.top, calc10.bottom, calc10.top - calc10.bottom)

      expect(Math.abs(calc2.right - calc2.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(270))) <= 1).assertTrue();
      expect(Math.abs(calc3.bottom - calc3.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(18))) <= 1).assertTrue();
      expect(Math.abs(calc4.right - calc4.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(90))) <= 1).assertTrue();
      expect(Math.abs(calc5.bottom - calc5.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(18))) <= 1).assertTrue();
      expect(Math.abs(calc6.right - calc6.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(90))) <= 1).assertTrue();
      expect(Math.abs(calc7.right - calc7.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(270))) <= 1).assertTrue();
      expect(Math.abs(calc8.right - calc8.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(270))) <= 1).assertTrue();
      expect(Math.abs(calc9.right - calc9.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(270))) <= 1).assertTrue();
      expect(Math.abs(calc10.bottom - calc10.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(54))) <= 1).assertTrue();
      done();
    });
  })
}
