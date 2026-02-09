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
import {UtilsTest,startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorOnWillChange018() {
  describe('RichEditorOnWillChange018', () => {
    beforeAll(() => {
      console.info("RichEditorOnWillChange018 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorOnWillChange018 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange018',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorOnWillChange018 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange018" == pages.name)) {
          console.info("get RichEditorOnWillChange018 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange018 success");
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange018 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);

      let int_callback_status = await (driver.findComponent(ON.id('int_callback_status')) as Promise<Component>);
      int_callback_status.click();
      await CommonFunc.sleep(500);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012 int_callback_status');
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012 pointCenter1');
      let selectAll = await (driver.findComponent(ON.text('全选')) as Promise<Component>);
      await selectAll.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012 selectAll');
      let copy = await (driver.findComponent(ON.text('剪切')) as Promise<Component>);
      await copy.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012 copy');
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012 pointCenter');
     try{
       let paste = await (driver.findComponent(ON.text('粘贴')) as Promise<Component>);
       await paste.click();
     }catch(e){}
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_static_0012 paste');
      let onWillChange = await (driver.findComponent(ON.id('onWillChange_callback')) as Promise<Component>);
      let onWillText = await onWillChange.getText();

      let replacedSpans_callback = await (driver.findComponent(ON.id('replacedSpans_callback')) as Promise<Component>);
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await (driver.findComponent(ON.id('onDidChange_callback')) as Promise<Component>);
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);

      expect(onWillText).assertEqual('onWillChange_callback:false');
      expect(replaceText).assertEqual('replacedSpans_callback:false');
      expect(didText).assertEqual('onDidChange_callback:false');

      done();
    });

  })
}


