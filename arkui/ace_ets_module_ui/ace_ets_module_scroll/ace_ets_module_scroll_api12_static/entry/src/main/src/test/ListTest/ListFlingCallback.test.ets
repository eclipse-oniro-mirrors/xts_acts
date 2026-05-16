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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ListFlingCallbackJsunit() {
  describe('ListFlingCallbackTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('text beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListFlingCallback',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info('get ListFlingCallback state pages:' + JSON.stringify(pages));
        if (!('ListFlingCallback' == pages.name)) {
          console.info('get ListFlingCallback state pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push ListFlingCallback page result:' + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error('push ListFlingCallback page error:' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ListFlingCallback after each called');
    });


    
    /**
     * @tc.number   ListFlingCallbackTest_static_0100
     * @tc.name     ListFlingCallbackTest_static_0100
     * @tc.desc     ListFlingCallbackTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ListFlingCallbackTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ListFlingCallbackTest_static_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('btn_list_fling_01')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('key_list_fling_text1');
      let obj = JSON.parseJsonElement(text1);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1000');
      console.info('ListFlingCallbackTest_static_0100 END');
      done();
    });


    
    /**
     * @tc.number   ListFlingCallbackTest_static_0200
     * @tc.name     ListFlingCallbackTest_static_0200
     * @tc.desc     ListFlingCallbackTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ListFlingCallbackTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ListFlingCallbackTest_static_0200 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('btn_list_fling_02')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let text2 = inspector.getInspectorByKey('key_list_fling_text2');
      let obj = JSON.parseJsonElement(text2);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('-1000');
      console.info('ListFlingCallbackTest_static_0200 END');
      done();
    });
  })
}