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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ArkTSUtils, taskpool, worker } from '@kit.ArkTS';
import { execute1, TaskPoolTest1 } from "./execute";
import appRecovery from "@ohos.app.ability.appRecovery";
import AbilityConstant from "@ohos.app.ability.AbilityConstant";
import Ability from "@ohos.app.ability.UIAbility";

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
}

function errorFunc(observer: errorManager.GlobalError) {
  console.log("result name :" + observer.name);
  console.log("result message :" + observer.message);
  console.log("result stack :" + observer.stack);
  console.log("result instanceName :" + observer.instanceName);
  console.log("result instaceType :" + observer.instanceType);
}

function errorFunc1(observer: errorManager.GlobalError) {
  console.log("result instaceType")
  console.log("result name :" + observer.name);
  console.log("result message :" + observer.message);
  console.log("result stack :" + observer.stack);
  console.log("result instanceName :" + observer.instanceName);
  console.log("result instaceType :" + observer.instanceType);
}

function promiseFunc(observer: errorManager.GlobalError) {
  console.log("result name :" + observer.name);
  console.log("result message :" + observer.message);
  console.log("result stack :" + observer.stack);
  console.log("result instanceName :" + observer.instanceName);
  console.log("result instaceType :" + observer.instanceType);
}

function promiseFunc1(observer: errorManager.GlobalError) {
  console.log("result name :" + observer.name);
  console.log("result message :" + observer.message);
  console.log("result stack :" + observer.stack);
  console.log("result instanceName :" + observer.instanceName);
  console.log("result instaceType :" + observer.instanceType);
}

function freezeCallback() {
  console.log("freezecallback");
}

function freezeCallback1() {
  console.log("freezecallback1");
}

function unregisterErrorObserverCallback(err: BusinessError) {
  if (err) {
    console.error('------------ unregisterErrorObserverCallback ------------', err);
  }
}

let observer01: errorManager.ErrorHandler;
const handler1: errorManager.ErrorHandler = (reason: Error) => {
  console.info('[Handler 1]  First uncaught exception handler invoked.');
  if (observer01) {
    observer01(reason);

  }
};

let observer02: errorManager.ErrorHandler;
const handler2: errorManager.ErrorHandler = (reason: Error) => {
  console.info('[Handler 2] Second uncaught exception handler invoked.');
  if (observer02) {
    observer02(reason);
  }
};

