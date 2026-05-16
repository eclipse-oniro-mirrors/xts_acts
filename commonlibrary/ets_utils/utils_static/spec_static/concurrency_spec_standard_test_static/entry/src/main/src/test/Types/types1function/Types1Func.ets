'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export function test(): double {
  let a1: int = 1;
  let a2: int = 1;
  let a3: int = 1;
  let a4: int = 1;
  let a5: int = 1;
  let a6: int = 1;
  let a7: int = 1;
  let a8: int = 1;
  let a9: int = 1;
  let a10: int = 1;
  let a11: int = 1;
  let a12: int = 1;
  let a13: int = 1;
  let a14: int = 1;
  let a15: int = 1;
  let a16: int = 1;
  return a16.toDouble();
}

export function RegisterAllocationTest001(): void {
  let caseName: string = "RegisterAllocationTest001";
  // 1. 核心逻辑
  let a: int | double = 1;
  let a1: int = 1;
  let a2: int = 1;
  let a3: int = 1;
  let a4: int = 1;
  let a5: int = 1;
  let a6: int = 1;
  let a7: int = 1;
  let a8: int = 1;
  let a9: int = 1;
  let a10: int = 1;
  let a11: int = 1;
  let a12: int = 1;
  let a13: int = 1;
  let a14: int = 1;
  let a15: int = 1;
  let a16: int = 1;
  let a17: int = 1;
  let a18: int = 1;
  let result: double = a.toDouble();
  // 2. 自定义断言
  if (!(result === 1.0)) {
    console.info(`${caseName} Task execution failed： result === 1.0`);
    throw new Error("Test failed: result === 1.0");
  }
}

export function RegisterAllocationTest002(): void {
  let caseName: string = "RegisterAllocationTest002";
  // 1. 核心逻辑
  let val: int | double = 256;
  test();
  let result: int = val.toInt();
  // 2. 自定义断言
  if (!(result === 256)) {
    console.info(`${caseName} Task execution failed： result === 256`);
    throw new Error("Test failed: result === 256");
  }
}

export function RegisterAllocationTest003(): void {
  let caseName: string = "RegisterAllocationTest003";
  // 1. 核心逻辑
  let a: int | float = 128;
  let a1: int = 1;
  let a2: int = 1;
  let a3: int = 1;
  let a4: int = 1;
  let a5: int = 1;
  let a6: int = 1;
  let a7: int = 1;
  let a8: int = 1;
  let a9: int = 1;
  let a10: int = 1;
  let a11: int = 1;
  let a12: float = 1.2f;
  let a13: float = 1.2f;
  let a14: float = 1.2f;
  let a15: float = 1.2f;
  let a16: float = 1.2f;
  let result: float = a.toFloat();
  // 2. 自定义断言
  if (!(result === 128.0)) {
    console.info(`${caseName} Task execution failed： result === 128.0`);
    throw new Error("Test failed: result === 128.0");
  }
}

export function RegisterAllocationTest004(): void {
  let caseName: string = "RegisterAllocationTest004";
  // 1. 核心逻辑
  let x: int | double = 555;
  let v1: int = 1;
  let v2: int = 2;
  let v3: int = 3;
  let v4: int = 4;
  let v5: int = 5;
  let v6: int = 6;
  let v7: int = 7;
  let int_8: int = 8;
  {
    let block1: int = 100;
    let block2: int = 200;
    let x1: int = 1;
    let x2: int = 1;
    let x3: int = 1;
    let x4: int = 1;
    {
      let inner1: int = 300;
      let inner2: int = 400;
      let y1: int = 1;
      let y2: int = 1;
      let y3: int = 1;
      let y4: int = 1;
      let result: double = x.toDouble();
      // 2. 自定义断言
      if (!(result === 555.0)) {
        console.info(`${caseName} Task execution failed： result === 555.0`);
        throw new Error("Test failed: result === 555.0");
      }
    }
  }
}
