/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

type targetType = string | int | boolean | null | undefined;

export default async function waitForExist<T extends targetType> (
  stateGetter: () => T,
  testsuite: string,
  expectValue: T,
  interval:int =3000,
  tryTime:int =20
):Promise<T>{
  let nums = 0;
  let isSuccess = false;
  while (nums < tryTime) {
    const tempValue = await new Promise<T>((resolve) => {
      setTimeout(()=>resolve(stateGetter()), interval);
    })
    let currentValue = tempValue as Promise<T> | T;
    console.log(testsuite + ' debug wait for exist' + nums + ' times, currentValue: ' + currentValue
      + ',expectValue ' + expectValue)

    if (expectValue == null) {
      if (currentValue != null) {
        console.log(testsuite + ' debug wait for success exist');
        isSuccess = true;
        return currentValue as Promise<T> | T;
      }
    } else {
      if (currentValue == expectValue) {
        console.log(testsuite + ' debug wait for success exist');
        isSuccess = true;
        return currentValue as Promise<T> | T;
      }
    }
    nums++;
  }
  if (!isSuccess) {
    console.log(testsuite + ' debug wait for failed')
  }
  const currentValue = await new Promise<T>((result) => {
    setTimeout(() => result(stateGetter()), interval);
  });
  console.log(testsuite + ' debug wait for failed exist ' + currentValue);
  return currentValue as Promise<T> | T;
}