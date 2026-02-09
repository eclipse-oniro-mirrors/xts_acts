/**
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { myAsyncSleep } from "../utils/SleepThread"

import { msgExecutor, promiseExecutorLazy } from "../utils/promise/PromiseExecutorLazy"
import { msgBefore, promiseBeforeLazy } from "../utils/promise/PromiseBeforeLazy"
import { msgThen, promiseThenLazy } from "../utils/promise/PromiseThenLazy"
import { msgAfter, promiseAfterLazy } from "../utils/promise/PromiseAfterLazy"
import { msgCatch, promiseCatchLazy } from "../utils/promise/PromiseCatchLazy"
import { msgFinally, promiseFinallyLazy } from "../utils/promise/PromiseFinallyLazy"
import { loadModuleWithInfo } from "libentry.so"


export default function promiseLazyTest() {
  describe('PromiseLazyTest', () => {
    /**
     * @tc.name   testPromiseExecutorLazy
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0001
     * @tc.desc   The lazy object is used in Promise Executor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseExecutorLazy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await promiseExecutorLazy();
      await myAsyncSleep(1);
      expect(msgExecutor.length).assertEqual(4);
      expect(msgExecutor[0]).assertEqual("promiseExecutorLazy start taskTest 1");
      expect(msgExecutor[1]).assertEqual("promiseExecutorLazy start asyncFunc 2");
      expect(msgExecutor[2]).assertEqual("promiseExecutorLazy asyncFunc end 3");
      expect(msgExecutor[3]).assertEqual("promiseExecutorLazy asyncFunc then 4");
    })
    /**
     * @tc.name   testPromiseBeforeLazy
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0002
     * @tc.desc   The lazy object is used before Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseBeforeLazy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await promiseBeforeLazy();
      await myAsyncSleep(1);
      expect(msgBefore.length).assertEqual(4);
      expect(msgBefore[0]).assertEqual("promiseBeforeLazy start taskTest 1");
      expect(msgBefore[1]).assertEqual("promiseBeforeLazy start asyncFunc 2");
      expect(msgBefore[2]).assertEqual("promiseBeforeLazy asyncFunc end 3");
      expect(msgBefore[3]).assertEqual("promiseBeforeLazy asyncFunc then 4");
    })
    /**
     * @tc.name   testPromiseThenLazy
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0003
     * @tc.desc   The lazy object is used in Promise then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseThenLazy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await promiseThenLazy();
      await myAsyncSleep(1);
      expect(msgThen.length).assertEqual(4);
      expect(msgThen[0]).assertEqual("promiseThenLazy start taskTest 1");
      expect(msgThen[1]).assertEqual("promiseThenLazy start asyncFunc 2");
      expect(msgThen[2]).assertEqual("promiseThenLazy asyncFunc end 3");
      expect(msgThen[3]).assertEqual("promiseThenLazy asyncFunc then 4");
    })
    /**
     * @tc.name   testPromiseAfterLazy
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0004
     * @tc.desc   The lazy object is used after Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseAfterLazy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await promiseAfterLazy();
      await myAsyncSleep(1);
      expect(msgAfter.length).assertEqual(4);
      expect(msgAfter[0]).assertEqual("promiseAfterLazy start taskTest 1");
      expect(msgAfter[1]).assertEqual("promiseAfterLazy start asyncFunc 2");
      expect(msgAfter[2]).assertEqual("promiseAfterLazy asyncFunc end 3");
      expect(msgAfter[3]).assertEqual("promiseAfterLazy asyncFunc then 4");
    })
    /**
     * @tc.name   testPromiseCatchLazy
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0005
     * @tc.desc   The lazy object is used in Promise catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseCatchLazy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await promiseCatchLazy();
      await myAsyncSleep(1);
      expect(msgCatch.length).assertEqual(5);
      expect(msgCatch[0]).assertEqual("promiseCatchLazy start taskTest 1");
      expect(msgCatch[1]).assertEqual("promiseCatchLazy start asyncFunc 2");
      expect(msgCatch[2]).assertEqual("promiseCatchLazy asyncFunc end 3");
      expect(msgCatch[3]).assertEqual("promiseCatchLazy asyncFunc catch 4");
      expect(msgCatch[4]).assertEqual("promiseCatchLazy asyncFunc finally 5");
    })
    /**
     * @tc.name   testPromiseFinallyLazy
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0006
     * @tc.desc   The lazy object is used in Promise finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseFinallyLazy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await promiseFinallyLazy();
      await myAsyncSleep(1);
      expect(msgFinally.length).assertEqual(5);
      expect(msgFinally[0]).assertEqual("promiseFinallyLazy start taskTest 1");
      expect(msgFinally[1]).assertEqual("promiseFinallyLazy start asyncFunc 2");
      expect(msgFinally[2]).assertEqual("promiseFinallyLazy asyncFunc end 3");
      expect(msgFinally[3]).assertEqual("promiseFinallyLazy asyncFunc catch 4");
      expect(msgFinally[4]).assertEqual("promiseFinallyLazy asyncFunc finally 5");
    })
    /**
     * @tc.name   testPromiseLazyInDynamicModule
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0007
     * @tc.desc   The lazy object is used in dynamic module Promise Executor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseLazyInDynamicModule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let module = await import("../utils/promise/PromiseLazyInDynamicModule");
      await module.promiseLazyInDynamicModule();
      await myAsyncSleep(1);
      expect(module.msgInDynamicModule.length).assertEqual(4);
      expect(module.msgInDynamicModule[0]).assertEqual("promiseLazyInDynamicModule start taskTest 1");
      expect(module.msgInDynamicModule[1]).assertEqual("promiseLazyInDynamicModule start asyncFunc 2");
      expect(module.msgInDynamicModule[2]).assertEqual("promiseLazyInDynamicModule asyncFunc end 3");
      expect(module.msgInDynamicModule[3]).assertEqual("promiseLazyInDynamicModule asyncFunc then 4");
    })
    /**
     * @tc.name   testPromiseLazyInNapiLoad
     * @tc.number SUB_Runtime_Language_Lazy_Import_Promise_0008
     * @tc.desc   The lazy object is used in napi load module Promise Executor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPromiseLazyInNapiLoad', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let module:ESObject = loadModuleWithInfo("ets/utils/promise/PromiseLazyInNapiLoad", "com.example.lazy_load/entry_test");
      await module.promiseLazyInNapiLoad();
      await myAsyncSleep(1);
      expect(module.msgInNapiLoad.length).assertEqual(4);
      expect(module.msgInNapiLoad[0]).assertEqual("promiseLazyInNapiLoad start taskTest 1");
      expect(module.msgInNapiLoad[1]).assertEqual("promiseLazyInNapiLoad start asyncFunc 2");
      expect(module.msgInNapiLoad[2]).assertEqual("promiseLazyInNapiLoad asyncFunc end 3");
      expect(module.msgInNapiLoad[3]).assertEqual("promiseLazyInNapiLoad asyncFunc then 4");
    })
  })
}