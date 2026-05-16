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
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import { UIContext,Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextAddApi1() {
  describe('TextAddApi1', () => {
    beforeAll(() => {
      console.info("TextAddApi1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAddApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextAddApi1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAddApi1 state pages:" + JSON.stringify(pages));
        if (!("TextAddApi1" == pages.name)) {
          console.info("get TextAddApi1 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextAddApi1 page error:" + err);
      }
      console.info("TextAddApi1 beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAddApi1 after each called");
    });

    /**
     * @tc.number   TextAddApi1_static_001
     * @tc.name     TextAddApi1_static_001
     * @tc.desc     TextAddApi1_static_001
     * @tc.level   Level.LEVEL0
     */
    it('TextAddApi1_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[TextAddApi1_001] START');

      let strJson = inspector.getInspectorByKey('TextAddApi1');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextAddApi1_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('editMenuOptions');
      console.info('[TextAddApi1_001] END');
      done();
    });

  })
}
