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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RichEditorSymbolSpanStyleTest() {
  describe('RichEditorSymbolSpanStyleTest', () => {
    beforeAll(() => {
      console.info("RichEditorSymbolSpanStyleTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorSymbolSpanStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorSymbolSpanStyleTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get RichEditorSymbolSpanStyleTest state pages:" + JSON.stringify(pages));
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("push RichEditorSymbolSpanStyleTest page error:" + err);
      }
      console.info("RichEditorSymbolSpanStyleTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorSymbolSpanStyleTest after each called");
    });


    
    
    


/**
     * @tc.number   RichEditorSymbolSpanStyleTest_static_0001
     * @tc.name     RichEditorSymbolSpanStyleTest_static_0001
     * @tc.desc     RichEditorSymbolSpanStyleTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('RichEditorSymbolSpanStyleTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorSymbolSpanStyleTest0001 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan1'))
      await CommonFunc.sleep(500);
      await (addSymbolSpan?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await (getSymbolSpanStyle?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get<string>('symbolSpanStyleFontColor')).assertEqual('#FFFF0000');
      expect('' + AppStorage.get<string>('symbolSpanStyleFontSize')).assertEqual('30');
      expect('' + AppStorage.get<string>('symbolSpanStyleFontWeight')).assertEqual('1');
      expect('' + AppStorage.get<string>('symbolSpanStyleEffectStrategy')).assertEqual('0');
      expect('' + AppStorage.get<string>('symbolSpanStyleSpanIndex')).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0001] end");
      done();
    });


    
    
    


/**
     * @tc.number   RichEditorSymbolSpanStyleTest_static_0002
     * @tc.name     RichEditorSymbolSpanStyleTest_static_0002
     * @tc.desc     RichEditorSymbolSpanStyleTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('RichEditorSymbolSpanStyleTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorSymbolSpanStyleTest0002 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan2'))
      await CommonFunc.sleep(500);
      await (addSymbolSpan?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await (getSymbolSpanStyle?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get<string>('symbolSpanStyleFontColor'))
        .assertEqual('#FFFF0000,#FF0000FF,#FFFFC0CB');
      expect('' + AppStorage.get<string>('symbolSpanStyleFontSize')).assertEqual('40');
      expect('' + AppStorage.get<string>('symbolSpanStyleFontWeight')).assertEqual('10');
      expect('' + AppStorage.get<string>('symbolSpanStyleEffectStrategy')).assertEqual('0');
      expect('' + AppStorage.get<string>('symbolSpanStyleSpanIndex')).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0002] end");
      done();
    });


    
    
    


/**
     * @tc.number   RichEditorSymbolSpanStyleTest_static_0003
     * @tc.name     RichEditorSymbolSpanStyleTest_static_0003
     * @tc.desc     RichEditorSymbolSpanStyleTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('RichEditorSymbolSpanStyleTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info(' RichEditorSymbolSpanStyleTest0003 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan3'))
      await CommonFunc.sleep(500);
      await (addSymbolSpan?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await (getSymbolSpanStyle?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      expect('' + AppStorage.get<string>('symbolSpanStyleFontColor'))
        .assertEqual('#FFF04B3D,#FF0000FF,#FFFFC0CB');
      expect('' + AppStorage.get<string>('symbolSpanStyleFontSize')).assertEqual('50');
      expect('' + AppStorage.get<string>('symbolSpanStyleFontWeight')).assertEqual('8');
      expect('' + AppStorage.get<string>('symbolSpanStyleEffectStrategy')).assertEqual('0');
      expect('' + AppStorage.get<string>('symbolSpanStyleSpanIndex')).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0003] end");
      done();
    });

  })
}