'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect, describe, it, afterEach, Level, describe, beforeAll, beforeEach } from '../../../../hypium';
import { Component, Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import inspector from '@ohos.arkui.inspector'


export default function customPropertyTest() {

  describe('CustomPropertyTest', (): void => {


    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api14.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);

    })

    
    /**
     * @tc.number   testGetCustomProperty001
     * @tc.name     testGetCustomProperty001
     * @tc.desc     testGetCustomProperty001
     * @tc.level    Level.LEVEL1
     */
    it('testGetCustomProperty001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestGetCustomProperty';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').getElement("$attrs").getString("backgroundColor"))
        .assertEqual('#FF00FF00')
      done();
    });

    
    /**
     * @tc.number   testGetParentInPageTree002
     * @tc.name     testGetParentInPageTree002
     * @tc.desc     testGetParentInPageTree002
     * @tc.level    Level.LEVEL1
     */
    it('testGetParentInPageTree002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestGetParentInPageTree';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').getElement("$attrs").getString("backgroundColor"))
        .assertEqual('#FF00FF00')
      done();
    });
  })
}