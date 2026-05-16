/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import entry from 'libentry.so';

export default function AudioEncoderTest() {
  describe('Hwh265Hdr2sdrTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   HEVC_HW_HDR2SDR_FUNC_002
     * @tc.number HEVC_HW_HDR2SDR_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HEVC_HW_HDR2SDR_FUNC_002', Level.LEVEL2, async (done: Function) => {
      const result = await entry.Hwh265_Hdr2sdr_Test(0);
      expect(result).assertEqual(0);
      done();
    })
  })
}