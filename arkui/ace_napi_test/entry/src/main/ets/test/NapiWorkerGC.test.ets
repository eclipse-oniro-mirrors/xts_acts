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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';
import napitest from 'libnapitest.so';
// import napitest from 'libentry.so';

interface WorkerMessage {
  messageType: string;
  value: Length | object | boolean ;
}

async function handleWorkerMessages(myWorker: worker.ThreadWorker, caseName: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    myWorker.onmessage = (e: MessageEvents) => {
      console.log(`${caseName} result: ` + JSON.stringify(e));
      try {
        expect(e.data).assertEqual(true);
        resolve();
      } catch (error) {
        reject(error);
      } finally {
        myWorker.terminate();
      }
    };
    myWorker.onexit = (code: number) => {
      console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
      resolve();
    };
    myWorker.onerror = (e: ErrorEvent) => {
      console.error(`${caseName} worker error: ` + JSON.stringify(e));
      reject(e);
    };
  });
}

declare class ArkTools {
  static forceFullGC(): void;
}

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

export default function NapiWorkerGCTest() {

  describe('napiWorkerGCTest', () => {
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0100
     * @tc.name      : testNapiWorkerGC0001
     * @tc.desc      : NapiWorkerTest getLastError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0001';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const getLastErrorValue: number = napitest.napiSerialize();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getLastError', value: getLastErrorValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0200
     * @tc.name      : testNapiWorkerGC0002
     * @tc.desc      : NapiWorkerTest isError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0002';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const isErrorValue: boolean = napitest.isError(true);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'isError', value: isErrorValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0300
     * @tc.name      : testNapiWorkerGC0003
     * @tc.desc      : NapiWorkerTest createError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0003';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createErrorValue: number = napitest.createError();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createError', value: createErrorValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0400
     * @tc.name      : testNapiWorkerGC0004
     * @tc.desc      : NapiWorkerTest createRangeError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0004';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createRangeErrorValue: number = napitest.createRangeError();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createRangeError', value: createRangeErrorValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0500
     * @tc.name      : testNapiWorkerGC0005
     * @tc.desc      : NapiWorkerTest isExceptionPending
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0005';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const isExceptionPendingValue: number = napitest.isExceptionPending();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'isExceptionPending', value: isExceptionPendingValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0600
     * @tc.name      : testNapiWorkerGC0006
     * @tc.desc      : NapiWorkerTest createReference
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0006';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createReferenceValue: number = napitest.createReference();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createReference', value: createReferenceValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0700
     * @tc.name      : testNapiWorkerGC0007
     * @tc.desc      : NapiWorkerTest referenceRefAndUnref
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0007';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const referenceRefAndUnrefValue: number = napitest.referenceRefAndUnref();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'referenceRefAndUnref', value: referenceRefAndUnrefValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0800
     * @tc.name      : testNapiWorkerGC0008
     * @tc.desc      : NapiWorkerTest createArrayAndGetLength
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0008';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const arrayValue = [1, 2];
        const createArrayAndGetLengthValue: number[] = napitest.createArrayAndGetLength(arrayValue);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createArrayAndGetLength', value: createArrayAndGetLengthValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0900
     * @tc.name      : testNapiWorkerGC0009
     * @tc.desc      : NapiWorkerTest createExternal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0009';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createExternalValue: number = napitest.createExternal();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createExternal', value: createExternalValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1000
     * @tc.name      : testNapiWorkerGC0010
     * @tc.desc      : NapiWorkerTest createExternalArraybuffer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0010';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createExternalArraybufferValue = napitest.createExternalArraybuffer();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createExternalArraybuffer', value: createExternalArraybufferValue
        };
        myWorker.postMessage(message,[createExternalArraybufferValue]);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1100
     * @tc.name      : testNapiWorkerGC0011
     * @tc.desc      : NapiWorkerTest createObject
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0011';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createObjectValue = napitest.createObject();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createObject', value: createObjectValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1200
     * @tc.name      : testNapiWorkerGC0012
     * @tc.desc      : NapiWorkerTest createSymbol
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0012';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const symbolValue = napitest.createSymbol('symbol');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createSymbol', value: symbolValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1300
     * @tc.name      : testNapiWorkerGC0013
     * @tc.desc      : NapiWorkerTest createTypeArray
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0013';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const typeArrayValue = napitest.createTypeArray();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createTypeArray',
          value: typeArrayValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1400
     * @tc.name      : testNapiWorkerGC0014
     * @tc.desc      : NapiWorkerTest getValueBool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0014';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const boolValue = napitest.getValueBool(false);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getValueBool',
          value: boolValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1500
     * @tc.name      : testNapiWorkerGC0015
     * @tc.desc      : NapiWorkerTest createAndGetInt32
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiWorkerGC0015';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const int32Value = napitest.createAndGetInt32(32);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createAndGetInt32',
          value: int32Value
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1600
     * @tc.name      : testNapiWorkerGC0016
     * @tc.desc      : NapiWorkerTest createAndGetUInt32
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0016';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const uInt32Value = napitest.createAndGetUInt32(32);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createAndGetUInt32',
          value: uInt32Value
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1700
     * @tc.name      : testNapiWorkerGC0017
     * @tc.desc      : NapiWorkerTest createAndGetInt64
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0017';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const int64Value = napitest.createAndGetInt64(23);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createAndGetInt64',
          value: int64Value
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1800
     * @tc.name      : testNapiWorkerGC0018
     * @tc.desc      : NapiWorkerTest createDouble
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0018';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const doubleValue = napitest.createDouble(24.67);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createDouble',
          value: doubleValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1900
     * @tc.name      : testNapiWorkerGC0019
     * @tc.desc      : NapiWorkerTest createAndGetStringUtf16
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0019';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const utf16Value = napitest.createAndGetStringUtf16('he');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createAndGetStringUtf16',
          value: utf16Value
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2000
     * @tc.name      : testNapiWorkerGC0020
     * @tc.desc      : NapiWorkerTest stringUtf16OfCase
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0020';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const utf16CaseValue = napitest.stringUtf16OfCase('abc2r42');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'stringUtf16OfCase',
          value: utf16CaseValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2100
     * @tc.name      : testNapiWorkerGC0021
     * @tc.desc      : NapiWorkerTest stringUtf16OfCase
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0021';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const valueDouble = napitest.getValueDouble(24.5);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getValueDouble',
          value: valueDouble
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2200
     * @tc.name      : testNapiWorkerGC0022
     * @tc.desc      : NapiWorkerTest getValueExternal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0022';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const valueExternal = napitest.getValueExternal();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getValueExternal',
          value: valueExternal
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2300
     * @tc.name      : testNapiWorkerGC0023
     * @tc.desc      : NapiWorkerTest getNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0023';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const nullValue = napitest.getNull();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getNull',
          value: nullValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2400
     * @tc.name      : testNapiWorkerGC0024
     * @tc.desc      : NapiWorkerTest getUndefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0024';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const undefinedValue = napitest.getUndefined();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getUndefined',
          value: undefinedValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2500
     * @tc.name      : testNapiWorkerGC0025
     * @tc.desc      : NapiWorkerTest coerceToBool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0025';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const coerceToBoolValue = napitest.coerceToBool(0);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'coerceToBool',
          value: coerceToBoolValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2600
     * @tc.name      : testNapiWorkerGC0026
     * @tc.desc      : NapiWorkerTest coerceToNumber
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0026';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const coerceToNumberValue = napitest.coerceToNumber('12');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'coerceToNumber',
          value: coerceToNumberValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2700
     * @tc.name      : testNapiWorkerGC0027
     * @tc.desc      : NapiWorkerTest coerceToObject
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0027';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const coerceToObjectValue = napitest.coerceToObject([2, 3]);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'coerceToObject',
          value: coerceToObjectValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2800
     * @tc.name      : testNapiWorkerGC0028
     * @tc.desc      : NapiWorkerTest coerceToString
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0028';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const coerceToStringValue = napitest.coerceToString(123);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'coerceToString',
          value: coerceToStringValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2900
     * @tc.name      : testNapiWorkerGC0029
     * @tc.desc      : NapiWorkerTest typeOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0029';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const typeOfValue = napitest.typeOf('test');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'typeOf',
          value: typeOfValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3000
     * @tc.name      : testNapiWorkerGC0030
     * @tc.desc      : NapiWorkerTest isArray
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0030';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const typeOfValue = napitest.isArray();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'isArray',
          value: typeOfValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3100
     * @tc.name      : testNapiWorkerGC0031
     * @tc.desc      : NapiWorkerTest strictEquals
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0031';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const strictEqualsValue = napitest.strictEquals();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'strictEquals',
          value: strictEqualsValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3200
     * @tc.name      : testNapiWorkerGC0032
     * @tc.desc      : NapiWorkerTest getPropertyNames
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0032';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const getPropertyNamesValue = napitest.getPropertyNames();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getPropertyNames',
          value: getPropertyNamesValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3300
     * @tc.name      : testNapiWorkerGC0033
     * @tc.desc      : NapiWorkerTest setProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0033';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const setPropertyValue = napitest.setProperty();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'setProperty',
          value: setPropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3400
     * @tc.name      : testNapiWorkerGC0034
     * @tc.desc      : NapiWorkerTest getProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0034';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const getPropertyValue = napitest.getProperty();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getProperty',
          value: getPropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3500
     * @tc.name      : testNapiWorkerGC0035
     * @tc.desc      : NapiWorkerTest hasProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0035';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const hasPropertyValue = napitest.hasProperty();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'hasProperty',
          value: hasPropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3600
     * @tc.name      : testNapiWorkerGC0036
     * @tc.desc      : NapiWorkerTest setAndDeleteProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0036';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        interface Person {
          name: string,
          age: number
        }
        const peop: Person = { name: 'John', age: 30 };
        const setAndDeletePropertyValue = napitest.setAndDeleteProperty(peop, 'a');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'setAndDeleteProperty',
          value: setAndDeletePropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3700
     * @tc.name      : testNapiWorkerGC0037
     * @tc.desc      : NapiWorkerTest hasOwnProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0037';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        interface Person {
          name: string,
          age: number
        }
        const peop: Person = { name: 'zhangsan', age: 18 };
        const hasOwnPropertyValue = napitest.hasOwnProperty(peop, 'name');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'hasOwnProperty',
          value: hasOwnPropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3800
     * @tc.name      : testNapiWorkerGC0038
     * @tc.desc      : NapiWorkerTest setNamedProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0038';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const setNamedPropertyValue = napitest.setNamedProperty([1, 2], 'e', false);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'setNamedProperty',
          value: setNamedPropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3900
     * @tc.name      : testNapiWorkerGC0039
     * @tc.desc      : NapiWorkerTest getNamedProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0039';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        interface Person {
          name: string,
          age: number
        }
        const peop: Person = { name: 'zhangsan', age: 18 };
        const getNamedPropertyValue = napitest.getNamedProperty(peop, 'name');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getNamedProperty',
          value: getNamedPropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4000
     * @tc.name      : testNapiWorkerGC0040
     * @tc.desc      : NapiWorkerTest hasNamedProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0040';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        interface Person {
          name: string,
          age: number
        }
        const peop: Person = { name: 'zhangsan', age: 18 };
        const hasNamedPropertyValue = napitest.hasNamedProperty(peop, 'name');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'hasNamedProperty',
          value: hasNamedPropertyValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4100
     * @tc.name      : testNapiWorkerGC0041
     * @tc.desc      : NapiWorkerTest setElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0041';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const setElementValue = napitest.setElement();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'setElement',
          value: setElementValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4200
     * @tc.name      : testNapiWorkerGC0042
     * @tc.desc      : NapiWorkerTest getElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0042';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const getElementValue = napitest.getElement();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getElement',
          value: getElementValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4300
     * @tc.name      : testNapiWorkerGC0043
     * @tc.desc      : NapiWorkerTest hasElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0043';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const hasElementValue = napitest.hasElement();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'hasElement',
          value: hasElementValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4400
     * @tc.name      : testNapiWorkerGC0044
     * @tc.desc      : NapiWorkerTest deleteElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0044';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const deleteElementValue = napitest.deleteElement();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'deleteElement',
          value: deleteElementValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4500
     * @tc.name      : testNapiWorkerGC0045
     * @tc.desc      : NapiWorkerTest defineProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0045';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const definePropertiesValue = napitest.defineProperties();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'defineProperties',
          value: definePropertiesValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4600
     * @tc.name      : testNapiWorkerGC0046
     * @tc.desc      : NapiWorkerTest callFunctionNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0046';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const callFunctionNullValue = napitest.callFunctionNull(null);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'callFunctionNull',
          value: callFunctionNullValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4700
     * @tc.name      : testNapiWorkerGC0047
     * @tc.desc      : NapiWorkerTest napiCreateFunctionFuncNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0047';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateFunctionFuncNullValue = napitest.napiCreateFunctionFuncNull();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateFunctionFuncNull',
          value: napiCreateFunctionFuncNullValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4800
     * @tc.name      : testNapiWorkerGC0048
     * @tc.desc      : NapiWorkerTest napiGetCbInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0048';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiGetCbInfoValue = napitest.napiGetCbInfo(12.06);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiGetCbInfo',
          value: napiGetCbInfoValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4900
     * @tc.name      : testNapiWorkerGC0049
     * @tc.desc      : NapiWorkerTest unwrap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0049';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const unwrapValue = napitest.unwrap();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'unwrap',
          value: unwrapValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5000
     * @tc.name      : testNapiWorkerGC0050
     * @tc.desc      : NapiWorkerTest removeWrap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0050';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const removeWrapValue = napitest.removeWrap();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'removeWrap',
          value: removeWrapValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5100
     * @tc.name      : testNapiWorkerGC0051
     * @tc.desc      : NapiWorkerTest getVersion
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0051';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const getVersionValue = napitest.getVersion();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getVersion',
          value: getVersionValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5200
     * @tc.name      : testNapiWorkerGC0052
     * @tc.desc      : NapiWorkerTest createPromise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0052';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createPromiseValue = napitest.createPromise();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createPromise',
          value: createPromiseValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5300
     * @tc.name      : testNapiWorkerGC0053
     * @tc.desc      : NapiWorkerTest resolveAndRejectDeferred
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0053';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const resolveAndRejectDeferredValue = napitest.resolveAndRejectDeferred();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'resolveAndRejectDeferred',
          value: resolveAndRejectDeferredValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5400
     * @tc.name      : testNapiWorkerGC0054
     * @tc.desc      : NapiWorkerTest isPromise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0054';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const isPromiseValue = napitest.isPromise();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'isPromise',
          value: isPromiseValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5500
     * @tc.name      : testNapiWorkerGC0055
     * @tc.desc      : NapiWorkerTest napiCreateThreadsafeFunction
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0055';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateThreadsafeFunctionValue = napitest.napiCreateThreadsafeFunction();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateThreadsafeFunction',
          value: napiCreateThreadsafeFunctionValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5600
     * @tc.name      : testNapiWorkerGC0056
     * @tc.desc      : NapiWorkerTest napiDeleteSerializationDataTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0056';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiDeleteSerializationDataValue = napitest.napiDeleteSerializationData();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiDeleteSerializationDataTest',
          value: napiDeleteSerializationDataValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5700
     * @tc.name      : testNapiWorkerGC0057
     * @tc.desc      : NapiWorkerTest napiCallThreadsafeFunction
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0057';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCallThreadsafeFunctionValue = napitest.napiCallThreadsafeFunction();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCallThreadsafeFunction',
          value: napiCallThreadsafeFunctionValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5800
     * @tc.name      : testNapiWorkerGC0058
     * @tc.desc      : NapiWorkerTest napiAnotherThreadSafeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0058';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiAnotherThreadSafeTestValue = napitest.ThreadSafeTestNull(() => 666);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiAnotherThreadSafeTest',
          value: napiAnotherThreadSafeTestValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5900
     * @tc.name      : testNapiWorkerGC0059
     * @tc.desc      : NapiWorkerTest napiRefThreadsafeFunction
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0059';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiRefThreadsafeFunctionValue = napitest.napiRefthreadSafeFunction();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiRefThreadsafeFunction',
          value: napiRefThreadsafeFunctionValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6000
     * @tc.name      : testNapiWorkerGC0060
     * @tc.desc      : NapiWorkerTest napiCreateDate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0060';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateDateValue = napitest.napiCreateDate();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateDate',
          value: napiCreateDateValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6100
     * @tc.name      : testNapiWorkerGC0061
     * @tc.desc      : NapiWorkerTest napiCreateBigintInt64
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0061';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateBigintInt64Value = napitest.napiCreateBigintInt64();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateBigintInt64',
          value: napiCreateBigintInt64Value
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6200
     * @tc.name      : testNapiWorkerGC0062
     * @tc.desc      : NapiWorkerTest napiCreateBigintUint64
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0062';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateBigintUint64Value = napitest.napiCreateBigintUint64();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateBigintUint64',
          value: napiCreateBigintUint64Value
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6300
     * @tc.name      : testNapiWorkerGC0063
     * @tc.desc      : NapiWorkerTest napiCreateBigintWords
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0063';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateBigintWordsValue = napitest.napiCreateBigintWords();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateBigintWords',
          value: napiCreateBigintWordsValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6400
     * @tc.name      : testNapiWorkerGC0064
     * @tc.desc      : NapiWorkerTest GetAllPropertyNamesEnvNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0064';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const GetAllPropertyNamesEnvNullValue = napitest.GetAllPropertyNamesEnvNull();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'GetAllPropertyNamesEnvNull',
          value: GetAllPropertyNamesEnvNullValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6500
     * @tc.name      : testNapiWorkerGC0065
     * @tc.desc      : NapiWorkerTest napiSetInstanceData
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0065';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiSetInstanceDataValue = napitest.napiSetInstanceData();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiSetInstanceData',
          value: napiSetInstanceDataValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6600
     * @tc.name      : testNapiWorkerGC0066
     * @tc.desc      : NapiWorkerTest getModuleFileName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0066';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const getModuleFileNameValue = napitest.getModuleFileName().indexOf('.so');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'getModuleFileName',
          value: getModuleFileNameValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6700
     * @tc.name      : testNapiWorkerGC0067
     * @tc.desc      : NapiWorkerTest createAsyncResource
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0067';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createAsyncResourceValue = napitest.createAsyncResource({ foo: 'bar' }, false);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createAsyncResource',
          value: createAsyncResourceValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6800
     * @tc.name      : testNapiWorkerGC0068
     * @tc.desc      : NapiWorkerTest asyncWorkWithQos
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0068';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const asyncWorkWithQosValue = napitest.asyncWorkWithQos(1000, (input) => {
          console.info('Worker: asyncWorkWithQos ' + (input * 2));
          return input * 2;
        });
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'asyncWorkWithQos',
          value: asyncWorkWithQosValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6900
     * @tc.name      : testNapiWorkerGC0069
     * @tc.desc      : NapiWorkerTest napiRunScriptPathEnvNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0069';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiRunScriptPathEnvNullValue = napitest.napiRunScriptPathEnvNull();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiRunScriptPathEnvNull',
          value: napiRunScriptPathEnvNullValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7000
     * @tc.name      : testNapiWorkerGC0070
     * @tc.desc      : NapiWorkerTest napiLoadModule
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0070';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiLoadModuleValue = napitest.napiLoadModule();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiLoadModuleTest',
          value: napiLoadModuleValue
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7100
     * @tc.name      : testNapiWorkerGC0071
     * @tc.desc      : NapiWorkerTest createObjectWithProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0071';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createObjectWithPropertiesValue = napitest.createObjectWithProperties();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createObjectWithProperties',
          value: createObjectWithPropertiesValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7200
     * @tc.name      : testNapiWorkerGC0072
     * @tc.desc      : NapiWorkerTest createObjectWithNamedProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0072';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const createObjectWithNamedPropertiesValue = napitest.createObjectWithNamedProperties();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'createObjectWithNamedProperties',
          value: createObjectWithNamedPropertiesValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7300
     * @tc.name      : testNapiWorkerGC0073
     * @tc.desc      : NapiWorkerTest coerceToNativeBindingObjectEnvNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0073';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const coerceToNativeBindingObjectEnvNullValue = napitest.coerceToNativeBindingObjectEnvNull(null);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'coerceToNativeBindingObjectEnvNull',
          value: coerceToNativeBindingObjectEnvNullValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7400
     * @tc.name      : testNapiWorkerGC0074
     * @tc.desc      : NapiWorkerTest napiSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0074';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiSerializeTestValue = napitest.napiSerialize();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiSerializeTest',
          value: napiSerializeTestValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7500
     * @tc.name      : testNapiWorkerGC0075
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerGC0075';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiDeSerializeTestValue = napitest.napiDeSerialize();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiDeSerializeTest',
          value: napiDeSerializeTestValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0100
     * @tc.name      : testNapiWorkerSendableGC0001
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0001';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiIsSendableValue = napitest.NapiIsSendable([1, 2]);
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiIsSendableTest',
          value: napiIsSendableValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0200
     * @tc.name      : testNapiWorkerSendableGC0002
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0002';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateSendableObjectValue = napitest.NapiCreateSendableObject();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateSendableObjectTest',
          value: napiCreateSendableObjectValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0300
     * @tc.name      : testNapiWorkerSendableGC0003
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0003';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateSendableArrayValue = napitest.NapiCreateSendableArray();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateSendableArrayTest',
          value: napiCreateSendableArrayValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0400
     * @tc.name      : testNapiWorkerSendableGC0004
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0004';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateSendableArrayWithLengthValue = napitest.NapiCreateSendableArrayWithLength();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateSendableArrayWithLengthTest',
          value: napiCreateSendableArrayWithLengthValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0500
     * @tc.name      : testNapiWorkerSendableGC0005
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0005';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateSendableArrayBufferValue = napitest.NapiCreateSendableArrayBuffer();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateSendableArrayBufferTest',
          value: napiCreateSendableArrayBufferValue,
        };
        myWorker.postMessage(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0600
     * @tc.name      : testNapiWorkerSendableGC0006
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0006';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateSendableTypedArrayValue = napitest.NapiCreateSendableTypedArray();
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiCreateSendableTypedArrayTest',
          value: napiCreateSendableTypedArrayValue,
        };
        myWorker.postMessageWithSharedSendable(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0700
     * @tc.name      : testNapiWorkerSendableGC0007
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0007';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateSendableObjectValue = napitest.NapiCreateSendableObject();
        napitest.NapiWrapSendable(napiCreateSendableObjectValue, 'data');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiWrapSendableTest',
          value: napiCreateSendableObjectValue,
        };
        myWorker.postMessageWithSharedSendable(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_SENDABLE_GC_0800
     * @tc.name      : testNapiWorkerSendableGC0008
     * @tc.desc      : NapiWorkerTest napiDeSerializeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerSendableGC0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorkerSendableGC0008';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        const napiCreateSendableObjectValue = napitest.NapiCreateSendableObject();
        napitest.NapiWrapSendableWithSize(napiCreateSendableObjectValue, 'data');
        ArkTools.forceFullGC();
        const message: WorkerMessage = {
          messageType: 'napiWrapSendableWithSizeTest',
          value: napiCreateSendableObjectValue,
        };
        myWorker.postMessageWithSharedSendable(message);
        await handleWorkerMessages(myWorker, caseName);
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
  })
}