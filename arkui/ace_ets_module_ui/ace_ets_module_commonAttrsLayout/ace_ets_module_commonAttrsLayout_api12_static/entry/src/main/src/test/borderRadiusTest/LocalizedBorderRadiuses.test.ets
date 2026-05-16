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

export default function LocalizedBorderRadiuses() {
  describe('LocalizedBorderRadiuses', () => {
    beforeAll(() => {
      console.info("LocalizedBorderRadiuses beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api12.static", "EntryAbility")
      
    });
    beforeEach(() => {
      console.info("LocalizedBorderRadiuses beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/borderRadius/LocalizedBorderRadiuses',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalizedBorderRadiuses state pages:" + JSON.stringify(pages));
        if (!("LocalizedBorderRadiuses" == pages.name)) {
          console.info("get LocalizedBorderRadiuses pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push LocalizedBorderRadiuses page error:" + err);
      }
      console.info("LocalizedBorderRadiuses beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("LocalizedBorderRadiuses after each called");
    });


    
    
/**
     * @tc.number   LocalizedBorderRadiuses_static_0100
     * @tc.name     LocalizedBorderRadiuses_static_0100
     * @tc.desc     LocalizedBorderRadiuses_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LocalizedBorderRadiuses_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LocalizedBorderRadiuses_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('LocalizedBorderRadiuses_col');
      await CommonFunc.sleep(1000);
      console.info("[ObserverNavDestinationId_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('topLeft'))
        .assertEqual('20.00vp')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('topRight'))
        .assertEqual('10.00vp')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('bottomLeft'))
        .assertEqual('15.00vp')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('bottomRight'))
        .assertEqual('25.00vp')
      console.info('LocalizedBorderRadiuses_static_0100 END');
      done();
    });


  })
}