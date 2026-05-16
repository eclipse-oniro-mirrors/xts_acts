import { ArkTSUtils, collections } from '@kit.ArkTS';

@Concurrent
export async function test_uint16Array_001(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let originalLength = uint16Array.length;
    uint16Array[originalLength] = index % 256;
    let temp = uint16Array[0];
    uint16Array[0] = uint16Array[1];
    uint16Array[1] = temp;
  })
}

@Concurrent
export async function test_uint16Array_002(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint16Array.from([index, index + 1, index + 2]);
    uint16Array[uint16Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint16Array_003(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint16Array.from([index, index + 1, index + 2]);
    uint16Array[uint16Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint16Array_004(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint16Array.copyWithin(0, 1, 3);
    let temp = uint16Array[0];
    uint16Array[0] = uint16Array[1];
    uint16Array[1] = temp;
  })
}

@Concurrent
export async function test_uint16Array_005(uint16Array: collections.Uint16Array, name: string, index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = uint16Array.some((element: number) => element < 0);
    let temp = uint16Array[0];
    uint16Array[0] = uint16Array[1];
    uint16Array[1] = temp;
  })
  return res;
}

@Concurrent
export async function test_uint16Array_006(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newSet = new Set([index, index + 1, index + 2]);
    let newArray = collections.Uint16Array.from(newSet);
    uint16Array[uint16Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint16Array_007(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint16Array.from([index, index + 1, index + 2], (value, idx) => value + idx);
    uint16Array[uint16Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint16Array_008(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint16Array.of(index, index + 1, index + 2);
    uint16Array[uint16Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint16Array_009(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint16Array.copyWithin(0, 1, 3);
    let temp = uint16Array[0];
    uint16Array[0] = uint16Array[1];
    uint16Array[1] = temp;
  })
}

@Concurrent
export async function test_uint16Array_010(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let temp = uint16Array[0];
    uint16Array[0] = uint16Array[1];
    uint16Array[1] = temp;
  })
}

@Concurrent
export async function test_uint16Array_011(uint16Array: collections.Uint16Array, name: string, index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let someResult = uint16Array.some((element: number) => element < 0);
    let everyResult = uint16Array.every((element: number) => element >= 0);
    res = someResult || !everyResult;
  })
  return res;
}

@Concurrent
export async function test_uint16Array_012(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint16Array.fill(0, 1, 3);
  })
}

@Concurrent
export async function test_uint16Array_013(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let filteredArray = uint16Array.filter((element: number) => element % 2 === 0);
    let foundElement = uint16Array.find((element: number) => element % 2 === 0);
    str = filteredArray.toString() + ',' + foundElement;
  })
  return str;
}

@Concurrent
export async function test_uint16Array_014(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let findIndexResult = uint16Array.findIndex((element: number) => element % 2 === 0);
    let indexOfResult = uint16Array.indexOf(2);
    str = findIndexResult + ',' + indexOfResult;
  })
  return str;
}

@Concurrent
export async function test_uint16Array_015(uint16Array: collections.Uint16Array, name: string, index: number) {
  let result = 'forEach_completed';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint16Array.forEach((value: number, index: number, array: collections.Uint16Array) => {
      if (value !== array[index]) {
        result = 'forEach_failed';
      }
    });
  })
  return result;
}

@Concurrent
export async function test_uint16Array_016(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let lastIndexOfResult = uint16Array.lastIndexOf(2);
    let joinResult = uint16Array.join('-');
    str = lastIndexOfResult + ',' + joinResult;
  })
  return str;
}

@Concurrent
export async function test_uint16Array_017(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let mappedArray = uint16Array.map((value: number) => value * 2);
    str = mappedArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint16Array_018(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let reduceResult = uint16Array.reduce((accumulator: number, value: number) => accumulator + value);
    let reduceWithInitResult = uint16Array.reduce((accumulator: number, value: number) => accumulator + value, 6);
    str = reduceResult + ',' + reduceWithInitResult;
  })
  return str;
}

@Concurrent
export async function test_uint16Array_019(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let reduceRightResult = uint16Array.reduceRight((accumulator: number, value: number) => accumulator + value);
    let reduceRightWithInitResult =
      uint16Array.reduceRight((accumulator: number, value: number) => accumulator + value, 6);
    str = reduceRightResult + ',' + reduceRightWithInitResult;
  })
  return str;
}

