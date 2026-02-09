/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';
import { ClassTest, PropsSelector } from './LiteralAsUnion';


export default function literalAsUnionType() {
  describe('LiteralAsUnionType', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   LiteralAsUnionType0001
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0001
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({prop:'front'}));
      expect(clsTest.testCase1()).assertTrue();
    });

    /**
     * @tc.name   LiteralAsUnionType0002
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0002
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({prop:'front'}));
      expect(clsTest.testCase2()).assertTrue();
    });
    /**
     * @tc.name   LiteralAsUnionType0003
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0003
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({prop:'front'}));
      expect(clsTest.testCase3()).assertTrue();
    });
    /**
     * @tc.name   LiteralAsUnionType0004
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0004
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({}));
      expect(clsTest.testCase1()).assertTrue();
    });

    /**
     * @tc.name   LiteralAsUnionType0005
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0005
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({}));
      expect(clsTest.testCase2()).assertTrue();
    });
    /**
     * @tc.name   LiteralAsUnionType0006
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0006
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({}));
      expect(clsTest.testCase3()).assertTrue();
    });

    /**
     * @tc.name   LiteralAsUnionType0007
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0007
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({prop:'back'}));
      expect(clsTest.testCase1()).assertTrue();
    });

    /**
     * @tc.name   LiteralAsUnionType0008
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0008
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({prop:'back'}));
      expect(clsTest.testCase2()).assertTrue();
    });
    /**
     * @tc.name   LiteralAsUnionType0009
     * @tc.number SUB_BUILTINS_LiteralAsUnionType_TEST0009
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LiteralAsUnionType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let clsTest = new ClassTest(new PropsSelector({prop:'back'}));
      expect(clsTest.testCase3()).assertTrue();
    });
  })
}