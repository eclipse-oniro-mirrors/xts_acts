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
export default function onSelectionChange9() {
  describe('onSelectionChange9', () => {
    beforeAll(() => {
      console.info("onSelectionChange9 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("onSelectionChange9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange9',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get onSelectionChange9 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange9" == pages.name)) {
          console.info("get onSelectionChange9 pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange9 page result");
        }
      } catch (err) {
        console.error("push onSelectionChange9 page error:" + err);
      }
      console.info("onSelectionChange9 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange9 after each called");
    });
    
    /**
     * @tc.number   onSelectionChange9_static_0100
     * @tc.name     onSelectionChange9_static_0100
     * @tc.desc     onSelectionChange9_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('onSelectionChange9_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onSelectionChange9_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await (driver.findComponent(ON.id('onSelectionChange9_RichEditor')) as Promise<Component>);
      await richEditor.click();
      await CommonFunc.sleep(1000);

      let text0 = inspector.getInspectorByKey('onSelectionChange9_text1');
      let Obj0 = JSON.parseJsonElement(text0);
      expect(Obj0.getElement('$attrs').getString('content')).assertEqual('1');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let text1 = inspector.getInspectorByKey('onSelectionChange9_text1');
      let Obj1 = JSON.parseJsonElement(text1);
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('1');

      console.info('[onSelectionChange9_static_0100] END');
      done();
    });

  })
}
