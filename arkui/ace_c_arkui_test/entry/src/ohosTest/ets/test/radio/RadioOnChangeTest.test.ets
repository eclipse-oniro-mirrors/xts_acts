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

export default function radioOnChangeTest() {

  describe('RadioOnChangeTest', () => {

    let PAGE_TAG = 'RadioOnChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`radio/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_RADIO_EVENT_ON_CHANGE_0100
    * @tc.name       : testRadioOnChange001
    * @tc.desc       : testing onChange event callback for radio with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRadioOnChange001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnChangeRadio')
      await Utils.sleep(3000);
      expect(Utils.getComponentInfoByKey('OnChangeRadio').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

  })
}
