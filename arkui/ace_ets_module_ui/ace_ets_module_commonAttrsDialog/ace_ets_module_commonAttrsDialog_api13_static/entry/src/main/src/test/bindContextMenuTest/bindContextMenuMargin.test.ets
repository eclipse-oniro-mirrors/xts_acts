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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function bindContextMenuMargin() {
  describe('bindContextMenuMargin',  () =>{
    beforeAll(() => {
      console.info("activeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api13.Static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("bindContextMenuMargin beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/bindContextMenuTest/bindContextMenuMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindContextMenuMargin state pages:" + JSON.stringify(pages));
        if (!("bindContextMenuMargin" == pages.name)) {
          console.info("get bindContextMenuMargin pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindContextMenuMargin page error:" + err);
      }
      console.info("bindContextMenuMargin beforeEach end");
    });

    
    
    /**
     * @tc.number   bindContextMenuMargin_Static_0100
     * @tc.name     bindContextMenuMargin_Static_0100
     * @tc.desc     bindContextMenuMargin_Static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindContextMenuMargin_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindContextMenuMargin_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('bindContextMenuMargin'));
      await (btn?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('bindContextMenuMargin');
      console.info("[bindContextMenuMargin_0100] bindContextMenuMargin JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[bindContextMenuMargin_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[bindContextMenuMargin_0100] title: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('bindContextMenuMargin');
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('menu'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[bindContextMenuMargin_0100] END');
      done();
    });
  })
}