export default function ErrormangerTest() {
  describe('ErrormangerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      afterEach(async () => {
        await asyncSleep(waittime);
      })
      let waittime = 500
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testErrorManger_0100
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0100
     * @tc.desc   验证在进程中的任一线程注册errormanager.on接口，支持捕获其他子线程
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorManger_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testErrorManger_0100 globalErrorOccurred start");
      let State1 = appRecovery.saveAppState(globalThis.abilityContext);
      console.info("====> DFX_DFR_AppRecovery_Interface_24001  + " + State1);
      expect(State1 == false).assertTrue();
      let State2 = appRecovery.saveAppState();
      console.info("====> DFX_DFR_AppRecovery_Interface_24002  + " + State2);
      expect(State2 == false).assertTrue();
      appRecovery.enableAppRecovery();
      let State3 = appRecovery.saveAppState(globalThis.abilityContext);
      console.info("====> DFX_DFR_AppRecovery_Interface_24003  + " + State3);
      expect(State3 == true).assertTrue();
      let State4 = appRecovery.saveAppState();
      console.info("====> DFX_DFR_AppRecovery_Interface_24004  + " + State4);
      expect(State4 == true).assertTrue();
      // promiseFunc
      errorManager.on("globalErrorOccurred", errorFunc);
      try {
        console.info("====> testErrorManger_0100 globalErrorOccurred end 01");
        errorManager.off('globalErrorOccurred', errorFunc);
        console.info("====> testErrorManger_0100 globalErrorOccurred end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====> testErrorManger_0100 globalErrorOccurred catch: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   testErrorManger_0200
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0200
     * @tc.desc   验证在进程中任一线程注册被拒绝promise监听器，注册后可以捕获到当前进程中未被捕获到的promise rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorManger_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testErrorManger_0200 globalUnhandledRejectionDetected start");
      // promiseFunc
      errorManager.on("globalUnhandledRejectionDetected", promiseFunc);
      try {
        console.info("====> testErrorManger_0200 globalUnhandledRejectionDetected end 01");
        errorManager.off('globalUnhandledRejectionDetected', promiseFunc);
        console.info("====> testErrorManger_0200 globalUnhandledRejectionDetected end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====> testErrorManger_0100 globalUnhandledRejectionDetected catch: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_0300
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0300
     * @tc.desc   验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0300 loopObserver start");
        errorManager.on("loopObserver", 2000, observer)
        console.info("====>testErrorManger_0300 loopObserver end 01");
        errorManager.off("loopObserver");
        console.info("====>testErrorManger_0300 loopObserver end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testErrorManger_0300 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_0400
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0400
     * @tc.desc   验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间,传入异常值 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0400 loopObserver start");
        errorManager.on("loopObserver", -1, observer);
        console.info("====>testErrorManger_0400 loopObserver error");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0400 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_0500
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0500
     * @tc.desc   验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间,on传入异常值 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0500 loopObserver start");
        errorManager.on(undefined, 2000, observer);
        console.info("====>testErrorManger_0500 loopObserver error");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0500 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_0600
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0600
     * @tc.desc   验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间,off传入异常值 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0600 loopObserver start");
        errorManager.off(undefined);
        console.info("====>testErrorManger_0600 loopObserver end");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0600 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_0700
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0700
     * @tc.desc   注册被拒绝promise监听器,注册后可以捕获到当前线程中未被捕获到的promise rejection。
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let observer: errorManager.UnhandledRejectionObserver = (reason: Error, promise: Promise<void>) => {
        if (promise === promise1) {
          console.log("promise1 is rejected");
        }
        console.log("reason.name: ", reason.name);
        console.log("reason.message: ", reason.message);
        if (reason.stack) {
          console.log("reason.stack: ", reason.stack);
        }
      };
      let promise1 = new Promise<void>(() => {}).then(() => {
        throw new Error("uncaught error");
      });

      try {
        console.info("====>testErrorManger_0700 unhandledRejection start");
        errorManager.on("unhandledRejection", observer);
        console.info("====>testErrorManger_0700 unhandledRejection end 01");
        errorManager.off("unhandledRejection");
        console.info("====>testErrorManger_0700 unhandledRejection end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0700 unhandledRej catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_0800
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0800
     * @tc.desc   在主线程注册errormanager.on接口,不支持捕获其他线程
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorManger_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let observer: errorManager.ErrorObserver = {
        onUnhandledException(errorMsg) {
          console.log('onUnhandledException, errorMsg: ', errorMsg);
        },
        onException(errorObj) {
          console.log('onException, name: ', errorObj.name);
          console.log('onException, message: ', errorObj.message);
          if (typeof(errorObj.stack) === 'string') {
            console.log('onException, stack: ', errorObj.stack);
          }
        }
      };
      let observerId = -1;
      try {
        console.info("====>testErrorManger_0800 error start");
        observerId = errorManager.on('error', observer);
        console.info("====>testErrorManger_0800 error end 01 " + observerId.toString());
        errorManager.off('error', observerId);
        console.info("====>testErrorManger_0800 error end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testErrorManger_0800 catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_0900
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0900
     * @tc.desc   注销错误观测器。使用callback异步返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorManger_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let observerId = 100;
      try {
        console.info("====>testErrorManger_0900 offcallback start");
        errorManager.off('error', observerId, unregisterErrorObserverCallback);
        console.info("====>testErrorManger_0900 offcallback end");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0900 offcallback catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_1000
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1000
     * @tc.desc   注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间。校验错误码 16200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorManger_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====>testErrorManger_1000 start");
      try {
        let observer: errorManager.LoopObserver = {
          onLoopTimeOut(timeout: number) {
            console.info('Duration timeout: ' + timeout);
          }
        };
        errorManager.on("loopObserver", 1, observer);
        setTimeout(() => {
          done();
        }, 2500);
        errorManager.off("loopObserver");
        done();
      } catch (error) {
        console.info("====>testErrorManger_1000 catch error: " + JSON.stringify(error));
        expect(error.code == 16200001).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_1100
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1100
     * @tc.desc   验证errorManager.on('globalErrorOccurred', errorFunc),返回错误码16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info("====> testErrorManger_1100 globalErrorOccurred start");
      // promiseFunc
      errorManager.on('globalErrorOccurred', errorFunc)
      try {
        errorManager.off('globalErrorOccurred', errorFunc1);
        console.info(" ====> testErrorManger_1100 globalErrorOccurred end 01");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info("====> testErrorManger_1100 globalErrorOccurred catch: " + JSON.stringify(err));
        expect(err.code == 16300004).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_1200
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1200
     * @tc.desc   验证errorManager.on("globalUnhandledRejectionDetected", promiseFunc),返回错误码16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info("====> testErrorManger_1200 globalUnhandledRejectionDetected start");
      // promiseFunc
      errorManager.on("globalUnhandledRejectionDetected", promiseFunc);
      try {
        console.info("====> testErrorManger_1200 globalUnhandledRejectionDetected end 01");
        errorManager.off('globalUnhandledRejectionDetected', promiseFunc1);
        console.info("====> testErrorManger_1200 globalUnhandledRejectionDetected end 02");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info("====> testErrorManger_1200 globalUnhandledRejectionDetected catch: " + JSON.stringify(err));
        expect(err.code == 16300004).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testErrorManger_1300
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1300
     * @tc.desc   验证errorManager.on("freeze", freezeCallback),返回错误码16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorManger_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testErrorManger_1300 freeze start");
      errorManager.on("freeze", freezeCallback);
      try {
        console.info("====> if appfreeze consolelog freezecallback");
        errorManager.off("freeze", freezeCallback);
        console.info("====> testErrorManger_1300 freeze end 01");
        done();
      } catch (err) {
        console.info("====> testErrorManger_1300 freeze catch: " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testErrorManger_1400
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1400
     * @tc.desc   验证errorManager.on("freeze", freezeCallback),返回错误码16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info("====> testErrorManger_1400 freeze start");
      errorManager.on("freeze", freezeCallback);
      try {
        errorManager.off("freeze", freezeCallback1);
        console.info("====> testErrorManger_1400 freeze end");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info("====> testErrorManger_0100 freeze catch: " + JSON.stringify(err));
        expect(err.code == 16300004).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testErrorManger_1500
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1500
     * @tc.desc   验证errorManager.on("globalUnhandledRejectionDetected", func),主线程抛出异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let result = ""
      let instanceType2 = -1
      let func = (observer:errorManager.GlobalError) => {
        result = observer.message
        console.log("result instaceType")
        console.log("result name :" + observer.name);
        console.log("result message :" + observer.message);
        console.log("result stack :" + observer.stack);
        console.log("result instanceName :" + observer.instanceName);
        console.log("result instaceType :" + observer.instanceType);
        instanceType2 = observer.instanceType
      }
      let lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let lock = lock_.lockAsync(() => {
        throw Error("这是一个error");
      })
      errorManager.on("globalUnhandledRejectionDetected", func)
      lock.then(() => {
      }).catch(() => {
        throw Error("throw error");
      })
      await asyncSleep(500)
      errorManager.off("globalUnhandledRejectionDetected", func)
      expect(result).assertEqual("throw error");
      console.info("====> testErrorManger_1500 result instaceType " + JSON.stringify(instanceType2))
      expect(instanceType2==errorManager.InstanceType.MAIN).assertTrue();
      done();
    })

    /**
     * @tc.name   testErrorManger_1600
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1600
     * @tc.desc   验证errorManager.on("globalUnhandledRejectionDetected", func),taskpool抛出异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      errorManager.off("globalErrorOccurred");
      errorManager.off("globalUnhandledRejectionDetected");
      let result = ""
      let instanceType2 = -1
      console.info("====> testErrorManger_1600 start");
      let func = (observer:errorManager.GlobalError) => {
        result = observer.message
        console.log("result instaceType")
        console.log("result name :" + observer.name);
        console.log("result message :" + observer.message);
        console.log("result stack :" + observer.stack);
        console.log("result instanceName :" + observer.instanceName);
        console.log("result instaceType :" + observer.instanceType);
        instanceType2 = observer.instanceType
      }
      errorManager.on("globalErrorOccurred", func)
      let task: taskpool.Task = new taskpool.Task(execute1);
      taskpool.executeDelayed(1000, task);
      console.info("====> testErrorManger_1600 wait");
      await asyncSleep(1500);
      console.info("====> testErrorManger_1600 wait end");
      errorManager.off("globalErrorOccurred", func)
      expect(result).assertEqual("throw error");
      expect(instanceType2==errorManager.InstanceType.TASKPOOL).assertTrue();
      console.info("====> testErrorManger_1600 end1");
      expect(errorManager.InstanceType.CUSTOM  == 3).assertTrue();
      console.info("====> testErrorManger_1600 end2");
      done();
    })

    /**
     * @tc.name   testErrorManger_1700
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1700
     * @tc.desc   验证errorManager.on("globalErrorOccurred", func),worker线程抛出异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testErrorManger_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let result: Array<string> = []
      let instanceType2 = -1
      let func = (observer:errorManager.GlobalError) => {
        console.log("result instaceType")
        console.log("result name :" + observer.name);
        console.log("result message :" + observer.message);
        console.log("result stack :" + observer.stack);
        console.log("result instanceName :" + observer.instanceName);
        console.log("result instaceType :" + observer.instanceType);
        instanceType2 = observer.instanceType
        result.push(observer.message)
      };
      errorManager.on("globalErrorOccurred", func)
      let worker1 = new worker.ThreadWorker("./worker/worker1");
      worker1.onmessage = () => {
      }
      worker1.postMessage("sendData");
      await asyncSleep(1000)
      expect(result.indexOf("throw error task19") != -1).assertTrue()
      errorManager.off("globalErrorOccurred", func)
      console.info("====> testErrorManger_1700 result instaceType " + JSON.stringify(instanceType2))
      expect(instanceType2==errorManager.InstanceType.WORKER).assertTrue();
      done();
    })

    /**
     * @tc.name   testErrorManger_1800
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1800
     * @tc.desc   验证errorManager.setDefaultErrorHandler(handler1&2链式调用)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testErrorManger_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testErrorManger_1800 start");;
      try{
        observer01 = errorManager.setDefaultErrorHandler(handler1);
        console.info('testErrorManger_1800 Registered Handler 1 (index 1)');
        observer02 = errorManager.setDefaultErrorHandler(handler2);
        console.info('testErrorManger_1800 Registered Handler 2 (index 2)');
        done();
      }catch(error){
        console.info("testErrorManger_1800 err = " + error.code);
        expect(false).assertTrue();
        done();
      }
      console.info("testErrorManger_1800 end");
    })

    /**
     * @tc.name   testErrorManger_1900
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1900
     * @tc.desc   验证errorManager.setDefaultErrorHandler()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testErrorManger_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info("testErrorManger_1900 start");;
      try{
        observer01 = errorManager.setDefaultErrorHandler(handler1);
        console.info('testErrorManger_1900 Registered Handler 1 (index 1)');
        observer02 = errorManager.setDefaultErrorHandler();
        console.info('testErrorManger_1900 Registered Handler 2 (index 2)');
        done();
      }catch(error){
        console.info("testErrorManger_1900 err = " + error.code);
        expect(false).assertTrue();
        done();
      }
      console.info("testErrorManger_1900 end");
    })

    /**
     * @tc.name   testErrorManger_2000
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_2000
     * @tc.desc   验证errorManager.setDefaultErrorHandler(null) 抛出错误码 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testErrorManger_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info("testErrorManger_2000 start");;
      try{
        observer01 = errorManager.setDefaultErrorHandler(null);
        console.info('testErrorManger_2000 Registered Handler 1 (index 1)');
        done();
      }catch(error){
        console.info("testErrorManger_2000 err = " + error.code);
        expect(error.code == 401).assertTrue();
        done();
      }
      console.info("testErrorManger_2000 end");
    })


    /**
     * @tc.name   testErrorManger_2100
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_2100
     * @tc.desc   验证errorManager.setDefaultErrorHandler() 在taskpool线程抛出 16000205
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testErrorManger_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {

      console.info("testErrorManger_2100 start1");
      taskpool.execute(TaskPoolTest1).then((code:Object) => {
        console.log("testErrorManger_2100 TaskPoolTest begin");
        expect(false).assertTrue();
        done();
      }).catch((error:Error)=>{
        console.error("testErrorManger_2100 TaskPoolTest throw" + (error as Error).message);
        expect(Number((error as Error).message) == 16000205)
        done();
      })
      console.info("testErrorManger_2100 end");
    })

  })
}
