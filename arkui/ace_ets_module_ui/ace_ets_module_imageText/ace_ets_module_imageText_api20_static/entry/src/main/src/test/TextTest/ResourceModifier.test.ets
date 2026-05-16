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
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function ResourceModifierTest() {
  describe('ResourceModifierTest', () => {
    beforeAll(() => {
      console.info("ResourceModifierTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("ResourceModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/ResourceModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ResourceModifierTest state success " + JSON.stringify(pages));
        routerInstance.replaceUrl(options);
        if (!("ResourceModifier" == pages.name)) {
          console.info("get ResourceModifierTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ResourceModifierTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ResourceModifierTest after each called");
    });

    
    /**
     * @tc.number   ResourceModifierTest_static_0010
     * @tc.name     ResourceModifierTest_static_0010
     * @tc.desc     ResourceModifierTest_static_0010
     * @tc.level   Level.LEVEL3
     */
    it('ResourceModifierTest_static_0010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('ResourceModifierTest_static_0010 START');
      let getObj = await driver.findComponent(ON.id('getObj_Modifier'))
      await CommonFunc.sleep(500);
      await (getObj?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get<string>('TextLetterSpacing')).assertEqual('0.00vp');
      expect(''+AppStorage.get<string>('TextBaselineOffset')).assertEqual('0');
      expect(''+AppStorage.get<string>('TextFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get<string>('TextInputFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get<string>('TextAreaFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get<string>('SpanLetterSpacing')).assertEqual('0.00fp');
      expect(''+AppStorage.get<string>('SpanFontWeight')).assertEqual('FontWeight.Normal');
      expect(''+AppStorage.get<string>('SearchSearchButton')).assertEqual('Search_Test');
      AppStorage.delete('TextLetterSpacing');
      AppStorage.delete('TextBaselineOffset');
      AppStorage.delete('TextFontWeight');
      AppStorage.delete('TextInputFontWeight');
      AppStorage.delete('TextAreaFontWeight');
      AppStorage.delete('SpanLetterSpacing');
      AppStorage.delete('SpanFontWeight');
      AppStorage.delete('SearchSearchButton');
      console.info("[ResourceModifierTest_static_0010] end");
      done();
    });

    
    /**
     * @tc.number   ResourceModifierTest_static_0020
     * @tc.name     ResourceModifierTest_static_0020
     * @tc.desc     ResourceModifierTest_static_0020
     * @tc.level   Level.LEVEL3
     */
    it('ResourceModifierTest_static_0020', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('ResourceModifierTest_static_0020 START');
      let change = await driver.findComponent(ON.id('change_Modifier'))
      await CommonFunc.sleep(500);
      await (change?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('getObj_Modifier'))
      await CommonFunc.sleep(500);
      await (getObj?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get<string>('TextLetterSpacing')).assertEqual('0.00px');
      expect(''+AppStorage.get<string>('TextBaselineOffset')).assertEqual('0');
      expect(''+AppStorage.get<string>('TextFontWeight')).assertEqual('400');
      expect(''+AppStorage.get<string>('TextInputFontWeight')).assertEqual('400');
      expect(''+AppStorage.get<string>('TextAreaFontWeight')).assertEqual('400');
      expect(''+AppStorage.get<string>('SpanLetterSpacing')).assertEqual('0.00fp');
      expect(''+AppStorage.get<string>('SpanFontWeight')).assertEqual('400');
      expect(''+AppStorage.get<string>('SearchSearchButton')).assertEqual('搜索');
      AppStorage.delete('TextLetterSpacing');
      AppStorage.delete('TextBaselineOffset');
      AppStorage.delete('TextFontWeight');
      AppStorage.delete('TextInputFontWeight');
      AppStorage.delete('TextAreaFontWeight');
      AppStorage.delete('SpanLetterSpacing');
      AppStorage.delete('SpanFontWeight');
      AppStorage.delete('SearchSearchButton');
      console.info("[ResourceModifierTest0002] end");
      done();
    });

    
    /**
     * @tc.number   ResourceModifierTest_static_0030
     * @tc.name     ResourceModifierTest_static_0030
     * @tc.desc     ResourceModifierTest_static_0030
     * @tc.level   Level.LEVEL3
     */
    it('ResourceModifierTest_static_0030', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('ResourceModifierTest_static_0030 START');
      let change = await driver.findComponent(ON.id('change_Modifier'))
      await CommonFunc.sleep(500);
      await (change?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (change?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let getObj = await driver.findComponent(ON.id('getObj_Modifier'))
      await CommonFunc.sleep(500);
      await (getObj?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get<string>('TextLetterSpacing')).assertEqual('20.00vp');
      expect(''+AppStorage.get<string>('TextBaselineOffset')).assertEqual('50');
      expect(''+AppStorage.get<string>('TextFontWeight')).assertEqual('900');
      expect(''+AppStorage.get<string>('TextInputFontWeight')).assertEqual('900');
      expect(''+AppStorage.get<string>('TextAreaFontWeight')).assertEqual('900');
      expect(''+AppStorage.get<string>('SpanLetterSpacing')).assertEqual('20.00fp');
      expect(''+AppStorage.get<string>('SpanFontWeight')).assertEqual('900');
      expect(''+AppStorage.get<string>('SearchSearchButton')).assertEqual('100.000000');
      AppStorage.delete('TextLetterSpacing');
      AppStorage.delete('TextBaselineOffset');
      AppStorage.delete('TextFontWeight');
      AppStorage.delete('TextInputFontWeight');
      AppStorage.delete('TextAreaFontWeight');
      AppStorage.delete('SpanLetterSpacing');
      AppStorage.delete('SpanFontWeight');
      AppStorage.delete('SearchSearchButton');
      console.info("[ResourceModifierTest_static_0030] end");
      done();
    });
  })
}