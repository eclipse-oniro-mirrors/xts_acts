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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function GridRows1() {
  describe('GridRows1', () => {
    beforeAll(() => {
      console.info("GridRows1 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("GridRows1 beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GridRows1 state pages:" + "");
        if (!("GridRows1" == pages.name)) {
          console.info("get  GridRows1 pages.name:" + "");
          routerInstance.pushUrl({url:"MainAbility/pages/GridRow/GridRows1"})
          await CommonFunc.sleep(4000);
          console.info("push GridRows1 page result:" + "");
        }
      } catch (err) {
        console.error("push GridRows1 page error:" + err);
      }
      console.info("GridRows1 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GridRows1 after each called");
    });

/**
     * @tc.number   GridRows1_static_001
     * @tc.name     GridRows1_static_001
     * @tc.desc     GridRows1_static_001
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_001] START');

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_static_001] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows1_static_001] END');
      done();
    });

/**
     * @tc.number   GridRows1_static_002
     * @tc.name     GridRows1_static_002
     * @tc.desc     GridRows1_static_002
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows1Bt1'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_static_002] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom)) <= 1).assertTrue();

      console.info('[GridRows1_static_002] END');
      done();
    });

/**
     * @tc.number   GridRows1_static_003
     * @tc.name     GridRows1_static_003
     * @tc.desc     GridRows1_static_003
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button_Bottom = await driver.findComponent(ON.id('GridRows1Bt3'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_5');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_static_003] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.top - row1.bottom) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(5)))) <= 1).assertTrue();

      console.info('[GridRows1_static_003] END');
      done();
    });

/**
     * @tc.number   GridRows1_static_004
     * @tc.name     GridRows1_static_004
     * @tc.desc     GridRows1_static_004
     * @tc.level    Level.LEVEL0
     */
it('GridRows1_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridRows1_static_004] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('GridRows1Bt2'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      await CommonFunc.sleep(1000);
      let row1 = CommonFunc.getComponentRect('GridRows1_1');
      let row2 = CommonFunc.getComponentRect('GridRows1_2');
      await CommonFunc.sleep(2000);

      console.info("[GridRows1_static_004] GridRows1_1 is: " + JSON.stringify(row1) + 'GridRows1_5:' + JSON.stringify(row2) );
      expect(Math.abs(Math.round(row2.left - row1.right)) <= 1).assertTrue();

      console.info('[GridRows1_static_004] END');
      done();
    });
  })
}
