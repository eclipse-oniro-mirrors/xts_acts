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
import { AppStorage, PersistentStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { PersistentStorage } from '@ohos.arkui.stateManagement';
 
export default function PersistentStorageApi() {
  describe('PersistentStorageApi', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });
 
    beforeEach(async (): Promise<void> => {
      console.info("PersistentStorageApi beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistentStorage/PersistentStorageApi",
      }
      try {
        const PersistentStorageApi = AppStorage.get<Router>("router") as Router
        PersistentStorageApi.clear();
        let pages:router.RouterState = PersistentStorageApi.getState();
        console.info("get PersistentStorageApi state pages: " + JSON.stringify(pages));
        if (!("PersistentStorageApi" == pages.name)) {
          console.info("get PersistentStorageApi state pages.name: " + JSON.stringify(pages.name));
          // let result = await PersistentStorageApi.pushUrl(options);
          PersistentStorageApi.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PersistentStorageApi success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistentStorageApi page error:" + err);
      }
      console.info("PersistentStorageApi beforeEach end");
    });
 
    afterEach(() => {
      console.info("afterEach case");
    });
 
    afterAll(async () => {
      console.info("afterAll case");
    });
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistentStoragePersistProp_0100
     * @tc.number  SUB_ARKUI_API_PersistentStoragePersistProp_0100
     * @tc.desc    Test PersistentStorage persistProp functionality - verify data persistence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistentStoragePersistProp_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistentStoragePersistProp_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Get initial value
      let strJson = inspector.getInspectorByKey('text_persist_prop');
      await CommonFunc.sleep(1000);
      let initialValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistentStoragePersistProp_0100] initial content: " + initialValue);
 
      // Click button to increase value
      let increaseBtn = await driver.findComponent(ON.id('button_increase'));
      await CommonFunc.sleep(1000);
      await (increaseBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
      // Get updated value
      let strJson2 = inspector.getInspectorByKey('text_persist_prop');
      await CommonFunc.sleep(1000);
      let updatedValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistentStoragePersistProp_0100] updated content: " + updatedValue);
 
      // Verify value was incremented
      expect(updatedValue).not().assertEqual(initialValue);
 
      done();
    });
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistentStoragePersistProps_0100
     * @tc.number  SUB_ARKUI_API_PersistentStoragePersistProps_0100
     * @tc.desc    Test PersistentStorage persistProps functionality - verify multiple properties persistence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistentStoragePersistProps_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistentStoragePersistProps_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Verify first persisted property
      let strJson1 = inspector.getInspectorByKey('text_persist_props_1');
      await CommonFunc.sleep(1000);
      let value1 = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistentStoragePersistProps_0100] value1: " + value1);
      expect(value1.indexOf('value1') !== -1).assertTrue();
 
      // Verify second persisted property
      let strJson2 = inspector.getInspectorByKey('text_persist_props_2');
      await CommonFunc.sleep(1000);
      let value2 = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistentStoragePersistProps_0100] value2: " + value2);
      expect(value2.indexOf('true') !== -1).assertTrue();
 
      done();
    });
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistentStorageDeleteProp_0100
     * @tc.number  SUB_ARKUI_API_PersistentStorageDeleteProp_0100
     * @tc.desc    Test PersistentStorage deleteProp functionality - verify property deletion
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistentStorageDeleteProp_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistentStorageDeleteProp_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
 
      // Get initial value before delete
      let strJson = inspector.getInspectorByKey('text_delete_prop');
      await CommonFunc.sleep(1000);
      let initialValue = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
      console.info("[SUB_ARKUI_API_PersistentStorageDeleteProp_0100] initial content: " + initialValue);
      expect(initialValue).assertEqual('"deletePropValue: 100"');
 
      // Click delete button
      let deleteBtn = await driver.findComponent(ON.id('button_delete'));
      await CommonFunc.sleep(1000);
      await (deleteBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
 
      done();
    });
 
    /**
     * @tc.name    SUB_ARKUI_API_PersistentStorageKeys_0100
     * @tc.number  SUB_ARKUI_API_PersistentStorageKeys_0100
     * @tc.desc    Test PersistentStorage keys functionality - verify retrieve all persisted keys
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_ARKUI_API_PersistentStorageKeys_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_PersistentStorageKeys_0100] START');
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
      console.info("[SUB_ARKUI_API_PersistentStorageKeys_0100] keys result: " + keysResult);
 
      // Verify keys contains expected properties
      expect(keysResult.indexOf('persistPropKey') !== -1).assertTrue();
      expect(keysResult.indexOf('persistPropsKey1') !== -1).assertTrue();
      expect(keysResult.indexOf('persistPropsKey2') !== -1).assertTrue();
      expect(keysResult.indexOf('keysProp2') !== -1).assertTrue();
      PersistentStorage.deleteProp('persistPropKey');
      PersistentStorage.deleteProp('persistPropsKey1');
      PersistentStorage.deleteProp('persistPropsKey2');
      PersistentStorage.deleteProp('deletePropKey');
      PersistentStorage.deleteProp('keysProp1');
      PersistentStorage.deleteProp('keysProp2');
      AppStorage.delete('persistPropKey');
      AppStorage.delete('persistPropsKey1');
      AppStorage.delete('persistPropsKey2');
      AppStorage.delete('deletePropKey');
      AppStorage.delete('keysProp1');
      AppStorage.delete('keysProp2');
      AppStorage.delete('keysResult');
      done();
    });
  })
}
