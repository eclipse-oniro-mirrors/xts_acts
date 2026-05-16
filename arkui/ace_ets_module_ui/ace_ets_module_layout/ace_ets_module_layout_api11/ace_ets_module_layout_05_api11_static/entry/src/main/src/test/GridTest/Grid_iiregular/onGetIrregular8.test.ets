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

export default function onGetIrregular8Jsunit() {
  describe('onGetIrregular8Jsunit', () => {
    beforeAll(() => {
      console.info("onGetIrregular8Jsunit beforeEach start");
      console.info("Grid_Row_Columns beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("onGetIrregular8Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/onGetIrregular8',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get onGetIrregular8Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular8" == pages.name)) {
          console.info("get onGetIrregular8Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onGetIrregular8Jsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   onGetIrregular8Jsunit_static_0001
     * @tc.name     onGetIrregular8Jsunit_static_0001
     * @tc.desc     onGetIrregular8Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('onGetIrregular8Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[onGetIrregular8Jsunit_static_0001] START');
      await CommonFunc.sleep(1000);
      let GridItem0: RectValue = CommonFunc.getComponentRect('layout0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('layout1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('layout2');
      let context = AppStorage.get<UIContext>('context') as UIContext
      await CommonFunc.sleep(1000);

      expect(Math.round(context.px2vp(GridItem0.right - GridItem0.left))).assertEqual(80);
      expect(Math.round(context.px2vp(GridItem2.right - GridItem2.left))).assertEqual(80);
      expect(Math.round(context.px2vp(GridItem0.bottom - GridItem0.top))).assertEqual(114);
      expect(Math.round(context.px2vp(GridItem2.bottom - GridItem2.top))).assertEqual(114);
      console.info('[onGetIrregular8Jsunit_static_0001] END');
      done();
    });

  })
}
