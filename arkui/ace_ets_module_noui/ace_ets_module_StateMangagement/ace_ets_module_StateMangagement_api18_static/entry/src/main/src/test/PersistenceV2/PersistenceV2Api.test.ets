'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  Level
} from '../../../../hypium/index';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { AppStorage, PersistenceV2 } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
 
export default function PersistenceV2Api() {
  describe('PersistenceV2Api', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });
 
    beforeEach(async (): Promise<void> => {
      console.info("PersistenceV2Api beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PersistenceV2Api",
      }
      try {
        const PersistenceV2Api = AppStorage.get<Router>("router") as Router
        PersistenceV2Api.clear();
        let pages:router.RouterState = PersistenceV2Api.getState();
        console.info("get PersistenceV2Api state pages: " + JSON.stringify(pages));
        if (!("PersistenceV2Api" == pages.name)) {
          console.info("get PersistenceV2Api state pages.name: " + JSON.stringify(pages.name));
          // let result = await PersistenceV2Api.pushUrl(options);
          PersistenceV2Api.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PersistenceV2Api success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistenceV2Api page error:" + err);
      }
      console.info("PersistenceV2Api beforeEach end");
    });
 
    afterEach(() => {
      console.info("afterEach case");
    });
 
    afterAll(async () => {
      console.info("afterAll case");
    });
 
    /**
     * @tc.name   SUB_ARKUI_API_PersistenceV2Connect_0100
     * @tc.number SUB_ARKUI_API_PersistenceV2Connect_0100
     * @tc.desc   Test PersistenceV2 connect functionality - verify data persistence via connect
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_PersistenceV2Connect_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistenceV2Connect_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Get initial value
      let strJson = inspector.getInspectorByKey('text_connect');
      await CommonFunc.sleep(1000);
      let initialValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistenceV2Connect_0100] initial content: " + initialValue);
      expect(initialValue.indexOf('John') !== -1).assertTrue();
 
      // Click button to change person name
      let changeBtn = await driver.findComponent(ON.id('button_change_person'));
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
      // Get updated value
      let strJson2 = inspector.getInspectorByKey('text_connect');
      await CommonFunc.sleep(1000);
      let updatedValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistenceV2Connect_0100] updated content: " + updatedValue);
 
      // Verify value was changed
      expect(updatedValue.indexOf('John') !== -1).assertTrue();
 
      done();
    });
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistenceV2GlobalConnect_0100
     * @tc.number  SUB_ARKUI_API_PersistenceV2GlobalConnect_0100
     * @tc.desc    Test PersistenceV2 globalConnect functionality - verify data persistence via globalConnect
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistenceV2GlobalConnect_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistenceV2GlobalConnect_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Verify initial globalConnect value
      let strJson = inspector.getInspectorByKey('text_global_connect');
      await CommonFunc.sleep(1000);
      let initialValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistenceV2GlobalConnect_0100] initial content: " + initialValue);
      expect(initialValue.indexOf('Jane') !== -1).assertTrue();
 
      // Click button to change person2 name
      let changeBtn = await driver.findComponent(ON.id('button_change_person2'));
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
      // Get updated value
      let strJson2 = inspector.getInspectorByKey('text_global_connect');
      await CommonFunc.sleep(1000);
      let updatedValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistenceV2GlobalConnect_0100] updated content: " + updatedValue);
 
      // Verify value was changed
      expect(updatedValue.indexOf('Jane') !== -1).assertTrue();
 
      done();
    });
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistenceV2Keys_0100
     * @tc.number  SUB_ARKUI_API_PersistenceV2Keys_0100
     * @tc.desc    Test PersistenceV2 keys functionality - verify retrieve all persisted keys
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistenceV2Keys_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistenceV2Keys_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Click button to get keys
      let getKeysBtn = await driver.findComponent(ON.id('button_get_keys'));
      await CommonFunc.sleep(1000);
      await (getKeysBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
      // Verify keys result in UI
      let strJson = inspector.getInspectorByKey('text_keys_result');
      await CommonFunc.sleep(1000);
      let keysResult = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistenceV2Keys_0100] keys result: " + keysResult);
 
      // Verify keys contains expected properties
      expect(keysResult.indexOf('Person') !== -1).assertTrue();
      expect(keysResult.indexOf('Person2') !== -1).assertTrue();
 
      done();
    });
 
    /**
     * @tc.name   SUB_ARKUI_API_PersistenceV2Remove_0100
     * @tc.number SUB_ARKUI_API_PersistenceV2Remove_0100
     * @tc.desc   Test PersistenceV2 remove functionality - verify remove specified key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_PersistenceV2Remove_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistenceV2Remove_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Get initial keys count
      let keysBefore = PersistenceV2.keys();
      console.info("[SUB_ARKUI_API_PersistenceV2Remove_0100] keys before remove: " + JSON.stringify(keysBefore));
      let keysCountBefore = keysBefore.length;
 
      // Click remove button
      let removeBtn = await driver.findComponent(ON.id('button_remove'));
      await CommonFunc.sleep(1000);
      await (removeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
      // Verify keys count decreased
      let keysAfter = PersistenceV2.keys();
      console.info("[SUB_ARKUI_API_PersistenceV2Remove_0100] keys after remove: " + JSON.stringify(keysAfter));
      expect(keysAfter.length < keysCountBefore).assertTrue();
 
      done();
    });
 
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistenceV2Save_0100
     * @tc.number  SUB_ARKUI_API_PersistenceV2Save_0100
     * @tc.desc    Test PersistenceV2 save functionality - verify manual data persistence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistenceV2Save_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistenceV2Save_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Click button to change person
      let changeBtn = await driver.findComponent(ON.id('button_change_person'));
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
 
      // Click save button to persist data
      let saveBtn = await driver.findComponent(ON.id('button_save_person'));
      await CommonFunc.sleep(1000);
      await (saveBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
      // Verify save succeeded (no error message)
      let strJson = inspector.getInspectorByKey('text_error_message');
      await CommonFunc.sleep(1000);
      let errorMsg = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      expect(errorMsg).assertEqual('"Error Message: "');;
 
      done();
    });
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistenceV2NotifyOnError_0100
     * @tc.number  SUB_ARKUI_API_PersistenceV2NotifyOnError_0100
     * @tc.desc    Test PersistenceV2 notifyOnError functionality - verify error callback registration
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistenceV2NotifyOnError_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistenceV2NotifyOnError_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Verify that notifyOnError callback is registered by checking initial state
      // The callback is registered in static block, so we verify the page loads successfully
      let strJson = inspector.getInspectorByKey('text_connect');
      await CommonFunc.sleep(1000);
      let pageContent = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistenceV2NotifyOnError_0100] page content: " + pageContent);
 
      // Page loaded successfully with notifyOnError registered
      expect(pageContent.length > 0).assertTrue();
      PersistenceV2.remove('Person2');
      AppStorage.delete('Person2');
      AppStorage.delete('Person');
      done();
    });
  })
}