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
import { describe, beforeEach,beforeAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextAreaGetTextTest() {
  describe('TextAreaGetTextTest', () => {
    beforeAll(() => {
      console.info("TextAreaGetTextTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextAreaGetTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/TextAreaGetText",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextAreaGetTextTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextAreaGetTextTest pages.name:" + JSON.stringify(pages.name));
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push TextAreaGetTextTest page error:" + err);
      }
      console.info("TextAreaGetTextTest beforeEach end");
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0010
     * @tc.name     TextAreaGetTextTest_static_0010
     * @tc.desc     TextAreaGetTextTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0010', Level.LEVEL0, async (done: ()=>void) => {      console.info('TextAreaGetTextTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_getText_1')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0010] getText1:" + JSON.stringify(AppStorage.get<string>('getText_1')));
      expect(AppStorage.get<string>('getText_1')).assertEqual('cd');
      AppStorage.delete('getText_1')
      console.info('[TextAreaGetTextTest_0010] END');
      done();
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0020
     * @tc.name     TextAreaGetTextTest_static_0020
     * @tc.desc     TextAreaGetTextTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0020', Level.LEVEL0, async (done: ()=>void) => {      console.info('[TextAreaGetTextTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_getText_2')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0010] getText2:" + JSON.stringify(AppStorage.get<string>('getText_2')));
      expect(AppStorage.get<string>('getText_2')).assertEqual('bcdef');
      AppStorage.delete('getText_2')
      console.info('[TextAreaGetTextTest_0020] END');
      done();
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0030
     * @tc.name     TextAreaGetTextTest_static_0030
     * @tc.desc     TextAreaGetTextTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0030', Level.LEVEL0, async (done: ()=>void) => {      console.info('[TextAreaGetTextTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_getText_3')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0030] getText3:" + JSON.stringify(AppStorage.get<string>('getText_3')));
      expect(AppStorage.get<string>('getText_3')).assertEqual('abc');
      AppStorage.delete('getText_3')
      console.info('[TextAreaGetTextTest_0030] END');
      done();
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0040
     * @tc.name     TextAreaGetTextTest_static_0040
     * @tc.desc     TextAreaGetTextTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0040', Level.LEVEL0, async (done: ()=>void) => {      console.info('[TextAreaGetTextTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_getText_4')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0040] getText4:" + JSON.stringify(AppStorage.get<string>('getText_4')));
      expect(AppStorage.get<string>('getText_4')).assertEqual('abcdef');
      AppStorage.delete('getText_4')
      console.info('[TextAreaGetTextTest_0040] END');
      done();
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0050
     * @tc.name     TextAreaGetTextTest_static_0050
     * @tc.desc     TextAreaGetTextTest_static_0050
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0050', Level.LEVEL0, async (done: ()=>void) => {      console.info('[TextAreaGetTextTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_getText_5')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0050] getText5:" + JSON.stringify(AppStorage.get<string>('getText_5')));
      expect(AppStorage.get<string>('getText_5')).assertEqual('abcdef');
      AppStorage.delete('getText_5')
      console.info('[TextAreaGetTextTest_0050] END');
      done();
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0060
     * @tc.name     TextAreaGetTextTest_static_0060
     * @tc.desc     TextAreaGetTextTest_static_0060
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0060', Level.LEVEL0, async (done: ()=>void) => {      console.info('[TextAreaGetTextTest_0060] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_getText_6')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0060] getText6:" + JSON.stringify(AppStorage.get<string>('getText_6')));
      expect(AppStorage.get<string>('getText_6')).assertEqual('abcdef');
      AppStorage.delete('getText_6')
      console.info('[TextAreaGetTextTest_0060] END');
      done();
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0070
     * @tc.name     TextAreaGetTextTest_static_0070
     * @tc.desc     TextAreaGetTextTest_static_0070
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0070', Level.LEVEL0, async (done: ()=>void) => {      console.info('[TextAreaGetTextTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_getText_7')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0070] getText7:" + JSON.stringify(AppStorage.get<string>('getText_7')));
      expect(AppStorage.get<string>('getText_7')).assertEqual('abcdef');
      AppStorage.delete('getText_7')
      console.info('[TextAreaGetTextTest_0070] END');
      done();
    });

    
    
    
    /**
     * @tc.number   TextAreaGetTextTest_static_0080
     * @tc.name     TextAreaGetTextTest_static_0080
     * @tc.desc     TextAreaGetTextTest_static_0080
     * @tc.level    Level.LEVEL0
     */
it('TextAreaGetTextTest_static_0080', Level.LEVEL0, async (done: ()=>void) => {      console.info('[TextAreaGetTextTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button:Component = await driver.findComponent(ON.id('TextArea_clearPreViewText')) as Component;
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info("[TextAreaGetTextTest_0080] TextArea:" + JSON.stringify(AppStorage.get<string>('clearPreViewText_TextArea')));
      expect(AppStorage.get<string>('clearPreViewText_TextArea')).assertEqual('succ');
      AppStorage.delete('clearPreViewText_TextArea')
      console.info('[TextAreaGetTextTest_0080] END');
      done();
    });
  })
}
