/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import libMediaCppStandard from 'libmediacppstandard_test.so';

export default function ActsVideoDecEncNdkTest() {
  describe('ActsVideoDecEncNdkTest', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0100
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0100', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.VideoDecEncFuncTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0200
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0200', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.VideoDecEncFuncTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0300
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0300', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.VideoDecEncFuncTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0400
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0400', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.VideoDecEncFuncTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0500
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0500', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.VideoDecEncFuncTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0600
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0600', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.VideoDecEncFuncTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0700
     * @tc.desc   Basic function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0700', Level.LEVEL1, async () => {
      const result = await libMediaCppStandard.VideoDecEncFuncTest(6);
      expect(result).assertEqual(0);
    })
  })
}
