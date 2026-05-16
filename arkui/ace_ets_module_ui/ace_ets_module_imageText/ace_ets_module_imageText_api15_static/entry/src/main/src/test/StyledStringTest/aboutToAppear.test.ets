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
import { describe, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function AboutToAppearTest() {
  describe('AboutToAppearTest', () => {
    beforeAll(() => {
      console.info("AboutToAppearTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("AboutToAppearTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/aboutToAppear',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get AboutToAppearTest state pages: " + JSON.stringify(pages));
        if (!("AboutToAppearTest" == pages.name)) {
          console.info("get AboutToAppearTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AboutToAppearTest page error: " + err);
        expect().assertFail();
      }
    });
    
    
    
/**
     * @tc.number   AboutToAppearTest_static_0010
     * @tc.name     AboutToAppearTest_static_0010
     * @tc.desc     AboutToAppearTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('AboutToAppearTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[AboutToAppearTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[AboutToAppearTest_0010] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('运动45分钟');
      console.info('[AboutToAppearTest_0010] END');
      done();
    });

  })
}

