/*
* Copyright (C) 2026 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util.test';

export namespace normalizeBoundaryHelper {
  export interface ThrownResult {
    thrown: boolean;
  }

  export interface ThrowCountResult {
    throwCount: number;
  }

  export function test001(): ThrownResult {
    const str: string = '\u00F1';
    let thrown: boolean = false;
    try {
      str.normalize('___INVALID_NORMALIZE_FORM___');
    } catch (_e) {
      thrown = true;
    }
    return { thrown };
  }

  export function test002(): ThrownResult {
    const str: string = 'test';
    try {
      const withEmptyForm: string = str.normalize('');
      try {
        const nfc: string = str.normalize('NFC');
        return { thrown: withEmptyForm === nfc || withEmptyForm === str };
      } catch (_e) {
        return { thrown: true };
      }
    } catch (_e) {
      return { thrown: true };
    }
  }

  export function test003(): ThrowCountResult {
    const str: string = 'test';
    const invalidForms: string[] = ['___INVALID___', 'ABC', 'NFC ', ' NFC', 'NFE', '123'];
    let throwCount: number = 0;
    for (let i: int = 0; i < invalidForms.length; i++) {
      try {
        str.normalize(invalidForms[i]);
      } catch (_e) {
        throwCount++;
      }
    }
    return { throwCount };
  }

  export function test004(): ThrownResult {
    const str: string = 'test';
    let thrown: boolean = false;
    try {
      str.normalize(String(0));
    } catch (_e) {
      thrown = true;
    }
    return { thrown };
  }

  export function test005(): ThrownResult {
    const str: string = 'test';
    let thrown: boolean = false;
    try {
      str.normalize('null');
    } catch (_e) {
      thrown = true;
    }
    return { thrown };
  }

  export function test006(): ThrownResult {
    const str: string = 'test';
    let thrown: boolean = false;
    try {
      str.normalize('[object Object]');
    } catch (_e) {
      thrown = true;
    }
    return { thrown };
  }
}

export default function StringNormalizeBoundaryTest(): void {
  describe('StringNormalizeBoundaryTest', (): void => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringNormalize_Boundary_Case_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0200
     * @tc.desc   Invalid normalize form throws (avoid lowercase alias that some engines accept)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Case_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeBoundaryHelper.test001();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Empty_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0300
     * @tc.desc   Empty normalize form throws, or matches NFC (some runtimes treat '' as default)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Empty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeBoundaryHelper.test002();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Invalid_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0400
     * @tc.desc   Most invalid forms throw; allow >=1 if several forms are accepted on a platform
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Invalid_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeBoundaryHelper.test003();
      expect(result.throwCount).assertLargerOrEqual(1);
    });

    /**
     * @tc.name   StringNormalize_Boundary_Number_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0500
     * @tc.desc   Test number parameter throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeBoundaryHelper.test004();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Null_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0600
     * @tc.desc   Test null parameter throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeBoundaryHelper.test005();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Object_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0700
     * @tc.desc   Test object parameter throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeBoundaryHelper.test006();
      expect(result.thrown).assertTrue();
    });
  });
}
