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

export default function imageMatrix() {
  describe('imageMatrix', () => {
    beforeAll(() => {
      console.info("imageMatrix beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('imageMatrix beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageMatrix/imageMatrix',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info('get imageMatrix state pages: ' + JSON.stringify(pages));
        if (!('imageMatrix' == pages.name)) {
          console.info('get imageMatrix state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push imageMatrix page error: ' + err);
        expect().assertFail();
      }
    });

        
    
/**
     * @tc.number   imageMatrix_static_0100
     * @tc.name     imageMatrix_static_0100
     * @tc.desc     imageMatrix_static_0100
     * @tc.level    Level.LEVEL0
     */
it('imageMatrix_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[imageMatrix_0100] START');
      let driver: Driver = Driver.create();
      let button1:Component = await driver.findComponent(ON.id('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(2000);

      
      let strJson = inspector.getInspectorByKey('imageMatrix');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageMatrix_0100] strJson is: ' + strJson);
      console.info('[imageMatrix_0100] imageMatrix obj is: ' + JSON.stringify(obj.getElement('$attrs').getElement('imageMatrix')));
      expect(obj.getElement('$attrs').getElement('imageMatrix')).assertEqual(
        '4.532353,2.110965,-0.040063,0.000000,\n'+
        '-2.009852,4.342766,1.449440,0.000000,\n'+
        '0.129348,-0.259554,0.957027,0.000000,\n'+
        '30.180006,61.629848,11.275022,1.000000,\n');

      console.info('[imageMatrix_0100] END');
      done();
    });
  })
}