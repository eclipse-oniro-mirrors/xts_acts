/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import {
  test3
} from './Utils';

export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}
export function printArgs(args: Number): void {
  console.info('printArgs: ' + args);
}

export function printArgsError(args: number): void {
  if (args < 0) {
    throw new Error('Invalid argument: args cannot be negative.');
  }
  console.info('printArgs: ' + args);
}

export function timedTask(duration: number): void {
  console.info('timedTask started');
  const start = Date.now();
  while (Date.now() - start < duration) {}
  console.info('timedTask completed');
}

export function timedTaskError(duration: number): void {
  console.info('timedTask started');
  const start = Date.now();
  while (Date.now() - start < duration) {}
  throw new Error('Invalid argument: args cannot be negative.');
}

export function longTask(): void {
  console.info('longTask started');
  for (let i = 0; i < 10000000; i++) {}
  console.info('longTask completed');
}

export function longTaskError(): void {
  console.info('longTask started');
  for (let i = 0; i < 10000000; i++) {}
  console.info('longTask completed');
  throw new Error('Invalid argument: args cannot be negative.');
}

export async function testFun1(step: Number): Promise<Number> {
  let points: Number = 0;
  points += step;
  let inner = async (args: Number): Promise<Number> => {
    console.info('printArgs: ' + args);
    return await new Promise<Number>((resolve, _) => {
      resolve(++args)
    })
  }
  await inner(points);
  test3(() => {
    points += step;
  });
  console.info('printArgs: ' + points);
  return points as Number;
}


export async function testFun2(cycleCount: number, step: number): Promise<number> {
  let points: number = 0;
  for (let i = 0; i < cycleCount; i++) {
    points = await new Promise<number>((resolve, _) => {
      resolve(points + step)
    })
  }
  return points
}

export async function testFun3(cycleCount: Number, text: string): Promise<number[]> {
  const textWidthList: number[] = [];

  for (let i = 0; i < cycleCount; i++) {
    textWidthList.push(i);
  }

  return textWidthList;
}


export async function testFun5(text: string): Promise<number[]> {
  let textWidthList: number[] = new Array<Number>(1);
  return textWidthList
}

