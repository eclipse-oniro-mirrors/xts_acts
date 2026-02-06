/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import hilog from '@ohos.hilog'
import napitestex from 'libnapitestex.so'
import worker, { MessageEvents } from '@ohos.worker';

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

interface TestObject {
  test: string;
}

export default function napiCheckExTest() {
  describe('napiCheckExTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiCheckExTest] after each called')
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0001
     * @tc.name napiTestEx0001
     * @tc.desc napiTestEx
     */
    it('napiTestEx0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBufferCopy();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0002
     * @tc.name napiBufferTest002
     * @tc.desc aceNapiEtsTest
     */
    it('napiBufferTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBuffer();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0003
     * @tc.name napiBufferTest003
     * @tc.desc aceNapiEtsTest
     */
    it('napiBufferTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buffer: Object = napitestex.CreateBufferCopy();
      expect(napitestex.IsBuffer(buffer)).assertTrue();
      expect(napitestex.GetBufferInfo(buffer)).assertTrue();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0004
     * @tc.name napiBufferTest004
     * @tc.desc aceNapiEtsTest - Test external buffer creation and finalize callback
     */
    it('napiBufferTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let externalBuffer: Object = napitestex.CreateExternalBufferTest();
      expect(napitestex.IsBuffer(externalBuffer)).assertTrue();
      expect(napitestex.GetBufferInfo(externalBuffer)).assertTrue();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0005
     * @tc.name napiBufferTest005
     * @tc.desc aceNapiEtsTest - Test buffer creation edge cases and error handling
     */
    it('napiBufferTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试零长度buffer
      let zeroLengthBuffer: Object = napitestex.createBufferSizeZeroTest();
      expect(zeroLengthBuffer).assertDeepEquals(1);

      // 测试最大长度buffer (2097152)
      let maxLengthBuffer: Object = napitestex.CreateBufferMaxLength();
      hilog.info(0x0000, 'testTag', 'maxLengthBuffer:%{public}d', maxLengthBuffer);
      expect(maxLengthBuffer).assertDeepEquals(0);

      // 测试超过最大长度 - 应该返回错误状态
      let invalidLengthStatus: Object = napitestex.CreateBufferExceedMaxLength();
      // 检查返回的是否为错误状态码 (napi_invalid_arg)
      hilog.info(0x0000, 'testTag', 'invalidLengthStatus:%{public}d', invalidLengthStatus);
      expect(invalidLengthStatus).assertDeepEquals(1); // napi_invalid_arg = 1

      // 测试无效参数 - 应该返回错误状态(crash)
      //let invalidEnvStatus: Object = napitestex.CreateBufferInvalidEnv();
      //hilog.info(0x0000, 'testTag', 'invalidEnvStatus:%{public}d', invalidEnvStatus);
      //expect(invalidEnvStatus).assertDeepEquals(1); // napi_invalid_arg = 1

      let invalidDataStatus: Object = napitestex.CreateBufferInvalidData();
      hilog.info(0x0000, 'testTag', 'invalidDataStatus:%{public}d', invalidDataStatus);
      expect(invalidDataStatus).assertDeepEquals(1); // napi_invalid_arg = 1

      //(crash)
      //let invalidResultStatus: Object = napitestex.CreateBufferInvalidResult();
      //hilog.info(0x0000, 'testTag', 'invalidResultStatus:%{public}d', invalidResultStatus);
      //expect(invalidResultStatus).assertDeepEquals(1); // napi_invalid_arg = 1
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0006
     * @tc.name napiBufferTest006
     * @tc.desc aceNapiEtsTest - Test non-ArrayBuffer object detection
     */
    it('napiBufferTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试非buffer对象的检测
      let notABuffer: Object = napitestex.CreateInt32Test();
      hilog.info(0x0000, 'testTag', 'notABuffer:%{public}d', notABuffer);
      expect(napitestex.IsBuffer(notABuffer)).assertFalse();

      // 测试获取非buffer对象信息应该返回错误
      let getBufferInfoStatus: Object = napitestex.GetBufferInfoNonBuffer(notABuffer);
      hilog.info(0x0000, 'testTag', 'getBufferInfoStatus:%{public}d', getBufferInfoStatus);
      // 应该返回 napi_arraybuffer_expected 错误码
      expect(getBufferInfoStatus).assertDeepEquals(19); // napi_arraybuffer_expected = 19
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0007
     * @tc.name napiBufferTest007
     * @tc.desc aceNapiEtsTest - Test multiple operations combination
     */
    it('napiBufferTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试多种操作的组合
      let testResult: Object = napitestex.TestMultipleOperations();
      hilog.info(0x0000, 'testTag', 'testResult:%{public}d', testResult);
      // 所有操作成功应该返回 0 (napi_ok)
      expect(testResult).assertDeepEquals(0);
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_BUFFER_0009
     * @tc.name napiBufferTest009
     * @tc.desc aceNapiEtsTest - Test ArrayBuffer and external ArrayBuffer comparison
     */
    it('napiBufferTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // 测试ArrayBuffer和外部ArrayBuffer的比对
      let comparisonResult: number = napitestex.TestArrayBufferComparison();
      hilog.info(0x0000, 'testTag', 'comparisonResult:%{public}d', comparisonResult);
      // 所有测试通过应该返回 0 (napi_ok)
      expect(comparisonResult).assertDeepEquals(1);
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0001
     * @tc.name      : testArrayBufferTest0001
     * @tc.desc      : Testing NapiWrapEnhanceTest multi object binding testing.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testArrayBufferTest0001 START');
      try {
        let result: boolean = napitestex.NapiArrayBufferTest01();
        console.info('testArrayBufferTest0001 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0001 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0002
     * @tc.name      : testArrayBufferTest0002
     * @tc.desc      : Testing ArrayBuffer creation and basic operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0002 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest02();
        console.info('testArrayBufferTest0002 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0002 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0003
     * @tc.name      : testArrayBufferTest0003
     * @tc.desc      : Testing ArrayBuffer data writing and verification.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0003 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest04();
        console.info('testArrayBufferTest0003 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0003 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0004
     * @tc.name      : testArrayBufferTest0004
     * @tc.desc      : Testing ArrayBuffer detach operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0004 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest04();
        console.info('testArrayBufferTest0004 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0004 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0005
     * @tc.name      : testArrayBufferTest0005
     * @tc.desc      : Testing zero-length ArrayBuffer operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0005 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest05();
        console.info('testArrayBufferTest0005 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0005 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ARRAYBUFFER_0006
     * @tc.name      : testArrayBufferTest0006
     * @tc.desc      : Testing ArrayBuffer multiple detach operations.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testArrayBufferTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testArrayBufferTest0006 START');
      try {
        const result: boolean = napitestex.NapiArrayBufferTest06();
        console.info('testArrayBufferTest0006 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testArrayBufferTest0006 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    // ==================== NAPI Number Tests ====================

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0001
     * @tc.name testNumberCreationAndRetrieval
     * @tc.desc Test number creation and retrieval using NAPI functions to ensure correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberCreationAndRetrieval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNumberCreationAndRetrieval START');

      try {
        // 调用C++测试函数进行数值创建和获取测试
        let result: boolean = napitestex.NapiNumberTest001();
        expect(result).assertTrue();

        console.info('testNumberCreationAndRetrieval PASS');
      } catch (err) {
        console.error('testNumberCreationAndRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0002
     * @tc.name testCrossTypeConversion
     * @tc.desc Test cross-type conversion between different numeric types using NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCrossTypeConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCrossTypeConversion START');

      try {
        // 调用C++测试函数进行跨类型转换测试
        let result: boolean = napitestex.NapiNumberTest002();
        expect(result).assertTrue();

        console.info('testCrossTypeConversion PASS');
      } catch (err) {
        console.error('testCrossTypeConversion err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0003
     * @tc.name testBoundaryValues
     * @tc.desc Test boundary values for different numeric types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoundaryValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBoundaryValues START');

      try {
        // 调用C++测试函数进行边界值测试
        let result: boolean = napitestex.NapiNumberTest003();
        expect(result).assertTrue();

        console.info('testBoundaryValues PASS');
      } catch (err) {
        console.error('testBoundaryValues err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0004
     * @tc.name testCombinedOperations
     * @tc.desc Test combined operations of multiple create and get operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCombinedOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCombinedOperations START');

      try {
        // 调用C++测试函数进行组合操作测试
        let result: boolean = napitestex.NapiNumberTest004();
        expect(result).assertTrue();

        console.info('testCombinedOperations PASS');
      } catch (err) {
        console.error('testCombinedOperations err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0005
     * @tc.name testTypeConversionAndOverflow
     * @tc.desc Test type conversion and overflow handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypeConversionAndOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeConversionAndOverflow START');

      try {
        // 调用C++测试函数进行类型转换和溢出测试
        let result: boolean = napitestex.NapiNumberTest005();
        expect(result).assertTrue();

        console.info('testTypeConversionAndOverflow PASS');
      } catch (err) {
        console.error('testTypeConversionAndOverflow err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0006
     * @tc.name testLargeNumbersAndPrecision
     * @tc.desc Test large numbers and precision handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLargeNumbersAndPrecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testLargeNumbersAndPrecision START');

      try {
        // 调用C++测试函数进行大数值和精度测试
        let result: boolean = napitestex.NapiNumberTest006();
        expect(result).assertTrue();

        console.info('testLargeNumbersAndPrecision PASS');
      } catch (err) {
        console.error('testLargeNumbersAndPrecision err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0007
     * @tc.name testBooleanValueHandling
     * @tc.desc Test boolean value creation and retrieval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanValueHandling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBooleanValueHandling START');
      try {
        // 调用C++测试函数进行布尔值处理测试
        let result: boolean = napitestex.NapiNumberTest007();
        expect(result).assertTrue();

        console.info('testBooleanValueHandling PASS');
      } catch (err) {
        console.error('testBooleanValueHandling err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_NUMBER_0008
     * @tc.name testThreadSafety
     * @tc.desc Test thread safety of NAPI value creation and retrieval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testThreadSafety START');

      try {
        // 调用C++测试函数进行线程安全性测试
        let result: boolean = napitestex.NapiNumberTest008();
        expect(result).assertTrue();

        console.info('testThreadSafety PASS');
      } catch (err) {
        console.error('testThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    // ==================== NAPI Object Tests ====================

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0001
     * @tc.name testObjectCreationPrototypeFreezeAndTypeCheck
     * @tc.desc Test object creation, prototype retrieval, freezing and type checking functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testObjectCreationPrototypeFreezeAndTypeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testObjectCreationPrototypeFreezeAndTypeCheck START');

      try {
        // 调用C++测试函数进行对象创建、原型获取、冻结和类型检查测试
        let result: boolean = napitestex.NapiObjectTest001();
        expect(result).assertTrue();

        console.info('testObjectCreationPrototypeFreezeAndTypeCheck PASS');
      } catch (err) {
        console.error('testObjectCreationPrototypeFreezeAndTypeCheck err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0002
     * @tc.name testObjectTypeTagCreationAndVerification
     * @tc.desc Test object type tag creation and verification functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testObjectTypeTagCreationAndVerification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testObjectTypeTagCreationAndVerification START');

      try {
        // 调用C++测试函数进行对象类型标签创建和验证测试
        let result: boolean = napitestex.NapiObjectTest002();
        expect(result).assertTrue();

        console.info('testObjectTypeTagCreationAndVerification PASS');
      } catch (err) {
        console.error('testObjectTypeTagCreationAndVerification err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0003
     * @tc.name testExternalObjectCreationAndValueRetrieval
     * @tc.desc Test external object creation and value retrieval functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testExternalObjectCreationAndValueRetrieval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testExternalObjectCreationAndValueRetrieval START');

      try {
        // 调用C++测试函数进行外部对象创建和值获取测试
        let result: boolean = napitestex.NapiObjectTest003();
        expect(result).assertTrue();

        console.info('testExternalObjectCreationAndValueRetrieval PASS');
      } catch (err) {
        console.error('testExternalObjectCreationAndValueRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0004
     * @tc.name testObjectPropertyOperationsUnderDifferentProtectionLevels
     * @tc.desc Test object property operations under different protection levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testObjectPropertyOperationsUnderDifferentProtectionLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        console.info('testObjectPropertyOperationsUnderDifferentProtectionLevels START');

        try {
          // 调用C++测试函数进行不同保护级别下的对象属性操作测试
          let result: boolean = napitestex.NapiObjectTest004();
          expect(result).assertTrue();

          console.info('testObjectPropertyOperationsUnderDifferentProtectionLevels PASS');
        } catch (err) {
          console.error('testObjectPropertyOperationsUnderDifferentProtectionLevels err msg: ' + err.message);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0005
     * @tc.name testSymbolCreationAndTypeCheck
     * @tc.desc Test Symbol creation and type checking functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSymbolCreationAndTypeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testSymbolCreationAndTypeCheck START');

      try {
        // 调用C++测试函数进行Symbol创建和类型检查测试
        let result: boolean = napitestex.NapiObjectTest005();
        expect(result).assertTrue();

        console.info('testSymbolCreationAndTypeCheck PASS');
      } catch (err) {
        console.error('testSymbolCreationAndTypeCheck err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0006
     * @tc.name testTypeTagWithExternalObjectCombination
     * @tc.desc Test type tag with external object combination usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypeTagWithExternalObjectCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeTagWithExternalObjectCombination START');

      try {
        // 调用C++测试函数进行类型标签与外部对象组合使用测试
        let result: boolean = napitestex.NapiObjectTest006();

        if (result) {
          console.info('[TestTypeTagWithExternalObjectCombination] SUCCESS - Type tag and external object operations completed');
        } else {
          console.error('[TestTypeTagWithExternalObjectCombination] FAILED - Test returned false');
        }

        expect(result).assertTrue();

        console.info('testTypeTagWithExternalObjectCombination PASS');
      } catch (err) {
        console.error('testTypeTagWithExternalObjectCombination err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0007
     * @tc.name testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels
     * @tc.desc Test Symbol as object property key under different protection levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        console.info('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels START');

        try {
          // 调用C++测试函数进行Symbol作为对象属性键在不同保护级别下的行为测试
          let result: boolean = napitestex.NapiObjectTest007();
          expect(result).assertTrue();

          console.info('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels PASS');
        } catch (err) {
          console.error('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels err msg: ' + err.message);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0008
     * @tc.name testTypeTagBehaviorInPrototypeChain
     * @tc.desc Test type tag behavior in prototype chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypeTagBehaviorInPrototypeChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeTagBehaviorInPrototypeChain START');

      try {
        // 调用C++测试函数进行类型标签在原型链中的行为测试
        let result: boolean = napitestex.NapiObjectTest008();
        expect(result).assertTrue();

        console.info('testTypeTagBehaviorInPrototypeChain PASS');
      } catch (err) {
        console.error('testTypeTagBehaviorInPrototypeChain err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0009
     * @tc.name testExternalObjectWithPrototypeMethodInteraction
     * @tc.desc Test external object interaction with prototype methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExternalObjectWithPrototypeMethodInteraction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testExternalObjectWithPrototypeMethodInteraction START');

      try {
        // 调用C++测试函数进行外部对象与原型方法交互测试
        let result: boolean = napitestex.NapiObjectTest009();
        expect(result).assertTrue();

        console.info('testExternalObjectWithPrototypeMethodInteraction PASS');
      } catch (err) {
        console.error('testExternalObjectWithPrototypeMethodInteraction err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0010
     * @tc.name testObjectThreadSafety
     * @tc.desc Test thread safety of object-related NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testObjectThreadSafety START');

      try {
        // 调用C++测试函数进行对象相关函数的线程安全性测试
        let result: boolean = napitestex.NapiObjectTest010();
        expect(result).assertTrue();

        console.info('testObjectThreadSafety PASS');
      } catch (err) {
        console.error('testObjectThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0011
     * @tc.name testExternalObjectThreadSafety
     * @tc.desc Test thread safety of external object NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExternalObjectThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testExternalObjectThreadSafety START');

      try {
        // 调用C++测试函数进行外部对象函数的线程安全性测试
        let result: boolean = napitestex.NapiObjectTest011();
        expect(result).assertTrue();

        console.info('testExternalObjectThreadSafety PASS');
      } catch (err) {
        console.error('testExternalObjectThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_OBJECT_0012
     * @tc.name testSymbolThreadSafety
     * @tc.desc Test thread safety of Symbol NAPI functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSymbolThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testSymbolThreadSafety START');

      try {
        // 调用C++测试函数进行Symbol函数的线程安全性测试
        let result: boolean = napitestex.NapiObjectTest012();
        expect(result).assertTrue();

        console.info('testSymbolThreadSafety PASS');
      } catch (err) {
        console.error('testSymbolThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0001
    * @tc.name      : testBigIntTest0001
    * @tc.desc      : Testing BigInt creation from int64 value.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0001 START');
      try {
        let result: boolean = napitestex.NapiBigIntTest01();
        console.info('testBigIntTest0001 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0001 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0002
    * @tc.name      : testBigIntTest0002
    * @tc.desc      : Testing BigInt creation from uint64 value.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0002 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest02();
        console.info('testBigIntTest0002 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0002 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0003
    * @tc.name      : testBigIntTest0003
    * @tc.desc      : Testing BigInt creation and retrieval using words interface (positive and negative).
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0003 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest03();
        console.info('testBigIntTest0003 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0003 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0004
    * @tc.name      : testBigIntTest0004
    * @tc.desc      : Testing BigInt boundary values (INT64_MAX, INT64_MIN, UINT64_MAX).
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0004 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest04();
        console.info('testBigIntTest0004 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0004 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0005
    * @tc.name      : testBigIntTest0005
    * @tc.desc      : Testing BigInt error handling (nullptr parameters, non-BigInt values).
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0005 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest05();
        console.info('testBigIntTest0005 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0005 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0006
    * @tc.name      : testBigIntTest0006
    * @tc.desc      : Testing BigInt conversion precision (lossless flag verification).
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0006 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest06();
        console.info('testBigIntTest0006 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0006 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0007
    * @tc.name      : testBigIntTest0007
    * @tc.desc      : Testing BigInt int64 round-trip correctness verification.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0007 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest07();
        console.info('testBigIntTest0007 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0007 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0008
    * @tc.name      : testBigIntTest0008
    * @tc.desc      : Testing BigInt uint64 round-trip correctness verification.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0008 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest08();
        console.info('testBigIntTest0008 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0008 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0009
    * @tc.name      : testBigIntTest0009
    * @tc.desc      : Testing BigInt uint64 array words round-trip correctness verification.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0009 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest09();
        console.info('testBigIntTest0009 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0009 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0010
    * @tc.name      : testBigIntTest0010
    * @tc.desc      : Testing BigInt with negative value.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0010 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest10();
        console.info('testBigIntTest0010 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0010 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0011
    * @tc.name      : testBigIntTest0011
    * @tc.desc      : Testing BigInt with maximum int64 value.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0011 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest11();
        console.info('testBigIntTest0011 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0011 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_BIGINT_0012
    * @tc.name      : testBigIntTest0012
    * @tc.desc      : Testing BigInt with zero value verification.
    * @tc.size      : SmallTest
    * @tc.type      : Function
    * @tc.level     : Level 1
    */
    it('testBigIntTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testBigIntTest0012 START');
      try {
        const result: boolean = napitestex.NapiBigIntTest12();
        console.info('testBigIntTest0012 test result: ' + result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`testBigIntTest0012 err msg: ${err.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0001
     * @tc.name    testExtension001
     * @tc.desc    Testing async task scheduling priority.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension001 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest001();
        console.info('testExtension001 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension001 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0002
     * @tc.name    testExtension002
     * @tc.desc    Testing thread safe function call with priority.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension002 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest002();
        console.info('testExtension002 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension002 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0003
     * @tc.name    testExtension003
     * @tc.desc    Testing high priority call to tail.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension003 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest003();
        console.info('testExtension003 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension003 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0004
     * @tc.name    testExtension004
     * @tc.desc    Testing normal priority call to head.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension004 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest004();
        console.info('testExtension004 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension004 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0005
     * @tc.name    testExtension005
     * @tc.desc    Testing low priority call.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension005 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest005();
        console.info('testExtension005 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension005 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0006
     * @tc.name    testExtension006
     * @tc.desc    Testing mixed priority execution order.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension006 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest006();
        console.info('testExtension006 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension006 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0007
     * @tc.name    testExtension007
     * @tc.desc    Testing same priority isTail effect.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension007 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest007();
        console.info('testExtension007 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension007 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0008
     * @tc.name    testExtension008
     * @tc.desc    Testing serialize simple object.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension008 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest008();
        console.info('testExtension008 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension008 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0009
     * @tc.name    testExtension009
     * @tc.desc    Testing serialize with transfer list.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension009 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest009();
        console.info('testExtension009 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension009 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0010
     * @tc.name    testExtension010
     * @tc.desc    Testing serialize with clone list.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension010 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest010();
        console.info('testExtension010 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension010 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0011
     * @tc.name    testExtension011
     * @tc.desc    Testing serialize complex nested object.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension011 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest011();
        console.info('testExtension011 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension011 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0012
     * @tc.name    testExtension012
     * @tc.desc    Testing deserialize simple object.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension012 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest012();
        console.info('testExtension012 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension012 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0013
     * @tc.name    testExtension013
     * @tc.desc    Testing deserialize with transfer data.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension013 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest013();
        console.info('testExtension013 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension013 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0014
     * @tc.name    testExtension014
     * @tc.desc    Testing deserialize with clone data.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension014 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest014();
        console.info('testExtension014 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension014 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0015
     * @tc.name    testExtension015
     * @tc.desc    Testing delete valid serialization data.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension015 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest015();
        console.info('testExtension015 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension015 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0036
     * @tc.name    testExtension036
     * @tc.desc    Testing async task with promise.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension036 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest036();
        console.info('testExtension036 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension036 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0037
     * @tc.name    testExtension037
     * @tc.desc    Testing async task with callback.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension037 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest037();
        console.info('testExtension037 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension037 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0038
     * @tc.name    testExtension038
     * @tc.desc    Testing thread safety development.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension038 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest038();
        console.info('testExtension038 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension038 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0039
     * @tc.name    testExtension039
     * @tc.desc    Testing native ArkTS object binding.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension039 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest039();
        console.info('testExtension039 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension039 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_RUNTIME_LANGUAGE_NAPI_EXTENSION_0045
     * @tc.name    testExtension045
     * @tc.desc    Testing NAPI exception logging and crash analysis.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testExtension045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testExtension045 START');
      try {
        let result: boolean = napitestex.NapiExtensionTest045();
        console.info('testExtension045 test result: ' + result);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`testExtension045 err msg: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0001
      * @tc.name      : napiDateTest001
      * @tc.desc      : Testing Date object creation and retrieval with timestamp.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test Date creation and retrieval
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest001 begin');
      
      // Define test timestamp (2024-01-01 00:00:00 UTC)
      const TEST_TIMESTAMP = 1704067200000;
      
      // Test creating Date object
      let dateObj: Date = napitestex.testCreateDate(TEST_TIMESTAMP);
      expect(dateObj instanceof Date).assertEqual(true);
      
      // Test getting Date timestamp value
      let retrievedTimestamp: number = napitestex.testGetDateValue(dateObj);
      expect(retrievedTimestamp).assertEqual(TEST_TIMESTAMP);
      
      // Verify the Date object works correctly in JavaScript
      expect(dateObj.getTime()).assertEqual(TEST_TIMESTAMP);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest001 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0002
      * @tc.name      : napiDateTest002
      * @tc.desc      : Testing invalid Date object timestamp acquisition with non-Date objects.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test Date object type verification
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest002 begin');
      
      // Define test timestamp (2024-01-01 00:00:00 UTC)
      const TEST_TIMESTAMP = 1704067200000;
      
      // Test creating Date object using napi_create_date
      let dateObj: Date = napitestex.testCreateDate(TEST_TIMESTAMP);
      expect(dateObj instanceof Date).assertEqual(true);
      
      // Test using napi_is_date to check if object is Date type
      let isDateResult: boolean = napitestex.testIsDate(dateObj);
      expect(isDateResult).assertEqual(true);
      
      // Test with non-Date objects to ensure napi_is_date returns false
      let nonDateObj: TestObject = { test: "not a date" };
      let isNotDateResult: boolean = napitestex.testIsDate(nonDateObj);
      expect(isNotDateResult).assertEqual(false);
      
      // Test with number to ensure napi_is_date returns false
      let numberObj = 123;
      let isNumberDateResult: boolean = napitestex.testIsDate(numberObj);
      expect(isNumberDateResult).assertEqual(false);
      
      // Test with string to ensure napi_is_date returns false
      let stringObj = "2024-01-01";
      let isStringDateResult: boolean = napitestex.testIsDate(stringObj);
      expect(isStringDateResult).assertEqual(false);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest002 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0003
      * @tc.name      : napiDateTest003
      * @tc.desc      : Testing invalid Date object timestamp acquisition with non-Date objects.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test passing non-Date objects to Date functions
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest003 begin');
      
      // Test with string object
      let stringObj = "2024-01-01";
      let stringResult: napitestex.DateValueWithErrorResult = napitestex.testGetDateValueWithError(stringObj);
      hilog.info(0x0000, 'testTag', '%{public}s%{public}s', 'napiDateTest003:', JSON.stringify(stringResult));
      
      // Verify napi_is_date returns napi_ok and is_date is false
      expect(stringResult.isDateStatus).assertEqual(0); // napi_ok = 0
      expect(stringResult.isDate).assertEqual(false);
      
      // Verify napi_get_date_value returns error (napi_date_expected = 18)
      expect(stringResult.getDateStatus).assertEqual(18); // napi_date_expected
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest003 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0004
      * @tc.name      : napiDateTest004
      * @tc.desc      : Testing invalid Date object timestamp acquisition with various non-Date types.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test invalid Date object timestamp retrieval
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest004 begin');
      
      // Test with string object (non-Date type)
      let stringObj = "2024-01-01";
      let stringResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(stringObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(stringResult.status).assertEqual(18); // napi_date_expected
      
      // Test with number object (non-Date type)
      let numberObj = 123;
      let numberResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(numberObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(numberResult.status).assertEqual(18); // napi_date_expected
      
      // Test with plain object (non-Date type)
      let plainObj: TestObject = { test: "not a date" };
      let plainResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(plainObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(plainResult.status).assertEqual(18); // napi_date_expected
      
      // Test with boolean (non-Date type)
      let booleanObj: boolean = true;
      let booleanResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(booleanObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(booleanResult.status).assertEqual(18); // napi_date_expected
      
      // Test with array (non-Date type)
      let arrayObj = [1, 2, 3];
      let arrayResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(arrayObj);
      
      // Verify napi_get_date_value returns napi_date_expected (18)
      expect(arrayResult.status).assertEqual(18); // napi_date_expected
      
      // Test with actual Date object for comparison (should succeed)
      let dateObj: Date = napitestex.testCreateDate(1704067200000);
      let dateResult: napitestex.DateValueOnlyResult = napitestex.testGetDateValueOnly(dateObj);
      
      // Verify napi_get_date_value returns napi_ok (0)
      expect(dateResult.status).assertEqual(0); // napi_ok
      expect(dateResult.value).assertEqual(1704067200000);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest004 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0005
      * @tc.name      : napiDateTest005
      * @tc.desc      : Testing minimum valid timestamp (0) for Date object creation and retrieval.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test minimum valid timestamp (0)
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest005 begin');
      
      // Test creating Date object with timestamp 0 and getting its value
      let result: napitestex.DateMinTimestampResult = napitestex.testCreateDateWithMinTimestamp();
      
      // Verify napi_create_date returns napi_ok
      expect(result.createStatus).assertEqual(0); // napi_ok = 0
      
      // Verify napi_get_date_value returns napi_ok
      expect(result.getStatus).assertEqual(0); // napi_ok = 0
      
      // Verify timestamp is 0
      expect(result.timestamp).assertEqual(0);
      
      // Additional verification: test with JavaScript Date object
      let jsDate = new Date(0);
      expect(jsDate.getTime()).assertEqual(0);
      
      // Verify the Date object represents Unix epoch (1970-01-01 00:00:00 UTC)
      expect(jsDate.getUTCFullYear()).assertEqual(1970);
      expect(jsDate.getUTCMonth()).assertEqual(0); // January (0-based)
      expect(jsDate.getUTCDate()).assertEqual(1);
      expect(jsDate.getUTCHours()).assertEqual(0);
      expect(jsDate.getUTCMinutes()).assertEqual(0);
      expect(jsDate.getUTCSeconds()).assertEqual(0);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest005 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0006
      * @tc.name      : napiDateTest006
      * @tc.desc      : Testing maximum valid timestamp for Date object creation and retrieval.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test maximum valid timestamp
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest006 begin');
      
      // Test creating Date object with maximum timestamp and getting its value
      let result: napitestex.DateMaxTimestampResult = napitestex.testCreateDateWithMaxTimestamp();
      
      // Verify napi_create_date returns napi_ok
      expect(result.createStatus).assertEqual(0); // napi_ok = 0
      
      // Verify napi_get_date_value returns napi_ok
      expect(result.getStatus).assertEqual(0); // napi_ok = 0
      
      // Verify timestamp is the maximum safe timestamp value
      const MAX_SAFE_TIMESTAMP = 8640000000000000.0;
      expect(result.timestamp).assertEqual(MAX_SAFE_TIMESTAMP);
      
      // Additional verification: test with JavaScript Date object
      let jsDate = new Date(MAX_SAFE_TIMESTAMP);
      expect(jsDate.getTime()).assertEqual(MAX_SAFE_TIMESTAMP);
      
      // Verify the Date object represents a very far future date
      // This timestamp represents approximately year 275759
      expect(jsDate.getTime()).assertLarger(1000000000000000); // Should be much larger than current time
      
      // Test that we can create and retrieve the same timestamp
      let testDate: Date = napitestex.testCreateDate(MAX_SAFE_TIMESTAMP);
      let retrievedTimestamp: number = napitestex.testGetDateValue(testDate);
      expect(retrievedTimestamp).assertEqual(MAX_SAFE_TIMESTAMP);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest006 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0007
      * @tc.name      : napiDateTest007
      * @tc.desc      : Testing multiple Date object creations and retrievals with different timestamps.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test multiple Date object creations and retrievals
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest007 begin');
      
      // Test multiple Date operations
      let result: napitestex.MultipleDateOperationsResult = napitestex.testMultipleDateOperations();
      
      // Verify both objects are Date instances
      expect(result.dateA instanceof Date).assertEqual(true);
      expect(result.dateB instanceof Date).assertEqual(true);
      
      // Verify timestamps
      expect(result.timestampA).assertEqual(1000);
      expect(result.timestampB).assertEqual(2000);
      
      // Verify modified timestamp A
      expect(result.modifiedTimestampA).assertEqual(3000);
      
      // Additional verification using JavaScript Date methods
      let dateA: Date = result.dateA;
      let dateB: Date = result.dateB;
      
      // Verify Date A properties
      expect(dateA.getTime()).assertEqual(1000);
      expect(dateA.getFullYear()).assertEqual(1970);
      expect(dateA.getMonth()).assertEqual(0); // January
      expect(dateA.getDate()).assertEqual(1);
      expect(dateA.getHours()).assertEqual(8);
      expect(dateA.getMinutes()).assertEqual(0);
      expect(dateA.getSeconds()).assertEqual(1);
      
      // Verify Date B properties
      expect(dateB.getTime()).assertEqual(2000);
      expect(dateB.getFullYear()).assertEqual(1970);
      expect(dateB.getMonth()).assertEqual(0); // January
      expect(dateB.getDate()).assertEqual(1);
      expect(dateB.getHours()).assertEqual(8);
      expect(dateB.getMinutes()).assertEqual(0);
      expect(dateB.getSeconds()).assertEqual(2);
      
      // Test creating additional Date objects to verify consistency
      hilog.info(0x0000, 'testTag', '%{public}s', 'Testing additional Date object creation...');
      
      // Create a new Date object with timestamp 5000
      let newDate: Date = napitestex.testCreateDate(5000);
      expect(newDate instanceof Date).assertEqual(true);
      expect(newDate.getTime()).assertEqual(5000);
      
      // Get timestamp using NAPI function
      let newTimestamp: number = napitestex.testGetDateValue(newDate);
      expect(newTimestamp).assertEqual(5000);
      
      // Verify Date type using NAPI function
      let isDate: boolean = napitestex.testIsDate(newDate);
      expect(isDate).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest007 completed successfully');
    })

    /**
      * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DATE_0008
      * @tc.name      : napiDateTest008
      * @tc.desc      : Testing bulk Date object creation and verification with large numbers of objects.
      * @tc.size      : SmallTest
      * @tc.type      : Function
      * @tc.level     : Level 1
      */
    it('napiDateTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Test bulk Date object creation and verification
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest008 begin');
      
      // Test with 10000 Date objects
      const TEST_COUNT = 10000;
      hilog.info(0x0000, 'testTag', '%{public}s', `Creating and verifying ${TEST_COUNT} Date objects...`);
      
      let result: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(TEST_COUNT);
      
      // Verify all operations were successful
      expect(result.success).assertEqual(true);
      
      // Verify all objects were created
      expect(result.totalCreated).assertEqual(TEST_COUNT);
      
      // Verify all objects were type-verified
      expect(result.totalVerified).assertEqual(TEST_COUNT);
      
      // Verify all timestamps were retrieved and verified
      expect(result.totalTimestamps).assertEqual(TEST_COUNT);
      
      // Verify execution time is reasonable (should be under 10 seconds for 10000 objects)
      expect(result.executionTime).assertLess(10000); // 10 seconds in milliseconds
      
      // Log performance metrics
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Performance: ${result.executionTime}ms for ${TEST_COUNT} objects`);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Average: ${(result.executionTime / TEST_COUNT).toFixed(3)}ms per object`);
      
      // Test with smaller count for quick verification
      const SMALL_COUNT = 100;
      hilog.info(0x0000, 'testTag', '%{public}s', `Quick test with ${SMALL_COUNT} objects...`);
      
      let smallResult: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(SMALL_COUNT);
      
      // Verify small batch also succeeds
      expect(smallResult.success).assertEqual(true);
      expect(smallResult.totalCreated).assertEqual(SMALL_COUNT);
      expect(smallResult.totalVerified).assertEqual(SMALL_COUNT);
      expect(smallResult.totalTimestamps).assertEqual(SMALL_COUNT);
      
      // Test edge case: 0 objects
      let zeroResult: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(0);
      expect(zeroResult.success).assertEqual(true);
      expect(zeroResult.totalCreated).assertEqual(0);
      expect(zeroResult.totalVerified).assertEqual(0);
      expect(zeroResult.totalTimestamps).assertEqual(0);
      
      // Test edge case: 1 object
      let oneResult: napitestex.BulkDateCreationResult = napitestex.testBulkDateCreation(1);
      expect(oneResult.success).assertEqual(true);
      expect(oneResult.totalCreated).assertEqual(1);
      expect(oneResult.totalVerified).assertEqual(1);
      expect(oneResult.totalTimestamps).assertEqual(1);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiDateTest008 completed successfully');
    })

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0001
     * @tc.name      testStringTest001
     * @tc.desc      Test UTF-16 string creation and retrieval using napi_create_string_utf16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testUtf16StringCreationAndRetrieval START');
      try {
        // 调用C++测试函数进行UTF-16字符串创建和获取测试
        let result: boolean = napitestex.NapiStringTest001();
        expect(result).assertTrue();
        console.info('testUtf16StringCreationAndRetrieval PASS');
      } catch (err) {
        console.error('testUtf16StringCreationAndRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0002
     * @tc.name      testStringTest002
     * @tc.desc      Test cross-encoding conversion between UTF-8, UTF-16, and Latin1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCrossEncodingConversion START');
      try {
        // 调用C++测试函数进行跨编码转换测试
        let result: boolean = napitestex.NapiStringTest002();
        expect(result).assertTrue();
        console.info('testCrossEncodingConversion PASS');
      } catch (err) {
        console.error('testCrossEncodingConversion err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0003
     * @tc.name      testStringTest003
     * @tc.desc      Test boundary length cases including empty strings and very long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBoundaryLengthCases START');
      try {
        // 调用C++测试函数进行边界长度测试
        let result: boolean = napitestex.NapiStringTest003();
        expect(result).assertTrue();
        console.info('testBoundaryLengthCases PASS');
      } catch (err) {
        console.error('testBoundaryLengthCases err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0004
     * @tc.name      testStringTest004
     * @tc.desc      Test encoding compatibility between different string types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testEncodingCompatibility START');
      try {
        // 调用C++测试函数进行编码兼容性测试
        let result: boolean = napitestex.NapiStringTest004();
        expect(result).assertTrue();
        console.info('testEncodingCompatibility PASS');
      } catch (err) {
        console.error('testEncodingCompatibility err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0005
     * @tc.name      testStringTest005
     * @tc.desc      Test buffer size edge cases and boundary conditions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testBufferSizeEdgeCases START');

      try {
        // 调用C++测试函数进行缓冲区边界测试
        let result: boolean = napitestex.NapiStringTest005();
        expect(result).assertTrue();
        console.info('testBufferSizeEdgeCases PASS');
      } catch (err) {
        console.error('testBufferSizeEdgeCases err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0006
     * @tc.name      testStringTest006
     * @tc.desc      Test error handling robustness with invalid parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testErrorHandlingRobustness START');
      try {
        // 调用C++测试函数进行错误处理健全性测试
        let result: boolean = napitestex.NapiStringTest006();
        expect(result).assertTrue();

        console.info('testErrorHandlingRobustness PASS');
      } catch (err) {
        console.error('testErrorHandlingRobustness err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0007
     * @tc.name      testStringTest007
     * @tc.desc      Test multi-encoding compatibility operations with mixed API usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testMultiEncodingCompatibilityOperations START');
      try {
        // 调用C++测试函数进行多编码兼容操作测试
        let result: boolean = napitestex.NapiStringTest007();
        expect(result).assertTrue();
        console.info('testMultiEncodingCompatibilityOperations PASS');
      } catch (err) {
        console.error('testMultiEncodingCompatibilityOperations err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0008
     * @tc.name      testStringTest008
     * @tc.desc      Test special character handling including BOM, NULL, and multi-byte characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testSpecialCharacterHandling START');
      try {
        // 调用C++测试函数进行特殊字符处理测试
        let result: boolean = napitestex.NapiStringTest008();
        expect(result).assertTrue();
        console.info('testSpecialCharacterHandling PASS');
      } catch (err) {
        console.error('testSpecialCharacterHandling err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_STRING_0009
     * @tc.name      testStringTest009
     * @tc.desc      Test thread safety simulation of NAPI string operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testStringTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info('testStringSafetySimulation START');
      try {
        // 调用C++测试函数进行线程安全性模拟测试
        let result: boolean = napitestex.NapiStringTest009();
        expect(result).assertTrue();
        console.info('testStringSafetySimulation PASS');
      } catch (err) {
        console.error('testStringSafetySimulation err msg: ' + err.message);
        expect().assertFail();
      }
    });    

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0004
     * @tc.name      testPrimitiveTest04
     * @tc.desc      Boolean conversion chain
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest04', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest04] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest04();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest04] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest04] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0005
     * @tc.name      testPrimitiveTest05
     * @tc.desc      Multi-level type coercion
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest05', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest05] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest05();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest05] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest05] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0006
     * @tc.name      testPrimitiveTest06
     * @tc.desc      Global object property operations
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest06', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest06] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest06();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest06] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest06] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0007
     * @tc.name      testPrimitiveTest07
     * @tc.desc      Global object interactions with null and undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest07', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest07] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest07();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest07] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest07] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0008
     * @tc.name      testPrimitiveTest08
     * @tc.desc      Extreme value conversion (MAX_VALUE/MIN_VALUE) round-trip
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest08', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest08] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest08();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest08] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest08] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0009
     * @tc.name      testPrimitiveTest09
     * @tc.desc      Null/undefined coercion to bool/number/string; ToObject should fail
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest09', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest09] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest09();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest09] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest09] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0010
     * @tc.name      testPrimitiveTest10
     * @tc.desc      Error conversion: BigInt to number should throw; bool coercion ok
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest10', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest10] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest10();
        expect(result).assertTrue();
      } catch (err) {
        console.info('[testPrimitiveTest10] throw error, err.message: ' + err.message);
        expect(err.message).assertEqual('Cannot convert a BigInt value to a number');
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0011
     * @tc.name      testPrimitiveTest11
     * @tc.desc      Object with circular reference; stringify coercion should return string or throw
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest11', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest11] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest11();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest11] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest11] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_PRIMITIVE_0012
     * @tc.name      testPrimitiveTest12
     * @tc.desc      Function object coercion to string (source or identifier)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimitiveTest12', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testPrimitiveTest12] START');
      try {
        let result: boolean = napitestex.NapiPrimitiveTest12();
        expect(result).assertTrue();
        console.info('[testPrimitiveTest12] PASS');
      } catch (err) {
        console.error('[testPrimitiveTest12] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0001
     * @tc.name      napiFunctioncallTest001
     * @tc.desc      Test napi_call_function basic function call
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest001 START');
      try {
        // Test basic function call with simple JS function
        let result: object = napitestex.callFunctionBasicTest();
        hilog.info(0x0000, 'testTag', 'callFunctionBasicTest result: %{public}s', JSON.stringify(result));

        expect(result['isSuccess']).assertTrue();
        expect(result['status']).assertEqual(0); // napi_ok
        console.info('napiFunctioncallTest001 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest001 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0002
     * @tc.name      napiFunctioncallTest002
     * @tc.desc      Test napi_call_function with parameters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest002 START');
      try {
        // Test function call with parameters
        let result: object = napitestex.callFunctionWithParamsTest();
        hilog.info(0x0000, 'testTag', 'callFunctionWithParamsTest result: %{public}s', JSON.stringify(result));

        expect(result['isSuccess']).assertTrue();
        expect(result['status']).assertEqual(0); // napi_ok
        expect(result['paramCount']).assertEqual(2);
        console.info('napiFunctioncallTest002 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest002 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0003
     * @tc.name      napiFunctioncallTest003
     * @tc.desc      Test napi_get_cb_info basic callback info
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest003 START');
      try {
        // Test basic callback info retrieval
        let result: object = napitestex.getCbInfoBasicTest();
        hilog.info(0x0000, 'testTag', 'getCbInfoBasicTest result: %{public}s', JSON.stringify(result));

        expect(result['hasThisArg']).assertTrue();
        expect(result['argCount']).assertDeepEquals(0);
        console.info('napiFunctioncallTest003 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest003 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0004
     * @tc.name      napiFunctioncallTest004
     * @tc.desc      Test napi_get_cb_info dynamic argument count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest004 START');
      try {
        // Test dynamic argument count handling
        let result: object = napitestex.getCbInfoDynamicTest();
        hilog.info(0x0000, 'testTag', 'getCbInfoDynamicTest result: %{public}s', JSON.stringify(result));

        expect(result['argCount']).assertDeepEquals(0);
        expect(result['hasZeroArgs']).assertTrue();
        console.info('napiFunctioncallTest004 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest004 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0005
     * @tc.name      napiFunctioncallTest005
     * @tc.desc      Test napi_get_cb_info data pointer acquisition
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest005 START');
      try {
        // Test data pointer acquisition from callback info
        let result: object = napitestex.getCbInfoDataTest();
        hilog.info(0x0000, 'testTag', 'getCbInfoDataTest result: %{public}s', JSON.stringify(result));

        expect(result['hasData']).assertTrue();
        expect(result['dataValue']).assertDeepEquals(42);
        console.info('napiFunctioncallTest005 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest005 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0006
     * @tc.name      napiFunctioncallTest006
     * @tc.desc      Test napi_get_cb_info partial information acquisition
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest006 START');
      try {
        // Test partial information acquisition without this object or data
        let result: object = napitestex.getCbInfoPartialTest();
        hilog.info(0x0000, 'testTag', 'getCbInfoPartialTest result: %{public}s', JSON.stringify(result));

        expect(result['argCount']).assertDeepEquals(0);
        expect(result['retrievedArgs']).assertDeepEquals(0);
        console.info('napiFunctioncallTest006 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest006 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0007
     * @tc.name      napiFunctioncallTest007
     * @tc.desc      Test napi_get_cb_info getting various types from ETS
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest007 START');
      try {
        // Test getting various types from ETS side
        let result: object = napitestex.getCbInfoVariousTypesTest();
        hilog.info(0x0000, 'testTag', 'getCbInfoVariousTypesTest result: %{public}s', JSON.stringify(result));

        expect(result['argCount']).assertDeepEquals(0);
        console.info('napiFunctioncallTest007 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest007 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0008
     * @tc.name      napiFunctioncallTest008
     * @tc.desc      Test napi_create_function basic function creation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest008 START');
      try {
        // Test basic function creation and verification
        let result: object = napitestex.createFunctionBasicTest();
        hilog.info(0x0000, 'testTag', 'createFunctionBasicTest result: %{public}s', JSON.stringify(result));

        expect(result['hasFunction']).assertTrue();
        expect(result['callSuccess']).assertTrue();
        expect(result['callResult']).assertEqual("basic callback executed");
        console.info('napiFunctioncallTest008 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest008 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0009
     * @tc.name      napiFunctioncallTest009
     * @tc.desc      Test napi_create_function named function
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest009 START');
      try {
        // Test named function creation with different function names
        let result: object = napitestex.createFunctionNamedTest();
        hilog.info(0x0000, 'testTag', 'createFunctionNamedTest result: %{public}s', JSON.stringify(result));

        expect(result['hasRegularName']).assertTrue();
        expect(result['hasUtf8Name']).assertTrue();
        console.info('napiFunctioncallTest009 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest009 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0010
     * @tc.name      napiFunctioncallTest010
     * @tc.desc      Test napi_create_function with data
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest010 START');
      try {
        // Test function creation with data pointer
        let result: object = napitestex.createFunctionWithDataTest();
        hilog.info(0x0000, 'testTag', 'createFunctionWithDataTest result: %{public}s', JSON.stringify(result));

        expect(result['callSuccess']).assertTrue();
        expect(result['dataValue']).assertDeepEquals(42);
        console.info('napiFunctioncallTest010 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest010 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0011
     * @tc.name      napiFunctioncallTest011
     * @tc.desc      Test napi_create_function different length names
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest011 START');
      try {
        // Test function creation with different length names
        let result: object = napitestex.createFunctionLengthTest();
        hilog.info(0x0000, 'testTag', 'createFunctionLengthTest result: %{public}s', JSON.stringify(result));

        expect(result['hasEmptyName']).assertTrue();
        expect(result['hasNullName']).assertTrue();
        expect(result['hasLongName']).assertTrue();
        console.info('napiFunctioncallTest011 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest011 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0012
     * @tc.name      napiFunctioncallTest012
     * @tc.desc      Test complete lifecycle test
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('napiFunctioncallTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('napiFunctioncallTest012 START');
      try {
        // Test complete lifecycle of function creation, calling, and callback info
        let result: object = napitestex.completeLifecycleTest();
        hilog.info(0x0000, 'testTag', 'completeLifecycleTest result: %{public}s', JSON.stringify(result));

        expect(result['createSuccess']).assertTrue();
        expect(result['callSuccess']).assertTrue();
        expect(result['callbackResult']['receivedArgs']).assertDeepEquals(2);
        expect(result['callbackResult']['message']).assertEqual("lifecycle test complete");
        console.info('napiFunctioncallTest012 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest012 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0013
     * @tc.name      napiFunctioncallTest013
     * @tc.desc      Test multi-thread napi_create_function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('napiFunctioncallTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('napiFunctioncallTest013 START');
      try {
        // Test multi-thread function creation safety
        let result: object = napitestex.multiThreadCreateFunctionTest();
        hilog.info(0x0000, 'testTag', 'multiThreadCreateFunctionTest result: %{public}s', JSON.stringify(result));

        expect(result['allCreated']).assertTrue();
        expect(result['noConflicts']).assertTrue();
        // Check status codes array - all should be napi_ok (0)
        let statusCodes: number[] = result['statusCodes'] as number[];
        statusCodes.forEach((status, index) => {
          expect(status).assertEqual(0); // napi_ok
        });
        console.info('napiFunctioncallTest013 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest013 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0014
     * @tc.name      napiFunctioncallTest014
     * @tc.desc      Test multi-thread napi_call_function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('napiFunctioncallTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('napiFunctioncallTest014 START');
      try {
        // Test multi-thread function calling safety
        let result: object = napitestex.multiThreadCallFunctionTest();
        hilog.info(0x0000, 'testTag', 'multiThreadCallFunctionTest result: %{public}s', JSON.stringify(result));

        expect(result['allSucceeded']).assertTrue();
        expect(result['parameterIsolated']).assertTrue();
        console.info('napiFunctioncallTest014 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest014 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0015
     * @tc.name      napiFunctioncallTest015
     * @tc.desc      Test multi-thread napi_get_cb_info
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('napiFunctioncallTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('napiFunctioncallTest015 START');
      try {
        // Test multi-thread callback info retrieval safety
        let result: object = napitestex.multiThreadGetCbInfoTest();
        hilog.info(0x0000, 'testTag', 'multiThreadGetCbInfoTest result: %{public}s', JSON.stringify(result));

        expect(result['infoCorrect']).assertTrue();
        expect(result['argumentIsolated']).assertTrue();
        console.info('napiFunctioncallTest015 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest015 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_FUNCTION_0016
     * @tc.name      napiFunctioncallTest016
     * @tc.desc      Test multi-thread comprehensive test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('napiFunctioncallTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('napiFunctioncallTest016 START');
      try {
        // Test comprehensive multi-thread function creation and calling
        let result: object = napitestex.multiThreadComprehensiveTest();
        hilog.info(0x0000, 'testTag', 'multiThreadComprehensiveTest result: %{public}s', JSON.stringify(result));

        expect(result['threadSafe']).assertTrue();
        expect(result['functionIsolated']).assertTrue();
        console.info('napiFunctioncallTest016 PASS');
      } catch (err) {
        console.error('napiFunctioncallTest016 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OTHERS_AND_MODULE_0001
     * @tc.name      testOthersAndModuleTest01
     * @tc.desc      napi_strict_equals different values comparison test
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOthersAndModuleTest01', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testOthersAndModuleTest01] START');
      try {
        let result: boolean = napitestex.NapiOthersAndModuleTest01();
        expect(result).assertTrue();
        console.info('[testOthersAndModuleTest01] PASS');
      } catch (err) {
        console.error('[testOthersAndModuleTest01] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OTHERS_AND_MODULE_0002
     * @tc.name      testOthersAndModuleTest02
     * @tc.desc      napi_strict_equals same type different values comparison test
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOthersAndModuleTest02', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testOthersAndModuleTest02] START');
      try {
        let result: boolean = napitestex.NapiOthersAndModuleTest02();
        expect(result).assertTrue();
        console.info('[testOthersAndModuleTest02] PASS');
      } catch (err) {
        console.error('[testOthersAndModuleTest02] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OTHERS_AND_MODULE_0003
     * @tc.name      testOthersAndModuleTest03
     * @tc.desc      Multi-thread node_api_get_module_file_name consistency and thread safety test
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOthersAndModuleTest03', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testOthersAndModuleTest03] START');
      try {
        let result: boolean = napitestex.NapiOthersAndModuleTest03();
        expect(result).assertTrue();
        console.info('[testOthersAndModuleTest03] PASS');
      } catch (err) {
        console.error('[testOthersAndModuleTest03] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OTHERS_AND_MODULE_0004
     * @tc.name      testOthersAndModuleTest04
     * @tc.desc      Mixed multi-thread calls to napi_get_node_version and napi_get_version
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOthersAndModuleTest04', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[testOthersAndModuleTest04] START');
      try {
        let result: boolean = napitestex.NapiOthersAndModuleTest04();
        expect(result).assertTrue();
        console.info('[testOthersAndModuleTest04] PASS');
      } catch (err) {
        console.error('[testOthersAndModuleTest04] ERROR. err.message: ' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0001
     * @tc.name Sendable001
     * @tc.desc Test TestIsSendable - check if normal object is sendable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable001 START');
      try {
        let result: boolean = napitestex.TestIsSendable();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestIsSendable result: %{public}s', result.toString());
        console.info('Sendable001 PASS');
      } catch (err) {
        console.error('Sendable001 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0002
     * @tc.name Sendable002
     * @tc.desc Test TestIsSendableTrue - check if sendable object is sendable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable002 START');
      try {
        let result: boolean = napitestex.TestIsSendableTrue();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestIsSendableTrue result: %{public}s', result.toString());
        console.info('Sendable002 PASS');
      } catch (err) {
        console.error('Sendable002 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0003
     * @tc.name Sendable003
     * @tc.desc Test TestIsSendableNull - check if null/undefined is sendable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable003 START');
      try {
        let result: boolean = napitestex.TestIsSendableNull();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestIsSendableNull result: %{public}s', result.toString());
        console.info('Sendable003 PASS');
      } catch (err) {
        console.error('Sendable003 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0004
     * @tc.name Sendable004
     * @tc.desc Test TestDefineSendableClass - define basic sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable004 START');
      try {
        let result: boolean = napitestex.TestDefineSendableClass();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestDefineSendableClass result: %{public}s', result.toString());
        console.info('Sendable004 PASS');
      } catch (err) {
        console.error('Sendable004 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0005
     * @tc.name Sendable005
     * @tc.desc Test TestDefineSendableClassInherit - sendable class inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable005 START');
      try {
        let result: boolean = napitestex.TestDefineSendableClassInherit();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestDefineSendableClassInherit result: %{public}s', result.toString());
        console.info('Sendable005 PASS');
      } catch (err) {
        console.error('Sendable005 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0006
     * @tc.name Sendable006
     * @tc.desc Test TestCreateSendableObject - create sendable object with properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable006 START');
      try {
        let result: boolean = napitestex.TestCreateSendableObject();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestCreateSendableObject result: %{public}s', result.toString());
        console.info('Sendable006 PASS');
      } catch (err) {
        console.error('Sendable006 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0007
     * @tc.name Sendable007
     * @tc.desc Test TestCreateSendableArray - create sendable array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable007 START');
      try {
        let result: boolean = napitestex.TestCreateSendableArray();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestCreateSendableArray result: %{public}s', result.toString());
        console.info('Sendable007 PASS');
      } catch (err) {
        console.error('Sendable007 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0008
     * @tc.name Sendable008
     * @tc.desc Test TestCreateSendableTypedArray - create sendable typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable008 START');
      try {
        let result: boolean = napitestex.TestCreateSendableTypedArray();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestCreateSendableTypedArray result: %{public}s', result.toString());
        console.info('Sendable008 PASS');
      } catch (err) {
        console.error('Sendable008 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0009
     * @tc.name Sendable009
     * @tc.desc Test TestWrapSendable - basic sendable wrapping test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable009 START');
      try {
        let result: boolean = napitestex.TestWrapSendable();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestWrapSendable result: %{public}s', result.toString());
        console.info('Sendable009 PASS');
      } catch (err) {
        console.error('Sendable009 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0010
     * @tc.name Sendable010
     * @tc.desc Test TestWrapSendableWithSize - sendable wrapping with size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable010 START');
      try {
        let result: boolean = napitestex.TestWrapSendableWithSize();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestWrapSendableWithSize result: %{public}s', result.toString());
        console.info('Sendable010 PASS');
      } catch (err) {
        console.error('Sendable010 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0011
     * @tc.name Sendable011
     * @tc.desc Test TestWrapEnhance - enhanced wrapping interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable011 START');
      try {
        let result: boolean = napitestex.TestWrapEnhance();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestWrapEnhance result: %{public}s', result.toString());
        console.info('Sendable011 PASS');
      } catch (err) {
        console.error('Sendable011 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0012
     * @tc.name Sendable012
     * @tc.desc Test TestUnwrapSendable - sendable unwrapping test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable012 START');
      try {
        let result: boolean = napitestex.TestUnwrapSendable();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestUnwrapSendable result: %{public}s', result.toString());
        console.info('Sendable012 PASS');
      } catch (err) {
        console.error('Sendable012 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0013
     * @tc.name Sendable013
     * @tc.desc Test TestUnwrapSendableMultiple - multiple unwrapping test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable013 START');
      try {
        let result: boolean = napitestex.TestUnwrapSendableMultiple();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestUnwrapSendableMultiple result: %{public}s', result.toString());
        console.info('Sendable013 PASS');
      } catch (err) {
        console.error('Sendable013 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0014
     * @tc.name Sendable014
     * @tc.desc Test TestRemoveWrapSendable - remove sendable wrapping test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable014 START');
      try {
        let result: boolean = napitestex.TestRemoveWrapSendable();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestRemoveWrapSendable result: %{public}s', result.toString());
        console.info('Sendable014 PASS');
      } catch (err) {
        console.error('Sendable014 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_0015
     * @tc.name Sendable015
     * @tc.desc Test TestComplexSendableStructure - complex sendable structure test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sendable015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Sendable015 START');
      try {
        let result: boolean = napitestex.TestComplexSendableStructure();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestComplexSendableStructure result: %{public}s', result.toString());
        console.info('Sendable015 PASS');
      } catch (err) {
        console.error('Sendable015 err msg: ' + err.message);
        expect().assertFail();
      }
    });   

        /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0001
     * @tc.name Class001
     * @tc.desc Test TestDefineClass - define simple class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class001 START');
      try {
        let result: boolean = napitestex.TestDefineClass();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestDefineClass result: %{public}s', result.toString());
        console.info('Class001 PASS');
      } catch (err) {
        console.error('Class001 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0002
     * @tc.name Class002
     * @tc.desc Test TestDefineClassWithProps - define class with properties and methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class002 START');
      try {
        let result: boolean = napitestex.TestDefineClassWithProps();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestDefineClassWithProps result: %{public}s', result.toString());
        console.info('Class002 PASS');
      } catch (err) {
        console.error('Class002 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0003
     * @tc.name Class003
     * @tc.desc Test TestDefineClassLengthMismatch - class name length mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class003 START');
      try {
        let result: boolean = napitestex.TestDefineClassLengthMismatch();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestDefineClassLengthMismatch result: %{public}s', result.toString());
        console.info('Class003 PASS');
      } catch (err) {
        console.error('Class003 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0004
     * @tc.name Class004
     * @tc.desc Test TestDefineClassNullName - class name is nullptr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class004 START');
      try {
        let result: boolean = napitestex.TestDefineClassNullName();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestDefineClassNullName result: %{public}s', result.toString());
        console.info('Class004 PASS');
      } catch (err) {
        console.error('Class004 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0005
     * @tc.name Class005
     * @tc.desc Test TestDefineClassInvalidProps - property count non-zero but properties array is nullptr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class005 START');
      try {
        let result: boolean = napitestex.TestDefineClassInvalidProps();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestDefineClassInvalidProps result: %{public}s', result.toString());
        console.info('Class005 PASS');
      } catch (err) {
        console.error('Class005 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0006
     * @tc.name Class006
     * @tc.desc Test TestNewInstance - create instance with valid constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class006 START');
      try {
        let result: boolean = napitestex.TestNewInstance();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestNewInstance result: %{public}s', result.toString());
        console.info('Class006 PASS');
      } catch (err) {
        console.error('Class006 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0007
     * @tc.name Class007
     * @tc.desc Test TestNewInstanceWithArgs - create instance with arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class007 START');
      try {
        let result: boolean = napitestex.TestNewInstanceWithArgs();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestNewInstanceWithArgs result: %{public}s', result.toString());
        console.info('Class007 PASS');
      } catch (err) {
        console.error('Class007 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0008
     * @tc.name Class008
     * @tc.desc Test TestGetNewTargetConstructor - get new.target in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class008 START');
      try {
        let result: boolean = napitestex.TestGetNewTargetConstructor();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestGetNewTargetConstructor result: %{public}s', result.toString());
        console.info('Class008 PASS');
      } catch (err) {
        console.error('Class008 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0009
     * @tc.name Class009
     * @tc.desc Test TestGetNewTargetFunction - get new.target in normal function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class009 START');
      try {
        let result: boolean = napitestex.TestGetNewTargetFunction();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestGetNewTargetFunction result: %{public}s', result.toString());
        console.info('Class009 PASS');
      } catch (err) {
        console.error('Class009 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0010
     * @tc.name Class010
     * @tc.desc Test TestWrap - wrap native object to JS object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class010 START');
      try {
        let result: boolean = napitestex.TestWrap();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestWrap result: %{public}s', result.toString());
        console.info('Class010 PASS');
      } catch (err) {
        console.error('Class010 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0011
     * @tc.name Class011
     * @tc.desc Test TestWrapWithFinalize - wrap with finalize callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class011 START');
      try {
        let result: boolean = napitestex.TestWrapWithFinalize();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestWrapWithFinalize result: %{public}s', result.toString());
        console.info('Class011 PASS');
      } catch (err) {
        console.error('Class011 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0012
     * @tc.name Class012
     * @tc.desc Test TestUnwrapNotWrapped - unwrap not wrapped object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class012 START');
      try {
        let result: boolean = napitestex.TestUnwrapNotWrapped();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestUnwrapNotWrapped result: %{public}s', result.toString());
        console.info('Class012 PASS');
      } catch (err) {
        console.error('Class012 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0013
     * @tc.name Class013
     * @tc.desc Test TestUnwrapWrapped - unwrap wrapped object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class013 START');
      try {
        let result: boolean = napitestex.TestUnwrapWrapped();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestUnwrapWrapped result: %{public}s', result.toString());
        console.info('Class013 PASS');
      } catch (err) {
        console.error('Class013 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0014
     * @tc.name Class014
     * @tc.desc Test TestRemoveWrapWrapped - remove wrapped object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class014 START');
      try {
        let result: boolean = napitestex.TestRemoveWrapWrapped();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestRemoveWrapWrapped result: %{public}s', result.toString());
        console.info('Class014 PASS');
      } catch (err) {
        console.error('Class014 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0015
     * @tc.name Class015
     * @tc.desc Test TestRemoveWrapNotWrapped - remove not wrapped object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class015 START');
      try {
        let result: boolean = napitestex.TestRemoveWrapNotWrapped();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestRemoveWrapNotWrapped result: %{public}s', result.toString());
        console.info('Class015 PASS');
      } catch (err) {
        console.error('Class015 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0016
     * @tc.name Class016
     * @tc.desc Test TestFullLifecycle - full lifecycle test: define class->create instance->wrap->unwrap->remove wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class016 START');
      try {
        let result: boolean = napitestex.TestFullLifecycle();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestFullLifecycle result: %{public}s', result.toString());
        console.info('Class016 PASS');
      } catch (err) {
        console.error('Class016 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0017
     * @tc.name Class017
     * @tc.desc Test TestMassWrapUnwrap - mass object wrap/unwrap test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class017 START');
      try {
        let result: boolean = napitestex.TestMassWrapUnwrap();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestMassWrapUnwrap result: %{public}s', result.toString());
        console.info('Class017 PASS');
      } catch (err) {
        console.error('Class017 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0018
     * @tc.name Class018
     * @tc.desc Test TestMassClassDefine - mass class definition and instantiation test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class018 START');
      try {
        let result: boolean = napitestex.TestMassClassDefine();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestMassClassDefine result: %{public}s', result.toString());
        console.info('Class018 PASS');
      } catch (err) {
        console.error('Class018 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0019
     * @tc.name Class019
     * @tc.desc Test TestClassDefineWithArgs - class definition and instance creation with arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class019 START');
      try {
        let result: boolean = napitestex.TestClassDefineWithArgs();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestClassDefineWithArgs result: %{public}s', result.toString());
        console.info('Class019 PASS');
      } catch (err) {
        console.error('Class019 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0020
     * @tc.name Class020
     * @tc.desc Test TestMultiThreadClassDefine - multi-thread concurrent class definition and instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class020 START');
      try {
        let result: boolean = napitestex.TestMultiThreadClassDefine();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestMultiThreadClassDefine result: %{public}s', result.toString());
        console.info('Class020 PASS');
      } catch (err) {
        console.error('Class020 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0021
     * @tc.name Class021
     * @tc.desc Test TestMultiThreadWrapUnwrapRace - multi-thread shared object wrap/unwrap race
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class021 START');
      try {
        let result: boolean = napitestex.TestMultiThreadWrapUnwrapRace();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestMultiThreadWrapUnwrapRace result: %{public}s', result.toString());
        console.info('Class021 PASS');
      } catch (err) {
        console.error('Class021 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0022
     * @tc.name Class022
     * @tc.desc Test TestClassInheritanceWrapping - class inheritance chain with wrapping combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class022 START');
      try {
        let result: boolean = napitestex.TestClassInheritanceWrapping();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestClassInheritanceWrapping result: %{public}s', result.toString());
        console.info('Class022 PASS');
      } catch (err) {
        console.error('Class022 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_CLASS_0023
     * @tc.name Class023
     * @tc.desc Test TestMultipleWrapUnwrap - multiple wrap and unwrap operations test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Class023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('Class023 START');
      try {
        let result: boolean = napitestex.TestMultipleWrapUnwrap();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'TestMultipleWrapUnwrap result: %{public}s', result.toString());
        console.info('Class023 PASS');
      } catch (err) {
        console.error('Class023 err msg: ' + err.message);
        expect().assertFail();
      }
    });         
  })

  // NAPI Promise Test Cases
  describe('NapiPromiseTests', () => {
    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0001
     * @tc.name napiPromiseTest001
     * @tc.desc 创建并解决Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest001 begin');
      
      let result: boolean = napitestex.NapiPromiseTest001();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest001 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0002
     * @tc.name napiPromiseTest002
     * @tc.desc 创建并拒绝Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest002 begin');
      
      let result: boolean = napitestex.NapiPromiseTest002();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest002 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0003
     * @tc.name napiPromiseTest003
     * @tc.desc 多次解决或拒绝Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest003 begin');
      
      let result: boolean = napitestex.NapiPromiseTest003();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest003 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0004
     * @tc.name napiPromiseTest004
     * @tc.desc 检查非Promise对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest004 begin');
      
      let result: boolean = napitestex.NapiPromiseTest004();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest004 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0005
     * @tc.name napiPromiseTest005
     * @tc.desc 异常情况处理
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest005 begin');
      
      let result: boolean = napitestex.NapiPromiseTest005();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest005 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0006
     * @tc.name napiPromiseTest006
     * @tc.desc Promise与线程安全函数组合
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest006 begin');
      
      let result: boolean = napitestex.NapiPromiseTest006();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest006 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0007
     * @tc.name napiPromiseTest007
     * @tc.desc Promise链式调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest007 begin');
      
      let result: boolean = napitestex.NapiPromiseTest007();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest007 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0008
     * @tc.name napiPromiseTest008
     * @tc.desc 尝试在promise解决后使用deferred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest008 begin');
      
      let result: boolean = napitestex.NapiPromiseTest008();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest008 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0009
     * @tc.name napiPromiseTest009
     * @tc.desc 在存在pending exception时操作promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest009 begin');
      
      let result: boolean = napitestex.NapiPromiseTest009();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest009 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0010
     * @tc.name napiPromiseTest010
     * @tc.desc Promise作为函数返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest010 begin');
      
      let result: boolean = napitestex.NapiPromiseTest010();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest010 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0011
     * @tc.name napiPromiseTest011
     * @tc.desc 使用Promise方式异步任务开发
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest011 begin');
      
      let result: boolean = napitestex.NapiPromiseTest011();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest011 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0012
     * @tc.name napiPromiseTest012
     * @tc.desc 异步任务完成通知测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest012 begin');
      
      let result: boolean = napitestex.NapiPromiseTest012();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest012 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0013
     * @tc.name napiPromiseTest013
     * @tc.desc Promise与线程安全函数上下文共享
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest013 begin');
      
      let result: boolean = napitestex.NapiPromiseTest013();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest013 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_PROMISE_0014
     * @tc.name napiPromiseTest014
     * @tc.desc 获取和使用libuv事件循环
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('napiPromiseTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest014 begin');
      
      let result: boolean = napitestex.NapiPromiseTest014();
      expect(result).assertEqual(true);
      
      hilog.info(0x0000, 'testTag', '%{public}s', 'napiPromiseTest014 completed successfully');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_INSTANCE_DATA_0001
     * @tc.name envlifecycle001
     * @tc.desc Test basic instance data set and get functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('envlifecycle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('envlifecycle001 START');
      try {
        let testValue: number = 42;
        let result: boolean = napitestex.testBasicInstanceDataSetAndGet(testValue);
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'envlifecycle001: Basic instance data set and get test passed');
        console.info('envlifecycle001 PASS');
      } catch (err) {
        console.error('envlifecycle001 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_INSTANCE_DATA_0002
     * @tc.name envlifecycle002
     * @tc.desc Test multiple set instance data behavior and finalize callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('envlifecycle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('envlifecycle002 START');
      try {
        let valueA: number = 100;
        let valueB: number = 200;
        let result: boolean = napitestex.testMultipleSetInstanceData(valueA, valueB);
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'envlifecycle002: Multiple set instance data test passed');
        console.info('envlifecycle002 PASS');
      } catch (err) {
        console.error('envlifecycle002 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_INSTANCE_DATA_0003
     * @tc.name envlifecycle003
     * @tc.desc Test instance data behavior without finalize callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('envlifecycle003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('envlifecycle003 START');
      try {
        let value1: number = 300;
        let value2: number = 400;
        let result: boolean = napitestex.testNoFinalizeCallback(value1, value2);
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'envlifecycle003: No finalize callback test passed');
        console.info('envlifecycle003 PASS');
      } catch (err) {
        console.error('envlifecycle003 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_INSTANCE_DATA_0005
     * @tc.name envlifecycle005
     * @tc.desc Test large data block set and get operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('envlifecycle005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('envlifecycle005 START');
      try {
        let result: boolean = napitestex.testLargeDataBlockSetAndGet();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'envlifecycle005: Large data block set and get test passed');
        console.info('envlifecycle005 PASS');
      } catch (err) {
        console.error('envlifecycle005 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_INSTANCE_DATA_0006
     * @tc.name envlifecycle006
     * @tc.desc Test API calls behavior within finalize callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('envlifecycle006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('envlifecycle006 START');
      try {
        let result: boolean = napitestex.testFinalizeCallbackApiCalls();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'envlifecycle006: Finalize callback API calls test passed');
        console.info('envlifecycle006 PASS');
      } catch (err) {
        console.error('envlifecycle006 err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_INSTANCE_DATA_0007
     * @tc.name envlifecycle007
     * @tc.desc Test instance data persistence in long-running environment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('envlifecycle007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('envlifecycle007 START');
      try {
        let result: boolean = napitestex.testLongRunningInstanceDataPersistence();
        expect(result).assertTrue();
        hilog.info(0x0000, 'testTag', 'envlifecycle007: Long running instance data persistence test passed');
        console.info('envlifecycle007 PASS');
      } catch (err) {
        console.error('envlifecycle007 err msg: ' + err.message);
        expect().assertFail();
      }
    });    
  });
}
