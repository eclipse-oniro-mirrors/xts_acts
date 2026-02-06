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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libnativetype from 'libnativetype.so'
import Utils from '../common/Utils';

const OS_ACCOUNT_ERR_INVALID_PARAMETER = 12300002;

export default function UnmarshallStyledStringDescriptorTest() {
  describe('UnmarshallStyledStringDescriptorTest', () => {
    /**
     * @tc.name   testArkUIACEUnmarshallStyledStringDescriptorTest0100
     * @tc.number SUB_ArkUI_ACE_UnmarshallStyledStringDescriptorTest_0100
     * @tc.desc   testing OH_ArkUI_UnmarshallStyledStringDescriptor interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEUnmarshallStyledStringDescriptorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_SnapshotOptionsSetScaleTest_0100 start====");
          await Utils.sleep(500);
          const text = "Test";
          const textLen = text.length;
          const totalSize = 4 + textLen + 4 + 4 + 4;
          const buffer = new ArrayBuffer(totalSize);
          const uint8Buffer = new Uint8Array(buffer);
          let offset = 0;
          uint8Buffer[offset++] = textLen & 0xFF;
          uint8Buffer[offset++] = (textLen >> 8) & 0xFF;
          uint8Buffer[offset++] = (textLen >> 16) & 0xFF;
          uint8Buffer[offset++] = (textLen >> 24) & 0xFF;
          for (let i = 0; i < textLen; i++) {
            uint8Buffer[offset++] = text.charCodeAt(i);
          }
          uint8Buffer[offset++] = 0x00;
          uint8Buffer[offset++] = 0x00;
          uint8Buffer[offset++] = 0x00;
          uint8Buffer[offset++] = 0x00;
          uint8Buffer[offset++] = 0xFF;
          uint8Buffer[offset++] = 0x00;
          uint8Buffer[offset++] = 0x00;
          uint8Buffer[offset++] = 0x00;
          const float32Arr = new Float32Array([12.0]);
          const floatBytes = new Uint8Array(float32Arr.buffer);
          uint8Buffer[offset++] = floatBytes[0];
          uint8Buffer[offset++] = floatBytes[1];
          uint8Buffer[offset++] = floatBytes[2];
          uint8Buffer[offset++] = floatBytes[3];
          const bufferSize = uint8Buffer.byteLength;
          let result: number = libnativetype.UnmarshallStyledStringDescriptor(buffer, bufferSize);
          console.info("====>SUB_ArkUI_ACE_SnapshotOptionsSetScaleTest_0100 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_SnapshotOptionsSetScaleTest_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        }
      })
    /**
     * @tc.name   testArkUIACEUnmarshallStyledStringDescriptorTest0200
     * @tc.number SUB_ArkUI_ACE_UnmarshallStyledStringDescriptorTest_0200
     * @tc.desc   testing OH_ArkUI_UnmarshallStyledStringDescriptor interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUIACEUnmarshallStyledStringDescriptorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_ArkUI_ACE_UnmarshallStyledStringDescriptorTest_0200 start====");
          await Utils.sleep(500);
          let result: number = libnativetype.UnmarshallStyledStringDescriptor();
          console.info("====>SUB_ArkUI_ACE_UnmarshallStyledStringDescriptorTest_0200 result: " + result);
          expect(result).assertEqual(401);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_UnmarshallStyledStringDescriptorTest_0200 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_INVALID_PARAMETER);
        }
      })
  })
}
