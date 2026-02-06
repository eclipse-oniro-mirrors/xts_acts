'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function alphabetAlignStyleTest() {
  describe('alphabetAlignStyleTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("alphabetAlignStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/alphabetAlignStyle",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info("get alphabetAlignStyleTest state pages:" + JSON.stringify(pages));
        if (!("alphabetAlignStyle" == pages.name)) {
          console.info("get alphabetAlignStyleTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push alphabetAlignStyleTest page result:");
        }
      } catch (err) {
        console.error("push alphabetAlignStyleTest page error:" + err);
      }
      console.info("alphabetAlignStyleTest beforeEach end");
    });

    
    /**
     * @tc.number   testAlphabetAlignStyle_static_001
     * @tc.name     testAlphabetAlignStyle_static_001
     * @tc.desc     testAlphabetAlignStyle_static_001
     * @tc.level    Level.LEVEL0
     */
it('testAlphabetAlignStyle_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testName: string = '[testAlphabetAlignStyle_static_001]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let startBtn = await driver.findComponent(ON.id('START'));
      await (startBtn?.click() as Promise<void>);
      console.log(`${testName} startBtn click`);
      await driver.delayMs(1000);
      let autoBtn = await driver.findComponent(ON.id('Auto'));
      await (autoBtn?.click() as Promise<void>);
      console.log(`${testName} autoBtn click`);
      await driver.delayMs(1000);
      let autoBBtn = await driver.findComponent(ON.text('B'));
      await (autoBBtn?.click() as Promise<void>);
      console.log(`${testName} autoBBtn click`);
      await driver.delayMs(1000);
      let autoBaiBtnList = await driver.findComponents(ON.text('白'));
      let autoBaiBtn = autoBaiBtnList![autoBaiBtnList!.length - 1];
      let autoRect = await (autoBaiBtn?.getBounds() as Promise<Rect>);
      console.log(`${testName} autoRect :${JSON.stringify(autoRect)}`);
      await driver.delayMs(1000);
      let rtlBtn = await driver.findComponent(ON.id('Rtl'));
      await (rtlBtn?.click() as Promise<void>);
      console.log(`${testName} rtlBtn click`);
      await driver.delayMs(1000);
      let rtlBBtn = await driver.findComponent(ON.text('B'));
      await (rtlBBtn?.click() as Promise<void>);
      console.log(`${testName} rtlBBtn click`);
      await driver.delayMs(1000);
      let rtlBaiBtnList = await driver.findComponents(ON.text('白'));
      let rtlBaiBtn = rtlBaiBtnList![rtlBaiBtnList!.length - 1];
      let rtlRect = await (rtlBaiBtn?.getBounds() as Promise<Rect>);
      console.log(`${testName} rtlRect :${JSON.stringify(rtlRect)}`);
      await driver.delayMs(1000);
      expect(autoRect.left === rtlRect.left).assertFalse();
      console.log(`${testName} end`);
      done();
    });


    
    /**
     * @tc.number   testAlphabetAlignStyle_static_002
     * @tc.name     testAlphabetAlignStyle_static_002
     * @tc.desc     testAlphabetAlignStyle_static_002
     * @tc.level    Level.LEVEL0
     */
it('testAlphabetAlignStyle_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testName: string = '[testAlphabetAlignStyle_static_002]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let endBtn = await driver.findComponent(ON.id('END'));
      await (endBtn?.click() as Promise<void>);
      console.log(`${testName} endBtn click`);
      await driver.delayMs(1000);
      let autoBtn = await driver.findComponent(ON.id('Auto'));
      await (autoBtn?.click() as Promise<void>);
      console.log(`${testName} autoBtn click`);
      await driver.delayMs(1000);
      let autoBBtn = await driver.findComponent(ON.text('B'));
      await (autoBBtn?.click() as Promise<void>);
      console.log(`${testName} autoBBtn click`);
      await driver.delayMs(1000);
      let autoBaiBtnList = await driver.findComponents(ON.text('白'));
      let autoBaiBtn = autoBaiBtnList![autoBaiBtnList!.length - 1];
      let autoRect = await (autoBaiBtn?.getBounds() as Promise<Rect>);
      console.log(`${testName} autoRect :${JSON.stringify(autoRect)}`);
      await driver.delayMs(1000);
      let rtlBtn = await driver.findComponent(ON.id('Rtl'));
      await (rtlBtn?.click() as Promise<void>);
      console.log(`${testName} rtlBtn click`);
      await driver.delayMs(1000);
      let rtlBBtn = await driver.findComponent(ON.text('B'));
      await (rtlBBtn?.click() as Promise<void>);
      console.log(`${testName} rtlBBtn click`);
      await driver.delayMs(1000);
      let rtlBaiBtnList = await driver.findComponents(ON.text('白'));
      let rtlBaiBtn = rtlBaiBtnList![rtlBaiBtnList!.length - 1];
      let rtlRect = await (rtlBaiBtn?.getBounds() as Promise<Rect>);
      console.log(`${testName} rtlRect :${JSON.stringify(rtlRect)}`);
      await driver.delayMs(1000);
      expect(autoRect.left === rtlRect.left).assertFalse();
      console.log(`${testName} end`);
      done();
    });
  })
}
