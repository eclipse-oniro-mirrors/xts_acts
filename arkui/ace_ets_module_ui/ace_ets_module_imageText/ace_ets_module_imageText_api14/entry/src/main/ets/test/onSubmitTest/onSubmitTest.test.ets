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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commoneventmanager from '@ohos.commonEventManager';
import inputMethod from '@ohos.inputMethod';
import { BusinessError } from '@ohos.base'


export default function onSubmitTest() {
  describe('onSubmitTest', () => {
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    beforeAll(async (done: Function) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await delegator.executeShellCommand('ime -e com.arkui.ace.imageText.api14 -f').then(result =>{
          console.info(`ime -e com.arkui.ace.imageText.api14 -f finished, result = ${JSON.stringify(result)}`);
            delegator.executeShellCommand('ime -s com.arkui.ace.imageText.api14').then(result => {
              console.info(`ime -s com.arkui.ace.imageText.api14 finished, result = ${JSON.stringify(result)}`);
              done();
            }).catch((err: Error) => {
              console.info(`ime -s com.arkui.ace.imageText.api14 failed, err = ${JSON.stringify(err)}`);
              done();
            })
          }).catch((err: Error) => {
            console.info(`ime -e com.arkui.ace.imageText.api14 -f failed, err = ${JSON.stringify(err)}`);
            done();
        })  
        console.info('====>beforeAll inputMethod_enable success');
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message))
        done();
      }
    })
    beforeEach(async (done: Function) => {
      console.info("onSubmitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onSubmit/onSubmitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSubmitTest state pages: " + JSON.stringify(pages));
        if (!("onHover" == pages.name)) {
          console.info("get onSubmitTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onSubmitTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSubmitTest page error: " + err);
        expect().assertFail();
      }
      done();
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

    /**
     * @tc.number    SUB_ACE_onSubmitTest_0010
     * @tc.name      SUB_ACE_onSubmitTest_0010
     * @tc.desc      test TextArea onSubmitTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onSubmitTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('onSubmitTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let TextArea = await driver.findComponent(ON.id('TextArea'));
      await CommonFunc.sleep(500);
      await TextArea.inputText('这是测试文本')
      await CommonFunc.sleep(500);
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
        await TextArea.click()
        console.log('onSubmitTest_0010  ---------- publishCallback END ')
      }
      //挂载输入法事件
      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 10
      }
      commoneventmanager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('enterKeyType');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("TextArea enterKeyType content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('2');
      let strJson2 = getInspectorByKey('TextAreaevent');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("TextArea TextAreaEventText content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('这是测试文本');
      let strJson3 = getInspectorByKey('TextAreaIsEdit');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("TextArea TextAreaIsEdit content: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('false');
      console.info('[onSubmitTest_0010] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_onSubmitTest_0020
     * @tc.name      SUB_ACE_onSubmitTest_0020
     * @tc.desc      test TextArea onSubmitTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onSubmitTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('onSubmitTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('changeIsCallKeepEditableState'));
      await CommonFunc.sleep(500);
      await button.click()
      await CommonFunc.sleep(500);
      let TextArea = await driver.findComponent(ON.id('TextArea'));
      await TextArea.inputText('这是测试文本')     
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(500);
      let stopEditBtn = await driver.findComponent(ON.id('stopEditBtn'));
      await CommonFunc.sleep(500);
      await stopEditBtn.click()
      await CommonFunc.sleep(500);
      //前置回调定义
      let publishCallback = async (err: BusinessError) => {
        console.log('onSubmitTest_0020  ---------- publishCallback START ')
        //点击触发
        await CommonFunc.sleep(200);
        await TextArea.click()
        console.log('onSubmitTest_0020  ---------- publishCallback END ')
      }
      //挂载输入法事件
      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 20
      }
      commoneventmanager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('enterKeyType');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("TextArea enterKeyType content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('2');
      let strJson2 = getInspectorByKey('TextAreaevent');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("TextArea TextAreaEventText content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('这是测试文本');
      let strJson3 = getInspectorByKey('TextAreaIsEdit');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("TextArea TextAreaIsEdit content: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('true');
      console.info('[onSubmitTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_onSubmitTest_0030
     * @tc.name      SUB_ACE_onSubmitTest_0030
     * @tc.desc      test Search onSubmitTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onSubmitTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('onSubmitTest_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let Search = await driver.findComponent(ON.id('Search'));
      await Search.inputText('这是测试文本')
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(500);
      let stopEditBtn = await driver.findComponent(ON.id('stopEditBtn'));
      await CommonFunc.sleep(500);
      await stopEditBtn.click()
      await CommonFunc.sleep(500);
      //前置回调定义
      let publishCallback = async (err: BusinessError) => {
        console.log('onSubmitTest_0030  ---------- publishCallback START ')
        //点击触发
        await CommonFunc.sleep(200);
        await Search.click()
        console.log('onSubmitTest_0030  ---------- publishCallback END ')
      }
      //挂载输入法事件
      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 30
      }
      commoneventmanager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('searchText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("Search searchText content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('这是测试文本');
      let strJson2 = getInspectorByKey('event');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("Search event content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('这是测试文本');
      let strJson3 = getInspectorByKey('searchIsEditing');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("TextArea searchIsEditing content: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('false');
      console.info('[onSubmitTest_0030] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_onSubmitTest_0040
     * @tc.name      SUB_ACE_onSubmitTest_0040
     * @tc.desc      test Search onSubmitTest
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onSubmitTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('onSubmitTest_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('changeIsCallKeepEditableState'));
      await CommonFunc.sleep(500);
      await button.click()
      await CommonFunc.sleep(500);
      let Search = await driver.findComponent(ON.id('Search'));
      await Search.inputText('这是测试文本')
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(500);
      let stopEditBtn = await driver.findComponent(ON.id('stopEditBtn'));
      await CommonFunc.sleep(500);
      await stopEditBtn.click()
      await CommonFunc.sleep(500);
      //前置回调定义
      let publishCallback = async (err: BusinessError) => {
        console.log('onSubmitTest_0040  ---------- publishCallback START ')
        //点击触发
        await CommonFunc.sleep(200);
        await Search.click()
        console.log('onSubmitTest_0040  ---------- publishCallback END ')
      }
      //挂载输入法事件
      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 40
      }
      commoneventmanager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('searchText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("Search searchText content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('这是测试文本');
      let strJson2 = getInspectorByKey('event');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("Search event content: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('这是测试文本');
      let strJson3 = getInspectorByKey('searchIsEditing');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("searchIsEditing content: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('true');
      console.info('[onSubmitTest_0040] END');
      done();
    });
  })
}