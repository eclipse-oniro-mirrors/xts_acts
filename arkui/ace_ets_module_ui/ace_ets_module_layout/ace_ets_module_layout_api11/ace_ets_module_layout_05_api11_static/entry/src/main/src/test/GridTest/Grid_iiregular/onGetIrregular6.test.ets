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

export default function onGetIrregular6Jsunit() {
  describe('onGetIrregular6Jsunit', () => {
    beforeAll(() => {
      console.info("onGetIrregular6Jsunit beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("onGetIrregular6Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/onGetIrregular6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get onGetIrregular6Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular6" == pages.name)) {
          console.info("get onGetIrregular6Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onGetIrregular6Jsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   onGetIrregular6Jsunit_static_0001
     * @tc.name     onGetIrregular6Jsunit_static_0001
     * @tc.desc     onGetIrregular6Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('onGetIrregular6Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[onGetIrregular6Jsunit_static_0001] START');


      await CommonFunc.sleep(1000);
      let Grid: RectValue = CommonFunc.getComponentRect('GridInfo');
      let GridItem0: RectValue = CommonFunc.getComponentRect('GridLog0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridLog1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem0.right - GridItem0.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem1.right - GridItem1.left))) <= 1).assertTrue();
      console.info('[onGetIrregular6Jsunit_static_0001] END');
      done();
    });

  })
}

