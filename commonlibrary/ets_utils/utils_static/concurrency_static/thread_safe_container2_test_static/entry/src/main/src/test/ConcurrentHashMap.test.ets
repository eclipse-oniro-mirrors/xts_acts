import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, xit, Level, Size, TestType } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

class CustomClass {
  id: number;
  name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}
class Person {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

class Person2 {
  age: number;

  constructor(age: number) {
    this.age = age;
  }
}

interface TestObject {
  id: number;
  name: string;
}

interface KeyType {
  id: number;
}

interface KeyType2 {
  a: number;
  b: number
}
interface CustomClass2 {
  a: number;
  b: number;
}

function createSetTask(map:  containers.ConcurrentHashMap<string, string>, key: string, value: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string, v: string) => {
    localMap.set(k, v);
  }, map, key, value);
}

function createDeleteTask(map:  containers.ConcurrentHashMap<string, string>, key: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string) => {
    localMap.delete(k);
  }, map, key);
}

function createReplaceTask(map:  containers.ConcurrentHashMap<string, string>, key: string, newValue: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string, v: string) => {
    localMap.set(k, v);
  }, map, key, newValue);
}

function createModifyTask(map:  containers.ConcurrentHashMap<string, string>, key: string, value: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string, v: string) => {
    localMap.set(k, v);
  }, map, key, value);
}

