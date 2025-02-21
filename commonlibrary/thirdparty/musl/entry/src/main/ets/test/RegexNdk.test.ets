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
import regex from 'libregexndk.so'

export default function regexNdkTest() {
  describe('MuslRegexTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_REGEX_REGCOMP_0100
     * @tc.name       : testMuslRegexRegcomp001
     * @tc.desc       : test regcomp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslRegexRegcomp001', 0, async (done: Function) => {
      let result:number = regex.regcomp();
      console.info("Test regcomp result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_REGEX_REGEXEC_0100
     * @tc.name       : testMuslRegexRegexec001
     * @tc.desc       : test regexec
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslRegexRegexec001', 0, async (done: Function) => {
      let result:number = regex.regexec();
      console.info("Test regexec result = " + JSON.stringify(result));
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_REGEX_REGERROR_0100
     * @tc.name       : testMuslRegexRegerror001
     * @tc.desc       : test regexec
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslRegexRegerror001', 0, async (done: Function) => {
      let result:number = regex.regerror();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_REGEX_REGFREE_0100
     * @tc.name       : testMuslRegexRegfree001
     * @tc.desc       : test regfree
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslRegexRegfree001', 0, async (done: Function) => {
      let result:number = regex.regfree();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

  })
}