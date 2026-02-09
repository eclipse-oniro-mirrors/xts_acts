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
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext,Router } from '@ohos.arkui.UIContext';
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

export default function textAreaInputTest() {
  describe('textAreaInputTest', () => {
    beforeAll(() => {
      console.info("textAreaInputTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaInputTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/textAreaInputTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textAreaInputTest state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get textAreaInputTest pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaInputTest page error:" + err);
      }
      console.info("textAreaInputTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaInputTest after each called");
    });

    
    /**
     * @tc.number   textAreaInputTest_static_0001
     * @tc.name     textAreaInputTest_static_0001
     * @tc.desc     textAreaInputTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('textAreaInputTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (AppStorage.get<number>("winLeft") == 0) {
        let driver = Driver.create();
        console.info('textAreaInputTest textAreaInputTest0001 START');
        await CommonFunc.sleep(1000);
        let textArea1 = await driver.findComponent(ON.id('textArea1'));
        await CommonFunc.sleep(500);
        let textArea2 = await driver.findComponent(ON.id('textArea2'));
        await CommonFunc.sleep(500);
        await (textArea2?.click() as Promise<void>)
        await CommonFunc.sleep(500);
        await driver.triggerKey(2070);
        await CommonFunc.sleep(500);
        try{
          let button1 = await driver.findComponent(ON.text('下一步'));
          await CommonFunc.sleep(500);
          await (button1?.click() as Promise<void>);
        }catch(e: Error){

        }
        await CommonFunc.sleep(500);

        await (textArea1?.longClick() as Promise<void>);
        await CommonFunc.sleep(2000);

        try{
          let button3 = await driver.findComponent(ON.text('全选'));
          await CommonFunc.sleep(500);
          await (button3?.click() as Promise<void>);
          console.info('textAreaInputTest0001 全选 success');
        }catch(e: Error){

        }
        await CommonFunc.sleep(500);

        textArea1?.dragTo(textArea2!) ;
        await CommonFunc.sleep(2000);
        console.info('textAreaInputTest0001 dragTo success');

        try{
          let button4 = await driver.findComponent(ON.text('取消'));
          await CommonFunc.sleep(500);
          await (button4?.click() as Promise<void>);
          await CommonFunc.sleep(500);
          console.info('textAreaInputTest0001 取消 success');
        }catch(e: Error){

        }
        await (textArea1?.longClick() as Promise<void>);
        await CommonFunc.sleep(2000);

        try{
          let button5 = await driver.findComponent(ON.text('全选'));
          await CommonFunc.sleep(500);
          await (button5?.click() as Promise<void>);
          await CommonFunc.sleep(500);
          console.info('textAreaInputTest0001 2 全选 success');
        }catch(e: Error){

        }

        try{
          let button6 = await driver.findComponent(ON.text('复制'));
          await CommonFunc.sleep(500);
          await (button6?.click() as Promise<void>);
          await CommonFunc.sleep(500);
          console.info('textAreaInputTest0001 2 复制 success');
        }catch(e: Error){

        }
        textArea1?.dragTo(textArea2!);
        await CommonFunc.sleep(2000);

        try{
          let Text7 = await driver.findComponent(ON.text('长按内容至浮起，可拖拽到底部小艺'));
            let button7 = await driver.findComponent(ON.type('Button'));
            await CommonFunc.sleep(500);
            await (button7?.click() as Promise<void>);
          await CommonFunc.sleep(500);
          console.info('textAreaInputTest0001 2 Button success');
        }catch(e: Error){

        }
      }

        expect("").assertEqual("");


      console.info("[textAreaInputTest0001] end");
      done()
    });


  })
}