export default function ConcurrentHashMapTest() {
  describe('ConcurrentHashMapTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0100
     * @tc.name constructor_With_ArrayLike_static_Test_001
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMapNull:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(concurrentHashMapNull.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0101
     * @tc.name constructor_With_ArrayLike_static_Test_002
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let result = concurrentHashMap.set(1, "one");
      expect(String(result.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0102
     * @tc.name constructor_With_ArrayLike_static_Test_003
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptyArray: Array<[Number, string]> = new Array<[Number, string]>();
      let arrayLike = emptyArray as ArrayLike<[Number, string]>;
      let constructorWithEmpty:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(constructorWithEmpty.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_00102
     * @tc.name constructor_With_ArrayLike_static_Test_004
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptyArray: [string, Boolean][] = [];
      let arrayLike = emptyArray as ArrayLike<[string, Boolean]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<string, Boolean> = new  containers.ConcurrentHashMap<string, Boolean>(arrayLike);
      let constructorWithTuple = concurrentHashMap.set("test", true);
      expect(String(constructorWithTuple.size)).assertEqual('1');
      expect(String(concurrentHashMap.has("test"))).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0104
     * @tc.name constructor_With_ArrayLike_static_Test_005
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: [string, Number][] = [["", 100], ["key1", 200]];
      let arrayLike = entries as ArrayLike<[string, Number]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<string, Number> = new  containers.ConcurrentHashMap<string, Number>(arrayLike);
      expect(String(concurrentHashMap.has(""))).assertEqual('true');
      expect(String(concurrentHashMap.get(""))).assertEqual('100');
      expect(String(concurrentHashMap.has("key1"))).assertEqual('true');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0105
     * @tc.name constructor_With_ArrayLike_static_Test_006
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: [Number, string][] = [[1, ""], [2, "value1"]];
      let arrayLike = entries as ArrayLike<[Number, string]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(concurrentHashMap.get(1))).assertEqual('');
      expect(String(concurrentHashMap.get(2))).assertEqual('value1');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0106
     * @tc.name constructor_With_ArrayLike_static_Test_007
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longKey = "this_is_a_very_long_string_key_with_multiple_characters_1234567890";
      let entries: [string, Boolean][] = [[longKey, true], ["short", false]];
      let arrayLike = entries as ArrayLike<[string, Boolean]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<string, Boolean> = new  containers.ConcurrentHashMap<string, Boolean>(arrayLike);
      expect(String(concurrentHashMap.has(longKey))).assertEqual('true');
      expect(String(concurrentHashMap.get(longKey))).assertEqual('true');
      expect(String(concurrentHashMap.get("short"))).assertEqual('false');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0107
     * @tc.name constructor_With_ArrayLike_static_Test_008
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longValue = "this_is_a_very_long_string_value_with_multiple_characters_0987654321";
      let entries: [Number, string][] = [[1, longValue], [2, "short"]];
      let arrayLike = entries as ArrayLike<[Number, string]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(concurrentHashMap.get(1))).assertEqual(longValue);
      expect(String(concurrentHashMap.get(2))).assertEqual('short');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_ArrayLike_static_TesT_STATIC_0108
     * @tc.name constructor_With_ArrayLike_static_Test_009
     * @tc.desc Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_ArrayLike_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arrKeys: Number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      let arrValues: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
      let array = Array<[Number, string]>(10);
      for (let i = 0; i < 10; i++) {
        let arrKV: [Number, string] = [arrKeys[i], arrValues[i]]
        array[i] = arrKV;
      }
      let arrayLike = array as ArrayLike<[Number, string]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(concurrentHashMap.get(0))).assertEqual('zero');
      expect(String(concurrentHashMap.get(2))).assertEqual('two');
      expect(String(concurrentHashMap.size)).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Iterable_static_Test_STATIC_0109
     * @tc.name constructor_With_Iterable_static_Test_001
     * @tc.desc Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Iterable_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let iterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iterable);
      expect(String(concurrentIter.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Iterable_static_Test_STATIC_0110
     * @tc.name constructor_With_Iterable_static_Test_002
     * @tc.desc Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Iterable_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      concurrentHashMap.set(1, "one");
      let iterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iterable);
      expect(String(concurrentIter.size)).assertEqual('1');
      concurrentIter.delete(1);
      expect(String(concurrentIter.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Iterable_static_Test_STATIC_0111
     * @tc.name constructor_With_Iterable_static_Test_003
     * @tc.desc Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Iterable_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 1000; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      let iterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iterable);
      expect(String(concurrentIter.size)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Iterable_static_Test_STATIC_0112
     * @tc.name constructor_With_Iterable_static_Test_006
     * @tc.desc Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Iterable_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new Map<number | null | undefined, string | null | undefined>();
      map.set(null, "nullKey");
      map.set(undefined, "undefinedKey");
      map.set(1, null);
      map.set(2, undefined);

      let iterable = map.entries();
      let concurrentMap = new  containers.ConcurrentHashMap<number | null | undefined, string | null | undefined>(iterable);
      expect(String(concurrentMap.size)).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Iterable_static_Test_STATIC_0113
     * @tc.name constructor_With_Iterable_static_Test_007
     * @tc.desc Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Iterable_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentHashMap = new Map<number, string>();
      const totalCount: number = 10;
      for (let i = 0; i < totalCount; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      const iter = concurrentHashMap.entries();
      let concurrentMap = new  containers.ConcurrentHashMap<number, string>(iter);
      expect(String(concurrentMap.size)).assertEqual(String(totalCount));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Iterable_static_Test_STATIC_0114
     * @tc.name constructor_With_Iterable_static_Test_008
     * @tc.desc Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Iterable_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentHashMap = new  containers.ConcurrentHashMap<number, string>();
      const totalCount: number = 10;
      for (let i: number = 0; i < totalCount; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      const iter = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iter);
      expect(String(concurrentIter.size)).assertEqual(String(totalCount));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Iterable_static_Test_STATIC_0115
     * @tc.name constructor_With_Iterable_static_Test_009
     * @tc.desc Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Iterable_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      concurrentHashMap.set(1, "one");
      concurrentHashMap.set(2, "two");
      let entriesIterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(entriesIterable);
      expect(String(concurrentIter.size)).assertEqual('2');
      expect(concurrentIter.get(1)).assertEqual("one");
      expect(concurrentIter.get(2)).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0116
     * @tc.name constructor_With_Remove_static_Test_001
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      hashMap.set(1, "one");
      hashMap.set(2, "two");
      hashMap.set(3, "three");
      expect(hashMap.remove(1)).assertEqual("one");
      expect(hashMap.remove(2)).assertEqual("two");
      expect(String(hashMap.size)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0117
     * @tc.name constructor_With_Remove_static_Test_002
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap:  containers.ConcurrentHashMap<string, number> = new  containers.ConcurrentHashMap<string, number>();
      hashMap.set("a", 100);
      hashMap.set("b", 200);
      hashMap.set("c", 300);
      expect(String(hashMap.remove("a"))).assertEqual('100');
      expect(String(hashMap.remove("b"))).assertEqual('200');
      expect(String(hashMap.size)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0118
     * @tc.name constructor_With_Remove_static_Test_003
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "first");
      expect(map.remove(1)).assertEqual("first");
      expect(String(map.size)).assertEqual('0');
      map.set(1, "newValue");
      expect(map.get(1)).assertEqual("newValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0119
     * @tc.name constructor_With_Remove_static_Test_004
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<BigInt, string>();
      const bigNum = BigInt(9999999999999999);
      map.set(bigNum, "bigNumber");
      expect(map.remove(bigNum)).assertEqual("bigNumber");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0120
     * @tc.name constructor_With_Remove_static_Test_005
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<boolean, string>();
      map.set(true, "yes");
      map.set(false, "no");
      expect(map.remove(true)).assertEqual("yes");
      expect(map.remove(false)).assertEqual("no");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0121
     * @tc.name constructor_With_Remove_static_Test_006
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<Person, string>();
      const person = new Person("Alice");
      map.set(person, "developer");
      expect(map.remove(person)).assertEqual("developer");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0122
     * @tc.name constructor_With_Remove_static_Test_007
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<Person2, number>();
      const person = new Person2(13);
      map.set(person, 13);
      expect(map.remove(person)).assertEqual(13);
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0123
     * @tc.name constructor_With_Remove_static_Test_008
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number[], string>();
      const arr: number[] = [1, 2, 3];

      map.set(arr, "numbers");
      expect(String(map.remove(arr))).assertEqual("numbers");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0124
     * @tc.name constructor_With_Remove_static_Test_009
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<TestObject, string>();
      const obj: TestObject = {
        id: 123,
        name: "test"
      };
      map.set(obj, "objectData");
      expect(map.remove(obj)).assertEqual("objectData");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0125
     * @tc.name constructor_With_GetTest_static_Test_001
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "one");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0126
     * @tc.name constructor_With_GetTest_static_Test_002
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "one");
      ConcurrentHashMap.set(2, "two");
      ConcurrentHashMap.set(3, "three");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('one');
      expect(String(ConcurrentHashMap.get(2))).assertEqual('two');
      expect(String(ConcurrentHashMap.get(3))).assertEqual('three');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0127
     * @tc.name constructor_With_GetTest_static_Test_003
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      ConcurrentHashMap.set(2, "value");
      ConcurrentHashMap.set(3, "value");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('value');
      expect(String(ConcurrentHashMap.get(2))).assertEqual('value');
      expect(String(ConcurrentHashMap.get(3))).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0128
     * @tc.name constructor_With_GetTest_static_Test_004
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      ConcurrentHashMap.set(1, "newvalue");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('newvalue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0129
     * @tc.name constructor_With_GetTest_static_Test_005
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(ConcurrentHashMap.get(999))).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0130
     * @tc.name constructor_With_GetTest_static_Test_006
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      map.set("key", "new");
      map.set("KEY", "NEW");
      expect(String(map.get("key"))).assertEqual("new");
      expect(String(map.get("KEY"))).assertEqual("NEW");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0131
     * @tc.name constructor_With_GetTest_static_Test_007
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "");
      expect(String(map.get(1))).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0132
     * @tc.name constructor_With_GetTest_static_Test_008
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      map.set(1, undefined);
      expect(String(map.get(1))).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0133
     * @tc.name constructor_With_GetTest_static_Test_009
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, null> = new  containers.ConcurrentHashMap<number, null>();
      map.set(1, null);
      expect(String(map.get(1))).assertEqual("null");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_GetTest_static_Test_0134
     * @tc.name constructor_With_GetTest_static_Test_0010
     * @tc.desc Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_GetTest_static_Test_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(map.get(1))).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0135
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_001
     * @tc.desc Judge whether this ConcurrentHashMap is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0136
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_002
     * @tc.desc Judge whether this ConcurrentHashMap is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0137
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_003
     * @tc.desc Judge whether this ConcurrentHashMap is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('false');
      ConcurrentHashMap.delete(1)
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0138
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_004
     * @tc.desc Judge whether this ConcurrentHashMap is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 100; i++) {
        map.set(i, `value${i}`)
      }
      expect(String(map.isEmpty())).assertEqual('false');
      for (let i = 0; i < 100; i++) {
        map.delete(i)
      }
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0139
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_005
     * @tc.desc Verify isEmpty after clear operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "value1");
      map.set(2, "value2");
      map.clear();
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0140
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_006
     * @tc.desc Verify isEmpty with concurrent modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "value1");
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0141
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_007
     * @tc.desc Verify isEmpty after adding and removing same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "value1");
      map.set(1, "value2");
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0142
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_008
     * @tc.desc Verify isEmpty with null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, null>();
      map.set(1, null);
      expect(String(map.isEmpty())).assertEqual('false');
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_isEmpty_static_Test_static_Test_0143
     * @tc.name constructor_With_isEmpty_static_Test_static_Test_009
     * @tc.desc Verify isEmpty with undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_isEmpty_static_Test_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, undefined>();
      map.set(1, undefined);
      expect(String(map.isEmpty())).assertEqual('false');
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_toString_static_Test_0144
     * @tc.name constructor_With_toString_static_Test_001
     * @tc.desc Verify toString after removing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_toString_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "one");
      ConcurrentHashMap.set(2, "two");
      let str = ConcurrentHashMap.toString();
      expect(str).assertEqual('1,one,2,two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_toString_static_Test_0145
     * @tc.name constructor_With_toString_static_Test_002
     * @tc.desc Verify toString after removing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_toString_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 100; i++) {
        ConcurrentHashMap.set(i, `value${i}`)
      }
      let str = ConcurrentHashMap.toString();
      expect(str).assertEqual(String(ConcurrentHashMap));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_toString_static_Test_0146
     * @tc.name constructor_With_toString_static_Test_003
     * @tc.desc Verify toString after removing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_toString_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let str = ConcurrentHashMap.toString();
      expect(str).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_toString_static_Test_0147
     * @tc.name constructor_With_toString_static_Test_005
     * @tc.desc Verify toString after removing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_toString_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.delete(1);
      let str = map.toString();
      expect(str).assertEqual('2,two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_toString_static_Test_0148
     * @tc.name constructor_With_toString_static_Test_006
     * @tc.desc Verify toString with null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_toString_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string | null>();
      map.set(1, null);
      map.set(2, "two");
      let str = map.toString();
      expect(str).assertEqual('1,null,2,two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_toString_static_Test_0149
     * @tc.name constructor_With_toString_static_Test_007
     * @tc.desc Verify toString with null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_toString_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string | undefined>();
      map.set(1, undefined);
      map.set(2, "two");
      let str = map.toString();
      expect(str).assertEqual('1,undefined,2,two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_values_static_Test_0150
     * @tc.name constructor_With_values_static_Test_001
     * @tc.desc Verify values iterator with values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_values_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      const iterator = map.values();
      const result = iterator.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_values_static_Test_0151
     * @tc.name constructor_With_values_static_Test_002
     * @tc.desc Verify values iterator with values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_values_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      const keys = Array.from(map.values());
      expect(JSON.stringify(keys)).assertEqual(JSON.stringify(["one", "two"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_values_static_Test_0152
     * @tc.name constructor_With_values_static_Test_003
     * @tc.desc Verify values iterator with values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_values_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let iter = map.values();
      let result = '';
      while (true) {
        const v = iter.next();
        if (v.done) {
          break;
        }
        result += v.value!.toString() + ',';
      }
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_values_static_Test_0153
     * @tc.name constructor_With_values_static_Test_004
     * @tc.desc Verify values iterator with values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_values_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, boolean> = new  containers.ConcurrentHashMap<string, boolean>();
      map.set('aaa', true);
      let iter = map.values();
      let result = '';
      const v = iter.next();
      if (!v.done) {
        result = v.value!.toString();
      }
      expect(result).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_values_static_Test_0154
     * @tc.name constructor_With_values_static_Test_005
     * @tc.desc Verify values iterator with null/undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_values_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string | null | undefined>();
      map.set(1, null);
      map.set(2, undefined);
      const values = Array.from(map.values());
      expect(String(values[0])).assertEqual('null');
      expect(String(values[1])).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_values_static_Test_0155
     * @tc.name constructor_With_values_static_Test_006
     * @tc.desc Verify values iterator after map modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_values_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      const iterator = map.values();
      map.set(2, "two");
      const values = Array.from(iterator);
      expect(String(values.length)).assertEqual('2');
      expect(String(values[0])).assertEqual("one");
      expect(String(values[1])).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0156
     * @tc.name constructor_With_Key_static_Test_001
     * @tc.desc Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      const iterator = map.keys();
      const result = iterator.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0157
     * @tc.name constructor_With_Key_static_Test_002
     * @tc.desc Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      const keys = Array.from(map.keys());
      expect(JSON.stringify(keys)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0158
     * @tc.name constructor_With_Key_static_Test_003
     * @tc.desc Verify keys iterator with duplicate keys (shouldn't happen but verify behavior)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "first");
      map.set(1, "second");
      const keys = Array.from(map.keys());
      expect(String(keys.length)).assertEqual('1');
      expect(String(keys[0])).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0159
     * @tc.name constructor_With_Key_static_Test_004
     * @tc.desc Verify keys iterator with various key types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number | string | null, string>();
      map.set(1, "number");
      map.set("1", "string");
      map.set(null, "null");
      const keys = Array.from(map.keys());
      expect(String(keys.length)).assertEqual('3');
      expect(String(keys[0])).assertEqual('1');
      expect(String(keys[1])).assertEqual("1");
      expect(String(keys[2])).assertEqual('null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0160
     * @tc.name constructor_With_Key_static_Test_005
     * @tc.desc Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let iter = map.keys();
      let result = '';
      while (true) {
        const v = iter.next();
        if (v.done) {
          break;
        }
        result += v.value!.toString() + ',';
      }
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0161
     * @tc.name constructor_With_Key_static_Test_006
     * @tc.desc Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, boolean> = new  containers.ConcurrentHashMap<string, boolean>();
      map.set('aaa', true);

      let iter = map.keys();
      let result = '';
      const v = iter.next();
      if (!v.done) {
        result = v.value!.toString();
      }
      expect(result).assertEqual('aaa');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_forEach_static_Test_0162
     * @tc.name constructor_With_forEach_static_Test_001
     * @tc.desc Test forEach() iteration with value/key/map callback params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_forEach_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");

      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(String(count)).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_forEach_static_Test_0163
     * @tc.name constructor_With_forEach_static_Test_002
     * @tc.desc Test forEach() iteration with value/key/map callback params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_forEach_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");
      const values = new Array<string>();
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(String(values.length)).assertEqual('3');
      expect(values[0]).assertEqual("one");
      expect(values[1]).assertEqual("two");
      expect(values[2]).assertEqual("three");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_forEach_static_Test_0164
     * @tc.name constructor_With_forEach_static_Test_003
     * @tc.desc Test forEach() iteration with value/key/map callback params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_forEach_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");
      let count = 0;
      map.forEach((value: string, key: number, m:  containers.ConcurrentHashMap<number, string>) => {
        expect(m.get(key)).assertEqual(value);
        count++;
      });
      expect(String(count)).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_forEach_static_Test_0165
     * @tc.name constructor_With_forEach_static_Test_004
     * @tc.desc Test forEach() iteration with value/key/map callback params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_forEach_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");

      map.forEach((value: string, key: number) => {
        if (key === 2) {
          map.set(4, "four");
        }
      });
      expect(String(map.size)).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_forEach_static_Test_0166
     * @tc.name constructor_With_forEach_static_Test_005
     * @tc.desc Test forEach() iteration with value/key/map callback params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_forEach_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(String(count)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Map_static_Test_0167
     * @tc.name constructor_With_Map_static_Test_001
     * @tc.desc To create an empty set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Map_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Map_static_Test_00167
     * @tc.name constructor_With_Map_static_Test_002
     * @tc.desc The collection contains an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Map_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, 'one');
      expect(String(map.size)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Map_static_Test_0169
     * @tc.name constructor_With_Map_static_Test_003
     * @tc.desc A map of a thousand elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Map_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 1000; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      expect(String(concurrentHashMap.size)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_static_Test_0170
     * @tc.name onstructor_static_Test_001
     * @tc.desc Map of two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("onstructor_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      concurrentHashMap.set(1, 'one');
      concurrentHashMap.set(2, 'two');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Set_static_Test_0167
     * @tc.name constructor_With_Set_static_Test_001
     * @tc.desc Hashmap of different parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Set_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const WithSet:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      WithSet.set(10, '10');
      expect(String(WithSet.size)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0168
     * @tc.name set_With_Set_static_Test_001
     * @tc.desc The value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let SetTest:  containers.ConcurrentHashMap<number, null> = new  containers.ConcurrentHashMap<number, null>();
      SetTest.set(10, null);
      expect(String(SetTest.size)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0169
     * @tc.name set_With_Set_static_Test_002
     * @tc.desc The value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let SetTest1:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      SetTest1.set(10, undefined);
      expect(String(SetTest1.size)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0170
     * @tc.name set_With_Set_static_Test_003
     * @tc.desc Set different key values to undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      keyData.set(10, undefined);
      keyData.set(20, undefined);
      expect(String(keyData.size)).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0171
     * @tc.name set_With_Set_static_Test_004
     * @tc.desc Duplicate key data already exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      keyData.set(10, undefined);
      expect(String(keyData.size)).assertEqual('1');
      keyData.set(10, undefined);
      expect(String(keyData.size)).assertEqual('1');
      keyData.set(20, undefined);
      expect(String(keyData.size)).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0172
     * @tc.name set_With_Set_static_Test_005
     * @tc.desc Set BigInt to a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<boolean, BigInt> = new  containers.ConcurrentHashMap<boolean, BigInt>();
      const key = true;
      const value = BigInt(12345678901234567890n);
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0173
     * @tc.name set_With_Set_static_Test_006
     * @tc.desc Set BigInt to a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<BigInt, boolean> = new  containers.ConcurrentHashMap<BigInt, boolean>();
      const key = BigInt(9007199254740991);
      const value = true;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0174
     * @tc.name set_With_Set_static_Test_007
     * @tc.desc Set object to a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<object, CustomClass> = new  containers.ConcurrentHashMap<object, CustomClass>();
      const key: KeyType = {
        id: 1
      };
      const value = new CustomClass(2, "Bob");
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0175
     * @tc.name set_With_Set_static_Test_008
     * @tc.desc Set array to a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<CustomClass, number[]> = new  containers.ConcurrentHashMap<CustomClass, number[]>();
      const key = new CustomClass(1, "Alice");
      const value: number[] = [1, 2, 3];
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0176
     * @tc.name set_With_Set_static_Test_009
     * @tc.desc Set object to a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number[], object> = new  containers.ConcurrentHashMap<number[], object>();
      const key: number[] = [1, 2, 3];
      const value: KeyType2 = {
        a: 1, b: 2
      };
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0177
     * @tc.name set_With_Set_static_Test_010
     * @tc.desc Set BigInt to a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<BigInt, string> = new  containers.ConcurrentHashMap<BigInt, string>();
      const key = BigInt(9007199254740991);
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0178
     * @tc.name set_With_Set_static_Test_011
     * @tc.desc Set boolean to a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<boolean, string> = new  containers.ConcurrentHashMap<boolean, string>();
      const key = false;
      const value = "TestBooleanKey";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0179
     * @tc.name set_With_Set_static_Test_012
     * @tc.desc Set class to a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<CustomClass, string> = new  containers.ConcurrentHashMap<CustomClass, string>();
      const key = new CustomClass(1, "Alice");
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0180
     * @tc.name set_With_Set_static_Test_013
     * @tc.desc Set array to a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number[], boolean> = new  containers.ConcurrentHashMap<number[], boolean>();
      const key: number[] = [1, 2, 3];
      const value = true;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0181
     * @tc.name set_With_Set_static_Test_014
     * @tc.desc Set object to a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<object, number[]> = new  containers.ConcurrentHashMap<object, number[]>();
      const key: KeyType = {
        id: 2
      };
      const value: number[] = [4, 5, 6];
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0182
     * @tc.name set_With_Set_static_Test_015
     * @tc.desc The value of the replacement key is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      keyData.set(1, "one");
      expect(keyData.get(1)).assertEqual("one");
      keyData.set(1, "newOne");
      expect(String(keyData.get(1))).assertEqual("newOne");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0183
     * @tc.name set_With_Set_static_Test_016
     * @tc.desc Test whether the key exists after being deleted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      keyData.set(1, "one");
      expect(keyData.delete(1)).assertTrue();
      expect(keyData.delete(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0184
     * @tc.name set_With_Set_static_Test_017
     * @tc.desc Undefined is returned when any key is obtained in an empty mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      keyData.set(1, "one");
      expect(keyData.get(1)).assertEqual('one');
      expect(keyData.has(1)).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0185
     * @tc.name delete_Key_With_Test_static_Test_001
     * @tc.desc The value is deleted as null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, null> = new  containers.ConcurrentHashMap<string, null>();
      const key = '1';
      const value = null;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0186
     * @tc.name delete_Key_With_Test_static_Test_002
     * @tc.desc The value is deleted as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      const key = 1;
      const value = undefined;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.delete(2))).assertEqual('false');
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0187
     * @tc.name delete_Key_With_Test_static_Test_003
     * @tc.desc Map with one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      hashMap.set(1, "one");
      let flag: boolean = hashMap.delete(1);
      expect(String(hashMap.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0188
     * @tc.name delete_Key_With_Test_static_Test_004
     * @tc.desc The value of Bigin in the property is deleted as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<BigInt, string> = new  containers.ConcurrentHashMap<BigInt, string>();
      const key = BigInt(9007199254740991);
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0189
     * @tc.name delete_Key_With_Test_static_Test_005
     * @tc.desc The value of boolean in the property is deleted as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<boolean, string> = new  containers.ConcurrentHashMap<boolean, string>();
      const key = true;
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0190
     * @tc.name delete_Key_With_Test_static_Test_006
     * @tc.desc The value of class in the property is deleted as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<CustomClass, string> = new  containers.ConcurrentHashMap<CustomClass, string>();
      const key = new CustomClass(1, "Alice");
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0191
     * @tc.name delete_Key_With_Test_static_Test_007
     * @tc.desc The value of array in the property is deleted as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number[], string> = new  containers.ConcurrentHashMap<number[], string>();
      const key: number[] = [1, 2, 3];
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0192
     * @tc.name delete_Key_With_Test_static_Test_008
     * @tc.desc The value of object in the property is deleted as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<object, string> = new  containers.ConcurrentHashMap<object, string>();
      const key: CustomClass2 = {
        a: 1, b: 2
      };
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0193
     * @tc.name delete_Key_With_Test_static_Test_009
     * @tc.desc The value of bigin in the property is deleted as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, BigInt> = new  containers.ConcurrentHashMap<string, BigInt>();
      const key = "key1";
      const value = BigInt(9007199254740991);
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0194
     * @tc.name delete_Key_With_Test_static_Test_010
     * @tc.desc The value of boolean in the property is deleted as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, boolean> = new  containers.ConcurrentHashMap<string, boolean>();
      const key = "key1";
      const value = true;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0195
     * @tc.name delete_Key_With_Test_static_Test_011
     * @tc.desc The value of class in the property is deleted as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, CustomClass> = new  containers.ConcurrentHashMap<string, CustomClass>();
      const key = "key1";
      const value = new CustomClass(1, "Alice");
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(JSON.stringify(keyData.get(key))).assertEqual(JSON.stringify(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0196
     * @tc.name delete_Key_With_Test_static_Test_012
     * @tc.desc The value of array in the property is deleted as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, number[]> = new  containers.ConcurrentHashMap<string, number[]>();
      const key = "key1";
      const value: number[] = [1, 2, 3];
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(JSON.stringify(keyData.get(key))).assertEqual(JSON.stringify(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0197
     * @tc.name delete_Key_With_Test_static_Test_013
     * @tc.desc The value of object in the property is deleted as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, object> = new  containers.ConcurrentHashMap<string, object>();
      const key = "key1";
      const value: CustomClass2 = {
        a: 1, b: 2
      };
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(JSON.stringify(keyData.get(key))).assertEqual(JSON.stringify(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_delete_Key_With_Test_static__0198
     * @tc.name delete_Key_With_Test_static_Test_014
     * @tc.desc Data that does not exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("delete_Key_With_Test_static_Test_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key1";
      const value = "value1";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      const nonExistentKey = "nonExistentKey";
      keyData.delete(nonExistentKey);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(nonExistentKey)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0199
     * @tc.name has_With_Test_static_Test_001
     * @tc.desc The key is null and the property has has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<null, string> = new  containers.ConcurrentHashMap<null, string>();
      const key = null;
      const value = "value1";
      keyData.set(key, value);
      let flag: boolean = keyData.has(key);
      expect(String(flag)).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0200
     * @tc.name has_With_Test_static_Test_002
     * @tc.desc The key is undefined and the property has has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, undefined> = new  containers.ConcurrentHashMap<string, undefined>();
      const key = "key";
      const value = undefined;
      keyData.set(key, value);
      let flag: boolean = keyData.has(key);
      expect(String(flag)).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0201
     * @tc.name has_With_Test_static_Test_003
     * @tc.desc The map is empty and the property has has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.has(key)).assertTrue();
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0202
     * @tc.name has_With_Test_static_Test_004
     * @tc.desc The key is consistent and the property has has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      keyData.set("key1", "value1")
      keyData.set("key2", "value2")
      expect(keyData.has("key1")).assertTrue();
      expect(keyData.has("key2")).assertTrue();
      expect(keyData.get("key1")).assertEqual('value1');
      expect(keyData.get("key2")).assertEqual('value2');
      keyData.delete('key1');
      keyData.delete('key2');
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0203
     * @tc.name has_With_Test_static_Test_005
     * @tc.desc Inconsistent data with the key and the property has has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const keyUpper = "KEY";
      const keyLower = "key";
      const valueUpper = "ValueForUpper";
      const valueLower = "ValueForLower";
      keyData.set(keyUpper, valueUpper);
      keyData.set(keyLower, valueLower);
      expect(String(keyData.size)).assertEqual("2");
      expect(keyData.has(keyUpper)).assertTrue();
      expect(keyData.get(keyUpper)).assertEqual(valueUpper);
      expect(keyData.has(keyLower)).assertTrue();
      expect(keyData.get(keyLower)).assertEqual(valueLower);
      keyData.delete(keyUpper);
      keyData.delete(keyLower);
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0204
     * @tc.name has_With_Test_static_Test_006
     * @tc.desc The key is inconsistent with the uppercase and lowercase of the data, and the property has has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, undefined> = new  containers.ConcurrentHashMap<string, undefined>();
      const key = "key";
      const value = undefined;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.has(key)).assertTrue();
      expect(String(keyData.get(key))).assertEqual(String(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0205
     * @tc.name has_With_Test_static_Test_007
     * @tc.desc A map with an element and the property has has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map: Map<number, string> = new Map<number, string>();
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(map);
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0206
     * @tc.name has_With_Test_static_Test_008
     * @tc.desc Replacement value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      let flag: boolean = map.replace(1, "first");
      expect(String(map.get(1))).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0207
     * @tc.name has_With_Test_static_Test_009
     * @tc.desc Get the values of keys one and two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      expect(String(map.get(1))).assertEqual("one");
      expect(String(map.get(2))).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_has_With_Test_static_0208
     * @tc.name has_With_Test_static_Test_010
     * @tc.desc Find a value that does not exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("has_With_Test_static_Test_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      expect(map.has(1)).assertTrue();
      expect(map.has(3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_replaceWithTest_0209
     * @tc.name replace_With_Test_static_Test_001
     * @tc.desc Null is the key, and the property is replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("replace_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<null, string> = new  containers.ConcurrentHashMap<null, string>();
      map.set(null, 'value')
      let flag: boolean = map.replace(null, "value1");
      expect(String(map.get(null))).assertEqual("value1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_replaceWithTest_0210
     * @tc.name replace_With_Test_static_Test_002
     * @tc.desc Undefined is the key, and the property is replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("replace_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<undefined, string> = new  containers.ConcurrentHashMap<undefined, string>();
      map.set(undefined, 'value')
      let flag: boolean = map.replace(undefined, 'value1');
      expect(String(map.get(undefined))).assertEqual('value1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_replaceWithTest_0211
     * @tc.name replace_With_Test_static_Test_003
     * @tc.desc The map is empty and the property is replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("replace_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      const flag = map.replace(1, "one");
      expect(flag).assertFalse();
      expect(map.get(1)).assertUndefined();
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_replaceWithTest_0212
     * @tc.name replace_With_Test_static_Test_004
     * @tc.desc The data with the same key and value is the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("replace_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      const flag = map.replace(key, value);
      expect(flag).assertTrue();
      expect(map.get(key)).assertEqual(value);
      map.delete(key);
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_replaceWithTest_0213
     * @tc.name replace_With_Test_static_Test_005
     * @tc.desc The data with the same key and value is the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("replace_With_Test_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      const flag = map.replace("nonExistentKey", "newValue");
      expect(flag).assertFalse();
      expect(map.get("nonExistentKey")).assertUndefined();
      map.delete(key);
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_replaceWithTest_0214
     * @tc.name replace_With_Test_static_Test_006
     * @tc.desc Map with one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("replace_With_Test_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      const flag = map.replace(key, "newValue");
      expect(flag).assertTrue();
      expect(map.get(key)).assertEqual("newValue");
      map.delete(key);
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_clearWithTest_0215
     * @tc.name clear_With_Test_static_Test_001
     * @tc.desc Empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("clear_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      map.clear();
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_clearWithTest_0216
     * @tc.name clear_With_Test_static_Test_002
     * @tc.desc Non-empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("clear_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      map.set('key1', 'value1')
      map.set('key2', 'value2')
      expect(String(map.size)).assertEqual("2");
      map.clear();
      expect(String(map.size)).assertEqual("0");
      expect(map.has('key1')).assertFalse();
      expect(map.has('key2')).assertFalse();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_clearWithTest_0217
     * @tc.name clear_With_Test_static_Test_003
     * @tc.desc Multiple addition and deletion operations after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("clear_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      expect(String(map.size)).assertEqual("1");
      map.clear();
      expect(String(map.size)).assertEqual("0");
      expect(map.has(key)).assertFalse();
      map.set(key, value);
      expect(String(map.size)).assertEqual("1");
      expect(map.has(key)).assertTrue();
      expect(map.get(key)).assertEqual(value);
      map.delete(key);
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_clearWithTest_0218
     * @tc.name clear_With_Test_static_Test_004
     * @tc.desc Repeated Clearing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("clear_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      expect(String(map.size)).assertEqual("1");
      map.clear();
      expect(String(map.size)).assertEqual("0");
      expect(map.has(key)).assertFalse();
      const key1 = "key1";
      const value1 = "value1";
      map.set(key1, value1);
      expect(String(map.size)).assertEqual("1");
      expect(map.has(key1)).assertTrue();
      expect(map.get(key1)).assertEqual(value1);
      map.clear();
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_getSize_With_Test_static_0219
     * @tc.name get_Size_With_Test_static_Test_001
     * @tc.desc Empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("get_Size_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const nonExistentKey = "nonExistentKey";
      expect(map.get(nonExistentKey)).assertUndefined();
      expect(String(map.size)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_getSize_With_Test_static_0220
     * @tc.name get_Size_With_Test_static_Test_002
     * @tc.desc Non-empty map, 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("get_Size_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key1 = "key1";
      const value1 = "value1";
      const key2 = "key2";
      const value2 = "value2";
      map.set(key1, value1);
      map.set(key2, value2);
      expect(String(map.size)).assertEqual("2");
      expect(map.get(key1)).assertEqual(value1);
      expect(map.get(key2)).assertEqual(value2);
      map.delete(key1);
      map.delete(key2);
      expect(String(map.size)).assertEqual("0");
      expect(map.get(key1)).assertUndefined();
      expect(map.get(key2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_getSize_With_Test_static_0221
     * @tc.name getSize_With_Test_static_Test_003
     * @tc.desc Map with one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getSize_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      expect(String(map.size)).assertEqual("1");
      expect(map.get(key)).assertEqual(value);
      map.delete(key);
      expect(String(map.size)).assertEqual("0");
      expect(map.get(key)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_getSize_With_Test_static_0222
     * @tc.name getSize_With_Test_static_Test_004
     * @tc.desc Transfer the new map as an input parameter for element judgment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getSize_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key1 = "key1";
      const value1 = "value1";
      const key2 = "key2";
      const value2 = "value2";
      map.set(key1, value1);
      map.set(key2, value2);
      map.clear();
      expect(String(map.size)).assertEqual("0");
      expect(map.get(key1)).assertUndefined();
      expect(map.get(key2)).assertUndefined();
      const keyA = "keyA";
      const valueA = "valueA";
      const keyB = "keyB";
      const valueB = "valueB";
      map.set(keyA, valueA);
      expect(String(map.size)).assertEqual("1");
      expect(map.get(keyA)).assertEqual(valueA);
      map.set(keyB, valueB);
      expect(String(map.size)).assertEqual("2");
      expect(map.get(keyB)).assertEqual(valueB);
      map.delete(keyA);
      expect(String(map.size)).assertEqual("1");
      expect(map.get(keyA)).assertUndefined();
      map.delete(keyB);
      expect(String(map.size)).assertEqual("0");
      expect(map.get(keyB)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_iterator_With_Test_static_0223
     * @tc.name iterator_With_Test_static_Test_001
     * @tc.desc Empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("iterator_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      let count = 0;
      const iterator = map.entries();
      let entry = iterator.next();
      while (!entry.done) {
        count++;
        entry = iterator.next();
      }
      expect(String(count)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_iterator_With_Test_static_0224
     * @tc.name iterator_With_Test_static_Test_002
     * @tc.desc Non-empty map, 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("iterator_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      for (let i = 0; i < 100; i++) {
        const key = `key${i}`;
        const value = `value${i}`;
        map.set(key, value);
      }
      let count = 0;
      const iterator = map.entries();
      let entry = iterator.next();
      while (!entry.done) {
        const key = entry.value![0];
        const value = entry.value![1];
        expect(map.get(key)).assertEqual(value);
        count++;
        entry = iterator.next();
      }
      expect(String(count)).assertEqual("100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_iterator_With_Test_static_0225
     * @tc.name iterator_With_Test_static_Test_003
     * @tc.desc Map with one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("iterator_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      let count = 0;
      const iterator = map.entries();
      let entry = iterator.next();
      while (!entry.done) {
        const iterKey = entry.value![0];
        const iterValue = entry.value![1];
        expect(iterKey).assertEqual(key);
        expect(iterValue).assertEqual(value);
        count++;
        entry = iterator.next();
      }
      expect(String(count)).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_iterator_With_Test_static_0226
     * @tc.name iterator_With_Test_static_Test_004
     * @tc.desc Transfer the new map as an input parameter for element judgment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("iterator_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map1:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      let map2: Map<string, string> = new Map<string, string>();
      map1.set("key1", "value1");
      map1.set("key2", "value2");
      map1.set("key3", "value3");
      const iterator = map1.entries();
      let entry = iterator.next();
      while (!entry.done) {
        const key = entry.value![0];
        const value = entry.value![1];
        map2.set(key, value);
        entry = iterator.next();
      }
      expect(String(map1.size)).assertEqual(String(map2.size));
      expect(map2.get("key1")).assertEqual("value1");
      expect(map2.get("key2")).assertEqual("value2");
      expect(map2.get("key3")).assertEqual("value3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_entriesWithTest_0227
     * @tc.name entries_With_Test_static_Test_001
     * @tc.desc Empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("entries_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const iterator = map.entries();
      let entry = iterator.next();
      expect(String(entry.done)).assertEqual('true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_entriesWithTest_0228
     * @tc.name entries_With_Test_static_Test_002
     * @tc.desc Non-empty map, 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("entries_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      for (let i = 0; i < 100; i++) {
        const key = `key${i}`;
        const value = `value${i}`;
        map.set(key, value);
      }
      let count = 0;
      const iterator = map.entries();
      let entry = iterator.next();
      while (!entry.done) {
        if (entry.value) {
          const keyValue = entry.value;
          const key = keyValue![0];
          const value = keyValue![1];
          expect(map.get(key)).assertEqual(value);
          count++;
        }
        entry = iterator.next();
      }
      expect(String(count)).assertEqual("100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_entriesWithTest_0229
     * @tc.name entries_With_Test_static_Test_003
     * @tc.desc Map with one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("entries_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key";
      const value = "value";
      map.set(key, value);
      let count = 0;
      const iterator = map.entries();
      let entry = iterator.next();
      while (!entry.done) {
        if (entry.value) {
          const keyValue = entry.value;
          const iterKey = keyValue![0];
          const iterValue = keyValue![1];
          expect(iterKey).assertEqual(key);
          expect(iterValue).assertEqual(value);
          count++;
        }
        entry = iterator.next();
      }
      expect(String(count)).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_entriesWithTest_0230
     * @tc.name entries_With_Test_static_Test_004
     * @tc.desc Transfer the new map as an input parameter for element judgment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("entries_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map1:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      let map2: Map<string, string> = new Map<string, string>();
      map1.set("key1", "value1");
      map1.set("key2", "value2");
      map1.set("key3", "value3");
      const iterator = map1.entries();
      let entry = iterator.next();
      while (!entry.done) {
        if (entry.value) {
          const keyValue = entry.value;
          const key = keyValue![0];
          const value = keyValue![1];
          map2.set(key, value);
          expect(map2.get(key)).assertEqual(value);
        }
        entry = iterator.next();
      }
      expect(String(map1.size)).assertEqual(String(map2.size));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_multithreadingWithTest_0231
     * @tc.name multithreading_With_Test_static_Test_001
     * @tc.desc Multiple threads set the same key at the same time and verify that the map status is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("multithreading_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const sameKey: string = "sharedKey";
      const threadCount: number = 10;
      for (let i: number = 0; i < threadCount; i++) {
        const value: string = `value${i}`;
        taskGroup.addTask(createSetTask(concurrentMap, sameKey, value));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(concurrentMap.size)).assertEqual('1');
      expect(concurrentMap.has(sameKey)).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_multithreadingWithTest_0232
     * @tc.name multithreading_With_Test_static_Test_002
     * @tc.desc Multiple threads set different keys at the same time to verify that the final map status is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("multithreading_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const threadCount: number = 10;
      for (let i: number = 0; i < threadCount; i++) {
        const key: string = `key${i}`;
        const value: string = `value${i}`;
        taskGroup.addTask(createSetTask(concurrentMap, key, value));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(concurrentMap.size)).assertEqual('10');
      for (let i: number = 0; i < threadCount; i++) {
        const key: string = `key${i}`;
        const value: string | undefined = concurrentMap.get(key);
        expect(value).assertEqual(`value${i}`);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_multithreadingWithTest_0233
     * @tc.name multithreading_With_Test_static_Test_0002
     * @tc.desc Multiple threads run set and get at the same time to verify data consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("multithreading_With_Test_static_Test_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const sameKey: string = "sharedKey";
      const threadCount: number = 10;
      for (let i: number = 0; i < threadCount; i++) {
        const value: string = `value${i}`;
        taskGroup.addTask(createSetTask(concurrentMap, sameKey, value));
      }
      await taskpool.execute(taskGroup);
      expect(String(concurrentMap.size)).assertEqual('1');
      const finalValue: string | undefined = concurrentMap.get(sameKey);
      expect(finalValue !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_multithreadingWithTest_0234
     * @tc.name multithreading_With_Test_static_Test_004
     * @tc.desc 10 Add set elements to the container at the same time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("multithreading_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const threadCount: number = 10;
      for (let i: number = 0; i < threadCount; i++) {
        const key: string = `key${i}`;
        const value: string = `value${i}`;
        taskGroup.addTask(createSetTask(concurrentMap, key, value));
      }
      await taskpool.execute(taskGroup);
      expect(String(concurrentMap.size)).assertEqual('10');
      for (let i: number = 0; i < threadCount; i++) {
        const key: string = `key${i}`;
        const value: string | undefined = concurrentMap.get(key);
        expect(value).assertEqual(`value${i}`);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_multithreadingWithTest_0235
     * @tc.name multithreading_With_Test_static_Test_005
     * @tc.desc The initial container contains 1000 elements, and 10 concurrent operations are performed on the container to replace the replace element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("multithreading_With_Test_static_Test_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i: number = 0; i < 1000; i++) {
        concurrentMap.set(`key${i}`, `value${i}`);
      }
      for (let i: number = 0; i < 10; i++) {
        taskGroup.addTask(createReplaceTask(concurrentMap, `key${i}`, `newValue${i}`));
      }
      await taskpool.execute(taskGroup);
      for (let i: number = 0; i < 10; i++) {
        const key: string = `key${i}`;
        const value: string | undefined = concurrentMap.get(key);
        expect(value).assertEqual(`newValue${i}`);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_performancer_With_Test_static_0236
     * @tc.name performancer_With_Test_static_Test_001
     * @tc.desc On three threads (EAWorker), the hashMap has 1000 elements, and the operation of the common interface is timed multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("performancer_With_Test_static_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i: number = 0; i < 10; i++) {
        concurrentMap.set(`key${i}`, `value${i}`);
      }
      const modifyKey: string = "key5";
      const modifyValue: string = "newValue";
      taskGroup.addTask(createModifyTask(concurrentMap, modifyKey, modifyValue));
      let iteratorError: boolean = false;
      let iterationResult: string = "";
      try {
        for (const key of concurrentMap.keys()) {
          const value: string | undefined = concurrentMap.get(key);
          if (value !== undefined) {
            iterationResult += `${key}:${value}, `;
          }
        }
      } catch (error) {
        iteratorError = true;
        expect(error instanceof Error).assertTrue();
      }
      await taskpool.execute(taskGroup);
      expect(concurrentMap.has(modifyKey)).assertTrue();
      expect(String(concurrentMap.get(modifyKey))).assertEqual(String(modifyValue));
      done();
    });

    /**
     * @tc.number SSUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_performancer_With_Test_static_0237
     * @tc.name performancer_With_Test_static_Test_002
     * @tc.desc Single-thread loop 1000 times interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("performancer_With_Test_static_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      for (let i: number = 0; i < 1000; i++) {
        concurrentMap.set(`key${i}`, `value${i}`);
      }
      let iteratorError: boolean = false;
      let iterationResult: string = "";
      try {
        for (const key of concurrentMap.keys()) {
          const value: string | undefined = concurrentMap.get(key);
          if (value !== undefined) {
            iterationResult += `${key}:${value}, `;
          }
        }
      } catch (error) {
        iteratorError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(String(concurrentMap.size)).assertEqual('1000');
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_performancer_With_Test_static_0238
     * @tc.name performancer_With_Test_static_Test_003
     * @tc.desc Multi-thread (10) competition 1000 tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("performancer_With_Test_static_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i: number = 0; i < 1000; i++) {
        concurrentMap.set(`key${i}`, `value${i}`);
      }
      for (let t: number = 0; t < 10; t++) {
        taskGroup.addTask(createModifyTask(concurrentMap, `key${t}`, `newValue${t}`));
      }
      let iteratorError: boolean = false;
      try {
        await taskpool.execute(taskGroup);
        for (const key of concurrentMap.keys()) {
          const value: string | undefined = concurrentMap.get(key);
          if (value === undefined) {
            throw new Error("Value is undefined!");
          }
        }
      } catch (error) {
        iteratorError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(String(concurrentMap.size)).assertEqual('1000');
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_performancer_With_Test_static_0239
     * @tc.name performancer_With_Test_static_Test_004
     * @tc.desc The hashMap has 1000 elements, and the operation of the common interface is timed for multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("performancer_With_Test_static_Test_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const concurrentMap:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      for (let i: number = 0; i < 1000; i++) {
        concurrentMap.set(`key${i}`, `value${i}`);
      }
      const worker = async (id: number) => {
        for (let i: number = 0; i < 1000; i++) {
          const key = `key${Math.floor(Math.random() * 1000)}`;
          concurrentMap.set(key, `newValue${key}`);
          const value = concurrentMap.get(key);
          if (value !== `newValue${key}`) {
            throw new Error("Value mismatch!");
          }
        }
      };
      const workers = [
        worker(1),
        worker(2),
        worker(3)
      ];
      try {
        await Promise.all(workers);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      expect(String(concurrentMap.size)).assertEqual('1000');
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0240
     * @tc.name constructor_With_Remove_static_Test_010
     * @tc.desc Verify remove operation returns correct value and updates map state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      hashMap.set(1, "one");
      hashMap.set(2, "two");
      hashMap.set(3, "three");

      expect(hashMap.remove(1)).assertEqual("one");
      expect(hashMap.remove(2)).assertEqual("two");

      expect(hashMap.remove(999)).assertUndefined();
      expect(String(hashMap.size)).assertEqual('1');
      expect(hashMap.remove(3)).assertEqual("three");
      expect(hashMap.remove(1)).assertUndefined();
      expect(String(hashMap.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Remove_static_Test_STATIC_0241
     * @tc.name constructor_With_Remove_static_Test_011
     * @tc.desc Verify remove operation returns correct value and updates map state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Remove_static_Test_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const hashMap = new  containers.ConcurrentHashMap<number, string | null | undefined>();
      hashMap.set(1, "one");
      hashMap.set(2, null);
      hashMap.set(3, undefined);
      hashMap.set(4, '@@@@');
      expect(hashMap.remove(1)).assertEqual("one");
      expect(String(hashMap.remove(2))).assertEqual("null");
      expect(String(hashMap.remove(3))).assertEqual("undefined");
      expect(String(hashMap.remove(4))).assertEqual('@@@@');
      expect(String(hashMap.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_forEach_static_Test_0242
     * @tc.name constructor_With_forEach_static_Test_006
     * @tc.desc Test forEach() iteration with value/key/map callback params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_forEach_static_Test_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.forEach((value, key) => {
        if (key === 1) {
          map.set(3, "three");
          map.remove(2);
        }
      });
      expect(String(map.size)).assertEqual('2');
      expect(map.get(3)).assertEqual("three");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0243
     * @tc.name constructor_With_Key_static_Test_007
     * @tc.desc Return a new iterator that contains the keys contained in this mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 100; i++) {
        map.set(i, "value" + i);
      }
      let iter = map.keys();
      let count = 0;
      let allValid = true;
      while (true) {
        let v = iter.next();
        if (v.done) break;

        if (v.value !== count) {
          allValid = false;
        }
        count++;
      }
      expect(String(count)).assertEqual("100");
      expect(String(allValid)).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_set_With_Set_static_Test_0245
     * @tc.name set_With_Set_static_Test_018
     * @tc.desc Batch insert 100 elements with 10ms interval.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("set_With_Set_static_Test_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      const totalCount: number = 100;
      for (let i: number = 0; i < totalCount; i++) {
        keyData.set(i, `value${i}`);
      }
      let allValid: boolean = true;
      for (let i: number = 0; i < totalCount; i++) {
        if (keyData.get(i) !== `value${i}`) {
          allValid = false;
          break;
        }
      }
      expect(allValid).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructor_With_Key_static_Test_0247
     * @tc.name constructor_With_Key_static_Test_0007
     * @tc.desc Verify keys iterator returns correct values for a populated ConcurrentHashMap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("constructor_With_Key_static_Test_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const inputMap = new Map<number, string>();
      inputMap.set(1, "value1");
      inputMap.set(2, "value2");
      inputMap.set(3, "value3");
      const concurrentMap = new  containers.ConcurrentHashMap<number, string>(inputMap);
      const iterator = concurrentMap.keys();
      const expectedKeys = [1, 2, 3];
      let index = 0;
      let result = iterator.next();
      while (!result.done) {
        expect(String(result.value)).assertEqual(String(expectedKeys[index]));
        index++;
        result = iterator.next();
      }
      expect(String(index)).assertEqual(String(expectedKeys.length));
      expect(result.value).assertUndefined();
      expect(result.done).assertTrue();
    });
  });
}