/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import entry from 'libentry.so';

export default function PtsApiTest() {
  describe('PtsApiTest.ets', () => {
    beforeAll(() => {
      entry.Pts_Api_Prepare(0);
    })
    beforeEach(() => {

    })
    afterEach(() => {
      entry.Pts_Api_Prepare(3)
    })
    afterAll(() => {

    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_001
     * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_PTS_FUNC_001", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.Pts_Api_Test(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_002
     * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_PTS_FUNC_002", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.Pts_Api_Test(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_003
     * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_PTS_FUNC_003", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.Pts_Api_Test(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_004
     * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_004
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_PTS_FUNC_004", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.Pts_Api_Test(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_005
     * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_005
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_PTS_FUNC_005", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.Pts_Api_Test(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_006
     * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_PTS_FUNC_006", Level.LEVEL1, async  (done: Function) => {
      const result = await entry.Pts_Api_Test(5);
      expect(result).assertEqual(0);
      done();
    })
  })
}