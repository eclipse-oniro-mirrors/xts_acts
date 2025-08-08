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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function checkboxOnChangeTest() {

  describe('CheckboxOnChangeTest', () => {

    let PAGE_TAG = 'CheckboxOnChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`checkbox/${PAGE_TAG}`, done);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CHECKBOX_ONCHANGE_0100
     * @tc.name       : testCheckboxOnChange001
     * @tc.desc       : testing onChange for checkbox
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCheckboxOnChange001', 0, async (done: Function) => {
      await Utils.clickComponent('OnChangeTestCheckBox')
      await Utils.sleep(2000)
      await Utils.clickComponent('OnChangeTestCheckBoxSelected')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnChangeTestCheckBox').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('OnChangeTestCheckBoxSelected').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      done()
    })

  })
}
