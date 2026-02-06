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
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SearchModifierTest() {
  describe('SearchModifierTest', () => {
    beforeAll(() => {
      console.info("SearchModifierTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get SearchModifierTest state pages: " + JSON.stringify(pages));
        if (!("SearchModifier" == pages.name)) {
          console.info("get SearchModifierTest state pages.name: " + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SearchModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchModifierTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SearchModifierTest_static_0010
     * @tc.name     SearchModifierTest_static_0010
     * @tc.desc     SearchModifierTest_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('SearchModifierTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchModifierTest_static_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SearchModifier_get_value');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchModifierTest_static_0010] textFont: " +
      obj.getElement('$attrs').getString('textFont'));
      expect(obj.getElement('$attrs').getString('textFont')).assertContain('fontSize');
      expect(obj.getElement('$attrs').getString('textFont')).assertContain('15.00fp');
      console.info('[SearchModifierTest_static_0010] END');
      done();
    });

    
    /**
     * @tc.number   SearchModifierTest_static_0020
     * @tc.name     SearchModifierTest_static_0020
     * @tc.desc     SearchModifierTest_static_0020
     * @tc.level    Level.LEVEL1
     */
    it('SearchModifierTest_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SearchModifierTest_static_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SearchModifier_get_type');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SearchModifierTest_static_0020] SearchInstance type is: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('init SearchModifier1');
      console.info('[SearchModifierTest_static_0020] END');
      done();
    });
  })
}
