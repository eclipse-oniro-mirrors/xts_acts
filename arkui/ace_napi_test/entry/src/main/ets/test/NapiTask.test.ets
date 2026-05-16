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

import { describe, afterEach, it, expect , TestType, Size, Level } from "@ohos/hypium";
import napitest from 'libnapitest.so';
// import napitest from 'libentry.so';
import { taskpool } from '@kit.ArkTS';

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
function getLastError(): number {
  let value = napitest.napiSerialize();
  console.info('testExecuteTask value is: ' + value);
  return value;
}

@Concurrent
function isError(): boolean {
  let value = napitest.isError(true);
  console.info('testIsError ret is: ' + value);
  return value;
}

@Concurrent
function createError(): number {
  let value = napitest.createError();
  console.info('testCreateError value is: ' + value);
  return value;
}

@Concurrent
function createRangeError(): number {
  let value = napitest.createRangeError();
  console.info('testCreateRangeError value is: ' + value);
  return value;
}

@Concurrent
function isExceptionPending(): number {
  let value = napitest.isExceptionPending();
  console.info('testIsExceptionPending value is: ' + value);
  return value;
}

@Concurrent
function createReference(): number {
  let value = napitest.createReference();
  console.info('testCreateReference value is: ' + value);
  return value;
}

@Concurrent
function referenceRefAndUnref(): number {
  let value = napitest.referenceRefAndUnref();
  console.info('testReferenceRefAndUnref value is: ' + value);
  return value;
}

@Concurrent
function createArrayAndGetLength(): string {
  let array = [1, 2];
  let value = napitest.createArrayAndGetLength(array);
  let obj = JSON.stringify(value);
  console.info('testCreateArrayAndGetLength value is: ' + obj);
  return obj;
}

@Concurrent
function createExternal(): number {
  let value = napitest.createExternal();
  console.info('testCreateExternal value is: ' + value);
  return value;
}

@Concurrent
function createExternalArraybuffer(): ArrayBuffer {
  let value = napitest.createExternalArraybuffer();
  console.info('testCreateExternalArraybuffer value is: ', value);
  return value;
}

@Concurrent
function createObject(): Object {
  let value = napitest.createObject();
  console.info('testCreateObject value is: ', value);
  return value;
}

@Concurrent
function createSymbol(): number {
  let value = napitest.createSymbol('symbol');
  console.info('testCreateSymbol value is: ', value);
  return value;
}

@Concurrent
function createTypeArray(): Int32Array {
  let value = napitest.createTypeArray();
  console.info('testCreateTypeArray value is: ', value);
  return value;
}

@Concurrent
function getValueBool(): boolean {
  let value = napitest.getValueBool(false);
  console.info('testGetValueBool value is: ', value);
  return value;
}

@Concurrent
function createAndGetInt32(): number {
  let value = napitest.createAndGetInt32(32);
  console.info('testCreateAndGetInt32 value is: ', value);
  return value;
}

@Concurrent
function createAndGetUInt32(): number {
  let value = napitest.createAndGetUInt32(32);
  console.info('testCreateAndGetUInt32 value is: ', value);
  return value;
}

@Concurrent
function createAndGetInt64(): number {
  let value = napitest.createAndGetInt64(23);
  console.info('testCreateAndGetInt64 value is: ', value);
  return value;
}

@Concurrent
function createDouble(): number {
  let value = napitest.createDouble(24.67);
  console.info('testCreateDouble value is: ', value);
  return value;
}

@Concurrent
function createAndGetStringUtf16(): string {
  let value = napitest.createAndGetStringUtf16('he');
  console.info('testCreateAndGetStringUtf16 value is: ', value);
  return value;
}

@Concurrent
function stringUtf16OfCase(): string {
  let value = napitest.stringUtf16OfCase('abc2r42');
  console.info('testStringUtf16OfCase value is: ', value);
  return value;
}

@Concurrent
function getValueDouble(): number {
  let value = napitest.getValueDouble(24.5);
  console.info('testValueDouble value is: ', value);
  return value;
}

@Concurrent
function getValueExternal(): number {
  let value = napitest.getValueExternal();
  console.info('testValueExternal value is: ', value);
  return value;
}

