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

import { beforeEach, expect, describe, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function radioValueTest() {

  describe('RadioValueTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_VALUE_0100
     * @tc.name       : testRadioValue001
     * @tc.desc       : testing value for Radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioValue001', 0, async (done: Function) => {
      expect(nativeFunc.testRadioValue001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_VALUE_0200
     * @tc.name       : testRadioValue002
     * @tc.desc       : testing value for Radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioValue002', 0, async (done: Function) => {
      expect(nativeFunc.testRadioValue002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_VALUE_0300
     * @tc.name       : testRadioValue003
     * @tc.desc       : testing value for Radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioValue003', 0, async (done: Function) => {
      expect(nativeFunc.testRadioValue003()).assertEqual(0)
      done();
    })

  })
}
