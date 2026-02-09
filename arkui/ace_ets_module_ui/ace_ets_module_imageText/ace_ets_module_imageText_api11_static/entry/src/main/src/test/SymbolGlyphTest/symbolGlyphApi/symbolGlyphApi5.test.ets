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
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
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

export default function symbolGlyphApi5() {
  describe('symbolGlyphApi5', () => {
    beforeAll(() => {
      console.info("symbolGlyphApi5 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("symbolGlyphApi5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/symbolGlyphApi/symbolGlyphApi5',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get symbolGlyphApi5 state pages:" + JSON.stringify(pages));
        if (!("symbolGlyphApi5" == pages.name)) {
          console.info("get symbolGlyphApi5 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push symbolGlyphApi5 page error:" + err);
      }
      console.info("symbolGlyphApi5 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("symbolGlyphApi5 after each called");
    });

    
    /**
     * @tc.number   symbolGlyphApi5_static_0100
     * @tc.name     symbolGlyphApi5_static_0100
     * @tc.desc     symbolGlyphApi5_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('symbolGlyphApi5_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolGlyphApi5_static_0100] START');
      await CommonFunc.sleep(2000);

      let symbolGlyphApi5 = inspector.getInspectorByKey('symbolGlyphApi5');
      let Obj1 = JSON.parseJsonElement(symbolGlyphApi5);
      expect(Obj1.getElement('$attrs').getString('effectStrategy')).assertEqual('SymbolEffectStrategy.HIERARCHICAL');
      console.info('[testRichEditor_0100] END');
      done();
    });
  })
}
