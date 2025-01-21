/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import syslog from 'libsyslogndk.so'

export default function syslogNdkTest() {
  describe('MuslSyslogTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSLOG_SETLOMASK_0100
     * @tc.name       : testMuslSyslogSetlogmask001
     * @tc.desc       : test setlogmask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSyslogSetlogmask001', 0, async (done: Function) => {
      let a: number = syslog.setlogmask();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSLOG_OPENLOG_0100
     * @tc.name       : testMuslSyslogOpenlog001
     * @tc.desc       : test openlog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSyslogOpenlog001', 0, async (done: Function) => {
      let data: number = syslog.openlog();

      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSLOG_SYSLOG_0100
     * @tc.name       : testMuslSyslogSyslog001
     * @tc.desc       : test syslog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSyslogSyslog001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = syslog.syslog();
      expect(result).assertEqual(resultTrue);
      done()
    });
  })
}