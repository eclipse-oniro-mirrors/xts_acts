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

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function SelectShowInSubWindowTest() {
  describe('SelectShowInSubWindowTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(() => {
      console.info("SelectShowInSubWindowTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SelectShowInSubWindowTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectShowInSubWindowTest state pages:" + JSON.stringify(pages));
        if (!("selectShowInSubWindow" == pages.name)) {
          console.info("get  SelectShowInSubWindowTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/select/selectShowInSubWindow',
          })
        }
      } catch (err) {
        console.error("push SelectShowInSubWindowTest page error:" + err);
      }
      console.info("SelectShowInSubWindowTest foreEach end");
    });

    /**
     * @tc.number   selectShowInSubWindow_static_0100
     * @tc.name     selectShowInSubWindow_static_0100
     * @tc.desc     Test the showInSubWindow interface
     * @tc.level    LEVEL2
     */
    it('selectShowInSubWindow_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectShowInSubWindow_static_0100';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('showInSubWindow001');
      let obj = JSON.parseJsonElement(strJson);
      let showInSubWindowStr = obj.getElement('$attrs').getString('showInSubWindow');
      console.info("[selectShowInSubWindow_static_0100] showInSubWindow is: " + showInSubWindowStr);
      expect(showInSubWindowStr).assertEqual('true');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   selectShowInSubWindow_static_0200
     * @tc.name     selectShowInSubWindow_static_0200
     * @tc.desc     Test the showInSubWindow interface
     * @tc.level    LEVEL2
     */
    it('selectShowInSubWindow_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectShowInSubWindow_static_0200';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('showInSubWindow002');
      let obj = JSON.parseJsonElement(strJson);
      let showInSubWindowStr = obj.getElement('$attrs').getString('showInSubWindow');
      console.info("[selectShowInSubWindow_static_0200] showInSubWindow is: " + showInSubWindowStr);
      expect(showInSubWindowStr).assertEqual('false');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.number   selectShowInSubWindow_static_0300
     * @tc.name     selectShowInSubWindow_static_0300
     * @tc.desc     Test the showInSubWindow interface
     * @tc.level    LEVEL2
     */
    it('selectShowInSubWindow_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'selectShowInSubWindow_static_0300';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('showInSubWindow003');
      let obj = JSON.parseJsonElement(strJson);
      let showInSubWindowStr = obj.getElement('$attrs').getString('showInSubWindow');
      console.info("[selectShowInSubWindow_static_0300] showInSubWindow is: " + showInSubWindowStr);
      expect(showInSubWindowStr).assertEqual('false');
      console.info('[' + tagName + '] END============================');
      done();
    });
  })
}
