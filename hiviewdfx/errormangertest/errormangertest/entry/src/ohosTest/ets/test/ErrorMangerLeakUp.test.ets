/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { hidebug, hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { errorManager } from '@kit.AbilityKit';
import { process, taskpool } from '@kit.ArkTS';



export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

function getLeakTypeName(type: errorManager.ResourceType): string {
  const typeMap = new Map<errorManager.ResourceType, string>([
    [errorManager.ResourceType.PSS_MEMORY, 'PSS_MEMORY'],
    [errorManager.ResourceType.ION_MEMORY, 'ION_MEMORY'],
    [errorManager.ResourceType.ASHMEM_MEMORY, 'ASHMEM_MEMORY'],
    [errorManager.ResourceType.GPU_MEMORY, 'GPU_MEMORY'],
    [errorManager.ResourceType.FD, 'FD'],
    [errorManager.ResourceType.THREAD, 'THREAD']
  ]);
  const typeName = typeMap.get(type);
  return typeName !== undefined ? typeName : 'UNKNOWN_TYPE';
}
const leakHandler: errorManager.ResourceUsageObserver = (leakType, leakSize, detailInfo) => {
  console.error('testTag 执行资源泄漏回调函数');

  const typeName = getLeakTypeName(leakType);
  console.error(`testTag 【泄漏事件】类型：${typeName}(${leakType})，大小/数量：${leakSize}`);
  if (leakType) {
    switch (leakType) {
      case errorManager.ResourceType.PSS_MEMORY :
        console.error('testTag→ 检测到 NATIVE 泄漏');
        break;
      case errorManager.ResourceType.THREAD:
        console.error('testTag→ 检测到 THREAD 泄漏');
        break;
      case errorManager.ResourceType.FD:
        if (detailInfo){
          console.error(`te 【泄漏事件】类型：${detailInfo.gpu}(${detailInfo.ion})，大小/数量：${JSON.stringify(detailInfo)}`);
        }
        console.error('testTag→ 检测到 FD 泄漏');
        break;
      case errorManager.ResourceType.ASHMEM_MEMORY :
        console.error('testTag→ 检测到 ASHMEM 泄漏');
        break;
      case errorManager.ResourceType.GPU_MEMORY :
        console.error('testTag→ 检测到 GPU 泄漏');
        break;
      case errorManager.ResourceType.ION_MEMORY  :
        console.error('testTag→ 检测到 ION_MEMORY  泄漏');
        break;
      default:
        console.error('testTag→ 检测到 其他类型 泄漏');
        break;
    }
  } else {
    console.error( 'testTag', `检测到未知类型(${leakType}) 泄漏，LeakType 枚举未定义`);
  }
};

let firstHandler: errorManager.ResourceUsageObserver;
const firstResourseUsageObserver: errorManager.ResourceUsageObserver = (leakType, leakSize, detailInfo) => {
  // 自定义的newObserver实现逻辑
  console.error('[Observer]  firstHandler Uncaught exception handler invoked.');
  if (firstHandler) {
    firstHandler(leakType, leakSize, detailInfo);
  } else {
    console.error('[Observer]  firstHandler is null.');
    // 建议增加判空操作，如果为空采用同步退出方式
    const processManager = new process.ProcessManager();
    processManager.exit(0);
  }
};
export function setFirstObserver() {
  firstHandler = errorManager.setDefaultResourceUsageObserver(firstResourseUsageObserver);
  console.error('Registered First Error Handler');
}

let secondHandler: errorManager.ResourceUsageObserver;
const secondResourseUsageObserver: errorManager.ResourceUsageObserver = (leakType, leakSize, detailInfo) => {
  // 自定义的newObserver实现逻辑
  console.error('[Observer] secondHandler Uncaught exception handler invoked.');
  if (secondHandler) {
    secondHandler(leakType, leakSize, detailInfo);
  } else {
    // 建议增加判空操作，如果为空采用同步退出方式
    console.error('[Observer]  secondHandler is null.');
    const processManager = new process.ProcessManager();
    processManager.exit(0);
  }
};
export function setSecondObserver() {
  secondHandler = errorManager.setDefaultResourceUsageObserver(secondResourseUsageObserver);
  console.error('Registered second Error Handler');
}


@Concurrent
export function TaskPoolTest01(){
  let secondHandler: errorManager.ResourceUsageObserver;

  const thirdResourseUsageObserver: errorManager.ResourceUsageObserver = (leakType, leakSize, detailInfo) => {
    // 自定义的newObserver实现逻辑
    console.error('[Observer] secondHandler Uncaught exception handler invoked.');
    if (secondHandler) {
      secondHandler(leakType, leakSize, detailInfo);
    } else {
      // 建议增加判空操作，如果为空采用同步退出方式
      console.error('[Observer]  secondHandler is null.');
      const processManager = new process.ProcessManager();
      processManager.exit(0);
    }
  };
  let code = 0
  try {
    console.info('testErrorManger_1900 taskpool start 2 ');
    errorManager.setDefaultResourceUsageObserver(thirdResourseUsageObserver);
    console.info('testErrorManger_1900 taskpool start 3 ');
  }catch (e){
    console.error(`TestTag error code: ${(e as BusinessError).code}, error msg: ${(e as BusinessError).message}`);
    console.info('testErrorManger_1900 ' + e.code);
    code = e.code
  }
  if (code == 16000205){
    throw Error(code.toString())
  }
  return 0

}


export default function ErrormangerLeakUpTest() {
  describe('ErrormangerLeakUpTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(() => {
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
     * @tc.name   testErrormangerLeakUpTest01
     * @tc.number SUB_DFX_DFR_Errormanger_LeakUp_0100
     * @tc.desc   setDefaultResourceUsageObserver(leakHandler)接口正常调用;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testErrormangerLeakUpTest01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-------------------------testErrormangerLeakUpTest01 start-------------------------");
      try{
        let ObserverDefault: errorManager.ResourceUsageObserver;
        ObserverDefault = errorManager.setDefaultResourceUsageObserver(leakHandler);
        console.error(`testErrormangerLeakUpTest01 > err code: ${ObserverDefault}`)
        done();
      }catch(err){
        console.error(`testErrormangerLeakUpTest01 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("testErrormangerLeakUpTest01 end");
    })


    /**
     * @tc.name   testErrormangerLeakUpTest02
     * @tc.number SUB_DFX_DFR_Errormanger_LeakUp_0200
     * @tc.desc   errorManager.setDefaultResourceUsageObserver(undefined);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testErrormangerLeakUpTest02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-------------------------testErrormangerLeakUpTest02 start-------------------------");
      try{
        errorManager.setDefaultResourceUsageObserver(undefined);
        done();
      }catch(err){
        console.error(`testErrormangerLeakUpTest02 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testErrormangerLeakUpTest02 end");
    })


    /**
     * @tc.name   testErrormangerLeakUpTest03
     * @tc.number SUB_DFX_DFR_Errormanger_LeakUp_0300
     * @tc.desc   errorManager.setDefaultResourceUsageObserver(null);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testErrormangerLeakUpTest03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("-------------------------testErrormangerLeakUpTest03 start-------------------------");
      try{
        errorManager.setDefaultResourceUsageObserver(null);
        done();
      }catch(err){
        console.error(`testErrormangerLeakUpTest03 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testErrormangerLeakUpTest03 end");
    })


    /**
     * @tc.name   testErrormangerLeakUpTest04
     * @tc.number SUB_DFX_DFR_Errormanger_LeakUp_0400
     * @tc.desc   errorManager.setDefaultResourceUsageObserver()链式调用;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testErrormangerLeakUpTest04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-------------------------testErrormangerLeakUpTest04 start-------------------------");
      try{
        console.info("testErrormangerLeakUpTest04 setFirstObserver start");
        setFirstObserver();
        console.info("testErrormangerLeakUpTest04 setSecondObserver start");
        setSecondObserver();
        done();
      }catch(err){
        console.error(`testErrormangerLeakUpTest04 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("testErrormangerLeakUpTest04 end");
    })


    /**
     * @tc.name   testErrormangerLeakUpTest05
     * @tc.number SUB_DFX_DFR_Errormanger_LeakUp_0500
     * @tc.desc   errorManager.setDefaultResourceUsageObserver 非主线程返回  16000205;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testErrormangerLeakUpTest05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("-------------------------testErrormangerLeakUpTest05 start-------------------------");
      taskpool.execute(TaskPoolTest01).then((code:Object) => {
        console.log("testErrormangerLeakUpTest05 TaskPoolTest begin");
        expect(false).assertTrue();
        done();
      }).catch((error:Error)=>{
        console.error("testErrormangerLeakUpTest05 TaskPoolTest throw" + (error as Error).message);
        expect(Number((error as Error).message) == 16000205)
        done();
      })
      console.info("testErrormangerLeakUpTest05 end");
    })

    /**
     * @tc.name   testErrormangerLeakUpTest06
     * @tc.number SUB_DFX_DFR_Errormanger_LeakUp_0600
     * @tc.desc   errorManager.setDefaultResourceUsageObserver()传入空值;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testErrormangerLeakUpTest06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("-------------------------testErrormangerLeakUpTest06 start-------------------------");
      try{
        errorManager.setDefaultResourceUsageObserver();
        done();
      }catch(err){
        console.error(`testErrormangerLeakUpTest06 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("testErrormangerLeakUpTest06 end");
    })






  })
}