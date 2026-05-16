'use static'

/*
* Copyright (C) 2026 HiHope Open Source Organization.
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


export function builtinsStatementBlockTest1001() {
  const TAG = 'builtinsStatementBlockTest1001';
  console.info('testTag', '%{public}s', 'it begin');
  let orderList = new Array<number>();
  {
    orderList.push(0);
    {
      orderList.push(1);
    }
    orderList.push(2);
  }
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }
}

export function builtinsStatementBlockTest1002() {
  const TAG = 'builtinsStatementBlockTest1002';
  console.info('testTag', '%{public}s', 'it begin');
  let orderList = new Array<number>();
  {
    orderList.push(0);
    {
      orderList.push(1);
    }
    orderList.push(2);
    {
      orderList.push(3);
    }
    orderList.push(4);
  }
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }

  if (orderList[3] !== 3) {
    console.info(`${TAG} Task execution failed: orderList[3]: ${orderList[3]}`);
    throw new Error('orderList[3] check failed, expected 3');
  }

  if (orderList[4] !== 4) {
    console.info(`${TAG} Task execution failed: orderList[4]: ${orderList[4]}`);
    throw new Error('orderList[4] check failed, expected 4');
  }
}

export function builtinsStatementBlockTest1003() {
  const TAG = 'builtinsStatementBlockTest1003';
  console.info('testTag', '%{public}s', 'it begin');
  let orderList = new Array<number>();
  {
    orderList.push(0);
    {
      orderList.push(1);
    }
    orderList.push(2);
    {
      orderList.push(3);
    }
    orderList.push(4);
    {
      orderList.push(5);
    }
    orderList.push(6);
  }
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }

  if (orderList[3] !== 3) {
    console.info(`${TAG} Task execution failed: orderList[3]: ${orderList[3]}`);
    throw new Error('orderList[3] check failed, expected 3');
  }

  if (orderList[4] !== 4) {
    console.info(`${TAG} Task execution failed: orderList[4]: ${orderList[4]}`);
    throw new Error('orderList[4] check failed, expected 4');
  }

  if (orderList[5] !== 5) {
    console.info(`${TAG} Task execution failed: orderList[5]: ${orderList[5]}`);
    throw new Error('orderList[5] check failed, expected 5');
  }

  if (orderList[6] !== 6) {
    console.info(`${TAG} Task execution failed: orderList[6]: ${orderList[6]}`);
    throw new Error('orderList[6] check failed, expected 6');
  }
}

export function builtinsStatementBlockTest1004() {
  const TAG = 'builtinsStatementBlockTest1004';
  console.info('testTag', '%{public}s', 'it begin');
  let orderList = new Array<number>();
  {
    orderList.push(0);
    {
      orderList.push(1);
    }
    orderList.push(2);
    {
      orderList.push(3);
    }
    orderList.push(4);
    {
      orderList.push(5);
    }
    orderList.push(6);
    {
      orderList.push(7);
    }
    orderList.push(8);
    {
      orderList.push(9);
    }
    orderList.push(10);
  }
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }

  if (orderList[3] !== 3) {
    console.info(`${TAG} Task execution failed: orderList[3]: ${orderList[3]}`);
    throw new Error('orderList[3] check failed, expected 3');
  }

  if (orderList[4] !== 4) {
    console.info(`${TAG} Task execution failed: orderList[4]: ${orderList[4]}`);
    throw new Error('orderList[4] check failed, expected 4');
  }

  if (orderList[5] !== 5) {
    console.info(`${TAG} Task execution failed: orderList[5]: ${orderList[5]}`);
    throw new Error('orderList[5] check failed, expected 5');
  }

  if (orderList[6] !== 6) {
    console.info(`${TAG} Task execution failed: orderList[6]: ${orderList[6]}`);
    throw new Error('orderList[6] check failed, expected 6');
  }

  if (orderList[7] !== 7) {
    console.info(`${TAG} Task execution failed: orderList[7]: ${orderList[7]}`);
    throw new Error('orderList[7] check failed, expected 7');
  }

  if (orderList[8] !== 8) {
    console.info(`${TAG} Task execution failed: orderList[8]: ${orderList[8]}`);
    throw new Error('orderList[8] check failed, expected 8');
  }

  if (orderList[9] !== 9) {
    console.info(`${TAG} Task execution failed: orderList[9]: ${orderList[9]}`);
    throw new Error('orderList[9] check failed, expected 9');
  }

  if (orderList[10] !== 10) {
    console.info(`${TAG} Task execution failed: orderList[10]: ${orderList[10]}`);
    throw new Error('orderList[10] check failed, expected 10');
  }
}

export function builtinsStatementBlockTest1005() {
  const TAG = 'builtinsStatementBlockTest1005';
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
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }

  if (orderList[3] !== 3) {
    console.info(`${TAG} Task execution failed: orderList[3]: ${orderList[3]}`);
    throw new Error('orderList[3] check failed, expected 3');
  }

  if (orderList[4] !== 4) {
    console.info(`${TAG} Task execution failed: orderList[4]: ${orderList[4]}`);
    throw new Error('orderList[4] check failed, expected 4');
  }

  if (orderList[5] !== 5) {
    console.info(`${TAG} Task execution failed: orderList[5]: ${orderList[5]}`);
    throw new Error('orderList[5] check failed, expected 5');
  }

  if (orderList[6] !== 6) {
    console.info(`${TAG} Task execution failed: orderList[6]: ${orderList[6]}`);
    throw new Error('orderList[6] check failed, expected 6');
  }

  if (orderList[7] !== 7) {
    console.info(`${TAG} Task execution failed: orderList[7]: ${orderList[7]}`);
    throw new Error('orderList[7] check failed, expected 7');
  }

  if (orderList[8] !== 8) {
    console.info(`${TAG} Task execution failed: orderList[8]: ${orderList[8]}`);
    throw new Error('orderList[8] check failed, expected 8');
  }

  if (orderList[9] !== 9) {
    console.info(`${TAG} Task execution failed: orderList[9]: ${orderList[9]}`);
    throw new Error('orderList[9] check failed, expected 9');
  }

  if (orderList[10] !== 10) {
    console.info(`${TAG} Task execution failed: orderList[10]: ${orderList[10]}`);
    throw new Error('orderList[10] check failed, expected 10');
  }

  if (orderList[11] !== 11) {
    console.info(`${TAG} Task execution failed: orderList[11]: ${orderList[11]}`);
    throw new Error('orderList[11] check failed, expected 11');
  }

  if (orderList[12] !== 12) {
    console.info(`${TAG} Task execution failed: orderList[12]: ${orderList[12]}`);
    throw new Error('orderList[12] check failed, expected 12');
  }

  if (orderList[13] !== 13) {
    console.info(`${TAG} Task execution failed: orderList[13]: ${orderList[13]}`);
    throw new Error('orderList[13] check failed, expected 13');
  }

  if (orderList[14] !== 14) {
    console.info(`${TAG} Task execution failed: orderList[14]: ${orderList[14]}`);
    throw new Error('orderList[14] check failed, expected 14');
  }

  if (orderList[15] !== 15) {
    console.info(`${TAG} Task execution failed: orderList[15]: ${orderList[15]}`);
    throw new Error('orderList[15] check failed, expected 15');
  }

  if (orderList[16] !== 16) {
    console.info(`${TAG} Task execution failed: orderList[16]: ${orderList[16]}`);
    throw new Error('orderList[16] check failed, expected 16');
  }

  if (orderList[17] !== 17) {
    console.info(`${TAG} Task execution failed: orderList[17]: ${orderList[17]}`);
    throw new Error('orderList[17] check failed, expected 17');
  }

  if (orderList[18] !== 18) {
    console.info(`${TAG} Task execution failed: orderList[18]: ${orderList[18]}`);
    throw new Error('orderList[18] check failed, expected 18');
  }

  if (orderList[19] !== 19) {
    console.info(`${TAG} Task execution failed: orderList[19]: ${orderList[19]}`);
    throw new Error('orderList[19] check failed, expected 19');
  }

  if (orderList[20] !== 20) {
    console.info(`${TAG} Task execution failed: orderList[20]: ${orderList[20]}`);
    throw new Error('orderList[20] check failed, expected 20');
  }
}

export function builtinsStatementBlockTest1007() {
  const TAG = 'builtinsStatementBlockTest1007';
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
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }

  if (orderList[3] !== 3) {
    console.info(`${TAG} Task execution failed: orderList[3]: ${orderList[3]}`);
    throw new Error('orderList[3] check failed, expected 3');
  }

  if (orderList[4] !== 4) {
    console.info(`${TAG} Task execution failed: orderList[4]: ${orderList[4]}`);
    throw new Error('orderList[4] check failed, expected 4');
  }

  if (orderList[5] !== 5) {
    console.info(`${TAG} Task execution failed: orderList[5]: ${orderList[5]}`);
    throw new Error('orderList[5] check failed, expected 5');
  }

  if (orderList[6] !== 6) {
    console.info(`${TAG} Task execution failed: orderList[6]: ${orderList[6]}`);
    throw new Error('orderList[6] check failed, expected 6');
  }
}

export function builtinsStatementBlockTest1008() {
  const TAG = 'builtinsStatementBlockTest1008';
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
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }

  if (orderList[3] !== 3) {
    console.info(`${TAG} Task execution failed: orderList[3]: ${orderList[3]}`);
    throw new Error('orderList[3] check failed, expected 3');
  }

  if (orderList[4] !== 4) {
    console.info(`${TAG} Task execution failed: orderList[4]: ${orderList[4]}`);
    throw new Error('orderList[4] check failed, expected 4');
  }

  if (orderList[5] !== 5) {
    console.info(`${TAG} Task execution failed: orderList[5]: ${orderList[5]}`);
    throw new Error('orderList[5] check failed, expected 5');
  }

  if (orderList[6] !== 6) {
    console.info(`${TAG} Task execution failed: orderList[6]: ${orderList[6]}`);
    throw new Error('orderList[6] check failed, expected 6');
  }

  if (orderList[7] !== 7) {
    console.info(`${TAG} Task execution failed: orderList[7]: ${orderList[7]}`);
    throw new Error('orderList[7] check failed, expected 7');
  }

  if (orderList[8] !== 8) {
    console.info(`${TAG} Task execution failed: orderList[8]: ${orderList[8]}`);
    throw new Error('orderList[8] check failed, expected 8');
  }

  if (orderList[9] !== 9) {
    console.info(`${TAG} Task execution failed: orderList[9]: ${orderList[9]}`);
    throw new Error('orderList[9] check failed, expected 9');
  }

  if (orderList[10] !== 10) {
    console.info(`${TAG} Task execution failed: orderList[10]: ${orderList[10]}`);
    throw new Error('orderList[10] check failed, expected 10');
  }

  if (orderList[11] !== 11) {
    console.info(`${TAG} Task execution failed: orderList[11]: ${orderList[11]}`);
    throw new Error('orderList[11] check failed, expected 11');
  }

  if (orderList[12] !== 12) {
    console.info(`${TAG} Task execution failed: orderList[12]: ${orderList[12]}`);
    throw new Error('orderList[12] check failed, expected 12');
  }

  if (orderList[13] !== 13) {
    console.info(`${TAG} Task execution failed: orderList[13]: ${orderList[13]}`);
    throw new Error('orderList[13] check failed, expected 13');
  }

  if (orderList[14] !== 14) {
    console.info(`${TAG} Task execution failed: orderList[14]: ${orderList[14]}`);
    throw new Error('orderList[14] check failed, expected 14');
  }

  if (orderList[15] !== 15) {
    console.info(`${TAG} Task execution failed: orderList[15]: ${orderList[15]}`);
    throw new Error('orderList[15] check failed, expected 15');
  }

  if (orderList[16] !== 16) {
    console.info(`${TAG} Task execution failed: orderList[16]: ${orderList[16]}`);
    throw new Error('orderList[16] check failed, expected 16');
  }

  if (orderList[17] !== 17) {
    console.info(`${TAG} Task execution failed: orderList[17]: ${orderList[17]}`);
    throw new Error('orderList[17] check failed, expected 17');
  }

  if (orderList[18] !== 18) {
    console.info(`${TAG} Task execution failed: orderList[18]: ${orderList[18]}`);
    throw new Error('orderList[18] check failed, expected 18');
  }

  if (orderList[19] !== 19) {
    console.info(`${TAG} Task execution failed: orderList[19]: ${orderList[19]}`);
    throw new Error('orderList[19] check failed, expected 19');
  }

  if (orderList[20] !== 20) {
    console.info(`${TAG} Task execution failed: orderList[20]: ${orderList[20]}`);
    throw new Error('orderList[20] check failed, expected 20');
  }
}

export function builtinsStatementBlockTest1009() {
  const TAG = 'builtinsStatementBlockTest1009';
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
  if (orderList[0] !== 0) {
    console.info(`${TAG} Task execution failed: orderList[0]: ${orderList[0]}`);
    throw new Error('orderList[0] check failed, expected 0');
  }

  if (orderList[1] !== 1) {
    console.info(`${TAG} Task execution failed: orderList[1]: ${orderList[1]}`);
    throw new Error('orderList[1] check failed, expected 1');
  }

  if (orderList[2] !== 2) {
    console.info(`${TAG} Task execution failed: orderList[2]: ${orderList[2]}`);
    throw new Error('orderList[2] check failed, expected 2');
  }

  if (orderList[3] !== 3) {
    console.info(`${TAG} Task execution failed: orderList[3]: ${orderList[3]}`);
    throw new Error('orderList[3] check failed, expected 3');
  }

  if (orderList[4] !== 4) {
    console.info(`${TAG} Task execution failed: orderList[4]: ${orderList[4]}`);
    throw new Error('orderList[4] check failed, expected 4');
  }

  if (orderList[5] !== 5) {
    console.info(`${TAG} Task execution failed: orderList[5]: ${orderList[5]}`);
    throw new Error('orderList[5] check failed, expected 5');
  }

  if (orderList[6] !== 6) {
    console.info(`${TAG} Task execution failed: orderList[6]: ${orderList[6]}`);
    throw new Error('orderList[6] check failed, expected 6');
  }

  if (orderList[7] !== 7) {
    console.info(`${TAG} Task execution failed: orderList[7]: ${orderList[7]}`);
    throw new Error('orderList[7] check failed, expected 7');
  }

  if (orderList[8] !== 8) {
    console.info(`${TAG} Task execution failed: orderList[8]: ${orderList[8]}`);
    throw new Error('orderList[8] check failed, expected 8');
  }

  if (orderList[9] !== 9) {
    console.info(`${TAG} Task execution failed: orderList[9]: ${orderList[9]}`);
    throw new Error('orderList[9] check failed, expected 9');
  }

  if (orderList[10] !== 10) {
    console.info(`${TAG} Task execution failed: orderList[10]: ${orderList[10]}`);
    throw new Error('orderList[10] check failed, expected 10');
  }

  if (orderList[11] !== 11) {
    console.info(`${TAG} Task execution failed: orderList[11]: ${orderList[11]}`);
    throw new Error('orderList[11] check failed, expected 11');
  }

  if (orderList[12] !== 12) {
    console.info(`${TAG} Task execution failed: orderList[12]: ${orderList[12]}`);
    throw new Error('orderList[12] check failed, expected 12');
  }
}
