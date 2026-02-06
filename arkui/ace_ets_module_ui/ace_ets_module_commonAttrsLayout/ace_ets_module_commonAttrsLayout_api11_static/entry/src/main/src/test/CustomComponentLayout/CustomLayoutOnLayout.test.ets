'use static';
/*
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, ComponentUtils, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import RectValue from '../../../ets/MainAbility/common/Rect'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function CustomLayoutOnLayoutTest() {

  describe('CustomLayoutOnLayoutTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CustomLayoutOnLayoutTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
    });
    beforeEach(() => {
      console.info("CustomLayoutOnLayoutTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponentLayout/CustomLayoutOnLayout',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomLayoutOnLayout state success " + JSON.stringify(pages));
        if (!("CustomLayoutOnLayout" == pages.name)) {
          console.info("get CustomLayoutOnLayout state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push CustomLayoutOnLayout page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("CustomLayoutOnLayoutTest after each called");
    });


    
    /**
     * @tc.number   CustomLayoutOnLayoutTest_static_0010
     * @tc.name     CustomLayoutOnLayoutTest_static_0010
     * @tc.desc     CustomLayoutOnLayoutTest_static_0010
     * @tc.level    Level.LEVEL1
     */
it('CustomLayoutOnLayoutTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CustomLayoutOnLayoutTest_0010] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      await CommonFunc.sleep(1000);

      let text_1: RectValue = CommonFunc.getComponentRect('CustomLayoutOnLayoutText_1') as RectValue;
      let text_2: RectValue = CommonFunc.getComponentRect('CustomLayoutOnLayoutText_2') as RectValue;
      let text_3: RectValue = CommonFunc.getComponentRect('CustomLayoutOnLayoutText_3') as RectValue;

      console.log('test pnumber is: ' + Math.abs(text_2.left - text_1.left - uiContext.vp2px(20)))

      expect(Math.abs(text_2.left - text_1.left - uiContext.vp2px(20)) <= 1).assertTrue();
      expect(Math.abs(text_3.left - text_2.left - uiContext.vp2px(20)) <= 1).assertTrue();
      expect(Math.abs(text_2.top - text_1.top - uiContext.vp2px(20)) <= 1).assertTrue();
      expect(Math.abs(text_3.top - text_2.top - uiContext.vp2px(20)) <= 1).assertTrue();

      console.info('[CustomLayoutOnLayoutTest_0010] END');
      done();
    });
  })
}
