'use static'
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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function RichEditorUndefinedTest() {
  describe('RichEditorUndefined2', () => {
    beforeAll(() => {
      console.info("RichEditorUndefinedTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.richeditor.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorUndefined2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/richEditorUndefined2',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get richEditorUndefined2 state pages:" + JSON.stringify(pages));
        if (!("richEditorUndefined2" == pages.name)) {
          console.info("get richEditorUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push richEditorUndefined2 page error:" + err);
      }
      console.info("RichEditorUndefined2 beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   richEditorUndefined_static_2001
     * @tc.name     richEditorUndefined_static_2001
     * @tc.desc     test placeholder
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_2001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_2001] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('RichEditor');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('placeholder'))
        .assertEqual('');

      let changeBtn = await driver.findComponent(ON.id('RichEditor_placeholder'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      strJson = inspector.getInspectorByKey('RichEditor');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('placeholder'))
        .assertContain('hello');

      changeBtn = await driver.findComponent(ON.id('RichEditor_placeholder'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      strJson = inspector.getInspectorByKey('RichEditor');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('placeholder'))
        .assertContain('');
      console.info('[richEditorUndefined_static_2001] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_2002
     * @tc.name     richEditorUndefined_static_2002
     * @tc.desc     test stopBackPress
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_2002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_2002] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('RichEditor');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('stopBackPress'))
        .assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('RichEditor_stopBackPress'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('RichEditor');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('stopBackPress'))
        .assertEqual('true');
      console.info('[richEditorUndefined_static_2002] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_2003
     * @tc.name     richEditorUndefined_static_2003
     * @tc.desc     test onSelect
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_2003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_2003] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('RichEditor_resetText'));
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('RichEditor_text'));
      let richEditor = await driver.findComponent(ON.id('RichEditor'));
      await (text?.click() as Promise<void>);
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(3000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onSelect');
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let changeBtn = await driver.findComponent(ON.id('RichEditor_onSelect'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(3000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      console.info('[richEditorUndefined_static_2003] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_2004
     * @tc.name     richEditorUndefined_static_2004
     * @tc.desc     tet onSubmit
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_2004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_2004] START');
      let driver: Driver = Driver.create()
      let strJson = inspector.getInspectorByKey('RichEditor');
      let resetTextBtn = await driver.findComponent(ON.id('RichEditor_resetText'));
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('RichEditor_text'));
      let richEditor = await driver.findComponent(ON.id('RichEditor'));
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onSubmit');
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let changeBtn = await driver.findComponent(ON.id('RichEditor_onSubmit'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      console.info('[richEditorUndefined_static_2004] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_2005
     * @tc.name     richEditorUndefined_static_2005
     * @tc.desc     test onPaste
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_2005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_2005] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('RichEditor_resetText'));
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('RichEditor_text'));
      let richEditor = await driver.findComponent(ON.id('RichEditor'));
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2620);
      await driver.triggerKey(2622);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('RichEditor_text');
      expect(await (text?.getText() as Promise<String>)).assertEqual('onPaste');
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let changeBtn = await driver.findComponent(ON.id('RichEditor_onPaste'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2622);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_text');
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      console.info('[richEditorUndefined_static_2005] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_2006
     * @tc.name     richEditorUndefined_static_2006
     * @tc.desc     test onSelectionChange
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_2006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_2006] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('RichEditor_resetText'));
      let changeBtn = await driver.findComponent(ON.id('RichEditor_onSelectionChange'));
      await (changeBtn?.click() as Promise<void>);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('RichEditor_text'));
      let richEditor = await driver.findComponent(ON.id('RichEditor'));
      let changeBtn_set = await driver.findComponent(ON.id('RichEditor_setCaretOffset'));
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_set?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onSelectionChange');
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_set?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      console.info('[richEditorUndefined_static_2006] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_2007
     * @tc.name     richEditorUndefined_static_2007
     * @tc.desc     test onWillChange
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_2007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_2007] START');
      let driver: Driver = Driver.create()
      let resetTextBtn = await driver.findComponent(ON.id('RichEditor_resetText'));
      let changeBtn = await driver.findComponent(ON.id('RichEditor_onWillChange'));
      await (changeBtn?.click() as Promise<void>);
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('RichEditor_text'));
      let richEditor = await driver.findComponent(ON.id('RichEditor'));
      let changeBtn_set = await driver.findComponent(ON.id('RichEditor_setCaretOffset'));
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (changeBtn_set?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2071);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('onWillChange');
      await (resetTextBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (changeBtn_set?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2071);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<String>)).assertEqual('hello');
      console.info('[richEditorUndefined_static_2007] END');
      done();
    });
  })
}