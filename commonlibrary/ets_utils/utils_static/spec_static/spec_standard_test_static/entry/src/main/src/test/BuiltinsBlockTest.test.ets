/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "../../../hypium/index";

export default function builtinsBlockTest() {
  describe('BuiltinsStatementBlockTest', (): void => {
    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll((): void => {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach(async () : Promise<void> => {
    //   await Utils.msSleep(100);
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    // afterEach((): void => {
    //   // Presets a clear action, which is performed after each unit test case ends.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: clear action function.
    // })
    // afterAll((): void => {
    //   // Presets a clear action, which is performed after all test cases of the test suite end.
    //   // This API supports only one parameter: clear action function.
    // })

    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0100
     * @tc.name builtinsStatementBlockTest1001
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1);
        }
        orderList.push(2);
      }
      expect(orderList[0]).assertEqual(0);
      expect(orderList[1]).assertEqual(1);
      expect(orderList[2]).assertEqual(2);
      done();
    })

    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0200
     * @tc.name builtinsStatementBlockTest1002
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1)
        }
        orderList.push(2);
        {
          orderList.push(3)
        }
        orderList.push(4)
      }
      expect(orderList[0]).assertEqual(0)
      expect(orderList[1]).assertEqual(1)
      expect(orderList[2]).assertEqual(2)
      expect(orderList[3]).assertEqual(3)
      expect(orderList[4]).assertEqual(4)
      done();
    })

    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0300
     * @tc.name builtinsStatementBlockTest1003
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1)
        }
        orderList.push(2);
        {
          orderList.push(3)
        }
        orderList.push(4);
        {
          orderList.push(5)
        }
        orderList.push(6)
      }
      expect(orderList[0]).assertEqual(0)
      expect(orderList[1]).assertEqual(1)
      expect(orderList[2]).assertEqual(2)
      expect(orderList[3]).assertEqual(3)
      expect(orderList[4]).assertEqual(4)
      expect(orderList[5]).assertEqual(5)
      expect(orderList[6]).assertEqual(6)
      done();
    })

    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0400
     * @tc.name builtinsStatementBlockTest1004
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1)
        }
        orderList.push(2);
        {
          orderList.push(3)
        }
        orderList.push(4);
        {
          orderList.push(5)
        }
        orderList.push(6);
        {
          orderList.push(7)
        }
        orderList.push(8);
        {
          orderList.push(9);
        }
        orderList.push(10);
      }
      expect(orderList[0]).assertEqual(0)
      expect(orderList[1]).assertEqual(1)
      expect(orderList[2]).assertEqual(2)
      expect(orderList[3]).assertEqual(3)
      expect(orderList[4]).assertEqual(4)
      expect(orderList[5]).assertEqual(5)
      expect(orderList[6]).assertEqual(6)
      expect(orderList[7]).assertEqual(7)
      expect(orderList[8]).assertEqual(8)
      expect(orderList[9]).assertEqual(9)
      expect(orderList[10]).assertEqual(10)
      done();
    })

    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0500
     * @tc.name builtinsStatementBlockTest1005
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1)
        }
        orderList.push(2);
        {
          orderList.push(3)
        }
        orderList.push(4);
        {
          orderList.push(5)
        }
        orderList.push(6);
        {
          orderList.push(7)
        }
        orderList.push(8);
        {
          orderList.push(9);
        }
        orderList.push(10);
        {
          orderList.push(11);
        }
        orderList.push(12);
        {
          orderList.push(13);
        }
        orderList.push(14);
        {
          orderList.push(15);
        }
        orderList.push(16);
        {
          orderList.push(17);
        }
        orderList.push(18);
        {
          orderList.push(19);
        }
        orderList.push(20);
      }
      expect(orderList[0]).assertEqual(0)
      expect(orderList[1]).assertEqual(1)
      expect(orderList[2]).assertEqual(2)
      expect(orderList[3]).assertEqual(3)
      expect(orderList[4]).assertEqual(4)
      expect(orderList[5]).assertEqual(5)
      expect(orderList[6]).assertEqual(6)
      expect(orderList[7]).assertEqual(7)
      expect(orderList[8]).assertEqual(8)
      expect(orderList[9]).assertEqual(9)
      expect(orderList[10]).assertEqual(10)
      expect(orderList[11]).assertEqual(11);
      expect(orderList[12]).assertEqual(12);
      expect(orderList[13]).assertEqual(13);
      expect(orderList[14]).assertEqual(14);
      expect(orderList[15]).assertEqual(15);
      expect(orderList[16]).assertEqual(16);
      expect(orderList[17]).assertEqual(17);
      expect(orderList[18]).assertEqual(18);
      expect(orderList[19]).assertEqual(19);
      expect(orderList[20]).assertEqual(20);
      done();
    })

    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0700
     * @tc.name builtinsStatementBlockTest1007
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1);
          {
            orderList.push(2);
            {
              orderList.push(3)
            }
            orderList.push(4)
          }
          orderList.push(5)
        }
        orderList.push(6)
      }
      expect(orderList[0]).assertEqual(0)
      expect(orderList[1]).assertEqual(1)
      expect(orderList[2]).assertEqual(2)
      expect(orderList[3]).assertEqual(3)
      expect(orderList[4]).assertEqual(4)
      expect(orderList[5]).assertEqual(5)
      expect(orderList[6]).assertEqual(6)
      done();
    })


    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0800
     * @tc.name builtinsStatementBlockTest1008
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1);
          {
            orderList.push(2);
            {
              orderList.push(3);
              {
                orderList.push(4);
                {
                  orderList.push(5);
                  {
                    orderList.push(6);
                    {
                      orderList.push(7);
                      {
                        orderList.push(8);
                        {
                          orderList.push(9);
                          {
                            orderList.push(10);
                          }
                          orderList.push(11);
                        }
                        orderList.push(12);
                      }
                      orderList.push(13);
                    }
                    orderList.push(14);
                  }
                  orderList.push(15);
                }
                orderList.push(16);
              }
              orderList.push(17);
            }
            orderList.push(18);
          }
          orderList.push(19);
        }
        orderList.push(20);
      }
      expect(orderList[0]).assertEqual(0);
      expect(orderList[1]).assertEqual(1);
      expect(orderList[2]).assertEqual(2);
      expect(orderList[3]).assertEqual(3);
      expect(orderList[4]).assertEqual(4);
      expect(orderList[5]).assertEqual(5);
      expect(orderList[6]).assertEqual(6);
      expect(orderList[7]).assertEqual(7);
      expect(orderList[8]).assertEqual(8);
      expect(orderList[9]).assertEqual(9);
      expect(orderList[10]).assertEqual(10);
      expect(orderList[11]).assertEqual(11);
      expect(orderList[12]).assertEqual(12);
      expect(orderList[13]).assertEqual(13);
      expect(orderList[14]).assertEqual(14);
      expect(orderList[15]).assertEqual(15);
      expect(orderList[16]).assertEqual(16);
      expect(orderList[17]).assertEqual(17);
      expect(orderList[18]).assertEqual(18);
      expect(orderList[19]).assertEqual(19);
      expect(orderList[20]).assertEqual(20);
      done();
    })

    /**
     * @tc.number SUB_BUILDINS_STATEMENT_BLOCK_TEST_0900
     * @tc.name builtinsStatementBlockTest1009
     * @tc.desc test Statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementBlockTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');
      let orderList = new Array<number>();
      {
        orderList.push(0);
        {
          orderList.push(1);
          {
            orderList.push(2);
          }
          orderList.push(3);
          {
            orderList.push(4);
            {
              orderList.push(5);
              {
                orderList.push(6);
              }
              orderList.push(7);
            }
            orderList.push(8);
          }
          orderList.push(9);
        }
        orderList.push(10);
        {
          orderList.push(11);
        }
        orderList.push(12);
      }
      expect(orderList[0]).assertEqual(0);
      expect(orderList[1]).assertEqual(1);
      expect(orderList[2]).assertEqual(2);
      expect(orderList[3]).assertEqual(3);
      expect(orderList[4]).assertEqual(4);
      expect(orderList[5]).assertEqual(5);
      expect(orderList[6]).assertEqual(6);
      expect(orderList[7]).assertEqual(7);
      expect(orderList[8]).assertEqual(8);
      expect(orderList[9]).assertEqual(9);
      expect(orderList[10]).assertEqual(10);
      expect(orderList[11]).assertEqual(11);
      expect(orderList[12]).assertEqual(12);
      done();
    })
  })
}