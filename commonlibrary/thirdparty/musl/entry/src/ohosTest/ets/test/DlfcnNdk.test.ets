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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import dlfcnndk from 'libdlfcnndk.so'

export default function dlfcnNdkTest() {
  describe('MuslDlfcnTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslDlFcnDlSym001
     * @tc.number SUB_THIRDPARTY_MUSL_DLFCN_DLSYM_0100
     * @tc.desc   test dlsym
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslDlFcnDlSym001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(dlfcnndk.dlsym()).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslDlFcnDlVSym001
     * @tc.number SUB_THIRDPARTY_MUSL_DLFCN_DLVSYM_0100
     * @tc.desc   test dlvsym
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslDlFcnDlVSym001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(dlfcnndk.dlvsym()).assertEqual(0);
      done()
    });

  })
}
