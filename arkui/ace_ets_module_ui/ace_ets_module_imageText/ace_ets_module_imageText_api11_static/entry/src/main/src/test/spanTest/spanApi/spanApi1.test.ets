'use static';
/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common'
import inspector from '@ohos.arkui.inspector';
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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function spanApi1() {
  describe('spanApi1', () => {
    beforeAll(() => {
      console.info("ImageLoadResultTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("spanApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span/spanApi/spanApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get spanApi1 state pages:" + JSON.stringify(pages));
        if (!("spanApi1" == pages.name)) {
          console.info("get spanApi1 pages.name:" + '');
          await CommonFunc.sleep(2000);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push spanApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push spanApi1 page error:" + err);
      }
      console.info("spanApi1 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("spanApi1 after each called");
    });
    
    /**
     * @tc.number   spanApi1_static_0100
     * @tc.name     spanApi1_static_0100
     * @tc.desc     spanApi1_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('spanApi1_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[spanApi1_0100] START');
      await CommonFunc.sleep(2000);
      let spanApi1 = inspector.getInspectorByKey('spanApi1');
      let Obj1 = JSON.parseJsonElement(spanApi1);
      expect(JSON.stringifyJsonElement(Obj1.getElement('$attrs').getElement('textBackgroundStyle')))
        .assertEqual('{"color":"#7F007DFF","radius":"5.00vp"}');
      console.info('[testRichEditor_0100] END');
      done();
    });
  })
}