@Concurrent
export async function test_uint16Array_020(arr: collections.Uint16Array, name: string, index: number) {
  let numberarr:string[]=[];
  let reversed: collections.Uint16Array = new collections.Uint16Array(5)
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    reversed = arr.reverse();
    console.info(`任务${index}翻转后：`, reversed);
  })
  numberarr.push(reversed.toString())
  return numberarr;
}


@Concurrent
export async function test_uint16Array_021(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newValues = [100, 101, 102];
    uint16Array.set(newValues, 0);
  })
}

@Concurrent
export async function test_uint16Array_022(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let slicedArray = uint16Array.slice(1, 3);
    str = slicedArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint16Array_023(uint16Array: collections.Uint16Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint16Array.sort((a: number, b: number) => b - a);
  })
}

@Concurrent
export async function test_uint16Array_024(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let subArray = uint16Array.subarray(1, 3);
    str = subArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint16Array_025(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let atResult = uint16Array.at(2);
    let includesResult = uint16Array.includes(3);
    str = atResult + ',' + includesResult;
  })
  return str;
}

@Concurrent
export async function test_uint16Array_026(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = uint16Array.entries();
    let firstEntry: [number, number] = iterator.next().value;
    str = firstEntry[0] + ',' + firstEntry[1];
  })
  return str;
}

@Concurrent
export async function test_uint16Array_027(uint16Array: collections.Uint16Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let keysIterator = uint16Array.keys();
    let firstKey: number = keysIterator.next().value;
    let valuesIterator = uint16Array.values();
    let firstValue: number = valuesIterator.next().value;
    str = firstKey + ',' + firstValue;
  })
  return str;
}

@Concurrent
export async function test_uint32Array_001(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let originalLength = uint32Array.length;
    uint32Array[originalLength] = index % 256;
    let temp = uint32Array[0];
    uint32Array[0] = uint32Array[1];
    uint32Array[1] = temp;
  })
}

@Concurrent
export async function test_uint32Array_002(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint32Array.from([index, index + 1, index + 2]);
    uint32Array[uint32Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint32Array_003(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint32Array.from([index, index + 1, index + 2]);
    uint32Array[uint32Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint32Array_004(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint32Array.copyWithin(0, 1, 3);
    let temp = uint32Array[0];
    uint32Array[0] = uint32Array[1];
    uint32Array[1] = temp;
  })
}

@Concurrent
export async function test_uint32Array_005(uint32Array: collections.Uint32Array, name: string, index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = uint32Array.some((element: number) => element < 0);
    let temp = uint32Array[0];
    uint32Array[0] = uint32Array[1];
    uint32Array[1] = temp;
  })
  return res;
}

@Concurrent
export async function test_uint32Array_006(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newSet = new Set([index, index + 1, index + 2]);
    let newArray = collections.Uint32Array.from(newSet);
    uint32Array[uint32Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint32Array_007(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint32Array.from([index, index + 1, index + 2], (value, idx) => value + idx);
    uint32Array[uint32Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint32Array_008(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint32Array.of(index, index + 1, index + 2);
    uint32Array[uint32Array.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint32Array_009(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint32Array.copyWithin(0, 1, 3);
    let temp = uint32Array[0];
    uint32Array[0] = uint32Array[1];
    uint32Array[1] = temp;
  })
}

@Concurrent
export async function test_uint32Array_010(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let temp = uint32Array[0];
    uint32Array[0] = uint32Array[1];
    uint32Array[1] = temp;
  })
}

@Concurrent
export async function test_uint32Array_011(uint32Array: collections.Uint32Array, name: string, index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let someResult = uint32Array.some((element: number) => element < 0);
    let everyResult = uint32Array.every((element: number) => element >= 0);
    res = someResult || !everyResult;
  })
  return res;
}

@Concurrent
export async function test_uint32Array_012(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint32Array.fill(0, 1, 3);
  })
}

@Concurrent
export async function test_uint32Array_013(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let filteredArray = uint32Array.filter((element: number) => element % 2 === 0);
    let foundElement = uint32Array.find((element: number) => element % 2 === 0);
    str = filteredArray.toString() + ',' + foundElement;
  })
  return str;
}

@Concurrent
export async function test_uint32Array_014(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let findIndexResult = uint32Array.findIndex((element: number) => element % 2 === 0);
    let indexOfResult = uint32Array.indexOf(2);
    str = findIndexResult + ',' + indexOfResult;
  })
  return str;
}

@Concurrent
export async function test_uint32Array_015(uint32Array: collections.Uint32Array, name: string, index: number) {
  let result = 'forEach_completed';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint32Array.forEach((value: number, index: number, array: collections.Uint32Array) => {
      if (value !== array[index]) {
        result = 'forEach_failed';
      }
    });
  })
  return result;
}

