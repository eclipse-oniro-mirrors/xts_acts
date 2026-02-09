/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { test2019_01_ans } from './test2019_01'
import { test2019_03_ans } from './test2019_03'
import { test2019_06_ans } from './test2019_06'


export default function es2019Test() {
  describe('ES2019Test', () => {
    /**
     * @tc.name   testArray.prototype.flatMap
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0001
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArray.prototype.flatMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test2019_01_ans).assertDeepEquals([1, 2, 3, 4, 5, 6]);
    })
    /**
     * @tc.name   testArray.prototype.flat
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0002
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArray.prototype.flat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1 = [1, 2, [3, 4]];
      expect(arr1.flat()).assertDeepEquals([1, 2, 3, 4]);
      const arr2 = [1, 2, [3, 4, [5, 6]]];
      expect(arr2.flat(1)).assertDeepEquals([1, 2, 3, 4, [5, 6]]);
      const arr3 = [1, 2, [3, 4, [5, 6, [7, 8]]]];
      expect(arr3.flat(Infinity)).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
      const arr4 = [1, 2, , 4, 5];
      expect(arr4.flat()).assertDeepEquals([1, 2, 4, 5]);
    })
    /**
     * @tc.name   testObject.fromEntries
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0003
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObject.fromEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test2019_03_ans).assertDeepEquals({
        "one": 1, "two": 2, "three": 3
      });
    })
    /**
     * @tc.name   testTrimStart&TrimEnd
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0004
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTrimStart&TrimEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const test = " hello "
      expect(test.trimStart()).assertEqual("hello ");
      expect(test.trimEnd()).assertEqual(" hello");
    })
    /**
     * @tc.name   testAlternativeCatchParameter
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0005
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlternativeCatchParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        throw new Error("err");
      } catch {
        expect(1).assertEqual(1);
      }
    })
    /**
     * @tc.name   testSymbol.description
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0006
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSymbol.description', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(test2019_06_ans).assertEqual("Desc")
    })
    /**
     * @tc.name   testJsonSuperSet
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0007
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJsonSuperSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const jsonObj: JSON = JSON.parse('"\u2028\u2029Hello,World!"');
      expect(jsonObj.toString()).assertContain("Hello,World!");
    })
    /**
     * @tc.name   testJson.stringfy
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ES2019NewFeatures_0008
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJson.stringfy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(JSON.stringify('\u{D800}')).assertEqual("\"\\ud800\"");
      expect(JSON.stringify('\u{D83D}')).assertEqual("\"\\ud83d\"");
      expect(JSON.stringify('\u{DFFF}')).assertEqual("\"\\udfff\"");
    })
  })
}