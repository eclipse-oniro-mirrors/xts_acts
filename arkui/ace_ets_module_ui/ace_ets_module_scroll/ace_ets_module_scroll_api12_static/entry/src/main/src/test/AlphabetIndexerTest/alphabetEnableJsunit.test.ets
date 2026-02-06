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
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function alphabetEnableJsunit() {
  describe('alphabetEnableJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("alphabetEnableJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetEnable",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get alphabetEnableJsunit state pages:" + JSON.stringify(pages));
        if (!("alphabetEnable" == pages.name)) {
          console.info("get alphabetEnableJsunit pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push alphabetEnableJsunit page result:");
        }
      } catch (err) {
        console.error("push alphabetEnableJsunit page error:" + err);
      }
      console.info("alphabetEnableJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("alphabetEnableJsunit after each called");
    });


    
    /**
     * @tc.number   alphabetEnableJsunit_static_001
     * @tc.name     alphabetEnableJsunit_static_001
     * @tc.desc     alphabetEnableJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('alphabetEnableJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alphabetEnableJsunit_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.text('B'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('alphabet_enable');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[alphabetEnableJsunit_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
      console.info('[alphabetEnableJsunit_static_001] END');
      done();
    });
  })
}
