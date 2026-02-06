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

export default function CalcJsunit02() {
  describe('CalcJsunit02', () => {
    beforeAll(() => {
      console.info("CalcJsunit02 beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("CalcJsunit02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Calc/Calc02',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CalcJsunit02 state pages:" + "");
        if (!("Calc02" == pages.name)) {
          console.info("get CalcJsunit02 pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CalcJsunit02 page error:" + err);
      }
      console.info("CalcJsunit02 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      const router = AppStorage.get<Router>("router") as Router
      router.back()
      console.info("CalcJsunit02 after each called");
    });

/**
     * @tc.number   CalcJsunit02_static_0100
     * @tc.name     CalcJsunit02_static_0100
     * @tc.desc     CalcJsunit02_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CalcJsunit02_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CalcJsunit02_static_0100] START');
      await CommonFunc.sleep(4000);
      let calc0201: RectValue = CommonFunc.getComponentRect('calc02key01');
      let calc0202: RectValue = CommonFunc.getComponentRect('calc02key02');
      let calc0203: RectValue = CommonFunc.getComponentRect('calc02key03');
      let calc0204: RectValue = CommonFunc.getComponentRect('calc02key04');
      let calc0205: RectValue = CommonFunc.getComponentRect('calc02key05');
      let calc0206: RectValue = CommonFunc.getComponentRect('calc02key06');
      let calc0207: RectValue = CommonFunc.getComponentRect('calc02key07');
      let calc0208: RectValue = CommonFunc.getComponentRect('calc02key08');
      let calc0209: RectValue = CommonFunc.getComponentRect('calc02key09');
      await CommonFunc.sleep(2000);
      console.log('1111', calc0201.top, calc0201.bottom, calc0201.bottom - calc0201.top)
      console.log('2222', calc0202.right, calc0202.left, calc0201.right - calc0201.left)
      console.log('3333', calc0203.right, calc0203.left, calc0203.right - calc0203.left)
      console.log('4444', calc0204.right, calc0204.left, calc0204.right - calc0204.left)
      console.log('5555', calc0205.right, calc0205.left, calc0205.right - calc0205.left)
      console.log('6666', calc0206.right, calc0206.left, calc0206.right - calc0206.left)
      console.log('7777', calc0207.right, calc0207.left, calc0207.right - calc0207.left)
      console.log('8888', calc0208.right, calc0208.left, calc0208.right - calc0208.left)
      console.log('9999', calc0209.right, calc0209.left, calc0209.right - calc0209.left)
      expect(Math.abs(calc0201.bottom - calc0201.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(54))) <= 1).assertTrue();
      expect(Math.abs(calc0202.right - calc0202.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(120))) <= 1).assertTrue();
      expect(Math.abs(calc0203.right - calc0203.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(calc0204.right - calc0204.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(140))) <= 1).assertTrue();
      expect(Math.abs(calc0205.right - calc0205.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(120))) <= 1).assertTrue();
      expect(Math.abs(calc0206.right - calc0206.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(calc0207.right - calc0207.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(90))) <= 1).assertTrue();
      expect(Math.abs(calc0208.right - calc0208.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))) <= 1).assertTrue();
      expect(Math.abs(calc0209.right - calc0209.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(90))) <= 1).assertTrue();
      done();
    });
  })
}
