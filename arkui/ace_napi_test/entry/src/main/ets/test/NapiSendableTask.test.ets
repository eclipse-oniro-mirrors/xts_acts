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

import { afterEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import napitest from 'libnapitest.so';
// import napitest from 'libentry.so';
import { taskpool } from '@kit.ArkTS';

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
function napiIsSendableTest(): boolean {
  let test = [1, 2];
  let value = napitest.NapiIsSendable(test);
  console.info('testNapiIsSendable value is: ', value);
  return value;
}

@Concurrent
function NapiCreateSendableObject(): boolean {
  let value = napitest.NapiCreateSendableObject();
  console.info('testNapiCreateSendableObject value is: ', value);
  return napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableArray(): boolean {
  let value = napitest.NapiCreateSendableArray();
  console.info('testNapiCreateSendableArray value is: ', value);
  let res = value.length == 0;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableArrayWithLength(): boolean {
  let value = napitest.NapiCreateSendableArrayWithLength();
  console.info('testNapiCreateSendableArrayWithLength value is: ', value);
  let res = value.length == 1;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableArrayBuffer(): boolean {
  let value = napitest.NapiCreateSendableArrayBuffer();
  console.info('testNapiCreateSendableArrayBuffer value is: ', value);
  let res = value.byteLength == 1024;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiCreateSendableTypedArray(): boolean {
  let value = napitest.NapiCreateSendableTypedArray();
  console.info('testNapiCreateSendableTypedArray value is: ', value);
  let res = value.byteLength == 1024;
  return res && napitest.NapiIsSendable(value);
}

@Concurrent
function NapiWrapSendable(): boolean {
  let value = napitest.NapiCreateSendableObject();
  napitest.NapiWrapSendable(value, "data");
  console.info('testNapiWrapSendable value is: ', value);
  let res1 = napitest.NapiUnwrapSendable(value) == "data";
  let res2 = napitest.NapiRemoveWrapSendable(value) == "data";
  let res3 = napitest.NapiUnwrapSendable(value) == undefined;
  return res1 && res2 && res3;
}

@Concurrent
function NapiWrapSendableWithSize(): boolean {
  let value = napitest.NapiCreateSendableObject();
  napitest.NapiWrapSendableWithSize(value, "data");
  console.info('testNapiWrapSendableWithSize value is: ', value);
  let res1 = napitest.NapiUnwrapSendable(value) == "data";
  let res2 = napitest.NapiRemoveWrapSendable(value) == "data";
  let res3 = napitest.NapiUnwrapSendable(value) == undefined;
  return res1 && res2 && res3;
}

export default function NapiSendableTaskTest() {

  describe('napiSendableTaskTest', () => {

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiTaskSendableTest] after each called')
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0100
     * @tc.name      : testNapiSendableTask0001
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(napiIsSendableTest).then((value) => {
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
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0200
     * @tc.name      : testNapiSendableTask0002
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(NapiCreateSendableObject).then((value) => {
            num++;
            expect(value).assertEqual(true);
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
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0300
     * @tc.name      : testNapiSendableTask0003
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(NapiCreateSendableArray).then((value) => {
            num++;
            expect(value).assertEqual(true);
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
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0400
     * @tc.name      : testNapiSendableTask0004
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(NapiCreateSendableArrayWithLength).then((value) => {
            num++;
            expect(value).assertEqual(true);
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
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0500
     * @tc.name      : testNapiSendableTask0005
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(NapiCreateSendableArrayBuffer).then((value) => {
            num++;
            expect(value).assertEqual(true);
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
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0600
     * @tc.name      : testNapiSendableTask0006
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(NapiCreateSendableTypedArray).then((value) => {
            num++;
            expect(value).assertEqual(true);
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
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0700
     * @tc.name      : testNapiSendableTask0007
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(NapiWrapSendable).then((value) => {
            num++;
            expect(value).assertEqual(true);
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
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_TASK_0800
     * @tc.name      : testNapiSendableTask0008
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableTask0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNapiSendableTask0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(NapiWrapSendableWithSize).then((value) => {
            num++;
            expect(value).assertEqual(true);
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