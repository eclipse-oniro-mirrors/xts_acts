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

export default function radioGroupTest() {

  describe('RadioGroupTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_GROUP_0100
     * @tc.name       : testRadioGroup001
     * @tc.desc       : testing Group for Radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioGroup001', 0, async (done: Function) => {
      expect(nativeFunc.testRadioGroup001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_GROUP_0200
     * @tc.name       : testRadioGroup002
     * @tc.desc       : testing Group for Radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioGroup002', 0, async (done: Function) => {
      expect(nativeFunc.testRadioGroup002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_GROUP_0300
     * @tc.name       : testRadioGroup003
     * @tc.desc       : testing Group for Radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioGroup003', 0, async (done: Function) => {
      expect(nativeFunc.testRadioGroup003()).assertEqual(0)
      done();
    })

  })
}
