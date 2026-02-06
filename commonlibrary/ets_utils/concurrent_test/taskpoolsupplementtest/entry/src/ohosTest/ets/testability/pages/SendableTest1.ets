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
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';

export namespace MyNamespace {
  export enum MyEnum {
    Value1 = 'value1',
    Value2 = 'value2'
  }

  export interface MySendableInstance {
    message: string;
  }

  export class MyInstance implements MySendableInstance {
    public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction(arg: MyNamespace.MyEnum, instance: MyNamespace.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg;
}


export namespace MyNamespace1 {
  export enum MyEnum {
    Value1 = 1,
    Value2 = 2
  }

  export interface MySendableInstance {
    message: number;
  }

  export class MyInstance implements MySendableInstance {
    public message: number = 10;
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction2(arg: MyNamespace1.MyEnum, instance: MyNamespace1.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg;
}


export namespace MyNamespace2 {
  export enum MyEnum {
    TrueValue = 1,
    FalseValue = 0,
  }

  export interface MySendableInstance {
    message: string;
  }

  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction3(arg: MyNamespace2.MyEnum, instance: MyNamespace2.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg;
}


export namespace MyNamespace4 {
  export const enum MyConstEnum {
    Value1 = 1,
    Value2 = 2
  }

  export interface MySendableInstance {
    message: string;
  }

  export class MyInstance implements MySendableInstance {
    public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction4(arg: MyNamespace4.MyConstEnum, instance: MyNamespace4.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace5 {
  @Sendable
  export class SendableClass {
    public data: string;

    constructor(data: string) {
      this.data = data;
    }
  }

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
    public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction5(arg: MyNamespace5.SendableClass, instance: MyNamespace5.MySendableInstance) {
  console.log(`Received argument: ${arg.data}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace6 {
  export type MyType = number;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction6(arg: MyNamespace6.MyType, instance: MyNamespace6.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace7 {
  @Sendable
  export class CustomData implements lang.ISendable {
    public data1: number;
    public data2: string;

    constructor(data1: number, data2: string) {
      this.data1 = data1;
      this.data2 = data2;
    }
  }

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction7(arg: MyNamespace7.CustomData, instance: MyNamespace7.MySendableInstance) {
  console.log(`Received argument data1: ${arg.data1}, data2: ${arg.data2}, and instance message: ${instance.message}`);
  return arg;
}


export namespace MyNamespace8 {
  export type ExportedBoolean = boolean;


  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction8(arg: MyNamespace8.ExportedBoolean, instance: MyNamespace8.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}

export namespace MyNamespace9 {
  export type ExportedNumber = number;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction9(arg: MyNamespace9.ExportedNumber, instance: MyNamespace9.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace10 {
  export type ExportedString = string;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction10(arg: MyNamespace10.ExportedString, instance: MyNamespace10.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace11 {
  export type ExportedBigint = bigint;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction11(arg: MyNamespace11.ExportedBigint, instance: MyNamespace11.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace12 {
  export type ExportedNull = null;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction12(arg: MyNamespace12.ExportedNull, instance: MyNamespace12.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace13 {
  export type ExportedUndefined = undefined;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction13(arg: MyNamespace13.ExportedUndefined, instance: MyNamespace13.MySendableInstance) {
  console.log(`Received argument: ${arg}, and instance message: ${instance.message}`);
  return arg
}

export namespace MyNamespace14 {
  export type ExportedCollectionsArray = collections.Array<number>;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction14(arg: MyNamespace14.ExportedCollectionsArray,
  instance: MyNamespace14.MySendableInstance) {
  const arrayElements: number[] = [];
  for (let i = 0; i < arg.length; i++) {
    const element = arg[i];
    if (element !== undefined) {
      arrayElements.push(element);
    }
  }
  console.log(`Received argument: ${arrayElements.join(', ')}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace15 {
  export type ExportedReadonlyArray = readonly number[];

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction15(arg: MyNamespace15.ExportedReadonlyArray,
  instance: MyNamespace15.MySendableInstance) {
  const arrayElements: number[] = [...arg];
  console.log(`Received argument: ${arrayElements.join(', ')}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace16 {
  export type ExportedCollectionsMap = collections.Map<string, number>;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction16(arg: MyNamespace16.ExportedCollectionsMap,
  instance: MyNamespace16.MySendableInstance) {
  console.log(`Received argument: ${JSON.stringify(arg)}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace17 {
  export type ExportedCollectionsSet = collections.Set<number>;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction17(arg: MyNamespace17.ExportedCollectionsSet,
  instance: MyNamespace17.MySendableInstance) {
  console.log(`Received argument: ${JSON.stringify(arg)}, and instance message: ${instance.message}`);
  return arg
}


export namespace MyNamespace18 {
  export type ExportedCollectionsInt8Array = collections.Int8Array;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction18(arg: MyNamespace18.ExportedCollectionsInt8Array,
  instance: MyNamespace18.MySendableInstance) {
  console.log(`Received argument: ${JSON.stringify(arg)}, and instance message: ${instance.message}`);
  return arg
}

export namespace MyNamespace19 {
  export type ExportedAsyncLock = ArkTSUtils.locks.AsyncLock;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export async function sendableFunction19(lock: MyNamespace19.ExportedAsyncLock,
  instance: MyNamespace19.MySendableInstance) {
  let externalVariable = 0;
  lock.lockAsync<void>(() => {
    return new Promise((resolve) => {
      setTimeout(() => {
        externalVariable = 20;
        resolve();
      });
    });
  })
  console.log(`${externalVariable}`);
  console.log(`Received instance message: ${instance.message}, Shared data after operation: ${lock}`);
  return externalVariable;
}


@Sendable
export class TypeA {
  public data: string;

  constructor(data: string) {
    this.data = data;
  }
}

@Sendable
export class TypeB {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

export namespace MyNamespace20 {
  export type UnionSendableType = TypeA | TypeB;

  export interface MySendableInstance {
    message: string;
  }

  @Sendable
  export class MyInstance implements MySendableInstance {
   public message: string = 'This is an instance from MyNamespace';
  }

  export const myInstance = new MyInstance();
}

@Sendable
export function sendableFunction20(data: MyNamespace20.UnionSendableType[],
  instance: MyNamespace20.MySendableInstance) {
  data.forEach((element) => {
    if (element instanceof TypeA) {
      console.log(`Received TypeA data: ${element.data}`);
    } else if (element instanceof TypeB) {
      console.log(`Received TypeB value: ${element.value}`);
    }
  });
  console.log(`Instance message: ${instance.message}`);
  return data
}