@Concurrent
function getNull(): number {
  let value = napitest.getNull();
  console.info('testValueNull value is: ', value);
  return value;
}

@Concurrent
function getUndefined(): number {
  let value = napitest.getUndefined();
  console.info('testGetUndefined value is: ', value);
  return value;
}

@Concurrent
function coerceToBool(): boolean {
  let value = napitest.coerceToBool(0);
  console.info('testCoerceToBool value is: ', value);
  return value;
}

@Concurrent
function coerceToNumber(): number {
  let value = napitest.coerceToNumber('12');
  console.info('testCoerceToNumber value is: ', value);
  return value;
}

@Concurrent
function coerceToObject(): string {
  let obj = napitest.coerceToObject([2, 3]);
  console.info('testCoerceToObject value is: ', obj);
  return JSON.stringify(obj);
}

@Concurrent
function coerceToString(): string {
  let value = napitest.coerceToString(123);
  console.info('testCoerceToString value is: ', value);
  return value;
}

@Concurrent
function typeOf(): number {
  let value = napitest.typeOf('test');
  console.info('testTypeOf value is: ', value);
  return value;
}

@Concurrent
function isArray(): number {
  let value = napitest.isArray();
  console.info('testIsArray value is: ', value);
  return value;
}


@Concurrent
function strictEquals(): number {
  let value = napitest.strictEquals();
  console.info('testStrictEquals value is: ', value);
  return value;
}


@Concurrent
function getPropertyNames(): number {
  let value = napitest.getPropertyNames();
  console.info('testGetPropertyNames value is: ', value);
  return value;
}

@Concurrent
function setProperty(): object {
  let value = napitest.setProperty();
  console.info('testSetProperty value is: ', value);
  return value;
}

@Concurrent
function getProperty(): object {
  let value = napitest.getProperty();
  console.info('testGetProperty value is: ', value);
  return value;
}

@Concurrent
function hasProperty(): number {
  let value = napitest.hasProperty();
  console.info('testHasProperty value is: ', value);
  return value;
}

@Concurrent
function setAndDeleteProperty(): number {
  interface Person {
    name: string,
    age: number
  }

  let peop: Person = { name: 'John', age: 30 };
  let value = napitest.setAndDeleteProperty(peop, 'a');
  console.info('testSetAndDeleteProperty value is: ', value);
  return value;
}

@Concurrent
function hasOwnProperty(): boolean {
  interface Person {
    name: string,
    age: number
  }

  let peop: Person = {
    name: 'zhangsan',
    age: 18
  };
  let value = napitest.hasOwnProperty(peop, 'name');
  console.info('testHasOwnProperty value is: ', value);
  return value;
}

@Concurrent
function setNamedProperty(): boolean {
  let value = napitest.setNamedProperty([1, 2], "e", false);
  console.info('testSetNamedProperty value is: ', value);
  return value;
}

@Concurrent
function getNamedProperty(): number {
  interface Person {
    name: string,
    age: number
  }

  let peop: Person = {
    name: 'zhangsan',
    age: 18
  };
  let value = napitest.getNamedProperty(peop, "name");
  console.info('testGetNamedProperty value is: ', value);
  return value;
}

@Concurrent
function hasNamedProperty(): boolean {
  interface Person {
    name: string,
    age: number
  }

  let peop: Person = {
    name: 'zhangsan',
    age: 18
  };
  let value = napitest.hasNamedProperty(peop, "name");
  console.info('testHasNamedProperty value is: ', value);
  return value;
}

@Concurrent
function setElement(): object {
  let value = napitest.setElement();
  console.info('testSetElement value is: ', value);
  return value;
}

@Concurrent
function getElement(): object {
  let value = napitest.getElement();
  console.info('testGetElement value is: ', value);
  return value;
}

@Concurrent
function hasElement(): object {
  let value = napitest.hasElement();
  console.info('testHasElement value is: ', value);
  return value;
}

@Concurrent
function deleteElement(): object {
  let value = napitest.deleteElement();
  console.info('testDeleteElement value is: ', value);
  return value;
}

@Concurrent
function defineProperties(): object {
  let value = napitest.defineProperties();
  console.info('testDefineProperties value is: ', value);
  return value;
}

