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

    /**
     * @tc.name   getState_001
     * @tc.number getState_001
     * @tc.desc   test OH_ArkUI_CustomDialog_GetState DIALOG_UNINITIALIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getState_001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('queryButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('text');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0');
      done();
    })

    /**
     * @tc.name   getState_002
     * @tc.number getState_002
     * @tc.desc   test OH_ArkUI_CustomDialog_GetState DIALOG_INITIALIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getState_002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('showButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('text1');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1');
      done();
    })

    /**
     * @tc.name   getState_003
     * @tc.number getState_003
     * @tc.desc   test OH_ArkUI_CustomDialog_GetState DIALOG_APPEARING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getState_003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let strJson = getInspectorByKey('text2');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('2');
      done();
    })

    /**
     * @tc.name   getState_004
     * @tc.number getState_004
     * @tc.desc   test OH_ArkUI_CustomDialog_GetState DIALOG_APPEARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getState_004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      await driver.pressBack();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text3');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('3');
      done();
    })

    /**
     * @tc.name   getState_005
     * @tc.number getState_005
     * @tc.desc   test OH_ArkUI_CustomDialog_GetState DIALOG_DISAPPEARING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getState_005', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let strJson = getInspectorByKey('text4');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('4');
      done();
    })

    /**
     * @tc.name   getState_006
     * @tc.number getState_006
     * @tc.desc   test OH_ArkUI_CustomDialog_GetState DIALOG_DISAPPEARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getState_006', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('queryButton'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('text');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getState_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('5');
      done();
    })

    /**
     * @tc.name   getStateErrorCode_001
     * @tc.number getStateErrorCode_001
     * @tc.desc   test the return value of OH_ArkUI_CustomDialog_GetState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getStateErrorCode_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.dialogGetStateErrorCode_001()).assertEqual(0)
      await Utils.sleep(200)
      done();
    })

    /**
     * @tc.name   getStateErrorCode_002
     * @tc.number getStateErrorCode_002
     * @tc.desc   test the return value of OH_ArkUI_CustomDialog_GetState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getStateErrorCode_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.dialogGetStateErrorCode_002()).assertEqual(0)
      await Utils.sleep(200)
      done();
    })
  })
}