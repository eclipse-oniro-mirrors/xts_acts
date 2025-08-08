/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { ArkTSUtils, collections, ErrorEvent, lang, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { sendablePreferences } from '@kit.ArkData';
import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { image, sendableImage } from '@kit.ImageKit';
import sendableResourceManager from '@ohos.sendableResourceManager';
import { AbilityConstant, common, sendableContextManager, UIAbility, Want } from '@kit.AbilityKit';


export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export const numVar: number = Number(123);

export const numVar2: number = Number(123);

export const numVar3: number = 123;


export const boolean1: boolean = Boolean(123);

export const boolean2: boolean = Boolean(0);

export const boolean3: boolean = true;

export const str: string = 'hello world';

export const big: bigint = 20n;

export const undefined1: undefined = undefined;


export const null1: null = null;


export const currentDate: Date = new Date();

export const str1: string = 'hello';

export const str2: string = String('hello123');

export const numberRegex: RegExp = new RegExp('\\d+', 'g');

export const arr: number[] = [1, 2, 3, 4]

export const myMap = new Map<string, number>();

export const mySet = new Set<number>();

interface Object {
  name: string;
  age: number;
  city: string;
}

export const myObject: Object = {
  name: 'John',
  age: 30,
  city: 'New York'
};

interface Object2 {
  name: string;
  age: number;
}

export const myObject2 = new Object() as Object2;

class Person {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

export const myObject3 = new Person('ZQ', 20);


export const myInt8Array = new Int8Array([1, -2, 3, -4]);

export const myUint8Array = new Uint8Array([10, 20, 30, 40]);

export const myInt16Array = new Int16Array([100, -200, 300, -400]);

export const myUint16Array = new Uint16Array([1000, 2000, 3000, 4000]);

export const myInt32Array = new Int32Array([10000, -20000, 30000, -40000]);

export const myUint32Array = new Uint32Array([100000, 200000, 300000, 400000]);

export const myUint8ClampedArray = new Uint8ClampedArray([20, 25, 10, 45]);

export const myFloat32Array = new Float32Array([1.5, 2.5, -3.8, 4.8]);

export const myArrayBuffer = new ArrayBuffer(16);

@Sendable
class MyClass {
  public message: string;

  constructor(message: string) {
    this.message = message;
  }

  getMessage(): string {
    return this.message;
  }
}

export const myClassInstance = new MyClass('Hello from Sendable class');


@Sendable
export function add(a: number, b: number): number {
  return a + b;
}


interface MySendableInterface extends lang.ISendable {
  num: number;

  getNum(): number;
}

@Sendable
export class MySendableClass implements MySendableInterface {
  public num: number;

  constructor(num: number) {
    this.num = num;
  }

  getNum(): number {
    return this.num;
  }
}

export const mySendableInstance: MySendableInterface = new MySendableClass(20);


export const enum MyEnum {
  value1 = 1,
  value2 = 2,
  value3 = 3
}

export const array = new collections.Array<number>(1, 2, 3, 4);

export const myMap1 = new collections.Map<string, number>([
  ['one', 10],
  ['two', 10],
  ['three', 3],
]);

export const mySet1 = new collections.Set<number>();


export const myInt8Array1 = new collections.Int8Array([1, -2, 3, -4]);

export const myUint8Array1 = new collections.Uint8Array([10, 20, 30, 40]);

export const myInt16Array1 = new collections.Int16Array([100, -200, 300, -400]);

export const myUint16Array1 = new collections.Uint16Array([1000, 2000, 3000, 4000]);

export const myInt32Array1 = new collections.Int32Array([10000, -20000, 30000, -40000]);

export const myUint32Array1 = new collections.Uint32Array([100000, 200000, 300000, 400000]);

export const myUint8ClampedArray1 = new collections.Uint8ClampedArray([20, 25, 10, 45]);

export const myFloat32Array1 = new collections.Float32Array([1.5, 2.5, -3.8, 4.8]);

export const myArrayBuffer1: collections.ArrayBuffer = new collections.ArrayBuffer(10);

export const bitVector: collections.BitVector = new collections.BitVector(10);


export const asonArray = ArkTSUtils.ASON.stringify(new collections.Array(1, 2, 3))

@Sendable
export class AsyncLock {
  public count_: number = 0;
  public lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {
    await this.lock_.lockAsync(() => {
      this.count_ = count;
    })
  }
}


export class MyPreference {
  public static  dataPreferences: sendablePreferences.Preferences | null;

  public static initDataPreferences(context: Context) {
    let options: sendablePreferences.Options = { name: 'myStore' };
    MyPreference.dataPreferences = sendablePreferences.getPreferencesSync(context, options);
  }

  public static setDataPreferences(key: string, value: string) {
    MyPreference.dataPreferences?.putSync(key, value)
    MyPreference.dataPreferences?.flush()
  }

  public static getDataPreferences(key: string) {
    return MyPreference.dataPreferences?.getSync(key, '')
  }
}


export async function createColorSpaceManager() {
  let primaries: colorSpaceManager.ColorSpacePrimaries = {
    redX: 0.1,
    redY: 0.1,
    greenX: 0.2,
    greenY: 0.2,
    blueX: 0.3,
    blueY: 0.3,
    whitePointX: 0.4,
    whitePointY: 0.4
  };
  const gamma: number = 2.2;
  const colorSpace = sendableColorSpaceManager.create(primaries, gamma);
  const colorSpaceGamma = colorSpace.getGamma();

  return colorSpaceGamma
}


export async function createAndGetPixelMapInfo() {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let opts: image.InitializationOptions = {
    editable: true,
    pixelFormat: 3,
    size: { height: 4, width: 6 }
  };

  const pixelMap: sendableImage.PixelMap = await sendableImage.createPixelMap(color, opts);
  console.info('Succeeded in creating pixelmap.');

  return pixelMap
}

const sampleResource: sendableResourceManager.Resource = {
  bundleName: 'com.example.app',
  moduleName: 'entry',
  id: 10,
  params: [],
};

export async function convertResourceToSendable() {

  const sendableResource = sendableResourceManager.resourceToSendableResource(sampleResource);
  console.log('Successfully converted Resource to SendableResource.');

  if (!sendableResource) {
    throw new Error('Converted SendableResource is null or undefined');
  }
  return sendableResource;
}


@Sendable
class MyObject {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}


type SendableUnion = number | string | MyObject;


export const sendableData: SendableUnion = 4;