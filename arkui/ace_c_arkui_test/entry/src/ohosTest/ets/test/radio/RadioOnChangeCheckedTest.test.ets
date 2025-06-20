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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';

export default function radioOnChangeCheckedTest() {

  describe('RadioOnChangeCheckedTest', () => {

    let PAGE_TAG = 'RadioOnChangeCheckedTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`radio/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_RADIO_CHECKED_0800
    * @tc.name       : testRadioChecked008
    * @tc.desc       : testing two radios checked in same group for radio with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRadioChecked008', Level.LEVEL1, async (done: Function) => {
      let r1 = Utils.getComponentInfoByKey('OnChangeRadio').$attrs.checked;
      let r2 = Utils.getComponentInfoByKey('OnChangeRadio2').$attrs.checked;

      let r3 = false;

      if(r1 != r2)
      {
        r3 = true;
      }
      await Utils.sleep(2000);
      expect(r3).assertEqual(true)
      done()
    })

  })
}
