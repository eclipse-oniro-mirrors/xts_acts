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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import { Driver, ON} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common'
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



export default function textCaretColor() {
  describe('textCaretColor', () => {
    beforeAll(() => {
      console.info("textCaretColor beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api14.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textCaretColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/textCaretColor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textCaretColor state pages:" + "");
        if (!("textCaretColor" == pages.name)) {
          console.info("get textCaretColor pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textCaretColor page error:" + err);
      }
      console.info("textCaretColor beforeEach end");
    });
    
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textCaretColor after each called");
    });

    
    

    /**
     * @tc.number   textCaretColor_static_0001
     * @tc.name     textCaretColor_static_0001
     * @tc.desc     textCaretColor_static_0001
     * @tc.level    Level.LEVEL1
     */
it('textCaretColor_static_0001', Level.LEVEL1, async () => {
      console.info('textCaretColor0001 START');
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textCaretColor0001] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[textCaretColor0001] caretColor: " + JSON.stringify(obj.getElement('$attrs').getString('caretColor')));
      console.info("[textCaretColor0001] selectedBackgroundColor: " + obj.getElement('$attrs').getString('selectedBackgroundColor'));
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual('#33008000');
      console.info('[textCaretColor0001] END');
    });
  })
}
