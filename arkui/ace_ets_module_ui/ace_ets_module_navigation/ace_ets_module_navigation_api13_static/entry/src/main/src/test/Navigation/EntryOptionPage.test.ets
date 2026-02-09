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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function EntryOptionPage() {
  describe('EntryOptionPage', () => {
    beforeAll(() => {
      console.info("EntryOptionPage beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation13.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("EntryOptionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/EntryOptionPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get EntryOptionPage state pages:" + JSON.stringify(pages));
        if (!("EntryOptionPage" == pages.name)) {
          console.info("get EntryOptionPage pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push EntryOptionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EntryOptionPage page error:" + err);
      }
      console.info("EntryOptionPage beforeEach end");

    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("EntryOptionPage after each called");
    });


    
    

    /**
     * @tc.number   EntryOptionPage_0100
     * @tc.name     EntryOptionPage_0100
     * @tc.desc     EntryOptionPage_0100
     * @tc.level    Level.LEVEL0
     */
it('EntryOptionPage_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('EntryOptionPage_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('textId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[MultiNavigation_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[MultiNavigation_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('22');

      console.info('EntryOptionPage_0100 END');
      done();
    });

  })
}