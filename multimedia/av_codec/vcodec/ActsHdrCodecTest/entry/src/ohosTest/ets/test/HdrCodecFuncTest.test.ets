/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import libHdrCodec from 'libhdrcodec.so';

export default function HdrCodecFuncTest() {
  describe('HdrCodecFuncTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   HDR_FUNC_0010
     * @tc.number HDR_FUNC_0010
     * @tc.desc   MAIN_10 Profile decode PQ Vivid content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HDR_FUNC_0010', Level.LEVEL1, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   HDR_FUNC_0020
     * @tc.number HDR_FUNC_0020
     * @tc.desc   MAIN_10 Profile decode HLG Vivid 4K content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HDR_FUNC_0020', Level.LEVEL1, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   HDR_FUNC_0030
     * @tc.number HDR_FUNC_0030
     * @tc.desc   MAIN Profile decode PQ Vivid, errors allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HDR_FUNC_0030', Level.LEVEL2, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   HDR_FUNC_0040
     * @tc.number HDR_FUNC_0040
     * @tc.desc   MAIN Profile decode HLG Vivid 4K, errors allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HDR_FUNC_0040', Level.LEVEL2, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   HDR_FUNC_0050
     * @tc.number HDR_FUNC_0050
     * @tc.desc   MAIN_10 Profile, repeat Start/Stop 5 times stress test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HDR_FUNC_0050', Level.LEVEL2, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   HDR_FUNC_0060
     * @tc.number HDR_FUNC_0060
     * @tc.desc   MAIN_10 Profile, repeat Start/Flush/Stop 5 times stress test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HDR_FUNC_0060', Level.LEVEL2, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   HDR_FUNC_0070
     * @tc.number HDR_FUNC_0070
     * @tc.desc   MAIN_10 Profile, repeat Start/Flush 5 times stress test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HDR_FUNC_0070', Level.LEVEL2, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   HDR_FUNC_0080
     * @tc.number HDR_FUNC_0080
     * @tc.desc   4K to 1080p dynamic resolution switch test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('HDR_FUNC_0080', Level.LEVEL1, async (done: Function) => {
      const result: number = await libHdrCodec.HdrFuncTest(7);
      expect(result).assertEqual(0);
      done();
    })

  })
}
