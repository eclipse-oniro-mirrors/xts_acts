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

import { describe, it, expect, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver } from '@ohos.UiTest';

export default function textAreaOnBlurTest() {

  describe('TextAreaOnBlurTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ONBLUR_0100
     * @tc.name: testTextAreaOnBlur001
     * @tc.desc: testing onBlur for textArea
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaOnBlur001', 0, async (done: Function) => {
      let PAGE_TAG = 'TextAreaOnBlurTest';
      let driver: Driver = Driver.create();
      await Utils.sleep(500);
      await Utils.pushPage(`textarea/${PAGE_TAG}`);
      await Utils.sleep(500);
      await driver.triggerKey(2070)
      await Utils.clickComponent('TextAreaOnBlur');
      await Utils.sleep(500);
      await driver.triggerKey(2070)
      await Utils.clickComponent('TextAreaOnFocusCompare');
      await Utils.sleep(1000);
      await driver.triggerKey(2070)
      await Utils.sleep(3000);
      expect(Utils.getComponentInfoByKey('TextAreaOnBlur').$attrs.backgroundColor).assertEqual('#FFFF0000');
      done();
    })
  })
}
