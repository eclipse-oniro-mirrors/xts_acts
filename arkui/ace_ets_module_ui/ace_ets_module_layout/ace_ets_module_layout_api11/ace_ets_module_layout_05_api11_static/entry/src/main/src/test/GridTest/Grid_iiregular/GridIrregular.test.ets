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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../../hypium/index"
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import router from '@ohos.router';
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

export default function GridIrregularJsunit() {
  describe('GridIrregularJsunit', () => {
    beforeAll(() => {
      console.info("GridIrregularJsunit beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridIrregularJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/GridIrregular',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridIrregularJsunit state pages: " + JSON.stringify(pages));
        if (!("GridIrregular" == pages.name)) {
          console.info("get GridIrregularJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridIrregularJsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridIrregularJsunit_static_0001
     * @tc.name     GridIrregularJsunit_static_0001
     * @tc.desc     GridIrregularJsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('GridIrregularJsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridIrregularJsunit_static_0001] START');
      let GridItem0: RectValue = CommonFunc.getComponentRect('GridIrregular0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridIrregular1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('GridIrregular2');
      let GridItem3: RectValue = CommonFunc.getComponentRect('GridIrregular3');
      let GridItem4: RectValue = CommonFunc.getComponentRect('GridIrregular4');
      let GridItem5: RectValue = CommonFunc.getComponentRect('GridIrregular5');


      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem1.top - GridItem1.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem2.top - GridItem2.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem3.top - GridItem3.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem4.top - GridItem4.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem5.top - GridItem5.bottom)) <= 1)
        .assertTrue();


      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem1.right - GridItem1.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem2.right - GridItem2.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem3.right - GridItem3.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem4.right - GridItem4.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem5.right - GridItem5.left)) <= 1)
        .assertTrue();

      console.info('[GridIrregularJsunit_static_0001] END');
      done();
    });

  })
}
