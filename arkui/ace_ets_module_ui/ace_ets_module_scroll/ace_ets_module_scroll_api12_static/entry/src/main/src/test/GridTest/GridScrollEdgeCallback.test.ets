'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function GridScrollEdgeCallbackJsunit() {
  describe('GridScrollEdgeCallbackJsunit', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('text beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridScrollEdgeCallback',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info('get GridScrollEdgeCallback state pages:' + JSON.stringify(pages));
        if (!('GridScrollEdgeCallback' == pages.name)) {
          console.info('get GridScrollEdgeCallback state pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push GridScrollEdgeCallback page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GridScrollEdgeCallback page error:' + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('GridScrollEdgeCallback after each called');
    });

    
    /**
     * @tc.number   GridScrollEdgeCallbackTest_1580
     * @tc.name     GridScrollEdgeCallbackTest_1580
     * @tc.desc     GridScrollEdgeCallbackTest_1580
     * @tc.level    Level.LEVEL0
     */
it('GridScrollEdgeCallbackTest_1580', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GridScrollEdgeCallbackTest_1580 START');
      let driver1 = Driver.create();
      let button = await (driver1.findComponent(ON.id('GridScrollEdgeCallback01')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('GridTextByScrollEdge01')
      console.info('[Grid_ReachStartAndEnd_0100] component obj1 is: ' + JSON.stringify(JSON.parseJsonElement(strJson1)))
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual('ScrollEdgeSuccess');
      await CommonFunc.sleep(1000);
      console.info('GridScrollEdgeCallbackTest_1580 END');
      done();
    });

  })
}