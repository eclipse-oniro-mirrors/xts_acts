'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
export default function searchEnableHapticFeedBackModifier() {
  describe('searchEnableHapticFeedBackModifier', () => {
    beforeAll(() => {
      console.info("searchEnableHapticFeedBack beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.search.undefined.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchEnableHapticFeedBack beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/SearchEnableHapticFeedBackModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchEnableHapticFeedBack state pages:" + JSON.stringify(pages));
        if (!("searchEnableHapticFeedBack" == pages.name)) {
          console.info("get searchEnableHapticFeedBack pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push searchEnableHapticFeedBack page error:" + err);
      }
      console.info("searchEnableHapticFeedBack beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("searchEnableHapticFeedBack after each called");
    })


    /**
     * @tc.number   searchEnableHapticFeedBackModifier_static_0100
     * @tc.name     searchEnableHapticFeedBackModifier_static_0100
     * @tc.desc     searchEnableHapticFeedBackModifier_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('searchEnableHapticFeedBackModifier_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'searchEnableHapticFeedBack0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('button_enableHapticFeedback1'))
      await CommonFunc.sleep(500);
      button?.click()
      await CommonFunc.sleep(500);
      let strJsonNew = inspector.getInspectorByKey('key_search_enableHapticFeedback_002');
      console.info('[' + tagName + '] Search enableHapticFeedback is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('enableHapticFeedback')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');

      let button1 = await driver.findComponent(ON.id('button_enableHapticFeedback1'))
      await CommonFunc.sleep(500);
      button1?.click()
      await CommonFunc.sleep(500);
      let strJsonNew1 = inspector.getInspectorByKey('key_search_enableHapticFeedback_002');
      console.info('[' + tagName + '] Search enableHapticFeedback is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('enableHapticFeedback')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('false');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
