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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function DetentsChange() {
  describe('DetentsChange', () => {

    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("DetentsChange beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/DetentsChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DetentsChange state pages:" + JSON.stringify(pages));
        if (!("DetentsChange" == pages.name)) {
          console.info("get DetentsChange pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push DetentsChange page error:" + err);
      }
      console.info("DetentsChange beforeEach end");
    });


    
    
    /**
     * @tc.number   DetentsChange_static_0100
     * @tc.name     DetentsChange_static_0100
     * @tc.desc     DetentsChange_static_0100
     * @tc.level    Level.LEVEL0
     */
it('DetentsChange_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DetentsChange_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DetentsChange'));
      await (button?.click() as Promise<void>)

      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('DetentsChangeValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DetentsChange_0100] component obj is: " + JSON.stringify(obj));
      console.info("[DetentsChange_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("DetentsChange success");

      console.info('[DetentsChange_0100] END');
      done();
    });


  })
}