@Concurrent
function callFunctionNull(): number {
  let value = napitest.callFunctionNull(null);
  console.info('testCallFunctionNull value is: ', value);
  return value;
}

@Concurrent
function napiCreateFunctionFuncNull(): Function {
  let value = napitest.napiCreateFunctionFuncNull();
  console.info('testNapiCreateFunctionFuncNull value is: ', value);
  return value;
}

@Concurrent
function napiGetCbInfo(): number {
  let value = napitest.napiGetCbInfo(12.06);
  console.info('testNapiGetCbInfo value is: ', value);
  return value;
}

@Concurrent
function unwrap(): number {
  let value = napitest.unwrap();
  console.info('testUnwrap value is: ', value);
  return value;
}

@Concurrent
function removeWrap(): number {
  let value = napitest.removeWrap();
  console.info('testRemoveWrap value is: ', value);
  return value;
}

@Concurrent
function getVersion(): number {
  let value = napitest.getVersion();
  console.info('testGetVersion value is: ', value);
  return value;
}

@Concurrent
function createPromise(): number {
  let value = napitest.createPromise();
  console.info('testCreatePromise value is: ', value);
  return value;
}

@Concurrent
function resolveAndRejectDeferred(): number {
  let value = napitest.resolveAndRejectDeferred();
  console.info('testResolveAndRejectDeferred value is: ', value);
  return value;
}

@Concurrent
function isPromise(): number {
  let value = napitest.isPromise();
  console.info('testIsPromise value is: ', value);
  return value;
}

@Concurrent
function napiCreateThreadsafeFunction(): number {
  let value = napitest.napiCreateThreadsafeFunction();
  console.info('testNapiCreateThreadsafeFunction value is: ', value);
  return value;
}

@Concurrent
function napiDeleteSerializationDataTest(): number {
  let value = napitest.napiDeleteSerializationData();
  console.info('testNapiDeleteSerializationData value is: ', value);
  return value;
}

@Concurrent
function napiCallThreadsafeFunction(): number {
  let value = napitest.napiCallThreadsafeFunction();
  console.info('testNapiCallThreadsafeFunction value is: ', value);
  return value;
}

@Concurrent
function napiAnotherThreadSafeTest(): number {
  let value = napitest.ThreadSafeTestNull(() => 666);
  console.info('testNapiAnotherThreadSafe value is: ', value);
  return value;
}

@Concurrent
function napiRefThreadsafeFunction(): number {
  let value = napitest.napiRefthreadSafeFunction();
  console.info('testNapiRefThreadsafeFunction value is: ', value);
  return value;
}

@Concurrent
function napiCreateDate(): number {
  let value = napitest.napiCreateDate();
  console.info('testNapiCreateDate value is: ', value);
  return value;
}

@Concurrent
function napiCreateBigintInt64(): number {
  let value = napitest.napiCreateBigintInt64();
  console.info('testNapiCreateBigintInt64 value is: ', value);
  return value;
}

@Concurrent
function napiCreateBigintUint64(): number {
  let value = napitest.napiCreateBigintUint64();
  console.info('testNapiCreateBigintUint64 value is: ', value);
  return value;
}

@Concurrent
function napiCreateBigintWords(): number {
  let value = napitest.napiCreateBigintWords();
  console.info('testNapiCreateBigintWords value is: ', value);
  return value;
}

@Concurrent
function GetAllPropertyNamesEnvNull(): number {
  let value = napitest.GetAllPropertyNamesEnvNull();
  console.info('testGetAllPropertyNamesEnvNull value is: ', value);
  return value;
}

@Concurrent
function napiSetInstanceData(): number {
  let value = napitest.napiSetInstanceData();
  console.info('testNapiSetInstanceData value is: ', value);
  return value;
}

@Concurrent
function getModuleFileName(): number {
  let value = napitest.getModuleFileName().indexOf(".so");
  console.info('testGetModuleFileName value is: ', value);
  return value;
}

@Concurrent
function createAsyncResource(): object {
  let value = napitest.createAsyncResource({
    foo: 'bar'
  }, false);
  console.info('testCreateAsyncResource value is: ', value);
  return value;
}

