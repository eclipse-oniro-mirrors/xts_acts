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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,  Size, TestType } from "../../../../hypium/index"
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
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
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function showActionSheetOrder() {
  describe('showActionSheetOrder', () => {

    beforeAll(() => {
      console.info("DismissReasonTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("showActionSheetOrder beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/showActionSheetOrder',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get showActionSheetOrder state pages: " + JSON.stringify(pages));
        if (!("showActionSheetOrder" == pages.name)) {
          console.info("get showActionSheetOrder state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showActionSheetOrder success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showActionSheetOrder page error: " + err);
        expect().assertFail();
      }
    })

    afterEach(async () => {
      if (AppStorage.get<number>('showActionSheetOrder') as number != undefined) {
        AppStorage.delete('showActionSheetOrder')
      }
      await CommonFunc.sleep(1000);
      console.info("showActionSheetOrder after each called");
    });

    
    /**
     * @tc.number   showActionSheetOrder_static_0100
     * @tc.name     showActionSheetOrder_static_0100
     * @tc.desc     showActionSheetOrder_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showActionSheetOrder_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showActionSheetOrder_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('100')) as Component;
      await button!.click();
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder')) as Component;
      await button1!.click();
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showActionSheetOrder') as number
      expect(top).assertEqual(100)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('Confirm')) as Component;
      await button2!.click();
      await CommonFunc.sleep(500);
      console.info('showActionSheetOrder_static_0100 END');
      done();
    });

    
    /**
     * @tc.number   showActionSheetOrder_static_0200
     * @tc.name     showActionSheetOrder_static_0200
     * @tc.desc     showActionSheetOrder_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showActionSheetOrder_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showActionSheetOrder_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('100001')) as Component;
      await button!.click();
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder')) as Component;
      await button1!.click();
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showActionSheetOrder') as number
      expect(top).assertEqual(100000)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('Confirm')) as Component;
      await button2!.click();
      await CommonFunc.sleep(500);
      console.info('showActionSheetOrder_static_0200 END');
      done();
    });

    
    /**
     * @tc.number   showActionSheetOrder_static_0300
     * @tc.name     showActionSheetOrder_static_0300
     * @tc.desc     showActionSheetOrder_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showActionSheetOrder_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showActionSheetOrder_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('-100001')) as Component;
      await button!.click();
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder')) as Component;
      await button1!.click();
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showActionSheetOrder') as number
      expect(top).assertEqual(-100000)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('Confirm')) as Component;
      await button2!.click();
      await CommonFunc.sleep(500);
      console.info('showActionSheetOrder_static_0300 END');
      done();
    });
    
    /**
     * @tc.number   showActionSheetOrder_static_0400
     * @tc.name     showActionSheetOrder_static_0400
     * @tc.desc     showActionSheetOrder_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showActionSheetOrder_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showActionSheetOrder_static_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined')) as Component;
      await button!.click(); 
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder')) as Component;
      await button1!.click();
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showActionSheetOrder') as number
      expect(top).assertEqual(0)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('Confirm')) as Component;
      await button2!.click();
      await CommonFunc.sleep(500);
      console.info('showActionSheetOrder_static_0400 END');
      done();
    });
  })
}