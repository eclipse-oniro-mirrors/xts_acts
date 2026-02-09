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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {
  TextDeleteDirection
} from '@ohos.arkui.component'
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function TextDeleteDirectionTest() {
  describe('TextDeleteDirectionTest', () :void=> {
    beforeAll(() => {
      console.info("TextDeleteDirectionTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("TextDeleteDirectionTest beforeEach start");
      try {
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/TextArea/TextDeleteDirectionTest',
        }
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextDeleteDirectionTest state success " + JSON.stringify(pages));
        routerInstance.pushUrl(options);
        await CommonFunc.sleep(4000);
        if (!("TextDeleteDirectionTest" == pages.name)) {
          console.info("get TextDeleteDirectionTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextDeleteDirectionTest page error:" + err);
      }
      console.info("TextDeleteDirectionTest foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("TextDeleteDirectionTest after each called");
    });

    
    
/**
     * @tc.number   TextDeleteDirectionTest_static_0001
     * @tc.name     TextDeleteDirectionTest_static_0001
     * @tc.desc     TextDeleteDirectionTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('TextDeleteDirectionTest_static_0001', Level.LEVEL1, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info('TextDeleteDirectionTest0001 START');
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
      await CommonFunc.sleep(500);
      await (TextArea?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let caretPosition = await driver.findComponent(ON.id('caretPosition0'))
      await CommonFunc.sleep(500);
      await (caretPosition?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      await driver.triggerKey(2071)
      await CommonFunc.sleep(2000);
      console.log("=============================================== _0001" + ''+AppStorage.get<string>('deleteValue'))
      expect(''+AppStorage.get<string>('deleteValue')).assertEqual('这');
      expect(''+AppStorage.get<number>('deleteOffset')).assertEqual('0');
      expect(''+AppStorage.get<TextDeleteDirection>('direction')).assertEqual('1');
      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0001] end");
      done();
    });

    
    
/**
     * @tc.number   TextDeleteDirectionTest_static_0002
     * @tc.name     TextDeleteDirectionTest_static_0002
     * @tc.desc     TextDeleteDirectionTest_static_0002
     * @tc.level    Level.LEVEL3
     */
    it('TextDeleteDirectionTest_static_0002', Level.LEVEL3, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info('TextDeleteDirectionTest0002 START');
      await CommonFunc.sleep(1000);


        let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
        await CommonFunc.sleep(500);
        await (TextArea?.longClick() as Promise<void>)
        await CommonFunc.sleep(500);
        let allSelect = await driver.findComponent(ON.text('全选'))
        await CommonFunc.sleep(500);
        await (allSelect?.click() as Promise<void>)
        await CommonFunc.sleep(500);
        await driver.triggerKey(2071)
        await CommonFunc.sleep(500);
        console.log("=============================================== " + ''+AppStorage.get<string>('deleteValue'))
        expect(''+AppStorage.get<string>('deleteValue')).assertEqual('这是测试删除回调文本');
        expect(''+AppStorage.get<number>('deleteOffset')).assertEqual('0');
        expect(''+AppStorage.get<TextDeleteDirection>('direction')).assertEqual('1');

      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0002] end");
      done();
    });

    
    
/**
     * @tc.number   TextDeleteDirectionTest_static_0003
     * @tc.name     TextDeleteDirectionTest_static_0003
     * @tc.desc     TextDeleteDirectionTest_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('TextDeleteDirectionTest_static_0003', Level.LEVEL1, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info(' TextDeleteDirectionTest0003 START');
      await CommonFunc.sleep(1000);


        let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
        await CommonFunc.sleep(500);
        await (TextArea?.click() as Promise<void>)
        await CommonFunc.sleep(500);
        let caretPosition = await driver.findComponent(ON.id('caretPosition6'))
        await CommonFunc.sleep(500);
        await (caretPosition?.click() as Promise<void>)
        await CommonFunc.sleep(500);
        await driver.triggerKey(2055)
        await CommonFunc.sleep(500);
        expect(''+AppStorage.get<string>('deleteValue')).assertEqual('除');
        expect(''+AppStorage.get<number>('deleteOffset')).assertEqual('5');
        expect(''+AppStorage.get<TextDeleteDirection>('direction')).assertEqual('0');

      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0003] end");
      done();
    });

    
    
/**
     * @tc.number   TextDeleteDirectionTest_static_0004
     * @tc.name     TextDeleteDirectionTest_static_0004
     * @tc.desc     TextDeleteDirectionTest_static_0004
     * @tc.level    Level.LEVEL3
     */
    it('TextDeleteDirectionTest_static_0004', Level.LEVEL3, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info(' TextDeleteDirectionTest0004 START');
      await CommonFunc.sleep(1000);


        let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
        await CommonFunc.sleep(500);
        await (TextArea?.longClick() as Promise<void>)
        await CommonFunc.sleep(500);
        let allSelect = await driver.findComponent(ON.text('全选'))
        await CommonFunc.sleep(500);
        await (allSelect?.click() as Promise<void>)
        await CommonFunc.sleep(500);
        await driver.triggerKey(2055)
        await CommonFunc.sleep(500);
        expect(''+AppStorage.get<string>('deleteValue')).assertEqual('这是测试删除回调文本');
        expect(''+AppStorage.get<number>('deleteOffset')).assertEqual('0');
        expect(''+AppStorage.get<TextDeleteDirection>('direction')).assertEqual('0');

      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0004] end");
      done();
    });
  })
}