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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test'

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function DrawModifier() {
  describe('DrawModifier', () => {

    beforeAll(() => {
      console.info("DrawModifier beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("DrawModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DrawModifier/DrawModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("DrawModifier" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DrawModifier after each called");
    });


    /**
     * @tc.number   DrawModifier_static_001
     * @tc.name     DrawModifier_static_001
     * @tc.desc     DrawModifier_static_001
     * @tc.level    Level.LEVEL0
     */
    it('DrawModifier_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[DrawModifier_static_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('DrawModifierBt'));
      if (button) {
        await button.click();
      } else {
        console.log('Button not found!')
      }
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DrawModifier');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawModifier_static_001] component obj is: " + JSON.stringifyJsonElement(obj));
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('drawBehind');
      console.info('[DrawModifier_static_001] END');
      done();
    });


    /**
     * @tc.number   DrawModifier_static_002
     * @tc.name     DrawModifier_static_002
     * @tc.desc     DrawModifier_static_002
     * @tc.level    Level.LEVEL0
     */
    it('DrawModifier_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[DrawModifier_static_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('DrawModifierBt'));
      if (button) {
        await button.click();
      }

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DrawModifier2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawModifier_static_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('drawContent');
      console.info('[DrawModifier_static_002] END');
      done();
    });


    /**
     * @tc.number   DrawModifier_static_003
     * @tc.name     DrawModifier_static_003
     * @tc.desc     DrawModifier_static_003
     * @tc.level    Level.LEVEL0
     */
    it('DrawModifier_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[DrawModifier_static_003] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('DrawModifierBt'));
      if (button) {
        await button.click();
      }

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('DrawModifier3');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawModifier_static_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('drawFront');
      console.info('[DrawModifier_static_003] END');
      done();
    });
  })
}
