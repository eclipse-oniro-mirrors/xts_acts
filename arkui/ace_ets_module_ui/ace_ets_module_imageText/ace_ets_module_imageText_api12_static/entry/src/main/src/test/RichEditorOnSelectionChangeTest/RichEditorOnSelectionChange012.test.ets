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
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorOnSelectionChange012() {
  describe('RichEditorOnSelectionChange012', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorOnSelectionChange012 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnSelectionChange/RichEditorOnSelectionChange012',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorOnSelectionChange012 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnSelectionChange012" == pages.name)) {
          console.info("get RichEditorOnSelectionChange012 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnSelectionChange012 success");
        }
      } catch (err) {
        console.error("push RichEditorOnSelectionChange012 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_static_0030
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_static_0030
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_static_0030
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_static_0030 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('rich_struct')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let selectAll = await (driver.findComponent(ON.text('全选')) as Promise<Component>)
      await selectAll.click();
      await CommonFunc.sleep(1000);

      let onSelectCallBack = await (driver.findComponent(ON.id('onSelectCallBack')) as Promise<Component>);
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertEqual('onSelectCallBack:true');

      let message = await (driver.findComponent(ON.id('message')) as Promise<Component>);
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText.indexOf('message:') == 0).assertEqual(true);
      expect(messageText.indexOf('"start":0') > 0).assertEqual(true);
      expect(messageText.indexOf('"end":1') > 0).assertEqual(true);

      let copy = await (driver.findComponent(ON.text('复制')) as Promise<Component>)
      await copy.click();
      await CommonFunc.sleep(1000);

      let set1 = await (driver.findComponent(ON.id('set1')) as Promise<Component>)
      await set1.click();
      await CommonFunc.sleep(1000);

      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let paste = await (driver.findComponent(ON.text('粘贴')) as Promise<Component>)
      await paste.click();
      await CommonFunc.sleep(1000);

      onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertEqual('onSelectCallBack:true');

      messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText.indexOf('message:') == 0).assertEqual(true);
      expect(messageText.indexOf('"start":2') > 0).assertEqual(true);
      expect(messageText.indexOf('"end":2') > 0).assertEqual(true);
      done();
    });

  })
}


