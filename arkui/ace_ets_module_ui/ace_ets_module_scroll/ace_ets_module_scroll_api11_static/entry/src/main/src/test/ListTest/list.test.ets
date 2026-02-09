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

export default function listSContentTest() {
  describe('listSContentTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("listSContent beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listSContent state pages:" + JSON.stringify(pages));
        if (!("listTest" == pages.name)) {
          console.info("get listSContent pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/List/listTest"
          })
          await CommonFunc.sleep(2000);
          // console.info("push listSContent  page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listSContent page error:" + err);
      }
      console.info("listSContent beforeEach end");
    });
    
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listSContent after each called");
    });

    

      
  
/**
     * @tc.number   listSContentTest_static_0100
     * @tc.name     listSContentTest_static_0100
     * @tc.desc     listSContentTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listSContentTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listSContentTest_static_0100] START');
      await CommonFunc.sleep(2000);
      let json = inspector.getInspectorByKey('listTestCon');
      let Obj1 = JSON.parseJsonElement(json);
      console.info("listTestCon json info " + json);
      expect(Obj1.getElement('$attrs').getString('contentStartOffset')).assertEqual('10.000000');
      expect(Obj1.getElement('$attrs').getString('contentEndOffset')).assertEqual('10.000000');
      console.info('[listSContentTest_static_0100] END');
      done();
    });

  })
}
