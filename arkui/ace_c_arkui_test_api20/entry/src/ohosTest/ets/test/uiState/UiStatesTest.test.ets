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

export default function uiStatesTest() {

  describe('UiStatesTest', () => {

    let PAGE_TAG = 'UiStatesTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`uiState/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : uiStatesTest_001
    * @tc.name       : uiStatesTest_001
    * @tc.desc       : test OH_ArkUI_AddSupportedUIStates
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('uiStatesTest_001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('textStates'));
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textStates');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("uiStatesTest_001 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PRESSED');
      done();
    })

    /*
    * @tc.number     : uiStatesTest_002
    * @tc.name       : uiStatesTest_002
    * @tc.desc       : test OH_ArkUI_RemoveSupportedUIStates
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('uiStatesTest_002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id('textStates'));
      let component1 = await driver.findComponent(ON.id('OnChangeButton'));
      await component1.click();
      await Utils.sleep(2000);
      await component.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('textStates');
      await Utils.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      console.info("uiStatesTest_002 content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PRESSED');
      done();
    })
  })
}