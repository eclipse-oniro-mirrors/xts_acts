'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

export default function stackAlignContentJsunit() {
  describe('stackAlignContentTest2', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/stack',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get stack state success " + JSON.stringify(pages));
        if (!("stack" == pages.name)) {
          console.info("get stack state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stack page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stack page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stackAlignContent after each called");
    });


    
    /**
     * @tc.number   teststackAlignContent_static_0001
     * @tc.name     teststackAlignContent_static_0001
     * @tc.desc     teststackAlignContent_static_0001
     * @tc.level    Level.LEVEL1
     */
it('teststackAlignContent_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('stackAlignContent teststackAlignContent_static_0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Stack');
      console.info("[teststackAlignContent_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00%");
      console.info("[teststackAlignContent_static_0001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('width'));
      done()
    });


    
    /**
     * @tc.number   teststackAlignContent_static_0002
     * @tc.name     teststackAlignContent_static_0002
     * @tc.desc     teststackAlignContent_static_0002
     * @tc.level    Level.LEVEL1
     */
it('teststackAlignContent_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('stackAlignContent teststackAlignContent_static_0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('Stack');
      console.info("[teststackAlignContent_static_0002] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("150.00vp");
      console.info("[teststackAlignContent_static_0002] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height'));
      done()
    });
  })
}