@Concurrent
function asyncWorkWithQos(): number {
  let value = napitest.asyncWorkWithQos(1000, (input) => {
    console.info('asyncWorkWithQos ' + (input * 2));
    return input * 2;
  });
  console.info('testAsyncWorkWithQos value is: ', value);
  return value;
}

@Concurrent
function napiRunScriptPathEnvNull(): number | object {
  let value = napitest.napiRunScriptPathEnvNull();
  console.info('testNapiRunScriptPathEnvNull value is: ', value);
  return value;
}

@Concurrent
function napiLoadModuleTest(): number {
  let value = napitest.napiLoadModule();
  console.info('testNapiLoadModule value is: ', value);
  return value;
}

@Concurrent
function createObjectWithProperties(): number {
  let value = napitest.createObjectWithProperties();
  console.info('testCreateObjectWithProperties value is: ', value);
  return value;
}

@Concurrent
function createObjectWithNamedProperties(): number {
  let value = napitest.createObjectWithNamedProperties();
  console.info('testCreateObjectWithNamedProperties value is: ', value);
  return value;
}

@Concurrent
function coerceToNativeBindingObjectEnvNull(): string {
  let value = napitest.coerceToNativeBindingObjectEnvNull(null);
  console.info('testCoerceToNativeBindingObjectEnvNull value is: ', value);
  return value;
}

@Concurrent
function napiSerializeTest(): number {
  let value = napitest.napiSerialize();
  console.info('testNapiSerialize value is: ', value);
  return value;
}

@Concurrent
function napiDeSerializeTest(): number {
  let value = napitest.napiDeSerialize();
  console.info('testNapiDeSerialize value is: ', value);
  return value;
}

