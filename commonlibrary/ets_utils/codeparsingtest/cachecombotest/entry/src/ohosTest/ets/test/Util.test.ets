import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

interface UtilObj1 {
  name: string;
}

interface ArrayBufferViewObj1 {
  age: number;
}

interface nullObj1 {}

interface AsyncFunctionObj1 {
  func: () => nullObj1;
}

interface MapObj1 {
  key: string;
}

interface DateObj1 {
  year: number;
  month: number;
}

interface RegExpObj1 {
  pattern: string;
  flags: string;
}

interface TypeArrayObj1 {
  length: number;
}

interface ProxyObj1 {
  name: string;
}

interface ProxyObj2 {
  name: string;
}

interface ProxyObj3 {
  inner: ProxyObj2;
}

interface ProxyObj4 {
  proxy: nullObj1;
}

interface NativeObj1 {
  message: string;
}
interface numberObj{
  gen: () => 2
}

interface WeakMapObj2 {
  key: string;
}

interface SharedArrayBufferObj1 {
  buffer: SharedArrayBuffer;
}

interface ArgumentsObject {
  zero: number;
  length: number;
}

interface ArrayBuffer1 {
  byteLength: number;
}

interface DataView1 {
  buffer: ArrayBuffer;
}

interface FloatArray1 {
  length: number;
}

interface SetObj1 {
  size: number;
}

// 定义 sleep 函数 (Promise 内部也必须用箭头函数)
const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};


