/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import buffer from "@ohos.fastbuffer";

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ActsFastBuffer3Test() {
  describe('ActsFastBuffer3Test', () => {
    beforeAll(() => {

    })

    beforeEach(async () => {
      await sleep(200);
    })

    afterAll(() => {

    })

    afterEach(() => {

    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_STRINGDECODER_0700
     * @tc.name       : testArrayScenarios0400
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testArrayScenarios0400 == ';
      let buf = buffer.from([
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28
      ])
      console.info(TAG + `buf: ${buf.length}`)
      expect(buf.length).assertEqual(360)
      done()
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_FASTBUFFER_BASE_STRINGDECODER_0800
     * @tc.name       : testArrayScenarios0500
     * @tc.desc       : Test ENCODER and DOCODER.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testArrayScenarios0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayScenarios0500 == ';
      let uint8Array = new Uint8Array([0, 0, 0, 0, 0, 72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      let newBuf = buffer.transcode(uint8Array, 'utf-8', 'ascii')
      console.info(TAG + `buf: ${newBuf.toString('ascii')}`)
      expect(newBuf.toString('ascii')).assertEqual('0,0,0,0,0,72,101,108,108,111,87,111,114,108,100,49,50,51,63')
    })
  })
}