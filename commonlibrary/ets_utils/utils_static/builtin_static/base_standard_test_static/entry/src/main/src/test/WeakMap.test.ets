import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

interface GeneratedObjectLiteralInterface_4 {}

interface GeneratedObjectLiteralInterface_7 {
  key?: number | string | undefined;
}

interface GeneratedObjectLiteralInterface_1 {
  name: string;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
}

export default function WeakMapTest() {

  describe('weakMapTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0100
     * @tc.name testWeakMap0001
     * @tc.desc Test the function of the weakMap function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMap0001";
      try {
        let weakMap: WeakMap<object, number> = new WeakMap<object, number>();
        let a = new Object();
        weakMap.set(a, 123);
        let value = weakMap.get(a);
        expect(String(value)).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0300
     * @tc.name testWeakMapDelete0001
     * @tc.desc Test the function of the WeakMap.prototype.delete().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapDelete0001";
      try {
        const weakMap1 = new WeakMap<Object, number>();
        let a = new Object();
        weakMap1.set(a, 1);
        expect(String(weakMap1.delete(a))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0400
     * @tc.name testWeakMapDelete0002
     * @tc.desc Test the function of the WeakMap.prototype.delete().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapDelete0002";
      try {
        const weakMap1 = new WeakMap<Object, number>();
        let a = new Object();
        let b = 0;
        weakMap1.set(a, 1);
        expect(String(weakMap1.delete(b))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0500
     * @tc.name testWeakMapDelete0005
     * @tc.desc Test the function of the WeakMap.prototype.delete().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapDelete0005";
      try {
        const weakMap: WeakMap<object, number> = new WeakMap<object, number>();


        let a: GeneratedObjectLiteralInterface_7 = {
          key: undefined
        };
        expect(String(weakMap.delete(a))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0600
     * @tc.name testWeakMapGet0001
     * @tc.desc Test the function of the ccc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapGet0001";
      try {
        let weakMap = new WeakMap<object, string>();


        let key: GeneratedObjectLiteralInterface_4 = {}
        let value = weakMap.get(key);
        expect(value).assertEqual(undefined);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0700
     * @tc.name testWeakMapGet0002
     * @tc.desc Test the function of the WeakMap.prototype.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapGet0002";
      try {
        let weakMap = new WeakMap<object, string>();


        let key: GeneratedObjectLiteralInterface_4 = {}
        weakMap.set(key, "aaa");
        let value = weakMap.get(key);
        expect(value).assertEqual("aaa");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0800
     * @tc.name testWeakMapGet0003
     * @tc.desc Test the function of the WeakMap.prototype.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapGet0003";
      try {
        let weakMap = new WeakMap<Object, string>();


        let a: GeneratedObjectLiteralInterface_1 = {
          name: "weiwei"
        }
        let b: GeneratedObjectLiteralInterface_2 = {
          name: "huihui"
        }
        let c = new Object();

        weakMap.set(a, 'weiwei');
        weakMap.set(b, 'huihui');
        weakMap.set(c, 'zhenzhen');
        expect(weakMap.get(a)).assertEqual('weiwei');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_0900
     * @tc.name testWeakMapGet0005
     * @tc.desc Test the function of the WeakMap.prototype.get().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapGet0005";
      try {
        let result: WeakMap<object, number> = new WeakMap<object, number>();
        let key: string[] = [];
        expect(result.get(key)).assertEqual(undefined);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1000
     * @tc.name testWeakMapGet0006
     * @tc.desc Test the function of the WeakMap.prototype.get().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapGet0006";
      try {
        let result: WeakMap<object, string> = new WeakMap<object, string>();
        let key: string[] = [];
        result.set(key, "values1");
        expect(result.get(key)).assertEqual("values1");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1100
     * @tc.name testWeakMapGet0007
     * @tc.desc Test the function of the WeakMap.prototype.get().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapGet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapGet0007";
      try {
        let result: WeakMap<object, string> = new WeakMap<object, string>();
        let key1: string[] = [];
        let key2: string[] = [];
        let key3: string[] = [];
        result.set(key1, "value1");
        result.set(key2, "value2");
        result.set(key3, "value3");
        expect(result.get(key1)).assertEqual("value1");
        expect(result.get(key2)).assertEqual("value2");
        expect(result.get(key3)).assertEqual("value3");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1200
     * @tc.name testWeakMapGet0008
     * @tc.desc Test the function of the WeakMap.prototype.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapGet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapGet0008";
      try {
        let result: WeakMap<object, string> = new WeakMap<object, string>();
        let key: string[] = [];
        result.set(key, "undefined");
        expect(result.get(key)).assertEqual("undefined");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1300
     * @tc.name testWeakMapHas0001
     * @tc.desc Test the function of the Interface WeakMap.has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testWeakMapHas0001';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap<object, string>();
        let key: string[] = [];
        expect(weakMap.has(key)).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1400
     * @tc.name testWeakMapHas0002
     * @tc.desc Test the function of the Interface WeakMap.has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testWeakMapHas0002';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap<object, string>();
        let key1 = ["姓名"];
        let value1 = '张三';
        weakMap.set(key1, value1);
        expect(weakMap.has(key1)).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1500
     * @tc.name testWeakMapHas0003
     * @tc.desc Test the function of the Interface WeakMap.has().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testWeakMapHas0003';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap<object, string>();
        const key1: string[] = [];
        const key2: string[] = [];
        const key3: string[] = [];
        const value1 = 'value1';
        const value2 = 'value2';
        const value3 = 'value3';
        weakMap.set(key1, value1);
        weakMap.set(key2, value2);
        weakMap.set(key3, value3);
        expect(weakMap.has(key1)).assertTrue();
        expect(weakMap.has(key2)).assertTrue();
        expect(weakMap.has(key3)).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1600
     * @tc.name testWeakMapHas0004
     * @tc.desc Test the function of the Interface has.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testWeakMapHas0004';
      try {
        let weakMap: WeakMap<object, string> = new WeakMap<object, string>();
        let a: Partial<GeneratedObjectLiteralInterface_4> = {};
        expect(String(weakMap.has(a))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1700
     * @tc.name testWeakMapHas0006
     * @tc.desc Test the function of the Interface has.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapHas0006";
      try {
        const weakMap1 = new WeakMap<object, string>();
        let a = new Object();
        weakMap1.set(a, 'asd');
        weakMap1.delete(a);
        weakMap1.set(a, 'tqj');
        let value = weakMap1.has(a);
        expect(String(value)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1800
     * @tc.name testWeakMapSet0001
     * @tc.desc Test the function of the Interface set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapSet0001";
      try {
        const weakMap1: WeakMap<object, string> = new WeakMap<object, string>();

        let object1: GeneratedObjectLiteralInterface_4 = {};
        weakMap1.set(object1, 'foo');
        expect(weakMap1.get(object1)).assertEqual('foo');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_WEAKMAP_1900
     * @tc.name testWeakMapSet0004
     * @tc.desc Test the function of the Interface set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWeakMapSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testWeakMapSet0004";
      try {
        const weakMap1 = new WeakMap<object, string>();
        let a = new Object();
        weakMap1.set(a, 'foo');
        weakMap1.delete(a);
        weakMap1.set(a, 'weiwei');
        expect(weakMap1.get(a)).assertEqual('weiwei');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
  })
}