@Concurrent
export async function test_uint32Array_016(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let lastIndexOfResult = uint32Array.lastIndexOf(2);
    let joinResult = uint32Array.join('-');
    str = lastIndexOfResult + ',' + joinResult;
  })
  return str;
}

@Concurrent
export async function test_uint32Array_017(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let mappedArray = uint32Array.map((value: number) => value * 2);
    str = mappedArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint32Array_018(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let reduceResult = uint32Array.reduce((accumulator: number, value: number) => accumulator + value);
    let reduceWithInitResult = uint32Array.reduce((accumulator: number, value: number) => accumulator + value, 6);
    str = reduceResult + ',' + reduceWithInitResult;
  })
  return str;
}

@Concurrent
export async function test_uint32Array_019(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let reduceRightResult = uint32Array.reduceRight((accumulator: number, value: number) => accumulator + value);
    let reduceRightWithInitResult =
      uint32Array.reduceRight((accumulator: number, value: number) => accumulator + value, 6);
    str = reduceRightResult + ',' + reduceRightWithInitResult;
  })
  return str;
}

@Concurrent
export async function test_uint32Array_020(arr: collections.Uint32Array, name: string, index: number) {
  let numberarr:string[]=[];
  let reversed: collections.Uint32Array = new collections.Uint32Array(5)
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    reversed = arr.reverse();
    console.info(`任务${index}翻转后：`, reversed);
  })
  numberarr.push(reversed.toString())
  return numberarr;
}

@Concurrent
export async function test_uint32Array_021(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newValues = [100, 101, 102];
    uint32Array.set(newValues, 0);
  })
}

@Concurrent
export async function test_uint32Array_022(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let slicedArray = uint32Array.slice(1, 3);
    str = slicedArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint32Array_023(uint32Array: collections.Uint32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint32Array.sort((a: number, b: number) => b - a);
  })
}

@Concurrent
export async function test_uint32Array_024(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let subArray = uint32Array.subarray(1, 3);
    str = subArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint32Array_025(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let atResult = uint32Array.at(2);
    let includesResult = uint32Array.includes(3);
    str = atResult + ',' + includesResult;
  })
  return str;
}

@Concurrent
export async function test_uint32Array_026(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = uint32Array.entries();
    let firstEntry: [number, number] = iterator.next().value;
    str = firstEntry[0] + ',' + firstEntry[1];
  })
  return str;
}

@Concurrent
export async function test_uint32Array_027(uint32Array: collections.Uint32Array, name: string, index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let keysIterator = uint32Array.keys();
    let firstKey: number = keysIterator.next().value;
    let valuesIterator = uint32Array.values();
    let firstValue: number = valuesIterator.next().value;
    str = firstKey + ',' + firstValue;
  })
  return str;
}


@Concurrent
export async function test_uint8ClampedArray_001(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let originalLength = uint8ClampedArray.length;
    uint8ClampedArray[originalLength] = index % 256;
    let temp = uint8ClampedArray[0];
    uint8ClampedArray[0] = uint8ClampedArray[1];
    uint8ClampedArray[1] = temp;
  })
}

@Concurrent
export async function test_uint8ClampedArray_002(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint8ClampedArray.from([index, index + 1, index + 2]);
    uint8ClampedArray[uint8ClampedArray.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint8ClampedArray_003(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint8ClampedArray.from([index, index + 1, index + 2]);
    uint8ClampedArray[uint8ClampedArray.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint8ClampedArray_004(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint8ClampedArray.copyWithin(0, 1, 3);
    let temp = uint8ClampedArray[0];
    uint8ClampedArray[0] = uint8ClampedArray[1];
    uint8ClampedArray[1] = temp;
  })
}

@Concurrent
export async function test_uint8ClampedArray_005(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = uint8ClampedArray.some((element: number) => element < 0);
    let temp = uint8ClampedArray[0];
    uint8ClampedArray[0] = uint8ClampedArray[1];
    uint8ClampedArray[1] = temp;
  })
  return res;
}

@Concurrent
export async function test_uint8ClampedArray_006(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newSet = new Set([index, index + 1, index + 2]);
    let newArray = collections.Uint8ClampedArray.from(newSet);
    uint8ClampedArray[uint8ClampedArray.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint8ClampedArray_007(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint8ClampedArray.from([index, index + 1, index + 2], (value, idx) => value + idx);
    uint8ClampedArray[uint8ClampedArray.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint8ClampedArray_008(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newArray = collections.Uint8ClampedArray.of(index, index + 1, index + 2);
    uint8ClampedArray[uint8ClampedArray.length] = newArray[0];
  })
}

@Concurrent
export async function test_uint8ClampedArray_009(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint8ClampedArray.copyWithin(0, 1, 3);
    let temp = uint8ClampedArray[0];
    uint8ClampedArray[0] = uint8ClampedArray[1];
    uint8ClampedArray[1] = temp;
  })
}

