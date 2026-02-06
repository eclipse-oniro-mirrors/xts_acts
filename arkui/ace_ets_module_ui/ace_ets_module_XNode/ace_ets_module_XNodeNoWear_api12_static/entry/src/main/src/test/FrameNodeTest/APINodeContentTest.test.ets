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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Component} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility } from '../Util.test'

let testAbilityContext:common.UIAbilityContext;
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function APINodeContentTest() {
  describe('APINodeContentTest', (): void => {

    beforeAll(() => {
      console.info("APINodeContentTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNodeNoWear.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("APINodeContentTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/APINodeContent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get APINodeContentTest state pages:" + JSON.stringify(pages));
        if (!("APINodeContent" == pages.name)) {
          console.info("get APINodeContentTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push APINodeContentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APINodeContentTest page error:" + err);
      }
      console.info("APINodeContentTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info('AxisEvent after each called');
    })

    
    
    /**
     * @tc.number   APINodeContentTest_static_0100
     * @tc.name     APINodeContentTest_static_0100
     * @tc.desc     APINodeContentTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APINodeContentTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> =>{

      console.info('APINodeContentTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
      await (button2!.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('APINodeContent_Text');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[APINodeContentTest_static_0100] component obj is: ", obj.getElement('$attrs').getString('content'))
      console.info("[APINodeContentTest_static_0100] component obj is1: ", JSON.stringifyJsonElement(obj.getElement('$attrs')))
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[APINodeContentTest_static_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   APINodeContentTest_static_0200
     * @tc.name     APINodeContentTest_static_0200
     * @tc.desc     APINodeContentTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('APINodeContentTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> =>{

      console.info('APINodeContentTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      console.log('+++++++++++++++++++++++++++++++1')
      let button1 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
      await (button1!.click() as Promise<void>);
      console.log('+++++++++++++++++++++++++++++++2')
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
      console.log('+++++++++++++++++++++++++++++++3')
      await (button2!.click() as Promise<void>);
      console.log('+++++++++++++++++++++++++++++++4')
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('APINodeContent_Button_RemoveBack'));
      console.log('+++++++++++++++++++++++++++++++5')
      await (button3!.click() as Promise<void>);
      console.log('+++++++++++++++++++++++++++++++6')
      await CommonFunc.sleep(1000);
      let button9 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
      console.log('+++++++++++++++++++++++++++++++7')
      await (button9!.click() as Promise<void>);
      console.log('+++++++++++++++++++++++++++++++8')
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('APINodeContent_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APINodeContentTest_static_0200] component obj is 1 : ", obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      await CommonFunc.sleep(500);
      let button4 = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
      console.log('+++++++++++++++++++++++++++++++9')
      await (button4!.click() as Promise<void>);
      console.log('+++++++++++++++++++++++++++++++10')
      await CommonFunc.sleep(1000);
      let button5 = await driver.findComponent(ON.id('APINodeContent_Button_AddToSlot'));
      console.log('+++++++++++++++++++++++++++++++11')
      await (button5!.click() as Promise<void>);
      console.log('+++++++++++++++++++++++++++++++12')
      await CommonFunc.sleep(1000);
      let button8 = await driver.findComponent(ON.id('APINodeContent_Button_get'));
      console.log('+++++++++++++++++++++++++++++++1')
      await (button8!.click() as Promise<void>);
      console.log('+++++++++++++++++++++++++++++++1')
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('APINodeContent_Text') ;
      let obj2 = JSON.parseJsonElement(strJson)
      console.info("[APINodeContentTest_static_0200] component obj is 2 : ", obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');  //值是2，取到的是0
      console.info('[APINodeContentTest_static_0200] END');
      done();
    });
  })
}

