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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RichEditorMaxLengthTest() {
  describe('RichEditorMaxLengthTest', () => {
    beforeAll(() => {
      console.info("RichEditorMaxLengthTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorMaxLengthTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorMaxLengthTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditorMaxLengthTest state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get RichEditorMaxLengthTest pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RichEditorMaxLengthTest page error:" + err);
      }
      console.info("RichEditorMaxLengthTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorMaxLengthTest after each called");
    });

    
    /**
     * @tc.number   RichEditorMaxLengthTest_static_0001
     * @tc.name     RichEditorMaxLengthTest_static_0001
     * @tc.desc     RichEditorMaxLengthTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLengthTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorMaxLengthTest0001 START');
      await CommonFunc.sleep(1000);


        let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
        await CommonFunc.sleep(500);
        await (richEditor?.inputText('012345678910') as  Promise<void>)
        await CommonFunc.sleep(500);
        let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
        await CommonFunc.sleep(500);
        await (getRichTextContent?.click() as  Promise<void>)
        await CommonFunc.sleep(500);
        expect(AppStorage.get<string>('RichEditorMaxLength')).assertEqual('012345678910');

      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0001] end");
      done();
    });

    
    /**
     * @tc.number   RichEditorMaxLengthTest_static_0002
     * @tc.name     RichEditorMaxLengthTest_static_0002
     * @tc.desc     RichEditorMaxLengthTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLengthTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorMaxLengthTest0002 START');
      await CommonFunc.sleep(1000);


        let setMaxLength = await driver.findComponent(ON.id('setMaxLength1'))
        await CommonFunc.sleep(500);
        await (setMaxLength?.click() as  Promise<void>)
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
        await CommonFunc.sleep(500);
        await (richEditor?.inputText('012345678910') as  Promise<void>)
        await CommonFunc.sleep(500);
        let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
        await CommonFunc.sleep(500);
        await (getRichTextContent?.click() as  Promise<void>)
        await CommonFunc.sleep(500);
        expect(AppStorage.get<string>('RichEditorMaxLength')).assertEqual('01234');

      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0002] end");
      done();
    });

    
    /**
     * @tc.number   RichEditorMaxLengthTest_static_0003
     * @tc.name     RichEditorMaxLengthTest_static_0003
     * @tc.desc     RichEditorMaxLengthTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLengthTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info(' RichEditorMaxLengthTest0003 START');
      await CommonFunc.sleep(1000);


        let setMaxLength = await driver.findComponent(ON.id('setMaxLength2'))
        await CommonFunc.sleep(500);
        await (setMaxLength?.click() as  Promise<void>)
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
        await CommonFunc.sleep(500);
        await (richEditor?.inputText('012345678910') as  Promise<void>)
        await CommonFunc.sleep(500);
        let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
        await CommonFunc.sleep(500);
        await (getRichTextContent?.click() as  Promise<void>)
        await CommonFunc.sleep(500);
        expect(AppStorage.get<string>('RichEditorMaxLength')).assertEqual('012345678910');

      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0003] end");
      done();
    });

    
    /**
     * @tc.number   RichEditorMaxLengthTest_static_0004
     * @tc.name     RichEditorMaxLengthTest_static_0004
     * @tc.desc     RichEditorMaxLengthTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('RichEditorMaxLengthTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info(' RichEditorMaxLengthTest0004 START');
      await CommonFunc.sleep(1000);


        let setMaxLength = await driver.findComponent(ON.id('setMaxLength3'))
        await CommonFunc.sleep(500);
        await (setMaxLength?.click() as  Promise<void>)
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('MaxLengthRichText'))
        await CommonFunc.sleep(500);
        await (richEditor?.inputText('012345678910') as  Promise<void>)
        await CommonFunc.sleep(500);
        let getRichTextContent = await driver.findComponent(ON.id('getRichTextContent'))
        await CommonFunc.sleep(500);
        await (getRichTextContent?.click() as  Promise<void>)
        await CommonFunc.sleep(500);
        expect(AppStorage.get<string>('RichEditorMaxLength')).assertEqual('0123456');

      AppStorage.delete('RichEditorMaxLength')
      console.info("[RichEditorMaxLengthTest0004] end");
      done();
    });
  })
}