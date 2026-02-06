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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';

export default function buttonGetTypeTest() {

  describe('ButtonGetTypeTest', () => {

    let PAGE_TAG = 'ButtonGetTypeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`button/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   ButtonGetTypeTest001
     * @tc.number SUB_ARKUI_CAPI_BUTTON_GetType_0100
     * @tc.desc   test OH_ArkUI_UIInputEvent_GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ButtonGetTypeTest001', Level.LEVEL0, async (done: Function) => {
      let driver = await Driver.create()
      await driver.triggerKey(2049)
      await Utils.sleep(2000)
      await driver.triggerKey(2119)
      await Utils.sleep(1000)
      let strJson = getInspectorByKey('gettype');
      await Utils.sleep(2000);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ButtonGetTypeTest001] component obj1 is: ' + JSON.stringify(obj));
      console.info('[ButtonGetTypeTest001] content is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('successed')
      done();
    });
  })
}