/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import stdioext1 from 'libstdioextndk1.so'

export default function muslStdioExt1Test() {
  describe('MuslStdioExt1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslStdioExtfBufSize001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FBUF_SIZE_0100
     * @tc.desc   test __fbufsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtfBufSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fBufSize_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtfBufSize002
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FBUF_SIZE_0200
     * @tc.desc   test __fbufsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtfBufSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fBufSize_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFLbf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0100
     * @tc.desc   test __flbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFLbf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fLbf_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFLbf002
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0200
     * @tc.desc   test __flbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFLbf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fLbf_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFLbf003
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0300
     * @tc.desc   test __flbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFLbf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fLbf_Three()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFPending001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FPENDING_0100
     * @tc.desc   test __fpending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFPending001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fPending_One()).assertLarger(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFPending002
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FPENDING_0200
     * @tc.desc   test __fpending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFPending002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fPending_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFPurge001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FPURGE_0100
     * @tc.desc   test __fpurge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFPurge001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fPurge_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFReadable001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADABLE_0100
     * @tc.desc   test __freadable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFReadable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fReadable_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFReadable002
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADABLE_0200
     * @tc.desc   test __freadable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFReadable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fReadable_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFReading001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADING_0100
     * @tc.desc   test __freading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFReading001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fReading_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFReading002
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADING_0200
     * @tc.desc   test __freading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFReading002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fReading_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFSetErr001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FSETERR_0100
     * @tc.desc   test __fseterr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFSetErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fSetErr()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFWritable001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITABLE_0100
     * @tc.desc   test __fwritable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFWritable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fWritable_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFWritable002
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITABLE_0200
     * @tc.desc   test __fwritable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFWritable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fWritable_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFWriting001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITING_0100
     * @tc.desc   test __fwriting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFWriting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fWriting_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFWriting002
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITING_0200
     * @tc.desc   test __fwriting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFWriting002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.fWriting_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFlushLbf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FLUSH_LBF_0100
     * @tc.desc   test _flushlbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFlushLbf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext1.flushLbf()).assertEqual(0);
      done()
    });
  })
}
