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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import { PlaybackSpeed } from '@ohos.arkui.component';

export default function XComponentNodeChageJsSuit() {
  describe('XComponentNodeChageJsSuit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.platform.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("XComponentNodeChageJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentNodeChage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get XComponentNodeChageJsSuit state pages: " + JSON.stringify(pages));
        if (!("XComponentNodeChage" == pages.name)) {
          console.info("get XComponentNodeChageJsSuit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push XComponentNodeChageJsSuit page error:" + err);
      }
    });

    

    /**
     * @tc.number   XComponentNodeChageJsSuit_0100
     * @tc.name     XComponentNodeChageJsSuit_0100
     * @tc.desc     XComponentNodeChageJsSuit_0100
     * @tc.level    Level.LEVEL2
     */
it('XComponentNodeChageJsSuit_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[XComponentNodeChageJsSuit_0100] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button_Bottom = await (driver.findComponent(ON.id('xComponentNode_change')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('xComponent_RenderType');
      console.info("[XComponentNodeChageJsSuit_0100] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[XComponentNodeChageJsSuit_0100] obj content is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') == 'init').assertTrue();
      console.info('[XComponentNodeChageJsSuit_0100] END');
      done();
    });
  })
}