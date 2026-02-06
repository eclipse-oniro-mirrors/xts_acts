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
import {UtilsTest,startAbility} from '../Util.test';
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
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function onSelectionChange3() {
  describe('onSelectionChange3', () => {
    beforeAll(() => {
      console.info("onSelectionChange3 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("onSelectionChange3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange3',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get onSelectionChange3 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange3" == pages.name)) {
          console.info("get onSelectionChange3 pages.name:" + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange3 page result");
        }
      } catch (err) {
        console.error("push onSelectionChange3 page error:" + err);
      }
      console.info("onSelectionChange3 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange3 after each called");
    });
    
    /**
     * @tc.number   onSelectionChange3_static_0100
     * @tc.name     onSelectionChange3_static_0100
     * @tc.desc     onSelectionChange3_static_0100
     * @tc.level   Level.LEVEL0
     */
    it('onSelectionChange3_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onSelectionChange3_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await (driver.findComponent(ON.id('onSelectionChange3_RichEditor')) as Promise<Component>);
      await richEditor.longClick();
      await CommonFunc.sleep(1000);
      let text1_1 = inspector.getInspectorByKey('onSelectionChange3_text1');
      let Obj1_1 = JSON.parseJsonElement(text1_1);
      expect(Obj1_1.getElement('$attrs').getString('content')).assertEqual('1');

      let copy = await (driver.findComponent(ON.text('复制')) as Promise<Component>)
      if (!copy) {
        richEditor.click();
        await CommonFunc.sleep(1000);
        copy = await (driver.findComponent(ON.text('复制')) as Promise<Component>)
      }
      await copy.click()
      await CommonFunc.sleep(1000);
      let text1_2 = inspector.getInspectorByKey('onSelectionChange3_text1');
      let Obj1_2 = JSON.parseJsonElement(text1_2);
      expect(Obj1_2.getElement('$attrs').getString('content')).assertEqual('1');
      await CommonFunc.sleep(2500);

      await richEditor.longClick();
      await CommonFunc.sleep(1000);
      let paste = await (driver.findComponent(ON.text('粘贴')) as Promise<Component>)
      if (!paste) {
        richEditor.click();
        await CommonFunc.sleep(1000);
        paste = await (driver.findComponent(ON.text('粘贴')) as Promise<Component>)
      }
      await paste.click()
      await CommonFunc.sleep(1000);
      let text1_3 = inspector.getInspectorByKey('onSelectionChange3_text1');
      let Obj1_3 = JSON.parseJsonElement(text1_3);
      expect(Obj1_3.getElement('$attrs').getString('content')).assertEqual('2');

      console.info('[onSelectionChange3_static_0100] END');
      done();
    });

  })
}
