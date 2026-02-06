'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size } from "../../../../hypium/index"
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

export default function primary() {
  describe('primary', () => {

    beforeAll(() => {
      console.info("primary beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/primary',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get primary state success ' + JSON.stringify(pages));
        if (!('primary' == pages.name)) {
          console.info('get primary state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          // let result = await routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000);
          // console.info('push primary page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push primary page error ' + JSON.stringify(err));
      }
    });

    
    
    
/**
     * @tc.number   primary_static_0100
     * @tc.name     primary_static_0100
     * @tc.desc     primary_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('primary_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('primary_static_0100 START');
      try{
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button:Component | null = await driver.findComponent(ON.id('primary1')) ;
        await button!.click();
        await CommonFunc.sleep(1000);
        await driver.triggerKey(2054);
        console.info('primary_static_0100 Enter');
        await CommonFunc.sleep(1500);
        let button1:Component | null = await driver.findComponent(ON.text('按钮1'));
        expect(button1 == null).assertTrue()
        // await button1.click(); // 1.1 注释
        await CommonFunc.sleep(1000);
        console.info('primary_static_0100 END');
        done();
      }catch(e){
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   primary_static_0200
     * @tc.name     primary_static_0200
     * @tc.desc     primary_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('primary_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('primary_static_0200 START');
      try{
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button:Component | null = await driver.findComponent(ON.id('primary2'));
        await button!.click();
        await CommonFunc.sleep(1000);
        await driver.triggerKey(2054);
        console.info('primary_static_0200 Enter');
        await CommonFunc.sleep(1500);
        let button1:Component | null = await driver.findComponent(ON.text('按钮1'));
        console.info('primary_static_0200 button1 ' + button1);
        await CommonFunc.sleep(2000);
        expect(button1 != null).assertTrue()
        await button1!.click();
        await CommonFunc.sleep(1000);
        console.info('primary_static_0200 END');
        done();
      }catch(e){
        expect().assertFail();
      }
    });
    
  })
}