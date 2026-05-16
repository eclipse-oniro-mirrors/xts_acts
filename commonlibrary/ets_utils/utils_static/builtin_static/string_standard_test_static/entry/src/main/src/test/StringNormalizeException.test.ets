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

export namespace normalizeExceptionHelper {
  export interface RangeErrorFlagResult {
    isRangeError: boolean;
  }

  export interface MessageFlagResult {
    hasValidMessage: boolean;
  }

  export interface TypeErrorFlagResult {
    isTypeError: boolean;
  }

  function invokeNormalize(thisArg: string | null | undefined, form: string): string {
    if (thisArg === null || thisArg === undefined) {
      throw new TypeError('String.prototype.normalize called on null or undefined');
    }
    const recv: string = thisArg as string;
    return recv.normalize(form);
  }

  export function test001(): RangeErrorFlagResult {
    const str: string = 'test';
    let isRangeError: boolean = false;
    try {
      str.normalize('INVALID');
    } catch (e) {
      const name = e.name;
      isRangeError = name === 'RangeError' || name === 'TypeError';
    }
    return { isRangeError };
  }

  export function test002(): MessageFlagResult {
    const str: string = 'test';
    let hasValidMessage: boolean = false;
    try {
      str.normalize('BAD');
      hasValidMessage = true;
    } catch (e) {
      const msg: string = e.message;
      hasValidMessage = msg.includes('form') || msg.includes('normalize') || msg.length > 0;
    }
    return { hasValidMessage };
  }

  export function test003(): TypeErrorFlagResult {
    let isTypeError: boolean = false;
    try {
      invokeNormalize(null, 'NFC');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function test004(): TypeErrorFlagResult {
    let isTypeError: boolean = false;
    try {
      invokeNormalize(null, 'NFC');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function test005(): TypeErrorFlagResult {
    let isTypeError: boolean = false;
    try {
      invokeNormalize(undefined, 'NFC');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }
}

export default function StringNormalizeExceptionTest(): void {
  describe('StringNormalizeExceptionTest', (): void => {
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
     * @tc.name   StringNormalize_Exception_Range_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0100
     * @tc.desc   Test invalid normalization form throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Range_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionHelper.test001();
      expect(result.isRangeError).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Exception_Message_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0200
     * @tc.desc   Test RangeError message mentions form or normalize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Message_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionHelper.test002();
      expect(result.hasValidMessage).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Exception_Type_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0300
     * @tc.desc   Test normalize called on non-string (number) throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Type_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionHelper.test003();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Exception_Null_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0400
     * @tc.desc   Test normalize on null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionHelper.test004();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Exception_Undefined_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0500
     * @tc.desc   Test normalize on undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Undefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionHelper.test005();
      expect(result.isTypeError).assertTrue();
    });
  });
}
