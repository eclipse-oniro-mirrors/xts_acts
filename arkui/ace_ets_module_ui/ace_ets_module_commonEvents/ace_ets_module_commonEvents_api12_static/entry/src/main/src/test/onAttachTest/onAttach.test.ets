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
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();


export default function onAttachTest() {
  describe('onAttachTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("onAttachTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAttach/onAttach',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        let pages = router.getState();
        console.info("get onAttachTest state pages:" + JSON.stringify(pages));
        if (!("onAttach" == pages.name)) {
          console.info("get onAttachTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onAttachTest page error:" + err);
      }
      console.info("onAttachTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("onAttachTest after each called");
    });

    afterAll(() => {
      const router = AppStorage.get<Router>('router') as Router
      router.back();
    })


    
    /**
     * @tc.number   onAttachTest_static_0010
     * @tc.name     onAttachTest_static_0010
     * @tc.desc     onAttachTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('onAttachTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onAttachTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('OnAttach_button'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('OnAttach_text');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onAttach succ');
      console.info('onAttachTest_0010 END');
      done();
    });


    
    /**
     * @tc.number   onDetachTest_static_0020
     * @tc.name     onDetachTest_static_0020
     * @tc.desc     onDetachTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('onDetachTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onDetachTest_0020 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('OnAttach_button'));
      await CommonFunc.sleep(2000);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('OnAttach_text');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onDetach succ');
      console.info('onDetachTest_0020 END');
      done();
    });
  })
}
