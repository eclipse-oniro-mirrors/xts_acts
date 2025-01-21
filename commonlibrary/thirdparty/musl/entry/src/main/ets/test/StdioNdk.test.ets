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
import stdio from 'libstdiondk.so'

export default function stdioNdkTest() {
  describe('MuslStdioTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VSPRINTFCHK_0100
     * @tc.name       : testMuslStdioVsprintfChk001
     * @tc.desc       : test vsprintfChk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVsprintfChk001', 0, async (done: Function) => {
      let data: number = stdio.vsprintfChk();
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SETBUF_0100
     * @tc.name       : testMuslStdioSetbuf001
     * @tc.desc       : test setbuf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSetbuf001', 0, async (done: Function) => {
      let data: number = stdio.setbuf();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SETBUFFER_0100
     * @tc.name       : testMuslStdioSetbuffer001
     * @tc.desc       : test setbuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSetbuffer001', 0, async (done: Function) => {
      let data: number = stdio.setbuffer();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SETLINEBUF_0100
     * @tc.name       : testMuslStdioSetlinebuf001
     * @tc.desc       : test setlinebuf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSetlinebuf001', 0, async (done: Function) => {
      let data: number = stdio.setlinebuf();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FEOF_0100
     * @tc.name       : testMuslStdioFEof001
     * @tc.desc       : test feof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFEof001', 0, async (done: Function) => {
      expect(stdio.feof()).assertEqual(0);
      done()
    });
  })
}