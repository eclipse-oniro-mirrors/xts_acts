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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextInputApi1() {
  describe('TextInputApi1', () => {
    beforeAll(() => {
      console.info("TextInputApi1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextInputApi1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputApi1 state pages:" + JSON.stringify(pages));
        if (!("TextInputApi1" == pages.name)) {
          console.info("get TextInputApi1 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputApi1 page error:" + err);
      }
      console.info("TextInputApi1 beforeEach end");
    }); 

    afterEach(async () => {
    });

    
    /**
     * @tc.number   TextInputApi1_static_0100
     * @tc.name     TextInputApi1_static_0100
     * @tc.desc     TextInputApi1_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('TextInputApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextInputApi1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let TextInput = await (driver.findComponent(ON.id('TextInputApi1_TextInput')) as Promise<Component>);
      await TextInput.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('TextInputApi1_Text1');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('before delete')

      let text2 = inspector.getInspectorByKey('TextInputApi1_Text2');
      expect(String(JSON.parseJsonElement(text2).getElement('$attrs').getString('content'))).assertEqual('after delete')

      await CommonFunc.sleep(1000);

      console.info('TextInputApi1_0100 END');
      done();
    });

  })
}