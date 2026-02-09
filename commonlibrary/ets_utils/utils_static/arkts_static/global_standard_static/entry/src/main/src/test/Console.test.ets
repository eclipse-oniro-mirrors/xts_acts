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
import { describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import { ArrayList, buffer } from '@kit.ArkTS';

class bar {
  a: number = 1;
  TestLog: number = 1;
}

interface A{
  a: Array<int>,
  b: int,
  c: B
}

interface B{
  e: int
}

interface C{
  age: Array<int>,
  name: Array<int>
}

interface D{
  age: Array<int>,
  name: int
}


function init(size: number): string {
  let ans = '[';
  while (ans.length < size) {
    ans += '{"a":1},';
  }
  ans += '{"a":1}]';
  return ans
}

export default function ConsoleTest() {
  describe('ConsoleTest', () => {

    /**
     * @tc.name   testConsole038
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_3800
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.debug('count: %d', number1);
        console.debug('count: %d');
        console.debug(number1.toString());
        console.debug('count: %d', str);
        console.debug('count: %d');
        console.debug(str);
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole039
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_3900
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.log('count: %d', number1);
        console.log('count: %d');
        console.log(number1.toString());
        console.log('count: %d', str);
        console.log('count: %d');
        console.log(str);
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole040
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4000
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.info('count: %d', number1);
        console.info('count: %d');
        console.info(number1.toString());
        console.info('count: %d', str);
        console.info('count: %d');
        console.info(str);
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole041
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4100
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.warn('count: %d', number1);
        console.warn('count: %d');
        console.warn(number1.toString());
        console.warn('count: %d', str);
        console.warn('count: %d');
        console.warn(str);
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole042
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4200
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.error('count: %d', number1);
        console.error('count: %d');
        console.error(number1.toString());
        console.error('count: %d', str);
        console.error('count: %d');
        console.error(str);
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole043
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4300
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.assert('count: %d', number1);
        console.assert('count: %d');
        console.assert(number1.toString());
        console.assert('count: %d', str);
        console.assert('count: %d');
        console.assert(str);
        console.assert();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole044
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4400
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.count(number1.toString());
        console.count(str);
        console.count('count: %d');
        console.count();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole045
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4500
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.countReset(number1.toString());
        console.countReset(str);
        console.countReset('count: %d');
        console.countReset();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole046
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4600
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.dir(number1.toString());
        console.dir(str);
        console.dir('count: %d');
        console.dir();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole047
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4700
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.dir(number1.toString());
        console.dir(str);
        console.dir('count: %d');
        console.dir();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole048
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4800
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.group(number1);
        console.group(str);
        console.group('count: %d');
        console.group();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole049
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_4900
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.groupCollapsed(number1, str);
        console.groupCollapsed(str);
        console.groupCollapsed('count: %d');
        console.groupCollapsed();
        console.groupCollapsed(number1, str, "sdsf");
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole050
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5000
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        console.groupEnd();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole051
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5100
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.table(number1);
        console.table(str);
        console.table('count: %d');
        console.table();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole052
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5200
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.time(number1.toString());
        console.time(str);
        console.time('count: %d');
        console.time();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole053
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5300
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.dirxml(number1.toString());
        console.dirxml(str);
        console.dirxml('count: %d');
        //console.dirxml();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole054
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5400
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.timeEnd(number1.toString());
        console.timeEnd(str);
        console.timeEnd('count: %d');
        console.timeEnd();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole055
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5500
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.timeLog(number1.toString());
        console.timeLog(str);
        console.timeLog('count: %d');
        console.timeLog();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testConsole056
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5600
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let number1: number = 1;
        let str = "str";
        console.trace(number1.toString());
        console.trace(str);
        console.trace('count: %d');
        console.trace();
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });

    // /**
    //  * @tc.name   testConsole057
    //  * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5700
    //  * @tc.desc   Test Console.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL1
    //  */
    // it('testConsole057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //    try {
    //      console.traceHybridStack();
    // } catch (e) {
    //     if (e instanceof BusinessError) {
    //       expect().assertFail();
    //     }
    //    }
    //  });

    /**
     * @tc.name   testConsole058
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSOLE_5800
     * @tc.desc   Test Console.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConsole058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        console.log(Math.log2(7) + "NaN", "DDGFWDJDGDKDHDJ");
        console.log(Number.isNaN(Math.log2(10)) + "NaN", "dasffheggjh")
      } catch (e) {
        if (e instanceof BusinessError) {
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testAssert0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0100
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0001';
      try {
        console.assert();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testAssert0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0200
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0002';
      try {
        console.assert(true, 'does nothing');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testAssert0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0300
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0003';
      try {
        console.assert(2 % 1 == 0, 'does nothing');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testAssert0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0400
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0004';
      try {
        console.assert(false, 'console %s work', 'didn\'t');
        expect(false).assertFalse();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertTrue();
        }
      }
    });
    /**
     * @tc.name   testAssert0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0500
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0005';
      try {
        console.assert(2 % 3 == 0, 'console %s work', 'didn\'t');
        expect(false).assertFalse();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
        }
      }
    });
    /**
     * @tc.name   testAssert0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0600
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0006';
      try {
        console.assert(2 % 3 == 0, 'console %s work', 'didn\'t');
        expect(false).assertFalse();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
        }
      }
    });
    /**
     * @tc.name   testAssert0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0700
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0007';
      try {
        console.assert([2 % 3 == 0, 2 % 3 == 1, 2 + 2 == 3, 3 + 3 == 6],
          'console %s work', 'didn\'t');
        expect(false).assertFalse();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
        }
      }
    });
    /**
     * @tc.name   testAssert0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0800
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0008';
      try {
        console.assert(2 * 2 == 4, 3 + 3 == 6, 'console %s work', 'didn\'t');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFalse();
        }
      }
    });
    /**
     * @tc.name   testAssert0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_0900
     * @tc.desc   Test the function of the interface Assert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAssert0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAssert0009'
      try {
        console.assert(false, 'a', 'b', 'c', 'd');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error:${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testCount0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1000
     * @tc.desc   Test the function of the interface Count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCount0001';
      try {
        console.count();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   testCount0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1100
     * @tc.desc   Test the function of the interface Count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCount0002';
      try {
        console.count('abc');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   testCount0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1200
     * @tc.desc   Test the function of the interface Count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCount0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCount0003';
      try {
        console.count('abc');
        console.count('default');
        console.count('abc');
        console.count('abc');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testCount0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1300
     * @tc.desc   Test the function of the interface Count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCount0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCount0004';
      try {
        console.count();
        console.count('default')
        console.count('abc');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   testCountReset0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1400
     * @tc.desc   Test the function of the interface CountReset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCountReset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCountReset0001';
      try {
        console.count();
        console.countReset();
        console.count();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   testCountReset0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1500
     * @tc.desc   Test the function of the interface CountReset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCountReset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCountReset0002';
      try {
        console.count('abc');
        console.countReset('abc');
        console.count('abc');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   testCountReset0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1600
     * @tc.desc   Test the function of the interface CountReset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCountReset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testCountReset0003';
      try {
        console.count('abc');
        console.count('abc');
        console.count('default')
        console.countReset('default')
        console.count('default')
        console.countReset('abc');
        console.countReset('abc');
        console.countReset('abc');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   testDir0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1700
     * @tc.desc   Test the function of the interface Dir.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDir0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDir0001';
      try {
        let a: bar = new bar();
        console.dir(a);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   testDir0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1800
     * @tc.desc   Test the function of the interface Dir.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDir0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDir0002';
      try {
        const Buffer = buffer.from('Hello World')
        console.dir(Buffer);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testDir0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1900
     * @tc.desc   Test the function of the interface Dir.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDir0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDir0003';
      try {
        let arrayList: Array<number> = [1, 2, 3];
        console.dir(arrayList);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testDir0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2000
     * @tc.desc   Test the function of the interface Dir.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDir0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDir0004';
      try {
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        console.dir(list);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testDir0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2100
     * @tc.desc   Test the function of the interface Dir.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDir0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDir0005';
      try {
        const nun = new Number(1);
        console.dir(nun);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testDir0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2200
     * @tc.desc   Test the function of the interface Dir.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDir0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDir0006';
      try {
        const str = new String('Hello World');
        console.dir(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTable0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2300
     * @tc.desc   Test the function of the interface Table.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTable0001';
      try {
        console.table([1, 2, 3]);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTable0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2400
     * @tc.desc   Test the function of the interface Table.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTable0002';
      try {
        let a :A ={
          a: [1, 2, 3, 4, 5], b: 5, c: {
            e: 5
          }
        }
        console.table(a);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTable0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2500
     * @tc.desc   Test the function of the interface Table.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTable0003';
      try {
        let a :C = {
          age: [1, 2, 3, 4, 5],
          name: [5]
        }
        console.table(a);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTable0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2600
     * @tc.desc   Test the function of the interface Table.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTable0004';
      try {
        let a :D ={
          age: [1, 2, 3, 4, 5],
          name: 5,
        }
        console.table();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error:${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2700
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0001';
      try {
        console.time('testTime0001');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2800
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0002';
      try {
        console.time();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_2900
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0003';
      try {
        console.time('default');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3000
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0004';
      try {
        console.time('abc');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3100
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0005';
      try {
        console.time('NaN');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testTime0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3300
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0007';
      try {
        console.time(undefined);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3400
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0008';
      try {
        const str = '!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~';
        console.time(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3500
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0008';
      try {
        const str = '!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~';
        console.time(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3600
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0010';
      try {
        const str = '\a';
        console.time('\a');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3700
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0011';
      try {
        const str = '\b';
        console.time(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3800
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0012';
      try {
        const str = '\f';
        console.time(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_3900
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0013';
      try {
        const str = '\n';
        console.time(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4000
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0014';
      try {
        const str = '\t';
        console.time(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4100
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0015';
      try {
        const str = '\r';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4200
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0016';
      try {
        const str = '\t';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4300
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0017';
      try {
        const str = '\v';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4400
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0018';
      try {
        const str = '\\';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4500
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0019';
      try {
        const str = '\'';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4600
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0020';
      try {
        const str = '\"';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4700
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0021';
      try {
        const str = '\?';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4800
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0022';
      try {
        const str = '\0';
        console.time(str);
        expect().assertFail();
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The input parameters are invalid, Timer or Counter name must be not null.');
      }
    });
    /**
     * @tc.name   testTime0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_4900
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0023';
      try {
        const str = '\d72';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5000
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0024';
      try {
        const str = '\x85';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTime0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5100
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTime0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTime0025';
      try {
        const str = '\ud83d';
        console.time(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5200
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0001';
      try {
        console.time('testTimeEnd0001');
        console.timeEnd('testTimeEnd0001');

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTTimeEnd0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5300
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTTimeEnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0002';
      try {
        console.time();
        console.timeEnd();

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5400
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0003';
      try {
        console.time('default');
        console.timeEnd('default');

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5500
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0004';
      try {
        console.time('abc');
        console.timeEnd('abc');

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5600
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0005';
      try {
        console.time('NaN');
        console.timeEnd('NaN');

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testTimeEnd0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5800
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0007';
      try {
        console.time(undefined);
        console.timeEnd(undefined);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_5900
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0008';
      try {
        const str = '!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6000
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0008';
      try {
        const str = '!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6100
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0010';
      try {
        console.time('\a');
        console.timeEnd('\a');

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6200
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0011';
      try {
        const str = '\b';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6300
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0012';
      try {
        const str = '\f';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6400
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0013';
      try {
        const str = '\n';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6500
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0014';
      try {
        const str = '\t';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6600
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0015';
      try {
        const str = '\r';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6700
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0016';
      try {
        const str = '\t';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6800
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0017';
      try {
        const str = '\v';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_6900
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0018';
      try {
        const str = '\\';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7000
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0019';
      try {
        const str = '\'';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0020
     * @tc.number SUB_COMMONLIBRARY_CONSOLE_6900
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0020';
      try {
        const str = '\"';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0021
     * @tc.number SUB_COMMONLIBRARY_CONSOLE_7000
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0021';
      try {
        const str = '\?';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7100
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0022';
      try {
        const str = '\0';
        console.time(str);
        console.timeEnd(str);
        expect().assertFail();
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The input parameters are invalid, Timer or Counter name must be not null.');
      }
    });
    /**
     * @tc.name   testTimeEnd0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7200
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0023';
      try {
        const str = '\d72';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7300
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0024';
      try {
        const str = '\x85';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeEnd0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7400
     * @tc.desc   Test the function of the interface TimeEnd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeEnd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeEnd0025';
      try {
        const str = '\ud83d';
        console.time(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7500
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0001';
      try {
        const str = 'testTimeLog0001';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7600
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0002';
      try {
        console.time();
        console.timeLog();
        console.timeEnd();

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7700
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0003';
      try {
        const str = 'default';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7800
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0004';
      try {
        const str = 'abc';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_7900
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0005';
      try {
        const str = 'NaN';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testTimeLog0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8100
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0007';
      try {
        const str = undefined;
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8200
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0008';
      try {
        const str = '!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8300
     * @tc.desc   Test the function of the interface Time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0008';
      try {
        const str = '!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8400
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0010';
      try {
        const str = '\a';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8500
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0011';
      try {
        const str = '\b';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8600
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0012';
      try {
        const str = '\f';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8700
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0013';
      try {
        const str = '\n';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8800
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0014';
      try {
        const str = '\t';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_8900
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0015';
      try {
        const str = '\r';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9000
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0016';
      try {
        const str = '\t';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9100
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0017';
      try {
        const str = '\v';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9200
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0018';
      try {
        const str = '\\';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9300
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0019';
      try {
        const str = '\'';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9500
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0020';
      try {
        const str = '\"';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9600
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0021';
      try {
        const str = '\?';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9700
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0022';
      try {
        const str = '\0';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);
      } catch (err) {
        err = err as Error;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message)
          .assertEqual('Parameter error. The input parameters are invalid, Timer or Counter name must be not null.');
      }
    });
    /**
     * @tc.name   testTimeLog0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9800
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0023';
      try {
        const str = '\d72';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_9900
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0024';
      try {
        const str = '\x85';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_10000
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0025';
      try {
        const str = '\ud83d';
        console.time(str);
        console.timeLog(str);
        console.timeEnd(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1010
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0026';
      try {
        let TestLog: bar = new bar();
        const str = '太好了';
        console.time(str);
         console.timeLog(str, TestLog);
        console.timeEnd(str);

      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1020
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0027';
      try {
        let TestLog: ArrayBuffer = new ArrayBuffer(10);
        const str = '太好了';
        console.time(str);
         console.timeLog(str, TestLog);
        console.timeEnd(str);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1030
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0028';
      try {
        let TestLog: ArrayList<string> = new ArrayList<string>();
        const str = '太好了';
        console.time(str);
        console.timeLog(str, TestLog);
        console.timeEnd(str);
      } catch (err) {
        if (err instanceof BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1040
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0029';
      try {
        let TestLog: number = 1;
        const str = '太好了';
        console.time(str);
        console.timeLog(str, TestLog);
        console.timeEnd(str);
      } catch (err) {
        if (err instanceof BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testTimeLog0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONSOLE_1050
     * @tc.desc   Test the function of the interface TimeLog.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTimeLog0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTimeLog0030';
      try {
        let TestLog: string = '陈隆庭！';
        const str = '加油';
        console.time(str);
        console.timeLog(str, TestLog);
        console.timeEnd(str);
      } catch (err) {
        if (err instanceof BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        }
      }
    });
  })
}