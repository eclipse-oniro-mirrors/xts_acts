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
import { describe, it, expect } from "@ohos/hypium";
import langinfo from 'liblanginfondk.so';

export default function langInfoNdkTest() {
  describe('MuslLanginfoTest', () => {
    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_LANGINFO_NL_LANGINFO_0100
    * @tc.name       : testMuslLanginfoNlLanginfo001
    * @tc.desc       : test nl_langinfo
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMuslLanginfoNlLanginfo001', 0, async (done: Function) => {
      let a: string = langinfo.nlLanginfo();
      expect(a).assertEqual('Monday');
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_LANGINFO_NL_LANGINFO_L_0100
    * @tc.name       : testMuslLanginfoNlLanginfoL001
    * @tc.desc       : nl_langinfo_l
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMuslLanginfoNlLanginfoL001', 0, async (done: Function) => {
      let a: string = langinfo.nlLanginfoL();
      expect(a).assertEqual('UTF-8');
      done()
    });

  })
}