export default function NapiTaskTest() {

  describe('napiTaskTest', () => {

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiTaskTest] after each called')
    });

    /**
     * @tc.name   testExecuteTask0001
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0100
     * @tc.desc   NapiTaskTest getLastError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getLastError).then((value) => {
            num++;
            expect(value).assertEqual(2000);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0002
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0200
     * @tc.desc   NapiTaskTest isError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(isError).then((value) => {
            num++;
            expect(value).assertEqual(false);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0003
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0300
     * @tc.desc   NapiTaskTest createError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createError).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0004
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0400
     * @tc.desc   NapiTaskTest createRangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createRangeError).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0005
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0500
     * @tc.desc   NapiTaskTest isExceptionPending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(isExceptionPending).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0006
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0600
     * @tc.desc   NapiTaskTest createReference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createReference).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0007
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0700
     * @tc.desc   NapiTaskTest referenceRefAndUnref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(referenceRefAndUnref).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0008
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0800
     * @tc.desc   NapiTaskTest createArrayAndGetLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createArrayAndGetLength).then((value) => {
            num++;
            expect(value).assertEqual('[1,2]');
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0009
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_0900
     * @tc.desc   NapiTaskTest createExternal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createExternal).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0010
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1000
     * @tc.desc   NapiTaskTest createExternalArraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createExternalArraybuffer).then((value) => {
            num++;
            expect(value instanceof ArrayBuffer).assertEqual(true);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0011
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1100
     * @tc.desc   NapiTaskTest createObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createObject).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0012
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1200
     * @tc.desc   NapiTaskTest createSymbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createSymbol).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0013
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1300
     * @tc.desc   NapiTaskTest createTypeArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createTypeArray).then((value) => {
            num++;
            expect(value instanceof Int32Array).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0014
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1400
     * @tc.desc   NapiTaskTest getValueBool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getValueBool).then((value) => {
            num++;
            expect(value).assertFalse();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0015
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1500
     * @tc.desc   NapiTaskTest createAndGetInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createAndGetInt32).then((value) => {
            num++;
            expect(value).assertEqual(32);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0016
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1600
     * @tc.desc   NapiTaskTest createAndGetUInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createAndGetUInt32).then((value) => {
            num++;
            expect(value).assertEqual(32);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0017
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1700
     * @tc.desc   NapiTaskTest createAndGetInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createAndGetInt64).then((value) => {
            num++;
            expect(value).assertEqual(23);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0018
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1800
     * @tc.desc   NapiTaskTest createDouble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createDouble).then((value) => {
            num++;
            expect(value).assertEqual(24.67);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0019
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_1900
     * @tc.desc   NapiTaskTest createAndGetStringUtf16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createAndGetStringUtf16).then((value) => {
            num++;
            expect(value).assertEqual('he');
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0020
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2000
     * @tc.desc   NapiTaskTest stringUtf16OfCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(stringUtf16OfCase).then((value) => {
            num++;
            expect(value).assertEqual('abc2');
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0021
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2100
     * @tc.desc   NapiTaskTest getValueDouble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getValueDouble).then((value) => {
            num++;
            expect(value).assertEqual(24.5);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0022
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2200
     * @tc.desc   NapiTaskTest getValueExternal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getValueExternal).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0023
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2300
     * @tc.desc   NapiTaskTest getNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getNull).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0024
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2400
     * @tc.desc   NapiTaskTest getUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getUndefined).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0025
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2500
     * @tc.desc   NapiTaskTest coerceToBool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(coerceToBool).then((value) => {
            num++;
            expect(value).assertFalse();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0026
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2600
     * @tc.desc   NapiTaskTest coerceToNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(coerceToNumber).then((value) => {
            num++;
            expect(value).assertEqual(12);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0027
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2700
     * @tc.desc   NapiTaskTest coerceToObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(coerceToObject).then((value) => {
            num++;
            expect(value).assertEqual('[2,3]');
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0028
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2800
     * @tc.desc   NapiTaskTest coerceToString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(coerceToString).then((value) => {
            num++;
            expect(value).assertEqual('123');
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0029
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_2900
     * @tc.desc   NapiTaskTest typeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(typeOf).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0030
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3000
     * @tc.desc   NapiTaskTest isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(isArray).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0031
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3100
     * @tc.desc   NapiTaskTest strictEquals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(strictEquals).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0032
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3200
     * @tc.desc   NapiTaskTest getPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getPropertyNames).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0033
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3300
     * @tc.desc   NapiTaskTest setProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(setProperty).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0034
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3400
     * @tc.desc   NapiTaskTest getProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getProperty).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0035
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3500
     * @tc.desc   NapiTaskTest hasProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(hasProperty).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0036
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3600
     * @tc.desc   NapiTaskTest setAndDeleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(setAndDeleteProperty).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0037
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3700
     * @tc.desc   NapiTaskTest hasOwnProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(hasOwnProperty).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0038
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3800
     * @tc.desc   NapiTaskTest setNamedProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(setNamedProperty).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0039
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_3900
     * @tc.desc   NapiTaskTest getNamedProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getNamedProperty).then((value) => {
            num++;
            expect(value).assertEqual('zhangsan');
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0040
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4000
     * @tc.desc   NapiTaskTest hasNamedProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(hasNamedProperty).then((value) => {
            num++;
            expect(value).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0041
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4100
     * @tc.desc   NapiTaskTest setElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(setElement).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0042
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4200
     * @tc.desc   NapiTaskTest getElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getElement).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0043
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4300
     * @tc.desc   NapiTaskTest hasElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(hasElement).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0044
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4400
     * @tc.desc   NapiTaskTest deleteElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(deleteElement).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0045
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4500
     * @tc.desc   NapiTaskTest defineProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(defineProperties).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0046
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4600
     * @tc.desc   NapiTaskTest callFunctionNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(callFunctionNull).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0047
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4700
     * @tc.desc   NapiTaskTest napiCreateFunctionFuncNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiCreateFunctionFuncNull).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0048
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4800
     * @tc.desc   NapiTaskTest napiGetCbInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiGetCbInfo).then((value) => {
            num++;
            expect(value).assertEqual(12.06);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0049
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_4900
     * @tc.desc   NapiTaskTest unwrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(unwrap).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0050
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5000
     * @tc.desc   NapiTaskTest removeWrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(removeWrap).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0051
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5100
     * @tc.desc   NapiTaskTest getVersionWrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getVersion).then((value) => {
            num++;
            expect(value).assertEqual(8);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0052
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5200
     * @tc.desc   NapiTaskTest createPromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createPromise).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0053
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5300
     * @tc.desc   NapiTaskTest resolveAndRejectDeferred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(resolveAndRejectDeferred).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0054
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5400
     * @tc.desc   NapiTaskTest isPromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(isPromise).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0055
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5500
     * @tc.desc   NapiTaskTest napiCreateThreadsafeFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiCreateThreadsafeFunction).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiDeleteSerializationData0056
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5600
     * @tc.desc   NapiTaskTest napiDeleteSerializationData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiDeleteSerializationData0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiDeleteSerializationData0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiDeleteSerializationDataTest).then((value) => {
            num++;
            expect(value).assertEqual(2000);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0057
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5700
     * @tc.desc   NapiTaskTest napiCallThreadsafeFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiCallThreadsafeFunction).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0058
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5800
     * @tc.desc   NapiTaskTest napiAnotherThreadSafeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiAnotherThreadSafeTest).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0059
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_5900
     * @tc.desc   NapiTaskTest napiRefThreadsafeFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiRefThreadsafeFunction).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0060
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6000
     * @tc.desc   NapiTaskTest napiCreateDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiCreateDate).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0061
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6100
     * @tc.desc   NapiTaskTest napiCreateBigintInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiCreateBigintInt64).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0062
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6200
     * @tc.desc   NapiTaskTest napiCreateBigintUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiCreateBigintUint64).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0063
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6300
     * @tc.desc   NapiTaskTest napiCreateBigintWords
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiCreateBigintWords).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0064
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6400
     * @tc.desc   NapiTaskTest GetAllPropertyNamesEnvNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(GetAllPropertyNamesEnvNull).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testExecuteTask0065
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6500
     * @tc.desc   NapiTaskTest napiSetInstanceData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTask0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testExecuteTask0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiSetInstanceData).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testGetModuleFileName0066
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6600
     * @tc.desc   NapiTaskTest getModuleFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetModuleFileName0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testGetModuleFileName0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(getModuleFileName).then((value) => {
            num++;
            expect(value < 0).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testCreateAsyncResource0067
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6700
     * @tc.desc   NapiTaskTest createAsyncResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateAsyncResource0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCreateAsyncResource0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createAsyncResource).then((value) => {
            num++;
            expect(value instanceof Object).assertTrue();
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testAsyncWorkWithQos0068
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6800
     * @tc.desc   NapiTaskTest asyncWorkWithQos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncWorkWithQos0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testAsyncWorkWithQos0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(asyncWorkWithQos).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiRunScriptPathEnvNull0069
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_6900
     * @tc.desc   NapiTaskTest napiRunScriptPathEnvNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiRunScriptPathEnvNull0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiRunScriptPathEnvNull0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiRunScriptPathEnvNull).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiLoadModule0070
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_7000
     * @tc.desc   NapiTaskTest napiLoadModule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiLoadModule0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiLoadModule0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiLoadModuleTest).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testCreateObjectWithProperties0071
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_7100
     * @tc.desc   NapiTaskTest createObjectWithProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateObjectWithProperties0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCreateObjectWithProperties0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createObjectWithProperties).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testCreateObjectWithNamedProperties0072
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_7200
     * @tc.desc   NapiTaskTest createObjectWithNamedProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateObjectWithNamedProperties0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCreateObjectWithNamedProperties0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(createObjectWithNamedProperties).then((value) => {
            num++;
            expect(value).assertEqual(0);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testCoerceToNativeBindingObjectEnvNull0073
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_7300
     * @tc.desc   NapiTaskTest coerceToNativeBindingObjectEnvNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToNativeBindingObjectEnvNull0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCoerceToNativeBindingObjectEnvNull0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(coerceToNativeBindingObjectEnvNull).then((value) => {
            num++;
            expect(value).assertEqual(1);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiSerialize0074
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_7400
     * @tc.desc   NapiTaskTest napiSerialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSerialize0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSerialize0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiSerializeTest).then((value) => {
            num++;
            expect(value).assertEqual(2000);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testNapiDeSerialize0075
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_TASK_7500
     * @tc.desc   NapiTaskTest napiDeSerialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiDeSerialize0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiDeSerialize0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiDeSerializeTest).then((value) => {
            num++;
            expect(value).assertEqual(2000);
          });
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
    })
  })
}