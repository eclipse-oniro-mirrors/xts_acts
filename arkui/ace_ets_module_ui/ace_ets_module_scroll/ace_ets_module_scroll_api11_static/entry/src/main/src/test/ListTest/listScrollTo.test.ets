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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listScrollTo() {
  describe('listScrollTo', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("listScrollTo beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listScrollTo",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listScrollTo state pages:" + JSON.stringify(pages));
        if (!("listScrollTo" == pages.name)) {
          console.info("get listScrollTo pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push listScrollTo page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listScrollTo page error:" + err);
      }
      console.info("listScrollTo beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listScrollTo after each called");
    });


    
    /**
     * @tc.number   listScrollTo_static_0100
     * @tc.name     listScrollTo_static_0100
     * @tc.desc     listScrollTo_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listScrollTo_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listScrollTo_static_0100] START');
      await CommonFunc.sleep(1000);
      let listItem1 = CommonFunc.getComponentRectOnScreen('list_scroll_100_2');
      console.info('[listScrollTo_static_0100] listItem1.bottom: ' + listItem1.bottom);
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('list_scrollTo_1')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let listItem2 = CommonFunc.getComponentRectOnScreen('list_scroll_100_2');
      console.info('[listScrollTo_static_0100] listItem2.bottom: ' + listItem2.bottom);
      await CommonFunc.sleep(1000);
      const uiContext = AppStorage.get<UIContext>('uiContext');
      expect(Math.abs(Math.round(listItem1.bottom - listItem2.bottom) - Math.round(uiContext!.vp2px(100))) <= 1)
        .assertTrue();
      console.info('[listScrollTo_static_0100] END');
      done();
    });
  })
}