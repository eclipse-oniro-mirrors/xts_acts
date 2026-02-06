/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testProxyArguments39,
  testProxyArrayFindLast13,
  testProxyArrayFlatMap27,
  testProxyArrayWith28,
  testProxyAsyncGenerator7,
  testProxyAsyncGeneratorReturn8,
  testProxyBatchObserver37,
  testProxyBigIntOperations58,
  testProxyCallStackTrace19,
  testProxyCompositeDecorator38,
  testProxyComputedCache11,
  testProxyDateYear25,
  testProxyError29,
  testProxyErrorCauseChain14,
  testProxyFilterDangerousProps6,
  testProxyFinalizationRegistry55,
  testProxyFunctionBind23,
  testProxyFunctionCall24,
  testProxyFunctionCurry47,
  testProxyFunctionPipe48,
  testProxyImportMeta9,
  testProxyIntlTimezone26,
  testProxyLazyModuleLoad12,
  testProxyMapClear21,
  testProxyMathPow57,
  testProxyMathRandom32,
  testProxyNumberIsInteger31,
  testProxyParamValidation50,
  testProxyPreventProtoPollution5,
  testProxyPromiseFinally34,
  testProxyPropertyBreakpoint20,
  testProxyRateLimit49,
  testProxyRegExpExec4,
  testProxyRegExpTestIgnoreCase45,
  testProxySetForEach22,
  testProxyStateMachine59,
  testProxyStatePattern15,
  testProxyStrategyPattern16,
  testProxyThisContext40,
  testProxyToJSON17,
  testProxyWeakRef56
} from './Proxy3';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function proxy3Test() {
  describe('proxy3Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_0400
     * @tc.name proxy3Test004
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyRegExpExec4();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_0500
     * @tc.name proxy3Test005
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyPreventProtoPollution5();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_0600
     * @tc.name proxy3Test006
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyFilterDangerousProps6();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_0700
     * @tc.name proxy3Test007
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await testProxyAsyncGenerator7();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_0800
     * @tc.name proxy3Test008
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await testProxyAsyncGeneratorReturn8();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_0900
     * @tc.name proxy3Test009
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyImportMeta9();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1100
     * @tc.name proxy3Test011
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyComputedCache11();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1200
     * @tc.name proxy3Test012
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyLazyModuleLoad12();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1300
     * @tc.name proxy3Test013
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyArrayFindLast13();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1400
     * @tc.name proxy3Test014
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyErrorCauseChain14();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1500
     * @tc.name proxy3Test015
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyStatePattern15();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1600
     * @tc.name proxy3Test016
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyStrategyPattern16();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1700
     * @tc.name proxy3Test017
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyToJSON17();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_1900
     * @tc.name proxy3Test019
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyCallStackTrace19();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2000
     * @tc.name proxy3Test020
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyPropertyBreakpoint20();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2100
     * @tc.name proxy3Test021
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyMapClear21();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2200
     * @tc.name proxy3Test022
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxySetForEach22();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2300
     * @tc.name proxy3Test023
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyFunctionBind23();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2400
     * @tc.name proxy3Test024
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyFunctionCall24();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2500
     * @tc.name proxy3Test025
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyDateYear25();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2600
     * @tc.name proxy3Test026
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyIntlTimezone26();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2700
     * @tc.name proxy3Test027
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyArrayFlatMap27();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2800
     * @tc.name proxy3Test028
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyArrayWith28();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_2900
     * @tc.name proxy3Test029
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyError29();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_3100
     * @tc.name proxy3Test031
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyNumberIsInteger31();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_3200
     * @tc.name proxy3Test032
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyMathRandom32();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_3400
     * @tc.name proxy3Test034
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await testProxyPromiseFinally34();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_3700
     * @tc.name proxy3Test037
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyBatchObserver37();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_3800
     * @tc.name proxy3Test038
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyCompositeDecorator38();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_3900
     * @tc.name proxy3Test039
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyArguments39();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_4000
     * @tc.name proxy3Test040
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyThisContext40();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_4500
     * @tc.name proxy3Test045
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyRegExpTestIgnoreCase45();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_4700
     * @tc.name proxy3Test047
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyFunctionCurry47();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_4800
     * @tc.name proxy3Test048
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyFunctionPipe48();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_4900
     * @tc.name proxy3Test049
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyRateLimit49();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_5000
     * @tc.name proxy3Test050
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyParamValidation50();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_5500
     * @tc.name proxy3Test055
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyFinalizationRegistry55();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_5600
     * @tc.name proxy3Test056
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyWeakRef56();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_5700
     * @tc.name proxy3Test057
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyMathPow57();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_5800
     * @tc.name proxy3Test058
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyBigIntOperations58();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY3_TEST_5900
     * @tc.name proxy3Test059
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxy3Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyStateMachine59();
      expect(result).assertEqual(true);
    });
  })
}