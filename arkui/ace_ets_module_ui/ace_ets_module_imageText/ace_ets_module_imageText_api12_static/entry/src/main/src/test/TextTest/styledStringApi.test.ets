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

export default function styledStringApi() {
  describe('styledStringApi', () => {
    beforeAll(() => {
      console.info("styledStringApi beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("styledStringApi beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/styledStringApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get styledStringApi state pages:" + JSON.stringify(pages));
        if (!("styledStringApi" == pages.name)) {
          console.info("get styledStringApi pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push styledStringApi page error:" + err);
      }
      console.info("styledStringApi beforeEach end");
    }); 

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("styledStringApi after each called");
    });

    /**
     * @tc.number   styledStringApi_static_001
     * @tc.name     styledStringApi_static_001
     * @tc.desc     styledStringApi_static_001
     * @tc.level   Level.LEVEL0
     */
    it('styledStringApi_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[styledStringApi_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('styledStringBt1')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await (driver.findComponent(ON.id('styledStringBt3')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('styledStringText');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[styledStringApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('tring');
      console.info('[styledStringApi_001] END');
      done();

    });

    /**
     * @tc.number   styledStringApi_static_002
     * @tc.name     styledStringApi_static_002
     * @tc.desc     styledStringApi_static_002
     * @tc.level   Level.LEVEL0
     */
    it('styledStringApi_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[styledStringApi_002] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('styledStringBt2')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await (driver.findComponent(ON.id('styledStringBt3')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('styledStringText');
      await CommonFunc.sleep(200);
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[styledStringApi_002] component obj is: " + obj);
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('content')).assertEqual('string');
      console.info('[styledStringApi_002] END');
      done();

    });

  })
}
