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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import {MessageManager,Callback,Message} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
import {UtilsTest,startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorPreventDefault001() {
  describe('RichEditorPreventDefault001', () => {
    beforeAll(() => {
      console.info("RichEditorPreventDefault001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorPreventDefault001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault001',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorPreventDefault001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault001" == pages.name)) {
          console.info("get RichEditorPreventDefault001 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorPreventDefault001 success");
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault001 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0002
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0002
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0002
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0002 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorPreventDefault001')) as Promise<Component>);
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);

      await driver.click(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      await driver.click(getBounds.left + 80, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      let textCall = await (driver.findComponent(ON.id('textCall')) as Promise<Component>);
      let textCallText = await textCall.getText();
      await CommonFunc.sleep(500);
      expect(textCallText).assertContain('textCall');

      let imageCall = await (driver.findComponent(ON.id('imageCall')) as Promise<Component>);
      let imageCallText = await imageCall.getText();
      await CommonFunc.sleep(500);
      expect(imageCallText).assertContain('imageCall');
      done();
    });

  })
}


