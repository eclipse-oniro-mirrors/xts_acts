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

export default function radioRadioStyleTest() {

  describe('RadioRadioStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_STYLE_0100
     * @tc.name       : testRadioRadioStyle001
     * @tc.desc       : testing Style for radio with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioRadioStyle001', 0, async (done: Function) => {
      expect(nativeFunc.testRadioRadioStyle001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_STYLE_0200
     * @tc.name       : testRadioRadioStyle002
     * @tc.desc       : testing Style for radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioRadioStyle002', 0, async (done: Function) => {
      expect(nativeFunc.testRadioRadioStyle002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_STYLE_0300
     * @tc.name       : testRadioRadioStyle003
     * @tc.desc       : testing Style for radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioRadioStyle003', 0, async (done: Function) => {
      expect(nativeFunc.testRadioRadioStyle003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_STYLE_0400
     * @tc.name       : testRadioRadioStyle004
     * @tc.desc       : testing Style for radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioRadioStyle004', 0, async (done: Function) => {
      expect(nativeFunc.testRadioRadioStyle004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RADIO_STYLE_0500
     * @tc.name       : testRadioRadioStyle005
     * @tc.desc       : testing Style for radio with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRadioRadioStyle005', 0, async (done: Function) => {
      expect(nativeFunc.testRadioRadioStyle005()).assertEqual(0)
      done();
    })
  })
}
