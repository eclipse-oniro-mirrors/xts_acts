/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import Utils from './Util.test'

class MockSharedData {
  private count: number = 0;

  setCount(value: number): void {
    this.count = value;
  }

  getCount(): number {
    return this.count;
  }
}

function mockTaskpoolTest(data: MockSharedData): void {
  data.setCount(10);
}

export default function TimerTest1() {
  describe('TimerTest1', (): void => {
    afterEach(() => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number SUB_Timer_Test_0100
     * @tc.name TimerTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest001';
      console.info(`${TAG} test start`);
      try {
        const timer = setTimeout("delay：-100.1", 100 as Int);
        let startTime = new Date().getTime();
        setTimeout(() => {
          const elapsed = new Date().getTime() - startTime;
          expect(elapsed > 0).assertTrue();
          clearTimeout(timer);
        }, 0);
      } catch (e) {
        e = e as Error;
        console.error(`${TAG} catch error: code =>  message => ${e.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_0200
     * @tc.name TimerTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest002';
      console.info(`${TAG} test start`);
      let executed = false;
      const callback = () => {
        executed = true;
      };
      const timerId = setTimeout(callback, 0);
      expect(executed).assertFalse();
      setTimeout(() => {
        try {
          expect(executed).assertTrue();
          clearTimeout(timerId);
        } catch (e) {
          e = e as Error;
          console.error(`${TAG} catch error: code =>  message => ${e.message}`);
          clearTimeout(timerId);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done()
      }, 5);
    });

    /**
     * @tc.number SUB_Timer_Test_0300
     * @tc.name TimerTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest003';
      console.info(`${TAG} test start`);
      try {
        let executed = false;
        let receivedArg: string | null = null;
        const handler = (str: string) => {
          executed = true;
          receivedArg = str;
        };
        const timer = setTimeout(handler, 100, "test");
        expect(executed).assertFalse();
        expect(receivedArg === null).assertTrue();
        setTimeout(() => {
          try {
            clearTimeout(timer);
            expect(executed).assertTrue();
            expect(receivedArg).assertEqual("test");
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch1 error: code =>  message => ${err.message}`);
          }

        }, 150);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
        done();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_0400
     * @tc.name TimerTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest004';
      console.info(`${TAG} test start`);
      try {
        const timer = setTimeout(() => null, 200);
        setTimeout(() => {
          try {
            clearTimeout(timer);

            done();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 250);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_0500
     * @tc.name TimerTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest005';
      console.info(`${TAG} test start`);
      try {
        const timer = setTimeout(() => undefined, 200);
        setTimeout(() => {
          try {
            clearTimeout(timer);

          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch1 error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 250);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_0600
     * @tc.name TimerTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest006';
      console.info(`${TAG} test start`);
      try {
        const timer = setTimeout("", 100);
        let startTime = new Date().getTime();
        setTimeout(() => {
          const elapsed = new Date().getTime() - startTime;
          expect(elapsed > 99).assertTrue();
          clearTimeout(timer);
        }, 150);
      } catch (e) {
        e = e as Error;
        console.error(`${TAG} catch error: code =>  message => ${e.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_0700
     * @tc.name TimerTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest007';
      console.info(`${TAG} test start`);
      try {
        const timer = setTimeout("@#$%^&*()", 100);
        let startTime = new Date().getTime();
        setTimeout(() => {
          const elapsed = new Date().getTime() - startTime;
          expect(elapsed > 99).assertTrue();
          clearTimeout(timer);
        }, 150);
      } catch (e) {
        e = e as Error;
        console.error(`${TAG} catch error: code =>  message => ${e.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_0800
     * @tc.name TimerTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest008';
      console.info(`${TAG} test start`);
      try {
        let executed = false;
        const handler = () => {
          executed = true;
        };
        const timer = setTimeout(handler, 2147483647, null);
        expect(executed).assertFalse();
        setTimeout(() => {
          try {
            clearTimeout(timer);
            expect(executed).assertFalse();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 50);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });
    
    /**
     * @tc.number SUB_Timer_Test_1000
     * @tc.name TimerTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest010';
      console.info(`${TAG} test start`);
      let executed = false;
      const callback = () => {
        executed = true;
      };
      const timer = setTimeout(callback, 100);
      clearTimeout(timer);
      setTimeout(() => {
        try {
          expect(executed).assertFalse();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
      }, 150);
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1100
     * @tc.name TimerTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest011';
      console.info(`${TAG} test start`);
      let executed = false;
      const timer = setTimeout(() => {
        executed = true;
      }, 50);
      setTimeout(() => {
        clearTimeout(timer);
        setTimeout(() => {
          try {
            expect(executed).assertTrue();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 50);
      }, 100);
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1200
     * @tc.name TimerTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest012';
      console.info(`${TAG} test start`);
      let executed = false;
      const timer = setTimeout(() => {
        executed = true;
      }, 50);
      setTimeout(() => {
        clearTimeout(timer);
        try {
          expect(executed).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
      }, 100);
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1300
     * @tc.name TimerTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest013"
      console.info(`${TAG} test start`);
      let validTimerExecuted = false;
      const invalidTimeoutId = 999999;
      const validTimer = setTimeout(() => {
        validTimerExecuted = true;
      }, 100);
      clearTimeout(invalidTimeoutId);
      setTimeout(() => {
        try {
          expect(validTimerExecuted).assertTrue();
          clearTimeout(validTimer);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          clearTimeout(validTimer);
          expect(false).assertFail();
        }
      }, 200);
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1400
     * @tc.name TimerTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest014"
      console.info(`${TAG} test start`);
      try {
        // clearTimeout();
        // clearTimeout(null);
        // clearTimeout(undefined);
        clearTimeout(-1);
        clearTimeout(0);
        // clearTimeout(1.1);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1500
     * @tc.name TimerTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest015"
      console.info(`${TAG} test start`);
      let intervalExecuted = false;
      try {
        const intervalId = setInterval(() => {
          intervalExecuted = true;
        }, 100);
        clearTimeout(intervalId);
        expect(intervalExecuted).assertFalse();
        clearInterval(intervalId);
        expect(intervalExecuted).assertFalse();
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1700
     * @tc.name TimerTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest017";
      console.info(`${TAG} test start`);
      const a: int = 0;
      try {
        const timer = setInterval("delay：-1", 110); // -1 cppcrash
        await Utils.msSleep(100);
        expect(typeof timer).assertEqual(typeof a);
        clearInterval(timer);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1800
     * @tc.name TimerTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest018";
      console.info(`${TAG} test start`);
      try {
        let callCount = 0;
        let argReceived: Function | null = null;
        const handler = (fn: Function) => {
          callCount++;
          argReceived = fn;
        };

        const argFunction = () => {
          return "The parameter function is called";
        };

        const timer = setInterval(handler, 100, argFunction);
        expect(callCount).assertEqual(0);
        setTimeout(() => {
          try {
            clearInterval(timer);
            expect(argReceived !== null).assertTrue();
            expect(typeof argReceived).assertEqual("function");
            const result = (argReceived as () => string)();
            expect(result).assertEqual("The parameter function is called");
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 250);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_1900
     * @tc.name TimerTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest019";
      console.info(`${TAG} test start`);
      try {
        let callCount: boolean = false;
        const handler = () => {
          callCount = true;
        };
        const timer = setInterval(handler, 100);
        while (callCount != true) {
          await Utils.msSleep(100);
        }
        clearInterval(timer);
        expect(callCount).assertTrue();
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_2000
     * @tc.name TimerTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest020";
      console.info(`${TAG} test start`);
      try {
        let callCount: boolean = false;
        const handler: () => null = (() => {
          callCount = true;
          return null;
        }) as () => null;
        const timer = setInterval(handler, 100);
        setTimeout(() => {
          try {
            expect(callCount).assertTrue();
            clearInterval(timer)
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 250);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      await Utils.msSleep(200);
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_2100
     * @tc.name TimerTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest021";
      console.info(`${TAG} test start`);
      try {
        let callCount: boolean = false;
        const handler: () => undefined = (() => {
          callCount = true;
          return undefined;
        }) as () => undefined;
        const timer = setInterval(handler, 100);

        setTimeout(() => {
          try {
            expect(callCount).assertTrue();
            clearInterval(timer);
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 250);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_2200
     * @tc.name TimerTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest022";
      console.info(`${TAG} test start`);
      try {
        const intervalId = setInterval("", 100); // 第二个参数undefined编译报错
        let executionCount = 0;
        const checkInterval = setInterval(() => {
          executionCount++;
        }, 100);
        setTimeout(() => {
          try {
            clearInterval(intervalId);
            clearInterval(checkInterval);
            expect(executionCount > 0).assertTrue();
          } catch (e) {
            e = e as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${e.message}`);
            expect(false).assertFail();
          }
        }, 150);
      } catch (e) {
        e = e as Error;
        console.error(`${TAG} catch error: code1 =>  message => ${e.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_2300
     * @tc.name TimerTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest023";
      console.info(`${TAG} test start`);
      try {
        const intervalId = setInterval("@#$%^&*()", 100);
        let executionCount = 0;

        const checkInterval = setInterval(() => {
          executionCount++;
        }, 100);

        setTimeout(() => {
          try {
            clearInterval(intervalId);
            clearInterval(checkInterval);

            expect(executionCount > 0).assertTrue();
          } catch (e) {
            e = e as Error;
            clearInterval(checkInterval);
            console.error(`${TAG} catch error: code1 =>  message => ${e.message}`);
            expect(false).assertFail();
          }
        }, 150);
      } catch (e) {
        e = e as Error;
        console.error(`${TAG} catch error: code =>  message => ${e.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });



    /**
     * @tc.number SUB_Timer_Test_2600
     * @tc.name TimerTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest026";
      console.info(`${TAG} test start`);
      try {
        const intervalId = setInterval(() => {
        }, 100);
        clearInterval(intervalId);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_2700
     * @tc.name TimerTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest027";
      console.info(`${TAG} test start`);
      let executed = false;
      const callback = () => {
        executed = true;
      };
      try {
        const timer = setInterval(callback, 1000);
        await Utils.msSleep(1000);
        clearInterval(timer);
        expect(executed).assertTrue();
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_2800
     * @tc.name TimerTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest028";
      console.info(`${TAG} test start`);
      let executionCount = 0;
      const timer = setInterval(() => {
        executionCount++;
      }, 20);
      setTimeout(() => {
        const countBeforeClear = executionCount;
        clearInterval(timer);
        setTimeout(() => {
          try {
            expect(executionCount).assertEqual(countBeforeClear);
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 50);
      }, 30);
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_2900
     * @tc.name TimerTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest029";
      console.info(`${TAG} test start`);
      let executionCount = 0;
      try {
        const setupTimer = () => {
          let intervalId: number;
          intervalId = setInterval(() => {
            executionCount++;
            clearInterval(intervalId as int);
          }, 50);

          return intervalId;
        };
        const intervalId = setupTimer();
        setTimeout(() => {
          try {
            clearInterval(intervalId as int);
            expect(executionCount).assertEqual(1);
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 150);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_3000
     * @tc.name TimerTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest030";
      console.info(`${TAG} test start`);
      const intervalPeriod: number = 100;
      const executionTime: number = 100;

      let executionCount: number = 0;
      let lastExecutionEnd: number = 0;
      let isContinuousExecution: boolean = true;

      try {
        const intervalId = setInterval(async () => {
          const start: number = Math.floor(Date.now());
          executionCount++;
          await Utils.msSleep(executionTime.toInt());
          const currentEnd: number = Math.floor(Date.now());
          if (lastExecutionEnd > 0 && (currentEnd - lastExecutionEnd) > intervalPeriod) {
            isContinuousExecution = false;
          }
          lastExecutionEnd = currentEnd;
        }, intervalPeriod.toInt());

        setTimeout(() => {
          try {
            clearInterval(intervalId);
            expect(executionCount > 1).assertTrue();
            expect(isContinuousExecution).assertEqual(false);
            done();
          } catch (e) {
            e = e as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${e.message}`);
            expect(false).assertFail();
          }
        }, 350);
      } catch (e) {
        e = e as Error;
        console.error(`${TAG} catch error: code =>  message => ${e.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });


    /**
     * @tc.number SUB_Timer_Test_3100
     * @tc.name TimerTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest031";
      console.info(`${TAG} test start`);
      try {
        clearInterval();
        clearInterval(-1);
        clearInterval(0);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });
    /**
     * @tc.number SUB_Timer_Test_3200
     * @tc.name TimerTest032
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest032";
      console.info(`${TAG} test start`);
      try {
        const timer = setTimeout(() => {
        }, 100);
        clearInterval(timer);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_3300
     * @tc.name TimerTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest033";
      console.info(`${TAG} test start`);
      let taskCompleted = false;
      try {
        setTimeout(() => {
          await Utils.msSleep(1000);
          taskCompleted = true;
        }, 50);
        setTimeout(() => {
          try {
            expect(taskCompleted).assertTrue();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 1500);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_3500
     * @tc.name TimerTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest035";
      console.info(`${TAG} test start`);
      let TimerTest3500: boolean = false
      try {
        setTimeout(async () => {
          await taskpool.execute(() => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                TimerTest3500 = true;
                resolve(undefined);
              }, 50);
            });
            expect(TimerTest3500).assertTrue();
          });
        }, 100);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_3600
     * @tc.name TimerTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest036";
      console.info(`${TAG} test start`);
      let outerTimerFired = false;
      let innerTimerFired = false;
      const startTime = Date.now();

      try {
        setTimeout(() => {
          outerTimerFired = true;
          const outerElapsed = Date.now() - startTime;
          setTimeout(() => {
            innerTimerFired = true;
            const totalElapsed = Date.now() - startTime;
            try {
              expect(outerTimerFired).assertTrue();
              expect(innerTimerFired).assertTrue();
            } catch (err) {
              err = err as Error;
              console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
              expect(false).assertFail();
            }
          }, 50);
        }, 100);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_3700
     * @tc.name TimerTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest037";
      console.info(`${TAG} test start`);
      try {
        setTimeout(() => {
          (async () => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined);
              }, 100);
            });

            // 嵌套另一个Promise
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined);
              }, 50);
            });
          })();
        }, 150);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_3800
     * @tc.name TimerTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest038";
      console.info(`${TAG} test start`);
      try {
        const timer = setTimeout(() => {
          try {
            throw new Error("Uncaught error in timer");
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(err.message).assertEqual("Uncaught error in timer");
          }
        }, 100);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });


    /**
     * @tc.number SUB_Timer_Test_3900
     * @tc.name TimerTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest039";
      console.info(`${TAG} test start`);
      try {
        let timeoutExecuted = false;
        const timeoutId = setTimeout(() => {
          timeoutExecuted = true;
        }, 100);

        let paramReceived = '';
        setTimeout((name: string) => {
          paramReceived = name;
        }, 150, 'test-param');

        let clearedTimeoutExecuted = false;
        const clearedTimeoutId = setTimeout(() => {
          clearedTimeoutExecuted = true;
        }, 200);
        clearTimeout(clearedTimeoutId);

        let intervalCount = 0;
        let intervalId: number;
        intervalId = setInterval(() => {
          intervalCount++;
          if (intervalCount === 3) {
            clearInterval(intervalId as int);
          }
        }, 50);
        let clearedIntervalExecuted = false;
        const clearedIntervalId = setInterval(() => {
          clearedIntervalExecuted = true;
        }, 100);
        clearInterval(clearedIntervalId);

        let exceptionCaught = false;
        setTimeout(() => {
          try {
            throw new Error('Exception in setTimeout');
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
            exceptionCaught = true;
          }
        }, 300);

        setTimeout(() => {
          try {
            expect(timeoutExecuted).assertTrue();
            expect(paramReceived).assertEqual('test-param');
            expect(clearedTimeoutExecuted).assertFalse();
            expect(intervalCount).assertEqual(3);
            expect(clearedIntervalExecuted).assertFalse();
            expect(exceptionCaught).assertTrue();
            done();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code1 =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        }, 400);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_4000
     * @tc.name TimerTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest040";
      console.info(`${TAG} test start`);
      let resultTimer: string = '';
      try {
        await taskpool.execute((): Promise<string> => {
          return new Promise<string>((resolve) => {
            const timer = setTimeout(() => {
              resolve('timerFired');
            }, 100);
          });
        }).then((value) => {
          resultTimer = value as string;
        })
        expect(resultTimer).assertEqual('timerFired');
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_4100
     * @tc.name TimerTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'TimerTest041';
      console.info(`${TAG} test start`);
      // Define a task with timer that returns a boolean
      const timerTask = (): boolean => {
        let timerExecuted: boolean = false;
        let timeoutId: number | null = null;
        timeoutId = setTimeout(() => {
          timerExecuted = true;
          console.log(`${TAG}: Timer executed in taskpool`);
        }, 1000);

        const startTime: number = Date.now();
        await Utils.msSleep(500);
        if (timeoutId !== null) {
          clearTimeout(timeoutId as int);
          console.log(`${TAG}: Timer cleared in taskpool`);
        }
        return timerExecuted;
      };
      try {
        const task1 = taskpool.execute(timerTask);
        const task2 = taskpool.execute(timerTask);
        const task3 = taskpool.execute(timerTask);

        const result1 = (await task1) as boolean;
        const result2 = (await task2) as boolean;
        const result3 = (await task3) as boolean;
        expect(result1).assertEqual(false);
        expect(result3).assertEqual(false);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_4200
     * @tc.name TimerTest042
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest042";
      console.info(`${TAG} test start`);
      const executionOrder: string[] = [];

      try {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            executionOrder.push('timer1');
            resolve(undefined);
          }, 100);
        })
          .then(() => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                executionOrder.push('timer2');
                resolve(undefined);
              }, 50);
            });
          })
          .then(() => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                executionOrder.push('timer3');
                resolve(undefined);
              }, 80);
            });
          });
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(['timer1', 'timer2', 'timer3']));
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_4300
     * @tc.name TimerTest043
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest043";
      console.info(`${TAG} test start`);
      const executionOrder: string[] = [];

      try {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            executionOrder.push('timer1');
            console.info(TAG, 'timer1 fired');
            setTimeout(() => {
              executionOrder.push('timer2');
              console.info(TAG, 'timer2 fired');
              resolve(undefined);
            }, 50);
          }, 100);
        })
          .then(() => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                executionOrder.push('timer3');
                console.info(TAG, 'timer3 fired');
                setTimeout(() => {
                  executionOrder.push('timer4');
                  console.info(TAG, 'timer4 fired');
                  resolve(undefined);
                }, 30);
              }, 80);
            });
          })
          .then(() => {
            setTimeout(() => {
              executionOrder.push('timer5');
              console.info(TAG, 'timer5 fired');
            }, 60);

            return new Promise<void>(resolve => resolve(undefined));
          });

        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined);
          }, 300);
        });
        console.info(TAG, `Execution order: ${executionOrder}`);
        expect(JSON.stringify(executionOrder)).assertEqual
        (JSON.stringify(['timer1', 'timer2', 'timer3', 'timer4', 'timer5']));
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });



    /**
     * @tc.number SUB_Timer_Test_4600
     * @tc.name TimerTest046
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest046";
      console.info(`${TAG} test start`);
      const DELAY_RANGE = 10;
      const executionOrder: number[] = [];
      let completedCount = 0;
      try {
        for (let delay = 0; delay <= DELAY_RANGE; delay++) {
          setTimeout(() => {
            executionOrder.push(delay);
            if (++completedCount === DELAY_RANGE + 1) {
              for (let i = 1; i < executionOrder.length; i++) {
                expect(executionOrder[i] >= executionOrder[i-1]).assertTrue();
              }
            }
          }, delay);
        }
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    });

    /**
     * @tc.number SUB_Timer_Test_4700
     * @tc.name TimerTest047
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest047";
      console.info(`${TAG} test start`);
      const executionSequence: string[] = [];
      let intervalCounter = 0;
      let intervalId: number = 0;
      try {
        setTimeout(() => {
          executionSequence.push('Timeout-100ms');
          intervalId = setInterval(() => {
            executionSequence.push(`Interval-50ms-${++intervalCounter}`);
            setTimeout(() => {
              executionSequence.push('Timeout-20ms');
              if (intervalCounter >= 3) {
                clearInterval(intervalId as int);
                expect(executionSequence).assertDeepEquals([
                  'Timeout-100ms',
                  'Interval-50ms-1',
                  'Timeout-20ms',
                  'Interval-50ms-2',
                  'Timeout-20ms',
                  'Interval-50ms-3',
                  'Timeout-20ms'
                ]);
                done();
              }
            }, 20);
          }, 50);
        }, 100);

        setTimeout(() => {
          if (intervalId !== 0) {
            clearInterval(intervalId as int);
          }
        }, 500);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        if (intervalId !== 0) {
          clearInterval(intervalId as int);
        }
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    })

    /**
     * @tc.number SUB_Timer_Test_4800
     * @tc.name TimerTest048
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TimerTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "TimerTest048";
      console.info(`${TAG} test start`);
      const clearSequence: string[] = [];
      let outerTimerId: number = 0;
      let innerIntervalId: number = 0;

      try {
        outerTimerId = setTimeout(() => {
          clearSequence.push('OuterTimeout-200ms');
          innerIntervalId = setInterval(() => {
            clearSequence.push(`InnerInterval-100ms-${clearSequence.filter(x => x.includes('InnerInterval')).length +
              1}`);
            setTimeout(() => {
              clearSequence.push('InnerTimeout-50ms');
              if (clearSequence.filter(x => x.includes('InnerInterval')).length >= 3) {
                clearInterval(innerIntervalId as int);
                clearSequence.push('ClearedInnerInterval');

                setTimeout(() => {
                  clearTimeout(outerTimerId as int);
                  clearSequence.push('ClearedOuterTimer');

                  expect(clearSequence).assertDeepEquals([
                    'OuterTimeout-200ms',
                    'InnerInterval-100ms-1',
                    'InnerTimeout-50ms',
                    'InnerInterval-100ms-2',
                    'InnerTimeout-50ms',
                    'InnerInterval-100ms-3',
                    'InnerTimeout-50ms',
                    'ClearedInnerInterval',
                    'ClearedOuterTimer'
                  ]);
                  done();
                }, 30);
              }
            }, 50);
          }, 100);
        }, 200);
        setTimeout(() => {
          if (outerTimerId !== 0) {
            clearTimeout(outerTimerId as int);
          }
          if (innerIntervalId !== 0) {
            clearInterval(innerIntervalId as int);
          }
        }, 1000);
      } catch (err) {
        err = err as Error;
        if (outerTimerId !== 0) {
          clearTimeout(outerTimerId as int);
        }
        if (innerIntervalId !== 0) {
          clearInterval(innerIntervalId as int);
        }
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      }
      console.info(`${TAG} test end`);
      done();
    })

  })
}