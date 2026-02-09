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
import {
  Component,
  DisplayRotation,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
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

export default function enableScrollJsunit() {
  describe('enableScrollJsunit', () => {
    beforeAll(() => {
      console.info("enableScrollJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("enableScrollJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollBar/enableScroll",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get enableScrollJsunit state pages:" + JSON.stringify(pages));
        if (!("enableScroll" == pages.name)) {
          console.info("get enableScrollJsunit pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enableScrollJsunit page error:" + err);
      }
      console.info("enableScrollJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("enableScrollJsunit after each called");
    });


    
    /**
     * @tc.number   enableScrollJsunit_static_0100
     * @tc.name     enableScrollJsunit_static_0100
     * @tc.desc     enableScrollJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('enableScrollJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[enableScrollJsunit_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sBar_enable');
      console.info("[enableScrollJsunit_static_0100] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[enableScrollJsunit_static_0100] enableNestedScroll: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableNestedScroll')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ScrollBar');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableNestedScroll')).assertEqual('true');
      console.info('[enableScrollJsunit_static_0100] END');
      done();
    });
  })
}