export default function Util1Test() {
  describe('Util1Test', () => {
    // 防止 app 崩坏的关键：使用箭头函数写异步钩子
    afterEach(async () => {
      console.info('UtilTest: 休眠 100ms 防止主线程阻塞...');
      // 如果 500ms 还是太慢，可以改小一点，比如 50-100ms
      await sleep(100);
    });

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0100
     * @tc.name Util1Test001
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab1 = new ArrayBuffer(8);
      expect(type.isAnyArrayBuffer(ab1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0200
     * @tc.name Util1Test002
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const sab1 = new SharedArrayBuffer(16);
      expect(type.isAnyArrayBuffer(sab1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0300
     * @tc.name Util1Test003
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj1: UtilObj1 = { name: 'test' };
      expect(type.isAnyArrayBuffer(obj1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0400
     * @tc.name Util1Test004
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr1 = [1, 2, 3];
      expect(type.isAnyArrayBuffer(arr1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0500
     * @tc.name Util1Test005
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dv1 = new DataView(new ArrayBuffer(8));
      expect(type.isAnyArrayBuffer(dv1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0600
     * @tc.name Util1Test006
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num1 = 123;
      expect(type.isAnyArrayBuffer(num1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0700
     * @tc.name Util1Test007
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str1 = 'arraybuffer';
      expect(type.isAnyArrayBuffer(str1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0800
     * @tc.name Util1Test008
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bool1 = true;
      expect(type.isAnyArrayBuffer(bool1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_0900
     * @tc.name Util1Test009
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map1 = new Map<number,number>();
      expect(type.isAnyArrayBuffer(map1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1000
     * @tc.name Util1Test010
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab2 = new ArrayBuffer(0);
      expect(type.isAnyArrayBuffer(ab2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1100
     * @tc.name Util1Test011
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr1 = new Int8Array(8);
      expect(type.isArrayBufferView(int8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1200
     * @tc.name Util1Test012
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr1 = new Uint8Array(16);
      expect(type.isArrayBufferView(uint8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1300
     * @tc.name Util1Test013
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arraybuffer = new ArrayBuffer(8)
      const dv2 = new DataView(arraybuffer);
      expect(type.isArrayBufferView(dv2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1400
     * @tc.name Util1Test014
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr1 = new Float32Array(4);
      expect(type.isArrayBufferView(float32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1500
     * @tc.name Util1Test015
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab3 = new ArrayBuffer(8);
      expect(type.isArrayBufferView(ab3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1600
     * @tc.name Util1Test016
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj2: ArrayBufferViewObj1 = { age: 20 };
      expect(type.isArrayBufferView(obj2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1700
     * @tc.name Util1Test017
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str2 = 'arraybufferview';
      expect(type.isArrayBufferView(str2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1800
     * @tc.name Util1Test018
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set1 = new Set<string>();
      expect(type.isArrayBufferView(set1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_1900
     * @tc.name Util1Test019
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr1 = new Uint32Array(2);
      expect(type.isArrayBufferView(uint32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2000
     * @tc.name Util1Test020
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num2 = 456;
      expect(type.isArrayBufferView(num2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2100
     * @tc.name Util1Test021
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc1 = async () => { return 1; };
      expect(type.isAsyncFunction(asyncFunc1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2200
     * @tc.name Util1Test022
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const normalFunc1 = () => { return 2; };
      expect(type.isAsyncFunction(normalFunc1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2300
     * @tc.name Util1Test023
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc2 = async () => {
      };
      expect(type.isAsyncFunction(asyncFunc2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2400
     * @tc.name Util1Test024
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('Util1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const type = new util.types();
    //   const genFunc1 = new Function();
    //   expect(type.isAsyncFunction(genFunc1)).assertEqual(false);
    // });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2500
     * @tc.name Util1Test025
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj3 = {
        func:  () => {}
      } as AsyncFunctionObj1;
      expect(type.isAsyncFunction(obj3.func)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2600
     * @tc.name Util1Test026
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str3 = 'async function() {}';
      expect(type.isAsyncFunction(str3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2700
     * @tc.name Util1Test027
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num3 = 789;
      expect(type.isAsyncFunction(num3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2800
     * @tc.name Util1Test028
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promise1 = Promise.resolve(1);
      expect(type.isAsyncFunction(promise1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_2900
     * @tc.name Util1Test029
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc3 = async () => await Promise.resolve(3);
      expect(type.isAsyncFunction(asyncFunc3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3000
     * @tc.name Util1Test030
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr2 = [async () => {}, 1, 2];
      expect(type.isAsyncFunction(arr2[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3100
     * @tc.name Util1Test031
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map2 = new Map<number,number>();
      expect(type.isMap(map2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3200
     * @tc.name Util1Test032
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj4: MapObj1 = { key: 'value' };
      expect(type.isMap(obj4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3300
     * @tc.name Util1Test033
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map3 = new Map<string,number | string>([['name', 'test'], ['age', 20]]);
      expect(type.isMap(map3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3400
     * @tc.name Util1Test034
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap1 = new WeakMap<object,string>();
      expect(type.isMap(weakMap1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3500
     * @tc.name Util1Test035
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str4 = 'map';
      expect(type.isMap(str4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3600
     * @tc.name Util1Test036
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num4 = 100;
      expect(type.isMap(num4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3700
     * @tc.name Util1Test037
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr3 = [1, 2, 3];
      expect(type.isMap(arr3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3800
     * @tc.name Util1Test038
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map4 = new Map<string,number>();
      map4.set('id', 1);
      expect(type.isMap(map4)).assertEqual(true);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_3900
     * @tc.name Util1Test039
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isMap(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4000
     * @tc.name Util1Test040
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set2 = new Set<string>();
      expect(type.isMap(set2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4100
     * @tc.name Util1Test041
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promise2 = Promise.resolve(1);
      expect(type.isPromise(promise2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4200
     * @tc.name Util1Test042
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promise3 = new Promise<number>((resolve) => resolve(2));
      expect(type.isPromise(promise3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4300
     * @tc.name Util1Test043
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const error1 = new Error('test')
      const promise4 = Promise.reject(error1);
      expect(type.isPromise(promise4)).assertEqual(true);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4400
     * @tc.name Util1Test044
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const normalFunc2 = () => { return 3; };
      expect(type.isPromise(normalFunc2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4500
     * @tc.name Util1Test045
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj5 = { func: () => {} } as AsyncFunctionObj1;
      expect(type.isPromise(obj5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4600
     * @tc.name Util1Test046
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str5 = 'promise';
      expect(type.isPromise(str5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4700
     * @tc.name Util1Test047
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr4 = [Promise.resolve(1), 2];
      expect(type.isPromise(arr4[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4800
     * @tc.name Util1Test048
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map5 = new Map<string,string>();
      expect(type.isPromise(map5)).assertEqual(false);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_4900
     * @tc.name Util1Test049
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc4 = async () => {};
      expect(type.isPromise(asyncFunc4())).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5000
     * @tc.name Util1Test050
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num5 = 200;
      expect(type.isPromise(num5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5100
     * @tc.name Util1Test051
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const date1 = new Date();
      expect(type.isDate(date1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5200
     * @tc.name Util1Test052
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const date2 = new Date('2025-01-01');
      expect(type.isDate(date2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5300
     * @tc.name Util1Test053
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str6 = '2025-01-01';
      expect(type.isDate(str6)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5400
     * @tc.name Util1Test054
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num6 = 1735689600000;
      expect(type.isDate(num6)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5500
     * @tc.name Util1Test055
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj6: DateObj1 = { year: 2025, month: 1 };
      expect(type.isDate(obj6)).assertEqual(false);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5600
     * @tc.name Util1Test056
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const date3 = new Date(0);
      expect(type.isDate(date3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5700
     * @tc.name Util1Test057
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr5 = [new Date(), 1, 2];
      expect(type.isDate(arr5[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5800
     * @tc.name Util1Test058
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map6 = new Map<number,number>();
      expect(type.isDate(map6)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_5900
     * @tc.name Util1Test059
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullDate = null;
      expect(type.isDate(nullDate)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6000
     * @tc.name Util1Test060
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const undefinedDate = undefined;
      expect(type.isDate(undefinedDate)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6100
     * @tc.name Util1Test061
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg1 = new RegExp('abc');
      expect(type.isRegExp(reg1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6200
     * @tc.name Util1Test062
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg2 = /^test$/;
      expect(type.isRegExp(reg2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6300
     * @tc.name Util1Test063
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str7 = '/^test$/';
      expect(type.isRegExp(str7)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6400
     * @tc.name Util1Test064
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj7: RegExpObj1 = { pattern: 'abc', flags: 'i' };
      expect(type.isRegExp(obj7)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6500
     * @tc.name Util1Test065
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg3 = new RegExp('');
      expect(type.isRegExp(reg3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6600
     * @tc.name Util1Test066
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num7 = 123;
      expect(type.isRegExp(num7)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6700
     * @tc.name Util1Test067
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr6 = [/abc/, 1, 2];
      expect(type.isRegExp(arr6[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6800
     * @tc.name Util1Test068
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set3 = new Set<number>();
      expect(type.isRegExp(set3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_6900
     * @tc.name Util1Test069
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const reg4 = new RegExp('\\d+', 'g');
      expect(type.isRegExp(reg4)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7000
     * @tc.name Util1Test070
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bool2 = true;
      expect(type.isRegExp(bool2)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7100
     * @tc.name Util1Test071
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr1 = new Int16Array(4);
      expect(type.isTypedArray(int16Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7200
     * @tc.name Util1Test072
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8ClampedArr1 = new Uint8ClampedArray(8);
      expect(type.isTypedArray(uint8ClampedArr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7300
     * @tc.name Util1Test073
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr1 = new Float64Array(2);
      expect(type.isTypedArray(float64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7400
     * @tc.name Util1Test074
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr1 = new BigInt64Array(1);
      expect(type.isTypedArray(bigInt64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7500
     * @tc.name Util1Test075
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab4 = new ArrayBuffer(8);
      expect(type.isTypedArray(ab4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7600
     * @tc.name Util1Test076
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab4 = new ArrayBuffer(8);
      const dv3 = new DataView(ab4);
      expect(type.isTypedArray(dv3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7700
     * @tc.name Util1Test077
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str8 = 'typedarray';
      expect(type.isTypedArray(str8)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7800
     * @tc.name Util1Test078
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr1 = new BigUint64Array(3);
      expect(type.isTypedArray(bigUint64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_7900
     * @tc.name Util1Test079
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj8: TypeArrayObj1 = { length: 5 };
      expect(type.isTypedArray(obj8)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8000
     * @tc.name Util1Test080
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr7 = [new Int32Array(), 1, 2];
      expect(type.isTypedArray(arr7[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8100
     * @tc.name Util1Test081
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const target1 = {} as nullObj1;
      const proxy1 = new Proxy(target1, {} as nullObj1);
      expect(type.isProxy(proxy1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8200
     * @tc.name Util1Test082
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nestedObj: ProxyObj3 = { inner: ({ name: 'test' } as ProxyObj2) };
      expect(type.isProxy(nestedObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8300
     * @tc.name Util1Test083
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const target3 = [];
      const nonProxy1 = target3;
      expect(type.isProxy(nonProxy1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8400
     * @tc.name Util1Test084
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const target1 = {} as nullObj1;
      const proxy1 = new Proxy(target1, {} as nullObj1);
      const obj9: ProxyObj4 = { proxy: proxy1 };
      expect(type.isProxy(obj9)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8500
     * @tc.name Util1Test085
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const func3 = () => {};
      const proxy3 = new Proxy(func3, {} as nullObj1);
      expect(type.isProxy(proxy3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8600
     * @tc.name Util1Test086
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str9 = 'proxy';
      expect(type.isProxy(str9)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8700
     * @tc.name Util1Test087
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num8 = 456;
      expect(type.isProxy(num8)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8800
     * @tc.name Util1Test088
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map7 = new Map<number,number>();
      const proxy4 = new Proxy(map7, {} as nullObj1);
      expect(type.isProxy(proxy4)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_8900
     * @tc.name Util1Test089
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullProxy = null;
      expect(type.isProxy(nullProxy)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9000
     * @tc.name Util1Test090
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const date1 = new Date()
      const proxy5 = new Proxy(date1, {} as nullObj1);
      expect(type.isProxy(proxy5)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9100
     * @tc.name Util1Test091
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const error1 = new Error('test error');
      expect(type.isNativeError(error1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9200
     * @tc.name Util1Test092
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const typeError1 = new TypeError('type error');
      expect(type.isNativeError(typeError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9300
     * @tc.name Util1Test093
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const referenceError1 = new ReferenceError('ref error');
      expect(type.isNativeError(referenceError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9400
     * @tc.name Util1Test094
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str10 = 'Error: test error';
      expect(type.isNativeError(str10)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9500
     * @tc.name Util1Test095
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj10: NativeObj1 = { message: 'error' };
      expect(type.isNativeError(obj10)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9600
     * @tc.name Util1Test096
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const rangeError1 = new RangeError('range error');
      expect(type.isNativeError(rangeError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9700
     * @tc.name Util1Test097
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num9 = 789;
      expect(type.isNativeError(num9)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9800
     * @tc.name Util1Test098
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const error1 = new Error()
      const arr8 = [error1, 1, 2];
      expect(type.isNativeError(arr8[0])).assertEqual(true);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_9900
     * @tc.name Util1Test099
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set4 = new Set<number>();
      expect(type.isNativeError(set4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10000
     * @tc.name Util1Test100
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const syntaxError1 = new SyntaxError('syntax error');
      expect(type.isNativeError(syntaxError1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10100
     * @tc.name Util1Test101
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const genFunc2 = () => {
        const values = [1];
        return values[Symbol.iterator]();
      };
      expect(type.isGeneratorFunction(genFunc2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10200
     * @tc.name Util1Test102
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const genFunc3 = () => 2;
      expect(type.isGeneratorFunction(genFunc3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10300
     * @tc.name Util1Test103
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const normalFunc3 = () => { return 1; };
      expect(type.isGeneratorFunction(normalFunc3)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10400
     * @tc.name Util1Test104
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const asyncFunc5 = async () => {};
      expect(type.isGeneratorFunction(asyncFunc5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10500
     * @tc.name Util1Test105
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj11 = { gen: () => 2 } as numberObj;
      expect(type.isGeneratorFunction(obj11.gen)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10600
     * @tc.name Util1Test106
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str11 = 'function* () { yield 1; }';
      expect(type.isGeneratorFunction(str11)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10700
     * @tc.name Util1Test107
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num10 = 100;
      expect(type.isGeneratorFunction(num10)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10800
     * @tc.name Util1Test108
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr9 = [() => 2, 1, 2];
      expect(type.isGeneratorFunction(arr9[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_10900
     * @tc.name Util1Test109
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map8 = new Map<number,number>();
      expect(type.isGeneratorFunction(map8)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11000
     * @tc.name Util1Test110
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const genFunc2 = () => 2;
      const genObj1 = genFunc2();
      expect(type.isGeneratorFunction(genObj1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11100
     * @tc.name Util1Test111
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap2 = new WeakMap<object,string>();
      expect(type.isWeakMap(weakMap2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11200
     * @tc.name Util1Test112
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakMap3 = new WeakMap<nullObj1,string>([[key1, 'value1']]);
      expect(type.isWeakMap(weakMap3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11300
     * @tc.name Util1Test113
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map9 = new Map<number,number>();
      expect(type.isWeakMap(map9)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11400
     * @tc.name Util1Test114
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const obj12: WeakMapObj2 = { key: 'value' };
      expect(type.isWeakMap(obj12)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11500
     * @tc.name Util1Test115
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str12 = 'weakmap';
      expect(type.isWeakMap(str12)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11600
     * @tc.name Util1Test116
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num11 = 200;
      expect(type.isWeakMap(num11)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11700
     * @tc.name Util1Test117
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap4 = new WeakMap<object,number>();
      weakMap4.set({} as nullObj1, 100);
      expect(type.isWeakMap(weakMap4)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11800
     * @tc.name Util1Test118
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weak = new WeakMap<object,number>();
      const arr10 = [weak, 1, 2];
      expect(type.isWeakMap(arr10[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_11900
     * @tc.name Util1Test119
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set5 = new Set<number>();
      expect(type.isWeakMap(set5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12000
     * @tc.name Util1Test120
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSet1 = new WeakSet<object>();
      expect(type.isWeakMap(weakSet1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12100
     * @tc.name Util1Test121
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullSab = null;
      expect(type.isSharedArrayBuffer(nullSab)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12200
     * @tc.name Util1Test122
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const sab2 = new SharedArrayBuffer(16);
      expect(type.isSharedArrayBuffer(sab2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12300
     * @tc.name Util1Test123
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab5 = new ArrayBuffer(16);
      expect(type.isSharedArrayBuffer(ab5)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12400
     * @tc.name Util1Test124
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const sab3 = new SharedArrayBuffer(0);
      expect(type.isSharedArrayBuffer(sab3)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12500
     * @tc.name Util1Test125
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const str16 = 'sharedarraybuffer';
      expect(type.isSharedArrayBuffer(str16)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12600
     * @tc.name Util1Test126
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const sab2 = new SharedArrayBuffer(16);
      const obj17: SharedArrayBufferObj1 = { buffer: sab2 };
      expect(type.isSharedArrayBuffer(obj17)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12700
     * @tc.name Util1Test127
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const num15 = 500;
      expect(type.isSharedArrayBuffer(num15)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12800
     * @tc.name Util1Test128
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrayBuffer = new SharedArrayBuffer(8)
      const arr15 = [arrayBuffer, 1, 2];
      expect(type.isSharedArrayBuffer(arr15[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_12900
     * @tc.name Util1Test129
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const sab2 = new SharedArrayBuffer(16);
      const dv4 = new DataView(sab2);
      expect(type.isSharedArrayBuffer(dv4)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13000
     * @tc.name Util1Test130
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map13 = new Map<number,number>();
      expect(type.isSharedArrayBuffer(map13)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13100
     * @tc.name Util1Test131
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const emptyObj = {} as nullObj1;
      expect(type.isModuleNamespaceObject(emptyObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13200
     * @tc.name Util1Test132
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'module';
      expect(type.isModuleNamespaceObject(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13300
     * @tc.name Util1Test133
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 123;
      expect(type.isModuleNamespaceObject(numVal)).assertEqual(false);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13400
     * @tc.name Util1Test134
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolVal = true;
      expect(type.isModuleNamespaceObject(boolVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13500
     * @tc.name Util1Test135
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrVal = [1, 2, 3];
      expect(type.isModuleNamespaceObject(arrVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13600
     * @tc.name Util1Test136
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number,number>();
      expect(type.isModuleNamespaceObject(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13700
     * @tc.name Util1Test137
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dateVal = new Date();
      expect(type.isModuleNamespaceObject(dateVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13800
     * @tc.name Util1Test138
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const regVal = new RegExp('test');
      expect(type.isModuleNamespaceObject(regVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_13900
     * @tc.name Util1Test139
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isModuleNamespaceObject(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14000
     * @tc.name Util1Test140
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const undefinedVal = undefined;
      expect(type.isModuleNamespaceObject(undefinedVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14100
     * @tc.name Util1Test141
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const argsObj1 = {} as nullObj1;
      expect(type.isArgumentsObject(argsObj1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14200
     * @tc.name Util1Test142
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const emptyArr = [];
      expect(type.isArgumentsObject(emptyArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14300
     * @tc.name Util1Test143
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj: ArgumentsObject = { zero: 1, length: 1 };
      expect(type.isArgumentsObject(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14400
     * @tc.name Util1Test144
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 123;
      expect(type.isArgumentsObject(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14500
     * @tc.name Util1Test145
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'arguments';
      expect(type.isArgumentsObject(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14600
     * @tc.name Util1Test146
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number,number>();
      expect(type.isArgumentsObject(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14700
     * @tc.name Util1Test147
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrWithArgs = [arguments, 'test'];
      expect(type.isArgumentsObject(arrWithArgs[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14800
     * @tc.name Util1Test148
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isArgumentsObject(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_14900
     * @tc.name Util1Test149
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isArgumentsObject(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15000
     * @tc.name Util1Test150
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const argsObj1 = arguments
      expect(type.isArgumentsObject(argsObj1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15100
     * @tc.name Util1Test151
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      expect(type.isExternal(ab)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15200
     * @tc.name Util1Test152
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'external';
      expect(type.isExternal(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15300
     * @tc.name Util1Test153
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 123;
      expect(type.isExternal(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15400
     * @tc.name Util1Test154
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number,number>();
      expect(type.isExternal(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15500
     * @tc.name Util1Test155
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isExternal(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15600
     * @tc.name Util1Test156
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isExternal(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15700
     * @tc.name Util1Test157
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const undefinedVal = undefined;
      expect(type.isExternal(undefinedVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15800
     * @tc.name Util1Test158
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dateVal = new Date();
      expect(type.isExternal(dateVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_15900
     * @tc.name Util1Test159
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const regVal = new RegExp(/^external$/);
      expect(type.isExternal(regVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16000
     * @tc.name Util1Test160
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolObj = new Boolean(false);
      expect(type.isExternal(boolObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16100
     * @tc.name Util1Test161
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv1 = new DataView(ab);
      expect(type.isDataView(dv1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16200
     * @tc.name Util1Test162
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv2 = new DataView(ab, 2, 8);
      expect(type.isDataView(dv2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16300
     * @tc.name Util1Test163
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const plainObj: DataView1 = { buffer: ab };
      expect(type.isDataView(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16400
     * @tc.name Util1Test164
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'dataview';
      expect(type.isDataView(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16500
     * @tc.name Util1Test165
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 16;
      expect(type.isDataView(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16600
     * @tc.name Util1Test166
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv1 = new DataView(ab);
      const arrWithDv = [dv1, 'test'];
      expect(type.isDataView(arrWithDv[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16700
     * @tc.name Util1Test167
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const int8Arr = new Int8Array(ab);
      expect(type.isDataView(int8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16800
     * @tc.name Util1Test168
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isDataView(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_16900
     * @tc.name Util1Test169
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isDataView(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17000
     * @tc.name Util1Test170
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      expect(type.isDataView(ab)).assertEqual(false);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17100
     * @tc.name Util1Test171
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr2 = new Float32Array(8);
      expect(type.isFloat32Array(float32Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17200
     * @tc.name Util1Test172
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr = new Float64Array();
      expect(type.isFloat32Array(float64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17300
     * @tc.name Util1Test173
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      expect(type.isFloat32Array(ab)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17400
     * @tc.name Util1Test174
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj: FloatArray1 = { length: 8 };
      expect(type.isFloat32Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17500
     * @tc.name Util1Test175
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'float32array';
      expect(type.isFloat32Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17600
     * @tc.name Util1Test176
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr2 = new Float32Array(8);
      const arrWithFloat32 = [float32Arr2, 'test'];
      expect(type.isFloat32Array(arrWithFloat32[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17700
     * @tc.name Util1Test177
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 8;
      expect(type.isFloat32Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17800
     * @tc.name Util1Test178
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isFloat32Array(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_17900
     * @tc.name Util1Test179
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isFloat32Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18000
     * @tc.name Util1Test180
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr1 = new Float32Array();
      expect(type.isFloat32Array(float32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18100
     * @tc.name Util1Test181
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const normalFunc = () => {};
      expect(type.isGeneratorObject(normalFunc)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18200
     * @tc.name Util1Test182
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'generator';
      expect(type.isGeneratorObject(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18300
     * @tc.name Util1Test183
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrVal = [1, 2, 3];
      expect(type.isGeneratorObject(arrVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18400
     * @tc.name Util1Test184
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 123;
      expect(type.isGeneratorObject(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18500
     * @tc.name Util1Test185
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isGeneratorObject(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18600
     * @tc.name Util1Test186
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isGeneratorObject(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18700
     * @tc.name Util1Test187
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullMap = new Map<number,number>();
      expect(type.isGeneratorObject(nullMap)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18800
     * @tc.name Util1Test188
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullObj = {} as nullObj1;
      expect(type.isGeneratorObject(nullObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_18900
     * @tc.name Util1Test189
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set1 = new Set<number>();
      expect(type.isGeneratorObject(set1)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19000
     * @tc.name Util1Test190
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const func = () => {}
      expect(type.isGeneratorObject(func)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19100
     * @tc.name Util1Test191
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set1 = new Set<number>();
      expect(type.isSet(set1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19200
     * @tc.name Util1Test192
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set2 = new Set<number>([1, 2, 3]);
      expect(type.isSet(set2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19300
     * @tc.name Util1Test193
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number,number>();
      expect(type.isSet(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19400
     * @tc.name Util1Test194
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrVal = [1, 2, 3];
      expect(type.isSet(arrVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19500
     * @tc.name Util1Test195
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj: SetObj1 = { size: 3 };
      expect(type.isSet(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19600
     * @tc.name Util1Test196
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'set';
      expect(type.isSet(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19700
     * @tc.name Util1Test197
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set2 = new Set<number>([1, 2, 3]);
      const arrWithSet = [set2, 'test'];
      expect(type.isSet(arrWithSet[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19800
     * @tc.name Util1Test198
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 3;
      expect(type.isSet(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_19900
     * @tc.name Util1Test199
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isSet(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20000
     * @tc.name Util1Test200
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSetVal = new WeakSet<object>();
      expect(type.isSet(weakSetVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20100
     * @tc.name Util1Test201
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr1 = new Float64Array();
      expect(type.isFloat64Array(float64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20200
     * @tc.name Util1Test202
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr2 = new Float64Array(10);
      expect(type.isFloat64Array(float64Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20300
     * @tc.name Util1Test203
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float32Arr = new Float32Array();
      expect(type.isFloat64Array(float32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20400
     * @tc.name Util1Test204
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(32);
      expect(type.isFloat64Array(ab)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20500
     * @tc.name Util1Test205
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { byteLength: 32 } as ArrayBuffer1;
      expect(type.isFloat64Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20600
     * @tc.name Util1Test206
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'float64array';
      expect(type.isFloat64Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20700
     * @tc.name Util1Test207
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const float64Arr2 = new Float64Array(10);
      const arrWithFloat64 = [float64Arr2, 'test'];
      expect(type.isFloat64Array(arrWithFloat64[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20800
     * @tc.name Util1Test208
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr = new BigInt64Array();
      expect(type.isFloat64Array(bigInt64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_20900
     * @tc.name Util1Test209
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isFloat64Array(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21000
     * @tc.name Util1Test210
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dateVal = new Date();
      expect(type.isFloat64Array(dateVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21100
     * @tc.name Util1Test211
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr1 = new Int8Array();
      expect(type.isInt8Array(int8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21200
     * @tc.name Util1Test212
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const int8Arr2 = new Int8Array(ab);
      expect(type.isInt8Array(int8Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21300
     * @tc.name Util1Test213
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr = new Uint8Array();
      expect(type.isInt8Array(uint8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21400
     * @tc.name Util1Test214
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr = new Int16Array();
      expect(type.isInt8Array(int16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21500
     * @tc.name Util1Test215
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainArr = [1, 2, 3];
      expect(type.isInt8Array(plainArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21600
     * @tc.name Util1Test216
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 8;
      expect(type.isInt8Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21700
     * @tc.name Util1Test217
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const int8Arr2 = new Int8Array(ab);
      const arrWithInt8 = [int8Arr2, 'test'];
      expect(type.isInt8Array(arrWithInt8[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21800
     * @tc.name Util1Test218
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'int8array';
      expect(type.isInt8Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_21900
     * @tc.name Util1Test219
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const undefinedVal = undefined;
      expect(type.isInt8Array(undefinedVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22000
     * @tc.name Util1Test220
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number,number>();
      expect(type.isInt8Array(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22100
     * @tc.name Util1Test221
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr1 = new Int16Array();
      expect(type.isInt16Array(int16Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22200
     * @tc.name Util1Test222
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr2 = new Int16Array([10, 20, 30]);
      expect(type.isInt16Array(int16Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22300
     * @tc.name Util1Test223
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr = new Int8Array();
      expect(type.isInt16Array(int8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22400
     * @tc.name Util1Test224
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isInt16Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22500
     * @tc.name Util1Test225
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = {} as nullObj1;
      expect(type.isInt16Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22600
     * @tc.name Util1Test226
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolVal = true;
      expect(type.isInt16Array(boolVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22700
     * @tc.name Util1Test227
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr2 = new Int16Array([10, 20, 30]);
      const arrWithInt16 = [int16Arr2, 'test'];
      expect(type.isInt16Array(arrWithInt16[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22800
     * @tc.name Util1Test228
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isInt16Array(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_22900
     * @tc.name Util1Test229
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isInt16Array(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23000
     * @tc.name Util1Test230
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const dv = new DataView(ab);
      expect(type.isInt16Array(dv)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23100
     * @tc.name Util1Test231
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr1 = new Int32Array();
      expect(type.isInt32Array(int32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23200
     * @tc.name Util1Test232
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr2 = new Int32Array(5);
      expect(type.isInt32Array(int32Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23300
     * @tc.name Util1Test233
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr = new Uint32Array();
      expect(type.isInt32Array(uint32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23400
     * @tc.name Util1Test234
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr = new Int16Array();
      expect(type.isInt32Array(int16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23500
     * @tc.name Util1Test235
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'int32array';
      expect(type.isInt32Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23600
     * @tc.name Util1Test236
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 5;
      expect(type.isInt32Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23700
     * @tc.name Util1Test237
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr2 = new Int32Array(5);
      const arrWithInt32 = [int32Arr2, 'test'];
      expect(type.isInt32Array(arrWithInt32[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23800
     * @tc.name Util1Test238
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const setVal = new Set<number>();
      expect(type.isInt32Array(setVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_23900
     * @tc.name Util1Test239
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const undefinedVal = undefined;
      expect(type.isInt32Array(undefinedVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24000
     * @tc.name Util1Test240
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const errorVal = new Error('test');
      expect(type.isInt32Array(errorVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24100
     * @tc.name Util1Test241
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string,number>([['a', 1], ['b', 2]]);
      const mapKeysIter = map.keys();
      expect(type.isMapIterator(mapKeysIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24200
     * @tc.name Util1Test242
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string,number>([['a', 1], ['b', 2]]);
      const mapValsIter = map.values();
      expect(type.isMapIterator(mapValsIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24300
     * @tc.name Util1Test243
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string,number>([['a', 1], ['b', 2]]);
      const mapEntriesIter = map.entries();
      expect(type.isMapIterator(mapEntriesIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24400
     * @tc.name Util1Test244
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>();
      const setIter = set.keys();
      expect(type.isMapIterator(setIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24500
     * @tc.name Util1Test245
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr = [1, 2];
      const arrIter = arr[Symbol.iterator]();
      expect(type.isMapIterator(arrIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24600
     * @tc.name Util1Test246
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string,number>([['a', 1], ['b', 2]]);
      expect(type.isMapIterator(map)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24700
     * @tc.name Util1Test247
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'map iterator';
      expect(type.isMapIterator(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24800
     * @tc.name Util1Test248
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<string,number>([['a', 1], ['b', 2]]);
      const mapKeysIter = map.keys();
      const arrWithMapIter = [mapKeysIter, 'test'];
      expect(type.isMapIterator(arrWithMapIter[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_24900
     * @tc.name Util1Test249
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isMapIterator(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25000
     * @tc.name Util1Test250
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 100;
      expect(type.isMapIterator(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25100
     * @tc.name Util1Test251
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setKeysIter = set.keys();
      expect(type.isSetIterator(setKeysIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25200
     * @tc.name Util1Test252
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setValsIter = set.values();
      expect(type.isSetIterator(setValsIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25300
     * @tc.name Util1Test253
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setEntriesIter = set.entries();
      expect(type.isSetIterator(setEntriesIter)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25400
     * @tc.name Util1Test254
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const map = new Map<number,number>();
      const mapIter = map.keys();
      expect(type.isSetIterator(mapIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25500
     * @tc.name Util1Test255
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arr = [1, 2];
      const arrIter = arr[Symbol.iterator]();
      expect(type.isSetIterator(arrIter)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25600
     * @tc.name Util1Test256
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      expect(type.isSetIterator(set)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25700
     * @tc.name Util1Test257
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'set iterator';
      expect(type.isSetIterator(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25800
     * @tc.name Util1Test258
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const set = new Set<number>([1, 2, 3]);
      const setKeysIter = set.keys();
      const arrWithSetIter = [setKeysIter, 'test'];
      expect(type.isSetIterator(arrWithSetIter[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_25900
     * @tc.name Util1Test259
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isSetIterator(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26000
     * @tc.name Util1Test260
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolVal = false;
      expect(type.isSetIterator(boolVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26100
     * @tc.name Util1Test261
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr1 = new Uint8Array();
      expect(type.isUint8Array(uint8Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26200
     * @tc.name Util1Test262
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const uint8Arr2 = new Uint8Array(ab);
      expect(type.isUint8Array(uint8Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26300
     * @tc.name Util1Test263
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8ClampedArr = new Uint8ClampedArray();
      expect(type.isUint8Array(uint8ClampedArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26400
     * @tc.name Util1Test264
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int8Arr = new Int8Array();
      expect(type.isUint8Array(int8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26500
     * @tc.name Util1Test265
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { byteLength: 8 } as ArrayBuffer1;
      expect(type.isUint8Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26600
     * @tc.name Util1Test266
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 8;
      expect(type.isUint8Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26700
     * @tc.name Util1Test267
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const uint8Arr2 = new Uint8Array(ab);
      const arrWithUint8 = [uint8Arr2, 'test'];
      expect(type.isUint8Array(arrWithUint8[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26800
     * @tc.name Util1Test268
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'uint8array';
      expect(type.isUint8Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_26900
     * @tc.name Util1Test269
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isUint8Array(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27000
     * @tc.name Util1Test270
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMapVal = new WeakMap<object,number>();
      expect(type.isUint8Array(weakMapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27100
     * @tc.name Util1Test271
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8ClampedArr1 = new Uint8ClampedArray();
      expect(type.isUint8ClampedArray(uint8ClampedArr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27200
     * @tc.name Util1Test272
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const uint8ClampedArr2 = new Uint8ClampedArray(ab);
      expect(type.isUint8ClampedArray(uint8ClampedArr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27300
     * @tc.name Util1Test273
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint8Arr = new Uint8Array();
      expect(type.isUint8ClampedArray(uint8Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27400
     * @tc.name Util1Test274
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr = new Uint16Array();
      expect(type.isUint8ClampedArray(uint16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27500
     * @tc.name Util1Test275
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainArr = [255, 256];
      expect(type.isUint8ClampedArray(plainArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27600
     * @tc.name Util1Test276
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 16;
      expect(type.isUint8ClampedArray(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27700
     * @tc.name Util1Test277
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const uint8ClampedArr2 = new Uint8ClampedArray(ab);
      const arrWithUint8Clamped = [uint8ClampedArr2, 'test'];
      expect(type.isUint8ClampedArray(arrWithUint8Clamped[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27800
     * @tc.name Util1Test278
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'uint8clampedarray';
      expect(type.isUint8ClampedArray(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_27900
     * @tc.name Util1Test279
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isUint8ClampedArray(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28000
     * @tc.name Util1Test280
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isUint8ClampedArray(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28100
     * @tc.name Util1Test281
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr1 = new Uint16Array();
      expect(type.isUint16Array(uint16Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28200
     * @tc.name Util1Test282
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr2 = new Uint16Array([100, 200]);
      expect(type.isUint16Array(uint16Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28300
     * @tc.name Util1Test283
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr = new Uint32Array();
      expect(type.isUint16Array(uint32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28400
     * @tc.name Util1Test284
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int16Arr = new Int16Array();
      expect(type.isUint16Array(int16Arr)).assertEqual(false);

    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28500
     * @tc.name Util1Test285
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { length: 2 } as FloatArray1;
      expect(type.isUint16Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28600
     * @tc.name Util1Test286
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const boolVal = true;
      expect(type.isUint16Array(boolVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28700
     * @tc.name Util1Test287
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr2 = new Uint16Array([100, 200]);
      const arrWithUint16 = [uint16Arr2, 'test'];
      expect(type.isUint16Array(arrWithUint16[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28800
     * @tc.name Util1Test288
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<number,number>();
      expect(type.isUint16Array(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_28900
     * @tc.name Util1Test289
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const undefinedVal = undefined;
      expect(type.isUint16Array(undefinedVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29000
     * @tc.name Util1Test290
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(8);
      const dv = new DataView(ab);
      expect(type.isUint16Array(dv)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29100
     * @tc.name Util1Test291
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const errorVal = new Error('test');
      expect(type.isUint32Array(errorVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29200
     * @tc.name Util1Test292
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr1 = new Uint32Array();
      expect(type.isUint32Array(uint32Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29300
     * @tc.name Util1Test293
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr2 = new Uint32Array(6);
      expect(type.isUint32Array(uint32Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29400
     * @tc.name Util1Test294
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isUint32Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29500
     * @tc.name Util1Test295
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint16Arr = new Uint16Array();
      expect(type.isUint32Array(uint16Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29600
     * @tc.name Util1Test296
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'uint32array';
      expect(type.isUint32Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29700
     * @tc.name Util1Test297
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 6;
      expect(type.isUint32Array(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29800
     * @tc.name Util1Test298
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr2 = new Uint32Array(6);
      const arrWithUint32 = [uint32Arr2, 'test'];
      expect(type.isUint32Array(arrWithUint32[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_29900
     * @tc.name Util1Test299
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const setVal = new Set<number>();
      expect(type.isUint32Array(setVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30000
     * @tc.name Util1Test300
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isUint32Array(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30100
     * @tc.name Util1Test301
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMap1 = new WeakMap<object,number>();
      expect(type.isWeakMap(weakMap1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30200
     * @tc.name Util1Test302
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakMap2 = new WeakMap<nullObj1,string>([[key1, 'value']]);
      expect(type.isWeakMap(weakMap2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30300
     * @tc.name Util1Test303
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const mapVal = new Map<string,string>();
      expect(type.isWeakMap(mapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30400
     * @tc.name Util1Test304
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSetVal = new WeakSet<object>();
      expect(type.isWeakMap(weakSetVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30500
     * @tc.name Util1Test305
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { key: 'value' } as MapObj1;
      expect(type.isWeakMap(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30600
     * @tc.name Util1Test306
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'weakmap';
      expect(type.isWeakMap(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30700
     * @tc.name Util1Test307
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakMap2 = new WeakMap<nullObj1,string>([[key1, 'value']]);
      const arrWithWeakMap = [weakMap2, 'test'];
      expect(type.isWeakMap(arrWithWeakMap[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30800
     * @tc.name Util1Test308
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 100;
      expect(type.isWeakMap(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_30900
     * @tc.name Util1Test309
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isWeakMap(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31000
     * @tc.name Util1Test310
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const arrVal = [1, 2, 3];
      expect(type.isWeakMap(arrVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31100
     * @tc.name Util1Test311
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakSet1 = new WeakSet();
      expect(type.isWeakSet(weakSet1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31200
     * @tc.name Util1Test312
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakSet2 = new WeakSet<nullObj1>([key1]);
      expect(type.isWeakSet(weakSet2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31300
     * @tc.name Util1Test313
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const setVal = new Set<number>();
      expect(type.isWeakSet(setVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31400
     * @tc.name Util1Test314
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMapVal = new WeakMap<object,string>();
      expect(type.isWeakSet(weakMapVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31500
     * @tc.name Util1Test315
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainArr = [{} as nullObj1, []];
      expect(type.isWeakSet(plainArr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31600
     * @tc.name Util1Test316
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'weakset';
      expect(type.isWeakSet(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31700
     * @tc.name Util1Test317
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const key1 = {} as nullObj1;
      const weakSet2 = new WeakSet<nullObj1>([key1]);
      const arrWithWeakSet = [weakSet2, 'test'];
      expect(type.isWeakSet(arrWithWeakSet[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31800
     * @tc.name Util1Test318
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const numVal = 200;
      expect(type.isWeakSet(numVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_31900
     * @tc.name Util1Test319
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isWeakSet(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32000
     * @tc.name Util1Test320
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const dateVal = new Date();
      expect(type.isWeakSet(dateVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32100
     * @tc.name Util1Test321
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr1 = new BigInt64Array();
      expect(type.isBigInt64Array(bigInt64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32200
     * @tc.name Util1Test322
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const bigInt64Arr2 = new BigInt64Array(ab);
      expect(type.isBigInt64Array(bigInt64Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32300
     * @tc.name Util1Test323
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr = new BigUint64Array();
      expect(type.isBigInt64Array(bigUint64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32400
     * @tc.name Util1Test324
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const int32Arr = new Int32Array();
      expect(type.isBigInt64Array(int32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32500
     * @tc.name Util1Test325
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { byteLength: 16 } as ArrayBuffer1;
      expect(type.isBigInt64Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32600
     * @tc.name Util1Test326
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigIntVal = BigInt(123);
      expect(type.isBigInt64Array(bigIntVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32700
     * @tc.name Util1Test327
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const ab = new ArrayBuffer(16);
      const bigInt64Arr2 = new BigInt64Array(ab);
      const arrWithBigInt64 = [bigInt64Arr2, 'test'];
      expect(type.isBigInt64Array(arrWithBigInt64[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32800
     * @tc.name Util1Test328
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'bigint64array';
      expect(type.isBigInt64Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_32900
     * @tc.name Util1Test329
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isBigInt64Array(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33000
     * @tc.name Util1Test330
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const promiseVal = Promise.resolve();
      expect(type.isBigInt64Array(promiseVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33100
     * @tc.name Util1Test331
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr1 = new BigUint64Array();
      expect(type.isBigUint64Array(bigUint64Arr1)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33200
     * @tc.name Util1Test332
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr2 = new BigUint64Array([BigInt(100), BigInt(200)]);
      expect(type.isBigUint64Array(bigUint64Arr2)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33300
     * @tc.name Util1Test333
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigInt64Arr = new BigInt64Array();
      expect(type.isBigUint64Array(bigInt64Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33400
     * @tc.name Util1Test334
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const uint32Arr = new Uint32Array();
      expect(type.isBigUint64Array(uint32Arr)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33500
     * @tc.name Util1Test335
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const plainObj = { length: 2 } as TypeArrayObj1;
      expect(type.isBigUint64Array(plainObj)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33600
     * @tc.name Util1Test336
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigIntVal = BigInt(300);
      expect(type.isBigUint64Array(bigIntVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33700
     * @tc.name Util1Test337
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const bigUint64Arr2 = new BigUint64Array([BigInt(100), BigInt(200)]);
      const arrWithBigUint64 = [bigUint64Arr2, 'test'];
      expect(type.isBigUint64Array(arrWithBigUint64[0])).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33800
     * @tc.name Util1Test338
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const strVal = 'biguint64array';
      expect(type.isBigUint64Array(strVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_33900
     * @tc.name Util1Test339
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const nullVal = null;
      expect(type.isBigUint64Array(nullVal)).assertEqual(false);
    });
    /**
     * @tc.number SUB_BUILTINS_Util1_TEST_34000
     * @tc.name Util1Test340
     * @tc.desc test Util types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Util1Test340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const type = new util.types();
      const weakMapVal = new WeakMap<object,number>();
      expect(type.isBigUint64Array(weakMapVal)).assertEqual(false);
    });
  })
}

