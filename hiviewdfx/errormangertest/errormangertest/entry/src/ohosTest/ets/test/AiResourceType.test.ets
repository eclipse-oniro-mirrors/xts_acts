/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { taskpool } from '@kit.ArkTS';

@Concurrent
function concurrentFunc(args: number): number {
  console.info("test_setDefaultFreezeObserver_in_worker_thread: arg: " + args);
  try {
    errorManager.setDefaultFreezeObserver(undefined);
    console.info("test_setDefaultFreezeObserver_in_worker_thread: end");
  } catch (err) {
    console.info("test_setDefaultFreezeObserver_in_worker_thread catch: " + JSON.stringify(err));
    console.info("test_setDefaultFreezeObserver_in_worker_thread err.code: " + JSON.stringify(err.code));
  }
  let result = args * 2;
  return result;
}
export default function ResourceTypeTest() {
  describe('ResourceTypeTest', () => {
    beforeAll(() => {
      console.info("====> ResourceTypeTest beforeAll start");
    })
    beforeEach(() => {
      console.info("====> ResourceTypeTest beforeEach start");
    })
    afterEach(() => {
      console.info("====> ResourceTypeTest afterEach start");
    })
    afterAll(() => {
      console.info("====> ResourceTypeTest afterAll start");
    })

    /**
     * @tc.name   testResourceType_PSS_MEMORY_0100
     * @tc.number SUB_DFX_DFR_ResourceType_PSS_MEMORY_0100
     * @tc.desc   验证ResourceType.PSS_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_PSS_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_PSS_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.PSS_MEMORY).assertEqual(1);
        console.info("====> testResourceType_PSS_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_PSS_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_ION_MEMORY_0100
     * @tc.number SUB_DFX_DFR_ResourceType_ION_MEMORY_0100
     * @tc.desc   验证ResourceType.ION_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_ION_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_ION_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.ION_MEMORY).assertEqual(2);
        console.info("====> testResourceType_ION_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_ION_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_ASHMEM_MEMORY_0100
     * @tc.number SUB_DFX_DFR_ResourceType_ASHMEM_MEMORY_0100
     * @tc.desc   验证ResourceType.ASHMEM_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_ASHMEM_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_ASHMEM_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.ASHMEM_MEMORY).assertEqual(3);
        console.info("====> testResourceType_ASHMEM_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_ASHMEM_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_FD_0100
     * @tc.number SUB_DFX_DFR_ResourceType_FD_0100
     * @tc.desc   验证ResourceType.FD枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_FD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_FD_0100 start");
      try {
        expect(errorManager.ResourceType.FD).assertEqual(5);
        console.info("====> testResourceType_FD_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_FD_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_THREAD_0100
     * @tc.number SUB_DFX_DFR_ResourceType_THREAD_0100
     * @tc.desc   验证ResourceType.THREAD枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_THREAD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_THREAD_0100 start");
      try {
        expect(errorManager.ResourceType.THREAD).assertEqual(6);
        console.info("====> testResourceType_THREAD_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_THREAD_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_GPU_MEMORY_0100
     * @tc.number SUB_DFX_DFR_ResourceType_GPU_MEMORY_0100
     * @tc.desc   验证ResourceType.GPU_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_GPU_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_GPU_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.GPU_MEMORY).assertEqual(4);
        console.info("====> testResourceType_GPU_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_GPU_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_setDefaultFreezeObserver_0100
     * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0100
     * @tc.desc   验证setDefaultFreezeObserver有效值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setDefaultFreezeObserver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> test_setDefaultFreezeObserver_0100 start");
      const freezeHandler: errorManager.FreezeObserver = () => {
        console.info('[freezeHandler] freeze handler invoked.');
      };
      try {
        const oldHandler = errorManager.setDefaultFreezeObserver(freezeHandler);
        console.info('test_setDefaultFreezeObserver_0100: Registered freeze Handler.' + oldHandler);
        done();
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('test_setDefaultFreezeObserver_0100', `error: ${code}, ${message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_setDefaultFreezeObserver_0200
     * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0200
     * @tc.desc   验证setDefaultFreezeObserver的null值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setDefaultFreezeObserver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> test_setDefaultFreezeObserver_0200 start");
      try {
        errorManager.setDefaultFreezeObserver(null);
        console.info('test_setDefaultFreezeObserver_0200: end');
        expect(false).assertTrue();
        done();
      } catch (error) {
        let code = (error as BusinessError).code;
        console.info('test_setDefaultFreezeObserver_0200 catch: ' + code);
        expect(code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   test_setDefaultFreezeObserver_0300
     * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0300
     * @tc.desc   验证setDefaultFreezeObserver的undefined值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setDefaultFreezeObserver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> test_setDefaultFreezeObserver_0300 start");
      try {
        errorManager.setDefaultFreezeObserver(undefined);
        console.info('test_setDefaultFreezeObserver_0300: end');
        done();
      } catch (error) {
        let code = (error as BusinessError).code;
        console.info('test_setDefaultFreezeObserver_0300 catch: ' + code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_setDefaultFreezeObserver_0400
     * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0400
     * @tc.desc   验证setDefaultFreezeObserver的空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setDefaultFreezeObserver_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> test_setDefaultFreezeObserver_0400 start");
      try {
        errorManager.setDefaultFreezeObserver();
        console.info('test_setDefaultFreezeObserver_0400: end');
        done();
      } catch (error) {
        let code = (error as BusinessError).code;
        console.info('test_setDefaultFreezeObserver_0400 catch: ' + code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_setDefaultFreezeObserver_0500
     * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0500
     * @tc.desc   验证setDefaultFreezeObserver的错误码16000205
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setDefaultFreezeObserver_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> test_setDefaultFreezeObserver_0500 start");
      try {
        let task = new taskpool.Task(concurrentFunc, 1);
        taskpool.execute(task);
        console.info("test_setDefaultFreezeObserver_0500: task end");
        done();
      } catch (error) {
        let code = (error as BusinessError).code;
        console.error('test_setDefaultFreezeObserver_0500', `error: ${code}`);
        expect(code === 16000205).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_setDefaultFreezeObserver_0600
     * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0600
     * @tc.desc   验证setDefaultFreezeObserver的责任链模式
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setDefaultFreezeObserver_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> test_setDefaultFreezeObserver_0600 start");
      let callCount: number = 0;
      const firstHandler: errorManager.FreezeObserver = () => {
        callCount++;
        console.info('[firstHandler] first handler invoked.');
      };
      const secondHandler: errorManager.FreezeObserver = () => {
        callCount++;
        console.info('[secondHandler] second handler invoked.');
      };
      try {
        const oldHandler = errorManager.setDefaultFreezeObserver(firstHandler);
        errorManager.setDefaultFreezeObserver(secondHandler);

        if (oldHandler) {
          oldHandler();
        }
        console.info('test_setDefaultFreezeObserver_0600: chain call test passed.' + callCount);
        console.info('test_setDefaultFreezeObserver_0600: chain call test passed.');
        done();
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('test_setDefaultFreezeObserver_0600', `error: ${code}, ${message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_setDefaultFreezeObserver_0700
     * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0700
     * @tc.desc   验证setDefaultFreezeObserver的单链模式
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setDefaultFreezeObserver_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("====> test_setDefaultFreezeObserver_0700 start");
      const freezeHandler: errorManager.FreezeObserver = () => {
        console.info('[freezeHandler] single chain handler invoked.');
      };
      try {
        errorManager.setDefaultFreezeObserver(freezeHandler);
        console.info('test_setDefaultFreezeObserver_0700: Registered freeze Handler.');
        done();
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error('test_setDefaultFreezeObserver_0700', `error: ${code}, ${message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
