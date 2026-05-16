/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function AttachThreadTest():void {

  describe("AttachThreadTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0100
     * @tc.name      testAttachDetachBasicFlow
     * @tc.desc      basic Attach/Detach flow test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testAttachDetachBasicFlow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AttachDetach();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0200
     * @tc.name      testAttachDetachWithoutInterop
     * @tc.desc      Attach/Detach without interop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testAttachDetachWithoutInterop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
      let cls = new Foo();
      let result = cls.test_AttachDetach();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0300
     * @tc.name      testAttachDetachWithInterop
     * @tc.desc      Attach/Detach with interop enabled
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testAttachDetachWithInterop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AttachDetach_WithInterop();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0400
     * @tc.name      testAttachCurrentThreadInvalidResult
     * @tc.desc      AttachCurrentThread with invalid result parameter (nullptr)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testAttachCurrentThreadInvalidResult", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_Attach_InvalidResult();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0500
     * @tc.name      testAttachCurrentThreadInvalidVersion
     * @tc.desc      AttachCurrentThread with invalid version
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testAttachCurrentThreadInvalidVersion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_Attach_InvalidVersion();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0600
     * @tc.name      testAttachCurrentThreadInvalidOption
     * @tc.desc      AttachCurrentThread with invalid option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testAttachCurrentThreadInvalidOption", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_Attach_InvalidOption();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0700
     * @tc.name      testAttachCurrentThreadRepeatAttach
     * @tc.desc      AttachCurrentThread called twice on same thread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testAttachCurrentThreadRepeatAttach", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_Attach_RepeatAttach();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0800
     * @tc.name      testDetachCurrentThreadRepeatDetach
     * @tc.desc      DetachCurrentThread called twice on same thread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDetachCurrentThreadRepeatDetach", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_Attach_RepeatDetach();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_0900
     * @tc.name      testDetachCurrentThreadWithoutAttach
     * @tc.desc      DetachCurrentThread called without prior Attach
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDetachCurrentThreadWithoutAttach", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_Detach_WithoutAttach();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_1000
     * @tc.name      testConcurrentAttach
     * @tc.desc      Multiple threads concurrently call AttachCurrentThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testConcurrentAttach", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_ConcurrentAttach();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_1100
     * @tc.name      testConcurrentMainThreadWorker
     * @tc.desc      Main thread and worker thread execute ANI operations concurrently
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testConcurrentMainThreadWorker", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_ConcurrentMainThreadWorker();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_1200
     * @tc.name      testEAWorkerConcurrentAttach
     * @tc.desc      Multiple EAWorker threads concurrently call Attach
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testEAWorkerConcurrentAttach", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const WORKER_COUNT = 5;

      const workers: EAWorker[] = [];
      for (let i = 0; i < WORKER_COUNT; i++) {
        const worker = new EAWorker(`Worker${i}`);
        workers.push(worker);
      }

      const tasks = workers.map(async (worker) => {
        worker.start();
        const job = worker.run<int>(() => {
          const cls = new Foo();
          return cls.test_AttachDetach();
        });
        const result = await job;
        await worker.join();
        return result;
      });

      const allResults = await Promise.all(tasks);

      expect(allResults.every((r) => r === 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_1300
     * @tc.name      testTaskPoolConcurrentAttach
     * @tc.desc      TaskPool tasks concurrently call Attach
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testTaskPoolConcurrentAttach", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const TASK_COUNT = 5;

      const tasks: Array<Promise<Any>> = [];
      for (let i = 0; i < TASK_COUNT; i++) {
        const task = new taskpool.Task(() => {
          const cls = new Foo();
          return cls.test_AttachDetach();
        });
        const promise = taskpool.execute(task);
        tasks.push(promise);
      }

      const allResults = await Promise.all(tasks);

      expect(allResults.every((r) => r === 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ANI_ATTACHDETACH_STATIC_1400
     * @tc.name      testCreateObjectInWorker
     * @tc.desc      Create object in native thread and return to main thread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testCreateObjectInWorker", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_CreateObjectInWorker();
      expect(result).assertEqual(1);
    });

  })
}