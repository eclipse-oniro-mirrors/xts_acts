/*
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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function customPropertyTest(){

  describe('CustomPropertyTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0100
     * @tc.name       : testAddCustomProperty001
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testAddCustomProperty001', 0, async (done: Function) => {
      let PAGE_TAG = 'TestAddCustomProperty';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('buttonCustomProperty'));
      await button.click();
      await Utils.sleep(1000)

      let strJson = getInspectorByKey('customPropertyValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testAddCustomProperty001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("aaa")
      console.info('[testAddCustomProperty001] END');
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRemoveCustomProperty002', 0, async (done: Function) => {
      let PAGE_TAG = 'TestRemoveCustomProperty';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('buttonCustomProperty'));
      await button.click();
      await Utils.sleep(1000)

      let strJson = getInspectorByKey('customPropertyValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testRemoveCustomProperty002] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("undefined")
      console.info('[testRemoveCustomProperty002] END');
      done();
    });
  })
}