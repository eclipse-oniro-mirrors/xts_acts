/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from "../../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commoneventmanager from '@ohos.commonEventManager';
import inputMethod from '@ohos.inputMethod';
import { BusinessError } from '@ohos.base'
export default function textInputApi1() {
  describe('textInputApi1', () => {
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    beforeAll(async (done: Function) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await delegator.executeShellCommand('ime -e com.arkui.ace.imageText -f').then(result =>{
          console.info(`ime -e com.arkui.ace.imageText -f finished, result = ${JSON.stringify(result)}`);
            delegator.executeShellCommand('ime -s com.arkui.ace.imageText').then(result => {
              console.info(`ime -s com.arkui.ace.imageText finished, result = ${JSON.stringify(result)}`);
              done();
            }).catch((err: Error) => {
              console.info(`ime -s com.arkui.ace.imageText failed, err = ${JSON.stringify(err)}`);
              done();
            })
          }).catch((err: Error) => {
            console.info(`ime -e com.arkui.ace.imageText -f failed, err = ${JSON.stringify(err)}`);
            done();
        })  
        console.info('====>beforeAll inputMethod_enable success');
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message))
        done();
      }
    })
    beforeEach(async (done: Function) => {
      console.info("textInputApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInputApi/textInputApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputApi1 state pages:" + JSON.stringify(pages));
        if (!("textInputApi1" == pages.name)) {
          console.info("get textInputApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textInputApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputApi1 page error:" + err);
      }
      console.info("textInputApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputApi1 after each called");
    });
    afterAll(async (done: Function) =>{
      console.info('====>afterAll reset inputMethod!')
      try {
        await delegator.executeShellCommand('ime -s com.huawei.hmos.inputmethod').then(result =>{
          console.info(`ime -s com.huawei.hmos.inputmethod finished, result = ${JSON.stringify(result)}`);
          }).catch((err: Error) => {
            console.info(`ime -s com.huawei.hmos.inputmethod failed, err = ${JSON.stringify(err)}`);
            done();
        })  
        console.info('====>afterAll reset inputMethod success!');
        done();
      } catch (err) {
        console.info('====>afterAll throw err:' + JSON.stringify(err.message))
        done();
      }
    });
    /* *
        * @tc.number: SUB_ACE_TextArea_onSubmit_001
        * @tc.name  : textInputApi1_001
        * @tc.desc  : onSubmit event test
        * @tc.level : Level 2
        */
    it('textInputApi1_001', Level.LEVEL2, async (done: Function) => {

      console.info('[textInputApi1_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let text = await driver.findComponent(ON.id('textInputApi1'));
      await CommonFunc.sleep(1000);
      await text.inputText('9');
      await CommonFunc.sleep(1000);
      //回车点击
      await driver.triggerKey(2070)
      await CommonFunc.sleep(500);
      let stopEditBtn = await driver.findComponent(ON.id('stopEditBtn'));
      await CommonFunc.sleep(500);
      await stopEditBtn.click()
      await CommonFunc.sleep(500);
      //前置回调定义
      let publishCallback = async (err: BusinessError) => {
        console.log('onSubmitTest_0010  ---------- publishCallback START ')
        //点击触发
        await CommonFunc.sleep(200);
        await text.click()
        console.log('onSubmitTest_0010  ---------- publishCallback END ')
      }
      //挂载输入法事件
      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 10
      }
      commoneventmanager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('textInputApi1_text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textInputApi1_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('PREVIOUS');

      console.info('[textInputApi1_001] END');
      done();
    });
  })
}