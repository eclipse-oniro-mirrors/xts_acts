import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import PlainArray from '@ohos.util.PlainArray';
import Utils from '../Util.test';

class Tmp {
  age: number = 0

  constructor(age: number) {
    this.age = age;
  }
}

export default function PlainArrayTest2() {
  describe('plainArrayTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testPlainArrayConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CONSTRUCTOR_0100
     * @tc.desc   Testing PlainArray constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayConstructor0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        expect(String(plainArray.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayIsEmpty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ISEMPTY_0100
     * @tc.desc   Testing PlainArray isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayIsEmpty0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        expect(String(plainArray.isEmpty())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayIsEmpty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ISEMPTY_0200
     * @tc.desc   Testing PlainArray isEmpty add->isEmpty->remove->isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayIsEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayIsEmpty0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(0, "zhang san");
        expect(String(plainArray.isEmpty())).assertEqual('false');
        plainArray.remove(0);
        expect(String(plainArray.isEmpty())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayIsEmpty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ISEMPTY_0300
     * @tc.desc   Testing PlainArray isEmpty add->clear->isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayIsEmpty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayIsEmpty0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(0, "zhang san");
        plainArray.clear();
        expect(String(plainArray.isEmpty())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0100
     * @tc.desc   Testing PlainArray has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayHas0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        let result = plainArray.has(1);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayHas0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0200
     * @tc.desc   Testing PlainArray has value is "".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayHas0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "");
        let result = plainArray.has(1);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayHas0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_HAS_0500
     * @tc.desc   Testing PlainArray has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayHas0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(0, "zhang san");
        expect(String(plainArray.has(0))).assertEqual('true');
        plainArray.add(-1, "zhang san");
        expect(String(plainArray.has(-1))).assertEqual('true');

        let num: int = 2147483647;
        plainArray.add(num, "li si");
        expect(String(plainArray.has(num))).assertEqual('true');
        let num1: int = -2147483648;
        plainArray.add(num1, "li si");
        expect(String(plainArray.has(num1))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testPlainArrayGet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0100
     * @tc.desc   Testing PlainArray get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPlainArrayGet0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.get(1);
        expect(String(result)).assertEqual('squirrel');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0200
     * @tc.desc   Testing PlainArray get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPlainArrayGet0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "");
        plainArray.add(2, "sparrow");
        let result = plainArray.get(1);
        expect(String(result)).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GET_0500
     * @tc.desc   Testing PlainArray get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPlainArrayGet0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(0, "zhang san");
        expect(String(plainArray.get(0))).assertEqual("zhang san");
        plainArray.add(-1, "zhang san");
        expect(String(plainArray.get(-1))).assertEqual("zhang san");

        let num: int = 2147483647;
        plainArray.add(num, "li si");
        expect(String(plainArray.get(num))).assertEqual("li si");
        let num1: int = -2147483648;
        plainArray.add(num1, "li si");
        expect(String(plainArray.get(num1))).assertEqual("li si");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetIndexOfKey0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOFKEY_0100
     * @tc.desc   Testing PlainArray getIndexOfKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetIndexOfKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPlainArrayGetIndexOfKey0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "");
        let result = plainArray.getIndexOfKey(2);
        expect(String(result)).assertEqual('1')
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetIndexOfKey0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOFKEY_0200
     * @tc.desc   Testing PlainArray getIndexOfKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetIndexOfKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPlainArrayGetIndexOfKey0002';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray<Tmp>();
        plainArray.add(1, new Tmp(10));
        plainArray.add(2, new Tmp(12));
        let result = plainArray.getIndexOfKey(2);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetIndexOfKey0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOFKEY_0400
     * @tc.desc   Testing PlainArray getIndexOfKey.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetIndexOfKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPlainArrayGetIndexOfKey0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getIndexOfKey(2);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testPlainArrayGetIndexOfValue0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOVALUE_0100
     * @tc.desc   Testing PlainArray getIndexOfValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetIndexOfValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetIndexOfValue0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "");
        let result = plainArray.getIndexOfValue("");
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetIndexOfValue0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOVALUE_0200
     * @tc.desc   Testing PlainArray getIndexOfValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetIndexOfValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetIndexOfValue0002';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray<Tmp>();
        let param1 = new Tmp(10);
        plainArray.add(1, param1);
        let param2 = new Tmp(10);
        plainArray.add(2, param2);
        let result = plainArray.getIndexOfValue(param2);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetIndexOfValue0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETINDEXOVALUE_0400
     * @tc.desc   Testing PlainArray getIndexOfValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetIndexOfValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetIndexOfValue0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getIndexOfValue("sparrow");
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetKeyAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETKEYAT_0100
     * @tc.desc   Testing PlainArray getKeyAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetKeyAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetKeyAt0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getKeyAt(3);
        expect(String(result)).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetKeyAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETKEYAT_0200
     * @tc.desc   Testing PlainArray getKeyAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetKeyAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetKeyAt0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getKeyAt(1);
        expect(String(result)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetValueAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0100
     * @tc.desc   Testing PlainArray getValueAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetValueAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetValueAt0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.getValueAt(2);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}`);
        expect(String(err.code)).assertEqual('10200001');
      }
    });

    /**
     * @tc.name   testPlainArrayGetValueAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0200
     * @tc.desc   Testing PlainArray getValueAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetValueAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetValueAt0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getValueAt(1);
        expect(String(result)).assertEqual("sparrow");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayGetValueAt0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_GETVALUEAT_0500
     * @tc.desc   Testing PlainArray getValueAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayGetValueAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayGetValueAt0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.getValueAt(1);
        let index = plainArray.getIndexOfValue(result);
        expect(String(index)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testPlainArrayClone0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0100
     * @tc.desc   Testing PlainArray clone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClone0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClone0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let newPlainArray = plainArray.clone();
        expect(String(newPlainArray.length)).assertEqual(String(plainArray.length));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayClone0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0200
     * @tc.desc   Testing PlainArray clone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClone0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClone0002';
      try {
        let plainArray: PlainArray<number> = new PlainArray<number>();
        plainArray.add(1, 1);
        plainArray.add(2, 2);
        let newPlainArray = plainArray.clone();
        expect(String(newPlainArray.length)).assertEqual(String(plainArray.length));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayClone0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0300
     * @tc.desc   Testing PlainArray clone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClone0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClone0003';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray<Tmp>();
        plainArray.add(1, new Tmp(10));
        plainArray.add(2, new Tmp(12));
        let newPlainArray = plainArray.clone();
        expect(String(newPlainArray.length)).assertEqual(String(plainArray.length));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayClone0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0400
     * @tc.desc   Testing PlainArray clone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClone0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClone0004';
      try {
        let plainArray: PlainArray<Tmp> = new PlainArray<Tmp>();
        plainArray.add(1, new Tmp(10));
        plainArray.add(2, new Tmp(12));
        let newPlainArray = plainArray.clone();
        newPlainArray.add(3, new Tmp(13));
        expect(String(plainArray.length)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayClone0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLONE_0500
     * @tc.desc   Testing PlainArray clone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClone0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClone0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        let param = "a".repeat(5120);
        plainArray.add(1, param);
        let newPlainArray = plainArray.clone();
        expect(String(plainArray.length)).assertEqual(String(newPlainArray.length));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayAdd0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ADD_0100
     * @tc.desc   Testing PlainArray add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayAdd0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        let param = "a".repeat(5120);
        plainArray.add(1, param);
        expect(String(plainArray.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayAdd0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_ADD_0200
     * @tc.desc   Testing PlainArray add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayAdd0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        expect(String(plainArray.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name   testPlainArrayRemove0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0100
     * @tc.desc   Testing PlainArray remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemove0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemove0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.remove(2);
        expect(String(result)).assertEqual("sparrow");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code} ${err.message}}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemove0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0400
     * @tc.desc   Testing PlainArray remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemove0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemove0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "zhang san");
        plainArray.add(2, "zhang san1");
        let result = plainArray.remove(3);
        expect(result).assertUndefined();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemove0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVE_0500
     * @tc.desc   Testing PlainArray remove.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemove0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemove0005';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "zhang san");
        plainArray.add(2, "zhang san1");
        let num: int = 2147483647;
        plainArray.add(num, "li si");
        expect(String(plainArray.remove(num))).assertEqual("li si");
        let num1: int = -2147483648;
        plainArray.add(num1, "li si");
        expect(String(plainArray.remove(num1))).assertEqual("li si");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemoveAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0100
     * @tc.desc   Testing PlainArray removeAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveAt0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeAt(1);
        expect(String(result)).assertEqual("sparrow");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemoveAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0200
     * @tc.desc   Testing PlainArray removeAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveAt0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeAt(-1);
        expect(result).assertUndefined();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemoveAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0300
     * @tc.desc   Testing PlainArray removeAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveAt0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeAt(2);
        expect(result).assertUndefined();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemoveAt0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVEAT_0400
     * @tc.desc   Testing PlainArray removeAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveAt0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        let result = plainArray.removeAt(0);
        expect(result).assertUndefined();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.name   testPlainArrayRemoveRangeFrom0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0100
     * @tc.desc   Testing PlainArray removeRangeFrom.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveRangeFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveRangeFrom0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.removeRangeFrom(1, 0);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testPlainArrayRemoveRangeFrom0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0200
     * @tc.desc   Testing PlainArray removeRangeFrom.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveRangeFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveRangeFrom0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeRangeFrom(1, 3);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemoveRangeFrom0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0300
     * @tc.desc   Testing PlainArray removeRangeFrom.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveRangeFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveRangeFrom0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.removeRangeFrom(1, Math.floor(7.5) as int);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayRemoveRangeFrom0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_REMOVERANGEFROM_0400
     * @tc.desc   Testing PlainArray removeRangeFrom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayRemoveRangeFrom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayRemoveRangeFrom0004';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        let result = plainArray.removeRangeFrom(0, 0);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200010);
      }
    });

    /**
     * @tc.name   testPlainArraySetValueAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0100
     * @tc.desc   Testing PlainArray setValueAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArraySetValueAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArraySetValueAt0001';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray<string | number>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.setValueAt(1, 3546);
        expect(String(plainArray.getValueAt(1))).assertEqual('3546');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArraySetValueAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0200
     * @tc.desc   Testing PlainArray setValueAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArraySetValueAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArraySetValueAt0002';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray<string | number>();
        plainArray.setValueAt(0, 3546);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200010);
      }
    });

    /**
     * @tc.name   testPlainArraySetValueAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SETVALUEAT_0300
     * @tc.desc   Testing PlainArray setValueAt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArraySetValueAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArraySetValueAt0003';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray<string | number>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        plainArray.setValueAt(0, 2147483647);
        plainArray.setValueAt(1, -2147483648);
        let param = "a".repeat(5120);
        plainArray.setValueAt(2, param);
        expect(String(plainArray.length)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name   testPlainArrayToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0100
     * @tc.desc   Testing PlainArray toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayToString0001';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray<string | number>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(String(result)).assertEqual('1:squirrel,2:sparrow');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0300
     * @tc.desc   Testing PlainArray toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayToString0003';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray<string | number>();
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0400
     * @tc.desc   Testing PlainArray toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayToString0004';
      try {
        let plainArray: PlainArray<string | number> = new PlainArray<string | number>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('1:squirrel,2:sparrow,3:sparrow');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0500
     * @tc.desc   Testing PlainArray toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayToString0005';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray<string | number | boolean>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, 10);
        plainArray.add(3, true);
        let result = plainArray.toString();
        console.log(`${TAG} result: ${result}`);
        expect(result).assertEqual('1:squirrel,2:10,3:true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_TOSTRING_0600
     * @tc.desc   Testing PlainArray toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayToString0006';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray<string | number | boolean>();
        for (let i = 0; i < 1024; i++) {
          plainArray.add(i, i);
        }
        plainArray.toString();
        expect(String(plainArray.length)).assertEqual('1024');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });




    /**
     * @tc.name   testPlainArrayClear0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLEAR_0100
     * @tc.desc   Testing PlainArray clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClear0001';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray<string | number | boolean>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.clear();
        expect(String(plainArray.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayClear0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLEAR_0200
     * @tc.desc   Testing PlainArray clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClear0002';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray<string | number | boolean>();
        plainArray.add(1, "squirrel");
        plainArray.clear();
        plainArray.add(2, "sparrow");
        expect(String(plainArray.length)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayClear0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_CLEAR_0300
     * @tc.desc   Testing PlainArray clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayClear0003';
      try {
        let plainArray: PlainArray<string | number | boolean> = new PlainArray<string | number | boolean>();
        plainArray.clear();
        expect(String(plainArray.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayForEach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0100
     * @tc.desc   Testing PlainArray forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayForEach0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.forEach((value: string, index: int) => {
          console.log(`${TAG} value: ${value}, index: ${index}`);
          expect(String(plainArray.get(index))).assertEqual(String(value));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayForEach0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0200
     * @tc.desc   Testing PlainArray forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayForEach0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        plainArray.forEach((value: string, index: int) => {
          console.log(`${TAG} value: ${value}, index: ${index}`);
          expect(String(plainArray.get(index))).assertEqual(String(value));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayForEach0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0300
     * @tc.desc   Testing PlainArray forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayForEach0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.forEach((value: string, index: int) => {
          console.log(`${TAG} value: ${value}, index: ${index}`);
          expect(String(plainArray.get(index))).assertEqual(String(value));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayForEach0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0600
     * @tc.desc   Testing PlainArray forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayForEach0006';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(0, "0");
        plainArray.forEach((value) => {
          expect(String(plainArray.get(0))).assertEqual(String(value));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArrayForEach0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_FOREACH_0700
     * @tc.desc   Testing PlainArray forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArrayForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArrayForEach0007';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(0, "0");
        plainArray.forEach((value, index, plainArray: PlainArray<string>) => {
          expect(String(plainArray.get(0))).assertEqual(String(value));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArraySymbolIterator0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_0100
     * @tc.desc   Testing PlainArray Symbol.iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArraySymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArraySymbolIterator0001';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        let iter = plainArray.$_iterator();
        let temp = iter.next();
        while (!temp.done) {
          let key = temp.value?.[0] as int;
          let value = temp.value?.[1] as string;
          console.log(`${TAG} key: ${key}, value: ${value}`);
          expect(String(plainArray.get(key))).assertEqual(String(value));
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArraySymbolIterator0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_0200
     * @tc.desc   Testing PlainArray Symbol.iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArraySymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArraySymbolIterator0002';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        plainArray.add(1, "squirrel");
        plainArray.add(2, "sparrow");
        plainArray.add(3, "sparrow");
        let iter = plainArray.$_iterator();
        let temp = iter.next();
        while (!temp.done) {
          let key = temp.value?.[0] as int;
          let value = temp.value?.[1] as string;
          console.log(`${TAG} key: ${key}, value: ${value}`);
          expect(String(plainArray.get(key))).assertEqual(String(value));
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPlainArraySymbolIterator0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_0300
     * @tc.desc   Testing PlainArray Symbol.iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlainArraySymbolIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  (): void => {
      const TAG = 'testPlainArraySymbolIterator0003';
      try {
        let plainArray: PlainArray<string> = new PlainArray<string>();
        let iter = plainArray.$_iterator();
        let temp = iter.next();
        while (!temp.done) {
          let key = temp.value?.[0] as int;
          let value = temp.value?.[1] as string;
          console.log(`${TAG} key: ${key}, value: ${value}`);
          expect(String(plainArray.get(key))).assertEqual(String(value));
          temp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name      testPlainArraySymbolIterator0017
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_PLAINARRAY_SYMBOL_ITERATOR_1700
     * @tc.desc      Testing PlainArray Symbol.iterator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPlainArraySymbolIterator0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let plainArray: PlainArray<string> = new PlainArray<string>();
      expect(plainArray.length).assertEqual(0);
      plainArray.add(1, "squirrel");
      plainArray.add(2, "sparrow");
      plainArray.add(3, "sparrow");
      expect(plainArray.length).assertEqual(3);
    });
  });
}