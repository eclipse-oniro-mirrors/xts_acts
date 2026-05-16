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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SXSymbolGlyphSINGLE01Jsunit() {
  describe('SXSymbolGlyphSINGLE01Jsunit', () => {
    beforeAll(() => {
      console.info("SXSymbolGlyphSINGLE01Jsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SXSymbolGlyphSINGLE01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SXSymbolGlyphSINGLE01',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SXSymbolGlyphSINGLE01Jsunit state pages:" + JSON.stringify(pages));
        if (!("SXSymbolGlyphSINGLE01" == pages.name)) {
          console.info("get SXSymbolGlyphSINGLE01Jsunit state pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SXSymbolGlyphSINGLE01Jsunit success " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push SXSymbolGlyphSINGLE01Jsunit page error:" + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SXSymbolGlyphSINGLE01Jsunit_static_0100
     * @tc.name     SXSymbolGlyphSINGLE01Jsunit_static_0100
     * @tc.desc     SXSymbolGlyphSINGLE01Jsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('SXSymbolGlyphSINGLE01Jsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 START');
      let strcontent = inspector.getInspectorByKey('SXSymbolGlyphSINGLE01Key');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj is: ' + obj);
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj.$attrs is: ' + obj.getElement('$attrs'));
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 component obj.$attrs.textBackgroundStyle is: ' +
      obj.getElement('$attrs').getString('renderingStrategy'));
      expect(obj.getElement('$attrs').getString('renderingStrategy')).assertEqual('SymbolRenderingStrategy.SINGLE');
      console.info('SXSymbolGlyphSINGLE01Jsunit_0100 END')
      done();
    });
  })
}