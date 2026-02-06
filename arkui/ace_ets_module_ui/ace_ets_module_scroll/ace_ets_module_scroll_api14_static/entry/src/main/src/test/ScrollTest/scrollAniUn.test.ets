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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { startAbility, UtilsTest } from '../Util.test';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';


export default function scrollAniUn() {
  describe('scrollAniUn', () => {

    beforeAll(() => {
      console.info("scrollAniUn beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("scrollAniUn beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollAniUn",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scrollAniUn state pages:" + JSON.stringify(pages));
        if (!("scrollAniUn" == pages.name)) {
          console.info("get scrollAniUn pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollAniUn page error:" + err);
      }
      console.info("scrollAniUn beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollAniUn after each called");
    });


    
    /**
     * @tc.number   scrollAniUn_static_0100
     * @tc.name     scrollAniUn_static_0100
     * @tc.desc     scrollAniUn_static_0100
     * @tc.level    Level.LEVEL0
     */
it('scrollAniUn_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollAniUn_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scroll_animation_undefined')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll_undefined_onText');
      console.info("[scrollAniUn_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[scrollAniUn_static_0100] content: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('Scroll: onWillScroll-onDidScroll-');
      console.info('[scrollAniUn_static_0100] END');
      done();
    });
  })
}
