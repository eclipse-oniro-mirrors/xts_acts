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
import nltypes from 'libnltypesndk.so'

export default function nltypesNdkTest() {
  describe('MuslNltypesTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NLTYPES_CATOPEN_0100
     * @tc.name       : testMuslNltypesCatopen001
     * @tc.desc       : test catopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNltypesCatopen001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = nltypes.catOpen();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NLTYPES_CATGETS_0100
     * @tc.name       : testMuslNltypesCatgets001
     * @tc.desc       : test catgets
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNltypesCatgets001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = nltypes.catgets();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NLTYPES_CATCLOSE_0100
     * @tc.name       : testMuslNltypesCatclose001
     * @tc.desc       : test catclose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNltypesCatclose001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = nltypes.catclose();
      expect(result).assertEqual(resultTrue);
      done()
    });
  })
}