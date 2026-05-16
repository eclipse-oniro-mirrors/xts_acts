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
import ftw from 'libftwndk.so'

export default function ftwNdkTest() {
  describe('MuslFtwTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslFtwFtw001
     * @tc.number SUB_THIRDPARTY_MUSL_FTW_FTW_0100
     * @tc.desc   test ftw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslFtwFtw001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = ftw.ftw();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslFtwFtw64001
     * @tc.number SUB_THIRDPARTY_MUSL_FTW_FTW64_0100
     * @tc.desc   test ftw64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslFtwFtw64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = ftw.ftw64();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.name   testMuslFtwNftw001
     * @tc.number SUB_THIRDPARTY_MUSL_FTW_NFTW_0100
     * @tc.desc   nftw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslFtwNftw001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = ftw.nftw();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslFtwNftw64001
     * @tc.number SUB_THIRDPARTY_MUSL_FTW_NFTW64_0100
     * @tc.desc   nftw64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslFtwNftw64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = ftw.nftw64();
      expect(a).assertEqual(0);
      done()
    });
  })
}