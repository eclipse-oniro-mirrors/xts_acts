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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textSelectableJsunit() {
  describe('textSelectableJsunit', () => {
    beforeAll(() => {
      console.info("textSelectableJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textSelectableJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/textSelectable",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textSelectableJsunit state pages:" + JSON.stringify(pages));
        if (!("textSelectable" == pages.name)) {
          console.info("get textSelectableJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textSelectableJsunit page error:" + err);
      }
      console.info("textSelectableJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" textSelectableJsunit after each called");
    });

    
    /**
     * @tc.number   textSelectableJsunit_static_0100
     * @tc.name     textSelectableJsunit_static_0100
     * @tc.desc     textSelectableJsunit_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('textSelectableJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textSelectableJsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textSelectable_mess');
      let obj  = JSON.parseJsonElement(strJson);
      console.info("[textSelectableJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textSelectableJsunit_0100] textSelectable: " + JSON.stringify(obj.getElement('$attrs').getString('textSelectable')));
      expect(obj.getElement('$attrs').getString('textSelectable')).assertEqual('selectable-focusable');
      console.info('[textSelectableJsunit_0100] END');
      done();
    });

  })
}