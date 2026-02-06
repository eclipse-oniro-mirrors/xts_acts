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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function dragAdaptationTest() {
  describe('dragAdaptationTest', () => {

    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.nowear.api11.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/dragAdaptation'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dragAdaptationTest state success " + JSON.stringify(pages));
        if (!("dragAdaptation" == pages.name)) {
          console.info("get dragAdaptationTest state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push dragAdaptationTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragAdaptationTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("dragAdaptationTest after each called");
    });

    
    
    
/**
     * @tc.number   dragAdaptationTest_static_001
     * @tc.name     dragAdaptationTest_static_001
     * @tc.desc     dragAdaptationTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('dragAdaptationTest_static_001', Level.LEVEL0, async (): Promise<void> => {
      if (AppStorage.get<number>("winLeft") == 0) {
        let driver = Driver.create();
        console.info('dragAdaptationTest dragAdaptationTest_static_001 START');
        await CommonFunc.sleep(1000);
        let textArea1 = await driver.findComponent(ON.id('textArea1'));
        await CommonFunc.sleep(500);
        let textArea2 = await driver.findComponent(ON.id('textArea2'));
        await CommonFunc.sleep(500);
        await (textArea2?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        console.log('dragAdaptationTest_static_001 = ')
        // let button1 = await driver.findComponent(ON.text('下一步'));
        // await CommonFunc.sleep(500);
        // await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        await (textArea1?.longClick() as Promise<void>);
        await CommonFunc.sleep(500);
        let button3 = await driver.findComponent(ON.text('全选'));
        await CommonFunc.sleep(500);
        await (button3?.click() as Promise<void>);
        console.info('dragAdaptationTest_static_001 全选 success');
        await CommonFunc.sleep(500);
        console.log('dragTo before')
        textArea1?.dragTo(textArea2!);
        console.log('dragTo after')
        await CommonFunc.sleep(3000);
        console.info('dragAdaptationTest_static_001 dragTo success');
        // let button4 = await driver.findComponent(ON.text('取消'));
        // await CommonFunc.sleep(500);
        // await (button4?.click() as Promise<void>);
        // await CommonFunc.sleep(500);
        // console.info('dragAdaptationTest_static_001 取消 success');

        await (textArea1?.longClick() as Promise<void>);
        await CommonFunc.sleep(500);
        let button5 = await driver.findComponent(ON.text('全选'));
        await CommonFunc.sleep(500);
        await (button5?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_static_001 2 全选 success');
        let button6 = await driver.findComponent(ON.text('复制'));
        await CommonFunc.sleep(500);
        await (button6?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_static_001 2 复制 success');
        textArea1?.dragTo(textArea2!);
        await CommonFunc.sleep(2000);
        // let button7 = await driver.findComponent(ON.type('Button'));
        // await CommonFunc.sleep(500);
        // await (button7?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        console.info('dragAdaptationTest_static_001 2 Button success');
      }
      
      expect("").assertEqual("");
      console.info("[dragAdaptationTest_static_001] end");
    });
  })
}
