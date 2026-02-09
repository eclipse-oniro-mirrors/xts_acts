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
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function gridAniTrue() {
  describe('gridAniTrue', () => {
    beforeAll(() => {
      console.info("gridAniTrue beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("gridAniTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/gridAniTrue",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gridAniTrue state pages:" + JSON.stringify(pages));
        if (!("gridAniTrue" == pages.name)) {
          console.info("get gridAniTrue pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gridAniTrue page error:" + err);
      }
      console.info("gridAniTrue beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gridAniTrue after each called");
    });


    
    /**
     * @tc.number   gridAniTrue_static_0100
     * @tc.name     gridAniTrue_static_0100
     * @tc.desc     gridAniTrue_static_0100
     * @tc.level    Level.LEVEL0
     */
it('gridAniTrue_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[gridAniTrue_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('grid_next_animation_true'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('grid_true_onText');
      console.info("[gridAniTrue_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[gridAniTrue_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('Grid: onReachStart-onScrollStart-onReachEnd-onDidScroll-onScrollStop');
      console.info('[gridAniTrue_static_0100] END');
      done();
    });
  })
}
