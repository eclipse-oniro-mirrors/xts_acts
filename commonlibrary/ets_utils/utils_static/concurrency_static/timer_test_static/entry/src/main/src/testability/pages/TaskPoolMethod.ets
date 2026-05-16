/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/



export function calculate(index: number): number {
  return index + 2;
}


export async function asyncCalculate(index: number): Promise<number> {

  const firstResult = await new Promise<number>((resolve, reject) => {
    setTimeout(() => {
      const intermediateResult = index + 1;
      resolve(intermediateResult);
    }, 1000);
  });

  const finalResult = await new Promise<number>((resolve, reject) => {
    setTimeout(() => {
      const result = firstResult + 3;
      resolve(result);
    }, 1000);
  });

  return finalResult;
}


export async function asyncCalculate1(index: number): Promise<number> {
  return index + 1;
}

