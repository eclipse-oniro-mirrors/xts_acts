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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, PointerMatrix } from '@ohos.UiTest';
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

export default function SwipeRecognizerTest() {
  describe('SwipeRecognizerTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi18.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureRecognizer/SwipeRecognizer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SwipeRecognizer state pages:' + JSON.stringify(pages));
        if (!('SwipeRecognizer' == pages.name)) {
          console.info('get SwipeRecognizer state pages.name:' + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push SwipeRecognizer page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SwipeRecognizer page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SwipeRecognizer after each called');
    });


    
    
/**
     * @tc.number   SwipeRecognizer_static_0100
     * @tc.name     SwipeRecognizer_static_0100
     * @tc.desc     SwipeRecognizer_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SwipeRecognizer_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwipeRecognizer_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeRecognizer');
      let top = colum.top
      let left = colum.left
      await driver.swipe(Math.round(AppStorage.get<number>("winLeft") as number + 100) as Int,
        Math.round(top + 100) as Int, Math.round(AppStorage.get<number>("winLeft") as number + 500) as Int,
        Math.round(top + 500) as Int, 600)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('value');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SwipeRecognizer_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeRecognizer_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content'))
        .assertEqual('SwipeGesture\ndirection:3\nfingers:1\nisFingerCountLimited:false\nspeed:100');
      console.info('[SwipeRecognizer_static_0100] END');
      done();
    });

  })
}
