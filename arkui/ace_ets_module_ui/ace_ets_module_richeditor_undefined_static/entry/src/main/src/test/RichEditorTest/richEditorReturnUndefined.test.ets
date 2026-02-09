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
  describe('richEditorReturnUndefined', () => {
    beforeAll(() => {
      console.info("RichEditorReturnUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.richeditor.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("richEditorReturnUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/richEditorReturnUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get richEditorReturnUndefined state pages:" + JSON.stringify(pages));
        if (!("richEditorReturnUndefined" == pages.name)) {
          console.info("get richEditorReturnUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push richEditorReturnUndefined page error:" + err);
      }
      console.info("RichEditorReturnUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0001
     * @tc.name     richEditorReturnUndefined_static_0001
     * @tc.desc     test addBuilderSpan
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0001] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_addBuilderSpan'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_addBuilderSpan'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0002
     * @tc.name     richEditorReturnUndefined_static_0002
     * @tc.desc     test addImageSpan
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0002] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_addImageSpan'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_addImageSpan'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0003
     * @tc.name     richEditorReturnUndefined_static_0003
     * @tc.desc     test addSymbolSpan
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0003] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_addSymbolSpan'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_addSymbolSpan'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0004
     * @tc.name     richEditorReturnUndefined_static_0004
     * @tc.desc     test addTextSpan
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0004] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_addTextSpan'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_addTextSpan'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0005
     * @tc.name     richEditorReturnUndefined_static_0005
     * @tc.desc     test getCaretOffset
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0005] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getCaretOffset'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getCaretOffset'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0005] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0006
     * @tc.name     richEditorReturnUndefined_static_0006
     * @tc.desc     test getStyledString
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0006] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getStyledString'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getStyledString'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0006] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0007
     * @tc.name     richEditorReturnUndefined_static_0007
     * @tc.desc     test getLayoutManager
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0007] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getLayoutManager'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getLayoutManager'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0007] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0008
     * @tc.name     richEditorReturnUndefined_static_0008
     * @tc.desc     test getParagraphs
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0008] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getParagraphs'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getParagraphs'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0008] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0009
     * @tc.name     richEditorReturnUndefined_static_0009
     * @tc.desc     test getPreviewText
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0009] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getPreviewText'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getPreviewText'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0009] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0010
     * @tc.name     richEditorReturnUndefined_static_0010
     * @tc.desc     test getSelection
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0010] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getSelection'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getSelection'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0010] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0011
     * @tc.name     richEditorReturnUndefined_static_0011
     * @tc.desc     test getSelection for RichEditorStyledStringController
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0011] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getSelection2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getSelection2'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0011] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0012
     * @tc.name     richEditorReturnUndefined_static_0012
     * @tc.desc     test getSpans
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0012] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getSpans'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getSpans'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0012] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0013
     * @tc.name     richEditorReturnUndefined_static_0013
     * @tc.desc     test getTypingStyle
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0013] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_getTypingStyle'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_getTypingStyle'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0013] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0014
     * @tc.name     richEditorReturnUndefined_static_0014
     * @tc.desc     test setCaretOffset
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0014] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_setCaretOffset'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_setCaretOffset'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0014] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0015
     * @tc.name     richEditorReturnUndefined_static_0015
     * @tc.desc     test fromStyledString
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0015] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_fromStyledString'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_fromStyledString'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0015] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0016
     * @tc.name     richEditorReturnUndefined_static_0016
     * @tc.desc     test toStyledString
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0016] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_toStyledString'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_toStyledString'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0016] END');
      done();
    });

    /**
     * @tc.number   richEditorReturnUndefined_static_0017
     * @tc.name     richEditorReturnUndefined_static_0017
     * @tc.desc     test isEditing
     * @tc.level    Level.LEVEL1
     */
    it('richEditorReturnUndefined_static_0017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorReturnUndefined_static_0017] START');
      let driver: Driver = Driver.create()
      let btn = await driver.findComponent(ON.id('Btn_isEditing'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let text = await driver.findComponent(ON.id('Text_isEditing'));
      expect(await (text?.getText() as Promise<String>)).assertEqual('undefined');

      console.info('[richEditorReturnUndefined_static_0017] END');
      done();
    });
  })
}