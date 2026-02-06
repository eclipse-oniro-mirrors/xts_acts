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
import { describe, beforeEach, afterEach,  it, Level, expect, beforeAll } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest,startAbility} from '../Util.test'

export default function UIContextCreateFromBuilderJsunit() {
  describe('UIContextCreateFromBuilderTest', () => {
    beforeAll(() => {
      console.info("UIContextCreateFromBuilderTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.example.myapplication.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info('UIContextCreateFromBuilderTest beforeEach start');
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/xts/UIContextCreateFromBuilder',
      }
      try {
        const router = AppStorage.get<Router>("router" ) as Router
        router.clear();
        let pages = router.getState();
        console.info('get UIContextCreateFromBuilder state pages:' + JSON.stringify(pages));
        if (!('UIContextCreateFromBuilder' == pages.name)) {
          console.info('get UIContextCreateFromBuilder state pages.name:' + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push UIContextCreateFromBuilder page error:' + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('UIContextCreateFromBuilder after each called');
    });
    
    


/**
     * @tc.number   UIContextCreateFromBuilderTest_static_0100
     * @tc.name     UIContextCreateFromBuilderTest_static_0100
     * @tc.desc     UIContextCreateFromBuilderTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('UIContextCreateFromBuilderTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {
  // App died
      console.info('UIContextCreateFromBuilderTest_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('getComponentSnapshot_03'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text =  inspector.getInspectorByKey('key_getComponentSnapshot_text_03');
      console.info('snapshot++++++++++++++++++++'+JSON.stringifyJsonElement(JSON.parseJsonElement(text).getElement('$attrs')));
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('snapshot');
      console.info('UIContextCreateFromBuilderTest_0100 END');
      done();
    });
    
    


/**
     * @tc.number   UIContextCreateFromBuilderTest_static_0200
     * @tc.name     UIContextCreateFromBuilderTest_static_0200
     * @tc.desc     UIContextCreateFromBuilderTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('UIContextCreateFromBuilderTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {

      console.info('UIContextCreateFromBuilderTest_0200 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('getComponentSnapshot_04'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text =  inspector.getInspectorByKey('key_getComponentSnapshot_text_04');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('snapshot');
      console.info('UIContextCreateFromBuilderTest_0200 END');
      done();
    });
  })
}