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
import { UnionTypeTest } from './UnionTypeCombination';


export default function unionTypeCombination() {
  describe('UnionTypeCombination', () => {
    let unCls = new UnionTypeTest()
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
     * @tc.name   UnionTypeCombination0001
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0001
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test1()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0004
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0004
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test4()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0006
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0006
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test6()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0008
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0008
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test8()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0010
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0010
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test10()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0012
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0012
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test12()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0014
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0014
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test14()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0016
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0016
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test16()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0017
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0017
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test17()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0018
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0018
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test18()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0020
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0020
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test20()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0022
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0022
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test22()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0024
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0024
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test24()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0026
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0026
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test26()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0028
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0028
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test28()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0030
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0030
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test30()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0032
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0032
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test32()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0034
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0034
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test34()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0036
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0036
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test36()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0038
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0038
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test38()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0039
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0039
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test39()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0040
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0040
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test40()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0043
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0043
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test43()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0045
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0045
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test45()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0046
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0046
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test46()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0047
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0047
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test47()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0048
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0048
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test48()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0049
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0049
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test49()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0050
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0050
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test50()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0052
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0052
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test52()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0053
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0053
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test53()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0055
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0055
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test55()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0058
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0058
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test58()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0060
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0060
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test60()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0062
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0062
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test62()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0064
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0064
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test64()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0066
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0066
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test66()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0069
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0069
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test69()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0070
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0070
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test70()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0071
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0071
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test71()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0080
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0080
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test80()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0082
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0082
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test82()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0083
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0083
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test83()).assertTrue();
    });

    /**
     * @tc.name   UnionTypeCombination0097
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0097
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test97()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0098
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0098
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test98()).assertTrue();
    });
    /**
     * @tc.name   UnionTypeCombination0100
     * @tc.number SUB_BUILTINS_UnionTypeCombination_TEST0100
     * @tc.desc   Literal Types and Union Primitive Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UnionTypeCombination0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(unCls.test100()).assertTrue();
    });
  })
}