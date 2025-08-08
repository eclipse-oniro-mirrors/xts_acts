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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';
import nativeRender from 'libnativerender.so'

export default function dialogGetStateTest() {

  describe('DialogGetStateTest', () => {

    let PAGE_TAG = 'DialogGetStateTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`dialog/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : getState_001
    * @tc.name       : getState_001
    * @tc.desc       : test OH_ArkUI_CustomDialog_GetState DIALOG_APPEARING
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('getState_001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('GetStateButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      await driver.pressBack(0);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textGetStates');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('2');
      done();
    })

    /*
    * @tc.number     : getState_002
    * @tc.name       : getState_002
    * @tc.desc       : test OH_ArkUI_CustomDialog_GetState DIALOG_DISAPPEARED
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('getState_002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component1 = await driver.findComponent(ON.id('GetStateButton1'));
      await component1.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textGetStates');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_002 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('5');
      done();
    })

    /*
    * @tc.number     : getState_003
    * @tc.name       : getState_003
    * @tc.desc       : test OH_ArkUI_CustomDialog_GetState DIALOG_APPEARED
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('getState_003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component1 = await driver.findComponent(ON.id('GetStateButton'));
      await component1.click();
      await Utils.sleep(2000);
      let component2 = await driver.findComponent(ON.id('GetStateButton3'));
      await component2.click();
      await Utils.sleep(2000);
      await driver.pressBack(0);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textGetStates');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_003 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('3');
      done();
    })

    /*
    * @tc.number     : getState_004
    * @tc.name       : getState_004
    * @tc.desc       : test OH_ArkUI_CustomDialog_GetState DIALOG_UNINITIALIZED
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('getState_004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component1 = await driver.findComponent(ON.id('GetStateButton'));
      await component1.click();
      await Utils.sleep(2000);
      await driver.pressBack(0);
      await Utils.sleep(2000);
      let component2 = await driver.findComponent(ON.id('GetStateButton5'));
      await component2.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textGetStates');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_004 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0');
      done();
    })
  })
}