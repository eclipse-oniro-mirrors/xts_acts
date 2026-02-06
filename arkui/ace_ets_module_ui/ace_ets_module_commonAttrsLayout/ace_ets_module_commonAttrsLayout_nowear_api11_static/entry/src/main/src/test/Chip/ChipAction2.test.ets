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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, MouseButton, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ChipAction2() {
  describe('ChipAction2', () => {

    beforeAll(async (): Promise<void> => {
      console.info("ChipAction2 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.nowear.api11.static", "EntryAbility")
    });

    beforeEach(() => {
      console.info("ChipAction2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Chip/ChipAction2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipAction2 state pages: " + JSON.stringify(pages));
        if (!("ChipAction2" == pages.name)) {
          console.info("get ChipAction2 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push ChipAction2 page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   ChipAction2_static_001
     * @tc.name     ChipAction2_static_001
     * @tc.desc     ChipAction2_static_001
     * @tc.level    Level.LEVEL0
     */
it('ChipAction2_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      console.info('ChipAction2_static_001 START');
      let ChipActionCol = CommonFunc.getComponentRect('ChipAction2Col');
      await CommonFunc.sleep(200);
      let right = ChipActionCol.right - uiContext.vp2px(22);
      let top = ChipActionCol.top + uiContext.vp2px(18);
      await CommonFunc.sleep(200);
      console.info('ChipAction2_static_001 right：' + right + 'top:' + top);
      let driver = Driver.create();
      await driver.mouseClick({
        x: Math.round(right) as int, y: Math.round(top) as int
      }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('ChipAction2_static_001 click success');

      let strJson1 = inspector.getInspectorByKey('ChipAction2');
      await CommonFunc.sleep(1000);
      console.info("[ChipAction2_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('');
      console.info('[ChipAction2_static_001] END');

      done();
    });


  })
}
