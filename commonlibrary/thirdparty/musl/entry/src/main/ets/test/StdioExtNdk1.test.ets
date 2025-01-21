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

import { describe, expect, it } from '@ohos/hypium'
import stdioext1 from 'libstdioextndk1.so'

export default function muslStdioExt1Test() {
  describe('MuslStdioExt1Test', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FBUF_SIZE_0100
     * @tc.name       : testMuslStdioExtfBufSize001
     * @tc.desc       : test __fbufsize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtfBufSize001', 0, async (done: Function) => {
      expect(stdioext1.fBufSize_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FBUF_SIZE_0200
     * @tc.name       : testMuslStdioExtfBufSize002
     * @tc.desc       : test __fbufsize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtfBufSize002', 0, async (done: Function) => {
      expect(stdioext1.fBufSize_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0100
     * @tc.name       : testMuslStdioExtFLbf001
     * @tc.desc       : test __flbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFLbf001', 0, async (done: Function) => {
      expect(stdioext1.fLbf_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0200
     * @tc.name       : testMuslStdioExtFLbf002
     * @tc.desc       : test __flbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFLbf002', 0, async (done: Function) => {
      expect(stdioext1.fLbf_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0300
     * @tc.name       : testMuslStdioExtFLbf003
     * @tc.desc       : test __flbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFLbf003', 0, async (done: Function) => {
      expect(stdioext1.fLbf_Three()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FPENDING_0100
     * @tc.name       : testMuslStdioExtFPending001
     * @tc.desc       : test __fpending
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFPending001', 0, async (done: Function) => {
      expect(stdioext1.fPending_One()).assertLarger(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FPENDING_0200
     * @tc.name       : testMuslStdioExtFPending002
     * @tc.desc       : test __fpending
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFPending002', 0, async (done: Function) => {
      expect(stdioext1.fPending_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FPURGE_0100
     * @tc.name       : testMuslStdioExtFPurge001
     * @tc.desc       : test __fpurge
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFPurge001', 0, async (done: Function) => {
      expect(stdioext1.fPurge_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADABLE_0100
     * @tc.name       : testMuslStdioExtFReadable001
     * @tc.desc       : test __freadable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFReadable001', 0, async (done: Function) => {
      expect(stdioext1.fReadable_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADABLE_0200
     * @tc.name       : testMuslStdioExtFReadable002
     * @tc.desc       : test __freadable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFReadable002', 0, async (done: Function) => {
      expect(stdioext1.fReadable_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADING_0100
     * @tc.name       : testMuslStdioExtFReading001
     * @tc.desc       : test __freading
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFReading001', 0, async (done: Function) => {
      expect(stdioext1.fReading_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADING_0200
     * @tc.name       : testMuslStdioExtFReading002
     * @tc.desc       : test __freading
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFReading002', 0, async (done: Function) => {
      expect(stdioext1.fReading_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FSETERR_0100
     * @tc.name       : testMuslStdioExtFSetErr001
     * @tc.desc       : test __fseterr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFSetErr001', 0, async (done: Function) => {
      expect(stdioext1.fSetErr()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITABLE_0100
     * @tc.name       : testMuslStdioExtFWritable001
     * @tc.desc       : test __fwritable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFWritable001', 0, async (done: Function) => {
      expect(stdioext1.fWritable_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITABLE_0200
     * @tc.name       : testMuslStdioExtFWritable002
     * @tc.desc       : test __fwritable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFWritable002', 0, async (done: Function) => {
      expect(stdioext1.fWritable_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITING_0100
     * @tc.name       : testMuslStdioExtFWriting001
     * @tc.desc       : test __fwriting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFWriting001', 0, async (done: Function) => {
      expect(stdioext1.fWriting_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITING_0200
     * @tc.name       : testMuslStdioExtFWriting002
     * @tc.desc       : test __fwriting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFWriting002', 0, async (done: Function) => {
      expect(stdioext1.fWriting_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FLUSH_LBF_0100
     * @tc.name       : testMuslStdioExtFlushLbf001
     * @tc.desc       : test _flushlbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFlushLbf001', 0, async (done: Function) => {
      expect(stdioext1.flushLbf()).assertEqual(0);
      done()
    });
  })
}
