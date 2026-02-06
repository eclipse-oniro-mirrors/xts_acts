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
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function notifyDragStartRequestTest() {
  describe('notifyDragStartRequestTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi18.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Drag/notifyDragStartRequest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get notifyDragStartRequestTest state pages: ' + JSON.stringify(pages));
        if (!('NormalEts' == pages.name)) {
          console.info('get notifyDragStartRequestTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push notifyDragStartRequestTest page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('notifyDragStartRequestTest after each called');
    });


    
    
/**
     * @tc.number   notifyDragStartRequestTest_static_0010
     * @tc.name     notifyDragStartRequestTest_static_0010
     * @tc.desc     notifyDragStartRequestTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('notifyDragStartRequestTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('notifyDragStartRequestTest_static_0010 START');
      let driver = Driver.create();
      let image1 = await driver.findComponent(ON.id('image1'));
      await (image1?.longClick() as Promise<void>);
      await CommonFunc.sleep(5000);
      let button = await driver.findComponent(ON.id('button'));
      image1?.dragTo(button!);
      await CommonFunc.sleep(4000);
      let strJson1 = inspector.getInspectorByKey('button');
      await CommonFunc.sleep(2000);
      // console.info('[notifyDragStartRequestTest_static_0010] PreDrag: ' + JSON.stringify(strJson1));
      let obj1 = JSON.parseJsonElement(strJson1);
      // console.info('[notifyDragStartRequestTest_static_0010] PreDrag: ' + JSON.stringify(obj1.getElement('$attrs')));
      console.info('[notifyDragStartRequestTest_static_0010] PreDrag: ' +
      JSON.stringify(obj1.getElement('$attrs').getString('label')));
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('success');
      console.info('[notifyDragStartRequestTest_static_0010] END');
      done();
    });
  })
}