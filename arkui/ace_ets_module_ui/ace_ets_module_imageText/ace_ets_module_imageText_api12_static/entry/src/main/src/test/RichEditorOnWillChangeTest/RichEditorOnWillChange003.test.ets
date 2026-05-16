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
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
import {UtilsTest,startAbility} from '../Util.test'
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorOnWillChange003() {
  describe('RichEditorOnWillChange003', () => {
    beforeAll(() => {
      console.info("RichEditorOnWillChange003 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorOnWillChange003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange003',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorOnWillChange003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange003" == pages.name)) {
          console.info("get RichEditorOnWillChange003 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange003 success");
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange003 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0003
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0003
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0003
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0003 START');
      let driver = Driver.create();
      await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);
      await CommonFunc.sleep(500);

      let add_text = await (driver.findComponent(ON.id('add_text')) as Promise<Component>);
      add_text.click();
      await CommonFunc.sleep(500);
      let onWillChange = await (driver.findComponent(ON.id('onWillChange_callback')) as Promise<Component>);
      let onWillText = await onWillChange.getText();

      let replacedSpans_callback = await (driver.findComponent(ON.id('replacedSpans_callback')) as Promise<Component>);
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await (driver.findComponent(ON.id('onDidChange_callback')) as Promise<Component>);
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);
      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(replaceText).assertEqual('replacedSpans_callback:true');
      expect(didText).assertEqual('onDidChange_callback:false');

      done();
    });

  })
}


