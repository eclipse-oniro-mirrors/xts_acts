'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
export default function buttonGetTypeTest() {

  describe('ButtonGetTypeTest', (): void  => {

    let PAGE_TAG = 'ButtonGetTypeTest';

    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api20.static", "EntryAbility")
    });

    
    /**
     * @tc.number   ButtonGetTypeTest001
     * @tc.name     ButtonGetTypeTest001
     * @tc.desc     ButtonGetTypeTest001
     * @tc.level    Level.LEVEL0
     */
    it('ButtonGetTypeTest001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver =  Driver.create()
      await driver.triggerKey(2049)
      await Utils.sleep(1000)
      await driver.triggerKey(2119)
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('gettype');  // 可能是inspector.getInspectorByKey返回值有问题 strJson无法打印 导致crash
      console.log('ButtonGetTypeTest001 inspector.getInspectorByKey end')
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson); //  有问题
      console.log('ButtonGetTypeTest001 JSON.parseJsonElement end');
      console.info('[ButtonGetTypeTest001] component obj1 is: ' + JSON.stringify(obj));
      console.info('[ButtonGetTypeTest001] content is: ' + JSON.stringify(obj.getElement("$attrs").getString("content")));
      expect(obj.getElement("$attrs").getString("content")).assertEqual('successed')
      done();
    });
  })
}