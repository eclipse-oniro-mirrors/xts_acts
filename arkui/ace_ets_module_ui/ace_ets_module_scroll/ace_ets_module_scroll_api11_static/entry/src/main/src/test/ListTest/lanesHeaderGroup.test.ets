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

export default function lanesHeaderGroup() {
  describe('lanesHeaderGroup', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("lanesHeaderGroup beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/lanesHeaderGroup",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get lanesHeaderGroup state pages:" + JSON.stringify(pages));
        if (!("lanesHeaderGroup" == pages.name)) {
          console.info("get lanesHeaderGroup pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push lanesHeaderGroup page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push lanesHeaderGroup page error:" + err);
      }
      console.info("lanesHeaderGroup beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("lanesHeaderGroup after each called");
    });


    
    /**
     * @tc.number   lanesHeaderGroup_static_0100
     * @tc.name     lanesHeaderGroup_static_0100
     * @tc.desc     lanesHeaderGroup_static_0100
     * @tc.level    Level.LEVEL1
     */
it('lanesHeaderGroup_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[lanesHeaderGroup_static_0100] START');
      await CommonFunc.sleep(1000);
      let groupHeader = CommonFunc.getComponentRectOnScreen('group_ver_list_head');
      let listItem = CommonFunc.getComponentRectOnScreen('group_ver_item_head');
      console.info('[lanesHeaderGroup_static_0100] groupHeader.bottom: ' + groupHeader.bottom);
      console.info('[lanesHeaderGroup_static_0100] listItem.top: ' + listItem.top);
      expect(Math.abs(listItem.top - groupHeader.bottom) <= 1).assertTrue();
      let driver = Driver.create() as Driver;
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('itemInGroup_ver_header')) as Component;
      await btn.click();
      await CommonFunc.sleep(2000);
      let text01 = (await driver.findComponent(ON.text("Group:2, Item:3"))) as Component
      let textContent = await text01.getText();
      expect(textContent).assertEqual("Group:2, Item:3");
      console.info('[lanesHeaderGroup_static_0100] END');
      done();
    });
  })
}