@Concurrent
export async function test_uint8ClampedArray_010(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let temp = uint8ClampedArray[0];
    uint8ClampedArray[0] = uint8ClampedArray[1];
    uint8ClampedArray[1] = temp;
  })
}

@Concurrent
export async function test_uint8ClampedArray_011(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let someResult = uint8ClampedArray.some((element: number) => element < 0);
    let everyResult = uint8ClampedArray.every((element: number) => element >= 0);
    res = someResult || !everyResult;
  })
  return res;
}

@Concurrent
export async function test_uint8ClampedArray_012(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint8ClampedArray.fill(0, 1, 3);
  })
}

@Concurrent
export async function test_uint8ClampedArray_013(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let filteredArray = uint8ClampedArray.filter((element: number) => element % 2 === 0);
    let foundElement = uint8ClampedArray.find((element: number) => element % 2 === 0);
    str = filteredArray.toString() + ',' + foundElement;
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_014(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let findIndexResult = uint8ClampedArray.findIndex((element: number) => element % 2 === 0);
    let indexOfResult = uint8ClampedArray.indexOf(2);
    str = findIndexResult + ',' + indexOfResult;
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_015(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let result = 'forEach_completed';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint8ClampedArray.forEach((value: number, index: number, array: collections.Uint8ClampedArray) => {
      if (value !== array[index]) {
        result = 'forEach_failed';
      }
    });
  })
  return result;
}

@Concurrent
export async function test_uint8ClampedArray_016(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let lastIndexOfResult = uint8ClampedArray.lastIndexOf(2);
    let joinResult = uint8ClampedArray.join('-');
    str = lastIndexOfResult + ',' + joinResult;
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_017(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let mappedArray = uint8ClampedArray.map((value: number) => value * 2);
    str = mappedArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_018(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let reduceResult = uint8ClampedArray.reduce((accumulator: number, value: number) => accumulator + value);
    let reduceWithInitResult = uint8ClampedArray.reduce((accumulator: number, value: number) => accumulator + value, 6);
    str = reduceResult + ',' + reduceWithInitResult;
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_019(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let reduceRightResult = uint8ClampedArray.reduceRight((accumulator: number, value: number) => accumulator + value);
    let reduceRightWithInitResult =
      uint8ClampedArray.reduceRight((accumulator: number, value: number) => accumulator + value, 6);
    str = reduceRightResult + ',' + reduceRightWithInitResult;
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_020(arr: collections.Uint8ClampedArray, name: string, index: number) {
  let numberarr:string[]=[];
  let reversed: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(5)
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    reversed = arr.reverse();
    console.info(`任务${index}翻转后：`, reversed);
  })
  numberarr.push(reversed.toString())
  return numberarr;
}

@Concurrent
export async function test_uint8ClampedArray_021(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let newValues = [100, 101, 102];
    uint8ClampedArray.set(newValues, 0);
  })
}

@Concurrent
export async function test_uint8ClampedArray_022(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let slicedArray = uint8ClampedArray.slice(1, 3);
    str = slicedArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_023(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    uint8ClampedArray.sort((a: number, b: number) => b - a);
  })
}

@Concurrent
export async function test_uint8ClampedArray_024(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let subArray = uint8ClampedArray.subarray(1, 3);
    str = subArray.toString();
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_025(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let atResult = uint8ClampedArray.at(2);
    let includesResult = uint8ClampedArray.includes(3);
    str = atResult + ',' + includesResult;
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_026(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = uint8ClampedArray.entries();
    let firstEntry: [number, number] = iterator.next().value;
    str = firstEntry[0] + ',' + firstEntry[1];
  })
  return str;
}

@Concurrent
export async function test_uint8ClampedArray_027(uint8ClampedArray: collections.Uint8ClampedArray, name: string,
  index: number) {
  let str = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let keysIterator = uint8ClampedArray.keys();
    let firstKey: number = keysIterator.next().value;
    let valuesIterator = uint8ClampedArray.values();
    let firstValue: number = valuesIterator.next().value;
    str = firstKey + ',' + firstValue;
  })
  return str;
}
