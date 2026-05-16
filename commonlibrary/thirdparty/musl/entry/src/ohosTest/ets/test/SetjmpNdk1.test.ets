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
import setjmp from 'libsetjmpndk1.so'

export default function muslSetJmpNdk1Test() {
  describe('MuslSetjmp1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslSetjmpLongjmp001
     * @tc.number SUB_THIRDPARTY_MUSL_SETJMP_LONGJMP_0100
     * @tc.desc   test longjmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSetjmpLongjmp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = setjmp.longjmp();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSetjmpSetjmp1001
     * @tc.number SUB_THIRDPARTY_MUSL_SETJMP_SETJMP1_0100
     * @tc.desc   test _setjmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSetjmpSetjmp1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a:number = setjmp._setjmp();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslSetjmpLongJmp1001
     * @tc.number SUB_THIRDPARTY_MUSL_SETJMP_LONGJMP1_0100
     * @tc.desc   test _longjmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSetjmpLongJmp1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a:number = setjmp._longjmp();
      expect(a).assertEqual(0);
      done()
    });
  })
}