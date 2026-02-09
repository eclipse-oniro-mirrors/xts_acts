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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index'
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { Callback, MessageManager } from '../../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../../Util.test'

export default function CloseEsc() {
  describe('CloseEsc', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("CloseEsc beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu/CloseEsc',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CloseEsc state pages: " + JSON.stringify(pages));
        if (!("CloseEsc" == pages.name)) {
          console.info("get CloseEsc state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CloseEsc page error: " + err);
      }

    });
    
    
    /**
     * @tc.number   CloseEsc_static_0100
     * @tc.name     CloseEsc_static_0100
     * @tc.desc     CloseEsc_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CloseEsc_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CloseEsc_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let Button = await driver.findComponent(ON.id('CloseEsc'));
      await (Button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('CloseEscText');
      console.info("[CloseEsc_0100] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[CloseEsc_0100] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("true");
      await CommonFunc.sleep(1000);
      console.info('[CloseEsc_0100] END');
      done();
    });
  })
}

