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
import { MyNamespace, MyNamespace1,
  MyNamespace10,
  MyNamespace11,
  MyNamespace12,
  MyNamespace13,
  MyNamespace14,
  MyNamespace15,
  MyNamespace16,
  MyNamespace17,
  MyNamespace18,
  MyNamespace19,MyNamespace2,
  MyNamespace20,MyNamespace4,
  MyNamespace5,
  MyNamespace6,
  MyNamespace7,
  MyNamespace8,
  MyNamespace9,
  sendableFunction,
  sendableFunction10,
  sendableFunction11,
  sendableFunction12,
  sendableFunction13,
  sendableFunction14,
  sendableFunction15,
  sendableFunction16,
  sendableFunction17,
  sendableFunction18,
  sendableFunction19,
  sendableFunction2,
  sendableFunction20,
  sendableFunction3, sendableFunction4,
  sendableFunction5,
  sendableFunction6,
  sendableFunction7,
  sendableFunction8,
  sendableFunction9,
  TypeA,
  TypeB,} from './SendableTest1';
import { ArkTSUtils, collections } from '@kit.ArkTS';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}


@Concurrent
export function TaskFunc1() {
  const arg: MyNamespace.MyEnum = MyNamespace.MyEnum.Value1;
  const instance = MyNamespace.myInstance;
  const result = sendableFunction(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc2() {
  const arg: MyNamespace1.MyEnum = MyNamespace1.MyEnum.Value1;
  const instance = MyNamespace1.myInstance;
  const result = sendableFunction2(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc3() {
  const arg: MyNamespace2.MyEnum = MyNamespace2.MyEnum.TrueValue;
  const instance = MyNamespace2.myInstance;
  const result = sendableFunction3(arg, instance);
  return result;
}


@Concurrent
export function TaskFunc4() {
  const arg: MyNamespace4.MyConstEnum = MyNamespace4.MyConstEnum.Value1;
  const instance = MyNamespace4.myInstance;
  const result = sendableFunction4(arg, instance);
  return result;
}


@Concurrent
export function TaskFunc5() {
  const arg = new MyNamespace5.SendableClass('Taskpool Data');
  const instance = MyNamespace5.myInstance;
  const result =sendableFunction5(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc6() {
  const arg: MyNamespace6.MyType= 20;
  const instance = MyNamespace6.myInstance;
  const result = sendableFunction6(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc7() {

  const arg = new MyNamespace7.CustomData(10, 'TaskPool Data');
  const instance = MyNamespace7.myInstance;
  const result = sendableFunction7(arg, instance);
  return result;
}


@Concurrent
export function TaskFunc8() {
  const arg: MyNamespace8.ExportedBoolean = true;
  const instance = MyNamespace8.myInstance;
  const result =sendableFunction8(arg, instance);
  return result;
}


@Concurrent
export function TaskFunc9() {
  const arg: MyNamespace9.ExportedNumber = 5;
  const instance = MyNamespace9.myInstance;
  const result = sendableFunction9(arg, instance);
  return result;
}


@Concurrent
export function TaskFunc10() {
  const arg: MyNamespace10.ExportedString = 'hello';
  const instance = MyNamespace10.myInstance;
  const result = sendableFunction10(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc11() {
  const arg: MyNamespace11.ExportedBigint = 10n;
  const instance = MyNamespace11.myInstance;
  const result = sendableFunction11(arg, instance);
  return result;
}


@Concurrent
export function TaskFunc12() {
  const arg: MyNamespace12.ExportedNull = null;
  const instance = MyNamespace12.myInstance;
  const result = sendableFunction12(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc13() {
  const arg: MyNamespace13.ExportedUndefined = undefined;
  const instance = MyNamespace13.myInstance;
  const result = sendableFunction13(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc14() {
  const arg: MyNamespace14.ExportedCollectionsArray = new collections.Array<number>();
  arg.push(10);
  arg.push(20);
  arg.push(30);
  const instance = MyNamespace14.myInstance;
  const result = sendableFunction14(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc15() {
  const arg: MyNamespace15.ExportedReadonlyArray = [1, 2, 3];
  const instance = MyNamespace15.myInstance;
  const result = sendableFunction15(arg, instance);
  return result;
}


@Concurrent
export function TaskFunc16() {
  const myMap: MyNamespace16.ExportedCollectionsMap = new collections.Map<string, number>();
  myMap.set('key1', 10);
  myMap.set('key2', 20);
  const instance = MyNamespace16.myInstance;
  const result = sendableFunction16(myMap, instance);
  return result;
}


@Concurrent
export function TaskFunc17() {
  const mySet: MyNamespace17.ExportedCollectionsSet = new collections.Set<number>();
  mySet.add(10);
  mySet.add(20);
  const instance = MyNamespace17.myInstance;
  const result = sendableFunction17(mySet, instance);
  return result;
}

@Concurrent
export function TaskFunc18() {
  const arg: MyNamespace18.ExportedCollectionsInt8Array = new collections.Int8Array([1, 2, 3]);
  const instance = MyNamespace18.myInstance;
  const result = sendableFunction18(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc19() {
  const arg: MyNamespace19.ExportedAsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');;
  const instance = MyNamespace19.myInstance;
  const result = sendableFunction19(arg, instance);
  return result;
}

@Concurrent
export function TaskFunc20() {
  const data: MyNamespace20.UnionSendableType[] = [
    new TypeA('Hello'),
    new TypeB(42)
  ];
  const instance = MyNamespace20.myInstance;
  const result = sendableFunction20(data, instance);
  return result;
}