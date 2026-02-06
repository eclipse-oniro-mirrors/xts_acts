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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function freezeTest() {

  describe('freezeTest', () => {
    beforeAll(() => {
      console.info("freezeTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api12.static", "EntryAbility")
      
    });
    beforeEach(() => {
      console.info("freezeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageEffect/freeze',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get freezeTest state pages: " + JSON.stringify(pages));
        if (!("freeze" == pages.name)) {
          console.info("get freezeTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push freezeTest page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("freezeTest after each called");
    });


    
    
/**
     * @tc.number   freezeTest_static_0100
     * @tc.name     freezeTest_static_0100
     * @tc.desc     freezeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('freezeTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('freezeTest_static_0100 START');
      let strJson = inspector.getInspectorByKey('OffscreenCanvasFreeze_id');
      await CommonFunc.sleep(4000);
      console.log('JSON.parseJsonElement(strJson) ' + strJson)
      // console.info('freezeTest_static_0100 width' +
      // JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('width'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("300.00vp");
      console.info('[freezeTest_static_0100] END');
      done();
    });
  })
}
