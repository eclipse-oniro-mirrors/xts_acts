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

export default function scrollAniTrue() {
  describe('scrollAniTrue', () => {

    beforeAll(() => {
      console.info("scrollAniTrue beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("scrollAniTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollAniTrue",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scrollAniTrue state pages:" + JSON.stringify(pages));
        if (!("scrollAniTrue" == pages.name)) {
          console.info("get scrollAniTrue pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollAniTrue page error:" + err);
      }
      console.info("scrollAniTrue beforeEach end");
    });


    
    /**
     * @tc.number   scrollAniTrue_static_0100
     * @tc.name     scrollAniTrue_static_0100
     * @tc.desc     scrollAniTrue_static_0100
     * @tc.level    Level.LEVEL0
     */
it('scrollAniTrue_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollAniTrue_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('scroll_animation_true')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('scroll_true_onText');
      console.info("[scrollAniTrue_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[scrollAniTrue_static_0100] content: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('Scroll: onReachStart-onScrollStart-onReachEnd-onDidScroll-onScrollStop');
      console.info('[scrollAniTrue_static_0100] END');
      done();
    });
  })
}
