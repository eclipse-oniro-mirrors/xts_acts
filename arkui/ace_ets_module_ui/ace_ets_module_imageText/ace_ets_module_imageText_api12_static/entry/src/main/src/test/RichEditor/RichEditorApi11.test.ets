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
export default function RichEditorApi11() {
  describe('RichEditorApi11', () => {
    beforeAll(() => {
       console.info("RichEditorOnWillChange001 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorApi11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorApi11',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorApi11 state pages:" + JSON.stringify(pages));
        if (!("RichEditorApi11" == pages.name)) {
          console.info("get RichEditorApi11 pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorApi11 page result");
        }
      } catch (err) {
        console.error("push RichEditorApi11 page error:" + err);
      }
      console.info("RichEditorApi11 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
    });

    
    /**
     * @tc.number   RichEditorApi11_static_0100
     * @tc.name     RichEditorApi11_static_0100
     * @tc.desc     RichEditorApi11_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('RichEditorApi11_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RichEditorApi11_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('RichEditorApi11_btn1',10,"")
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('RichEditorApi11_text1');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')) ).assertEqual('[0,5]')

      await CommonFunc.sleep(1000);

      console.info('RichEditorApi11_static_0100 END');
      done();
    });

  })
}