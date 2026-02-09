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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ImageSpanVisibilityTest() {
  describe('ImageSpanVisibilityTest', () => {
    beforeAll(() => {
      console.info("ImageSpanVisibilityTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageSpanVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSpan/ImageSpanVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ImageSpanVisibilityTest state pages: " + JSON.stringify(pages));
        if (!("ImageSpanVisibility" == pages.name)) {
          console.info("get ImageSpanVisibilityTest state pages.name: " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageSpanVisibilityTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageSpanVisibilityTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   ImageSpanVisibilityTest_static_0010
     * @tc.name     ImageSpanVisibilityTest_static_0010
     * @tc.desc     ImageSpanVisibilityTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('ImageSpanVisibilityTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageSpanVisibilityTest_static_0010 START');
      await CommonFunc.sleep(1000);
      const strJson = inspector.getInspectorByKey('ImageSpan_Visibility_None');
      const obj = JSON.parseJsonElement(strJson);
      console.info("[ImageSpanVisibilityTest_static_0010] ImageSpan Visibility is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('visibility')));
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      console.info('[ImageSpanVisibilityTest_static_0010] END');
      done();
    });

    
    /**
     * @tc.number   ImageSpanVisibilityTest_static_0020
     * @tc.name     ImageSpanVisibilityTest_static_0020
     * @tc.desc     ImageSpanVisibilityTest_static_0020
     * @tc.level    Level.LEVEL0
     */
    it('ImageSpanVisibilityTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageSpanVisibilityTest_static_0020 START');
      await CommonFunc.sleep(1000);
      const strJson = inspector.getInspectorByKey('ImageSpan_Visibility_Hidden');
      const obj = JSON.parseJsonElement(strJson);
      console.info("[ImageSpanVisibilityTest_static_0020] ImageSpan Visibility is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('visibility')));
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Hidden');
      console.info('[ImageSpanVisibilityTest_static_0020] END');
      done();
    });

    
    /**
     * @tc.number   ImageSpanVisibilityTest_static_0030
     * @tc.name     ImageSpanVisibilityTest_static_0030
     * @tc.desc     ImageSpanVisibilityTest_static_0030
     * @tc.level    Level.LEVEL0
     */
    it('ImageSpanVisibilityTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageSpanVisibilityTest_static_0030 START');
      await CommonFunc.sleep(1000);
      const strJson = inspector.getInspectorByKey('ImageSpan_Visibility_Visible');
      const obj = JSON.parseJsonElement(strJson);
      console.info("[ImageSpanVisibilityTest_static_0030] ImageSpan Visibility is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('visibility')));
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      console.info('[ImageSpanVisibilityTest_static_0030] END');
      done();
    });

    
    /**
     * @tc.number   ImageSpanVisibilityTest_static_0040
     * @tc.name     ImageSpanVisibilityTest_static_0040
     * @tc.desc     ImageSpanVisibilityTest_static_0040
     * @tc.level    Level.LEVEL0
     */
    it('ImageSpanVisibilityTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageSpanVisibilityTest_static_0040 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_Visibility_default');
      const obj = JSON.parseJsonElement(strJson);
      console.info("[ImageSpanVisibilityTest_static_0040] ImageSpan Visibility is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('visibility')));
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      console.info('[ImageSpanVisibilityTest_static_0040] END');
      done();
    });

    
    /**
     * @tc.number   ImageSpanVisibilityTest_static_0050
     * @tc.name     ImageSpanVisibilityTest_static_0050
     * @tc.desc     ImageSpanVisibilityTest_static_0050
     * @tc.level    Level.LEVEL0
     */
    it('ImageSpanVisibilityTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageSpanVisibilityTest_static_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageSpan_Visibility_undefined');
      const obj = JSON.parseJsonElement(strJson);
      console.info("[ImageSpanVisibilityTest_static_0050] ImageSpan Visibility is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('visibility')));
      expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      console.info('[ImageSpanVisibilityTest_static_0050] END');
      done();
    });
  })
}
