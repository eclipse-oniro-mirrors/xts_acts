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
import List from '@ohos.util.List';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';

class Temp1 {
  age: number = 0
  name: string = ""

  constructor(age: number, name: string) {
    this.age = age;
    this.name = name;
  }
}

interface Person {
  age: number;
  name: string;
}

class Temp {
  age: number = 0
  name: string = ""
}

export default function ArkListTest() {
  describe('arkListTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testListConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_CONSTRUCTOR_0100
     * @tc.desc   Testing List constructor support dataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListConstructor0001';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | bigint |
        Int32Array | undefined | null | object> =
          new List<number | string | Array<number | string | boolean> | boolean | bigint |
          Int32Array | undefined | null | object>();
        expect(String(list.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListAdd0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_ADD_0100
     * @tc.desc   Testing List Add different dataType data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListAdd0001';
      try {
        let list: List<number | string | Array<number | string | boolean | undefined> | boolean | undefined | null | Object> =
          new List<number | string | Array<number | string | boolean | undefined> | boolean | undefined | null | Object>();

        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        list.insert("insert", 0);

        list.removeByIndex(0);

        let jsonResult = JSON.stringify(list);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(jsonResult)
          .assertEqual(`{"0":"zhang san","1":1,"2":{"age":10,"name":"zhang"},"4":null,"5":true}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListAdd0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_ADD_0200
     * @tc.desc   Testing List add special string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListAdd0002';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        list.add(param);
        let jsonResult = JSON.stringify(list);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(String(list.get(0))).assertEqual(String(param));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListInsert0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_INSERT_0100
     * @tc.desc   Testing List insert insert->getIndexOf->removeByIndex->has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListInsert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListInsert0001';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        list.insert(1, 0);
        list.insert(2, 1);
        list.insert(param, 0);
        let index = list.getIndexOf(param);
        expect(String(index)).assertEqual('0');
        let removeResult = list.removeByIndex(index);
        console.log(`${TAG} removeResult: ${removeResult}`);
        expect(String(list.has(param))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListInsert0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_INSERT_0200
     * @tc.desc   Testing List insert insert->add->getLastIndexOf->removeByIndex->has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListInsert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListInsert0002';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        list.insert(1, 0);
        list.insert(2, 1);
        list.add(param);
        let index = list.getLastIndexOf(param);
        expect(String(index)).assertEqual(String(list.length - 1));
        let removeResult = list.removeByIndex(index);
        console.log(`${TAG} removeResult: ${removeResult}`);
        expect(String(list.has(param))).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_HAS_0100
     * @tc.desc   Testing List has different dataType data check has result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListHas0001';
      try {

        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        let arr = [0, 1, 2, undefined];
        list.add(arr);
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        list.add(param);

        expect(String(list.has("zhang san"))).assertEqual('true');
        expect(String(list.has(1))).assertEqual('true');
        expect(String(list.has(temp))).assertEqual('true');
        expect(String(list.has(undefined))).assertEqual('true');
        expect(String(list.has(null))).assertEqual('true');
        expect(String(list.has(true))).assertEqual('true');
        expect(String(list.has(arr))).assertEqual('true');
        expect(String(list.has(param))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GET_0100
     * @tc.desc   Testing List has different dataType data check get result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGet0001';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        let arr = [0, 1, 2, undefined];
        list.add(arr);
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        list.add(param);
        list.forEach((value, index) => {
          expect(String(list.get(index))).assertEqual(String(value));
        })
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetLastIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETLASTINDEXOF_0100
     * @tc.desc   Testing List getIndexOf add same data check index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetLastIndexOf0001';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        let index1 = list.getLastIndexOf(2);
        list.add(2);
        let index2 = list.getLastIndexOf(2);
        list.add(2);
        let index3 = list.getLastIndexOf(2);
        expect(String(index1 !== index2 && index2 !== index3)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetLastIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETLASTINDEXOF_0200
     * @tc.desc   Testing List getIndexOf add->getLastIndexOf->removeByIndex same data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetLastIndexOf0002';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(2);
        list.add(3);
        list.add(3);
        let index101 = list.removeByIndex(list.getLastIndexOf(2));
        let index102 = list.removeByIndex(list.getLastIndexOf(2));
        expect(String(index101 == index102)).assertEqual('true');
        let index103 = list.removeByIndex(list.getLastIndexOf(3));
        let index104 = list.removeByIndex(list.getLastIndexOf(3));
        expect(String(index103 == index104)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetLastIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETLASTINDEXOF_0300
     * @tc.desc   Testing List getIndexOf add->getLastIndexOf->removeByIndex->add->getLastIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetLastIndexOf0003';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(5);
        list.add(5);
        let lastIndex = list.getLastIndexOf(5);
        let removeParam = list.removeByIndex(lastIndex);
        if (removeParam !== undefined) {
          const param: number = removeParam;
          list.add(param);
          expect(String(list.getLastIndexOf(param))).assertEqual(String(lastIndex));
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetLastIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETLASTINDEXOF_0400
     * @tc.desc   Testing List getIndexOf add->remove->add->getLastIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetLastIndexOf0004';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        let param: number = 5;
        list.remove(param);
        list.add(param);
        expect(String(list.getLastIndexOf(param))).assertEqual(String(list.length - 1));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetIndexOf0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETINDEXOF_0100
     * @tc.desc   Testing List getIndexOf add same data check index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetIndexOf0001';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        let index1 = list.getIndexOf(2);
        list.add(2);
        let index2 = list.getIndexOf(2);
        list.add(2);
        let index3 = list.getIndexOf(2);
        expect(String(index1 === index2 && index2 === index3)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetIndexOf0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETINDEXOF_0200
     * @tc.desc   Testing List getIndexOf add->getIndexOf->removeByIndex same data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetIndexOf0002';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(2);
        list.add(3);
        list.add(3);
        let index101 = list.removeByIndex(list.getIndexOf(2));
        let index102 = list.removeByIndex(list.getIndexOf(2));
        expect(String(index101 == index102)).assertEqual('true');
        let index103 = list.removeByIndex(list.getIndexOf(3));
        let index104 = list.removeByIndex(list.getIndexOf(3));
        expect(String(index103 == index104)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetIndexOf0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETINDEXOF_0300
     * @tc.desc   Testing List getIndexOf add->remove->add->getIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetIndexOf0003';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        let param: number = 5;
        list.remove(param);
        list.add(param);
        expect(String(list.getIndexOf(param))).assertEqual(String(list.length - 1));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListGetIndexOf0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_GETINDEXOF_0400
     * @tc.desc   Testing List getIndexOf add->removeByIndex->add->getIndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListGetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListGetIndexOf0004';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        let removeParam = list.removeByIndex(list.length - 1);
        if (removeParam !== undefined) {
          const param: number = removeParam;
          list.add(param);
          expect(String(list.getLastIndexOf(param))).assertEqual(String(list.length - 1));
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListReplaceAllElement0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_REPLACEALLELEMENT_0100
     * @tc.desc   Testing List replaceAllElement insert new string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListReplaceAllElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListReplaceAllElement0001';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        let array = [0, 1, 2, undefined];
        list.add(array);
        list.add("");
        list.add("`");
        list.add("%");
        list.add(`"`);

        list.replaceAllElements((value, index, tempList) => {
          let indexValue = index || 0;
          let length = tempList ? tempList.length - 1 : 0
          if (indexValue === length) {
            let tmp = value as string;
            value = tmp + "add last index";
          }
          return value;
        })
        let index = list.getLast() as string;
        expect(index).assertContain("add last index");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSort0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SORT_0100
     * @tc.desc   Testing List getIndexOf add->clear->add->insert->sort(a-b)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSort0001';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        expect(String(list.isEmpty())).assertEqual('false');
        list.clear();
        expect(String(list.isEmpty())).assertEqual('true');
        list.add(4);
        list.add(1);
        list.insert(2, 0);
        list.insert(10, 0);
        list.insert(8, 0);
        list.sort((first, second) => first - second);
        list.add(3);
        console.log(`${TAG} list: ${JSON.stringify(list)}`);
        expect(JSON.stringify(list)).assertEqual(`{"0":1,"1":2,"2":4,"3":8,"4":10,"5":3}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSort0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SORT_0200
     * @tc.desc   Testing List getIndexOf add->clear->add->insert->sort(b-a)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSort0002';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        expect(String(list.isEmpty())).assertEqual('false');
        list.clear();
        expect(String(list.isEmpty())).assertEqual('true');
        list.add(4);
        list.add(1);
        list.insert(2, 0);
        list.insert(10, 0);
        list.insert(8, 0);
        list.sort((first, second) => second - first);
        list.add(3);
        console.log(`${TAG} list: ${JSON.stringify(list)}`);
        expect(JSON.stringify(list)).assertEqual(`{"0":10,"1":8,"2":4,"3":2,"4":1,"5":3}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSort0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SORT_0300
     * @tc.desc   Testing List getIndexOf add->clear->add->insert->sort(a-b)->getSubList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSort0003';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        expect(String(list.isEmpty())).assertEqual('false');
        list.clear();
        expect(String(list.isEmpty())).assertEqual('true');
        list.add(4);
        list.add(1);
        list.insert(2, 0);
        list.insert(10, 0);
        list.insert(8, 0);
        list.sort((first, second) => first - second);
        list.getSubList(Math.floor(5) as int, Math.floor(1) as int);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(10200001)
      }
    });

    /**
     * @tc.name   testListSort0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SORT_0400
     * @tc.desc   Testing List getIndexOf add->clear->add->insert->sort(a-b)->getSubList->add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSort0004';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        expect(String(list.isEmpty())).assertEqual('false');
        list.clear();
        expect(String(list.isEmpty())).assertEqual('true');
        list.add(4);
        list.add(1);
        list.insert(2, 0);
        list.insert(10, 0);
        list.insert(8, 0);
        list.sort((first, second) => first - second);
        list.getSubList(Math.floor(1) as int , Math.floor(5) as int);
        list.add(3);
        console.log(`${TAG} list: ${JSON.stringify(list)}`);
        expect(JSON.stringify(list)).assertEqual(`{"0":1,"1":2,"2":4,"3":8,"4":10,"5":3}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SET_0100
     * @tc.desc   Testing List set list and update data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSet0001';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let param: Temp = {
          age: 10, name: "zhang"
        };
        list.add(param);
        list.add(undefined);
        list.add(null);
        list.add(true);
        list.add([0, 1, 2]);

        list.forEach((value, index: int) => {
          expect(String(list.set(Math.floor(index || 0) as int, "li si") != undefined)).assertEqual('true');
        })
        console.log(`${JSON.stringify(list)}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SET_0200
     * @tc.desc   Testing List set getIndexOf->set->removeByIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSet0002';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let param: Temp = {
          age: 10, name: "zhang"
        };
        list.add(param);
        list.add(undefined);
        list.add(null);
        list.add(true);
        list.add([0, 1, 2]);

        let index = list.getIndexOf(param);
        let setParam = list.set(Math.floor(index) as int, "li si");
        let removeParam = list.removeByIndex(Math.floor(index) as int);
        expect(String(setParam == removeParam)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SET_0300
     * @tc.desc   Testing List set getIndexOf->set->has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSet0003';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let param: Temp = {
          age: 10, name: "zhang"
        };
        list.add(param);
        list.add(undefined);
        list.add(null);
        list.add(true);
        list.add([0, 1, 2]);

        let index = list.getIndexOf(param);
        let setParam = list.set(Math.floor(index) as int, "li si");
        expect(String(list.has(setParam))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SET_0400
     * @tc.desc   Testing List set set->convertToArray->instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSet0004';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let param: Temp1 = new Temp1(10, "zhang");
        list.add(param);
        list.add(undefined);
        list.add(null);
        list.add(true);
        list.add([0, 1, 2]);

        list.forEach((value, index) => {
          list.set(Math.floor(index || 0) as int, new Temp1(index, "zhang " + index));
        })
        let array = list.convertToArray();
        array.forEach((value) => {
          expect(String(value instanceof Temp1)).assertEqual('true');
        })
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SET_0500
     * @tc.desc   Testing List set set->getFirst
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSet0005';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let param: Temp1 = new Temp1(10, "zhang");
        list.add(param);
        list.add(undefined);
        list.add(null);
        list.add(true);
        list.add([0, 1, 2]);

        let setParam = list.set(0, "li si");
        let firstParam = list.getFirst();
        expect(setParam == firstParam).assertEqual(true);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SET_0600
     * @tc.desc   Testing List set set->getLast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListSet0006';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let param: Temp1 = new Temp1(10, "zhang");
        list.add(param);
        list.add(undefined);
        list.add(null);
        list.add(true);
        list.add([0, 1, 2]);

        let setParam = list.set(list.length - 1, "li si");
        let lastParam = list.getLast();
        expect(setParam == lastParam).assertEqual(true);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSymbolIterator0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SYMBOL_ITERATOR_0100
     * @tc.desc   Testing List Symbol.iterator for of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,(): void => {
      const TAG = 'testListSymbolIterator0001';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        let iter =list.$_iterator();
          for (let tmp of iter) {
          expect(String(list.has(tmp))).assertEqual('true');
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListSymbolIterator0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_SYMBOL_ITERATOR_0200
     * @tc.desc   Testing List Symbol.iterator next
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListSymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,(): void => {
      const TAG = 'testListSymbolIterator0002';
      try {
        let list: List<number> = new List<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        let iter =list.$_iterator();
        let tmp = iter.next();
        while (!tmp.done) {
          if (tmp.value!==undefined) {
            expect(String(list.has(tmp.value as number))).assertEqual('true');
          }
          tmp = iter.next();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListForEach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_FOREACH_0100
     * @tc.desc   Testing List forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListForEach0001';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        let array = [0, 1, 2, undefined];
        list.add(array);
        list.add("");
        list.add("`");
        list.add("%");
        list.add(`"`);
        list.forEach((value, index) => {
          expect(list.get(Math.floor(index || 0) as int)).assertEqual(value);
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListForEach0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_FOREACH_0200
     * @tc.desc   Testing List forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListForEach0002';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        let array = [0, 1, 2, undefined];
        list.add(array);
        list.add("");
        list.add("`");
        list.add("%");
        list.add(`"`);
        let index = 0;
        list.forEach((value) => {
          expect(list.get(Math.floor(index || 0) as int)).assertEqual(value);
          index++;
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListForEach0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_FOREACH_0300
     * @tc.desc   Testing List forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListForEach0003';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let listNew: List<number> = new List<number>();
        listNew.add(0);
        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        let array = [0, 1, 2, undefined];
        list.add(array);
        list.add("");
        list.add("`");
        list.add("%");
        list.add(`"`);
        let index = 0;
        list.forEach((value) => {
          expect(list.get(Math.floor(index || 0) as int)).assertEqual(value);
          index++;
        });
        expect(listNew.convertToArray().toString()).assertEqual("0");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testListForEach0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIST_FOREACH_0400
     * @tc.desc   Testing List forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testListForEach0004';
      try {
        let list: List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new List<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        list.add("zhang san");
        list.add(1);
        let temp: Temp = {
          age: 10, name: "zhang"
        };
        list.add(temp);
        list.add(undefined);
        list.add(null);
        list.add(true);
        let array = [0, 1, 2, undefined];
        list.add(array);
        list.add("");
        list.add("`");
        list.add("%");
        list.add(`"`);
        list.forEach((value, index, list: List<number | string | Array<number | string | boolean> | boolean |
        undefined | null | Object>) => {
          expect(list.get(Math.floor(index || 0) as int)).assertEqual(value);
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUtil3_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL3_010
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListEqual001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let list: List<number> = new List<number>();
        list.add(2);
        list.add(4);
        list.add(5);
        let obj: List<number> = new List<number>();
        obj.add(2);
        obj.add(4);
        obj.add(5);
        let result = list.equal(obj);
        expect(result).assertEqual(true);
      } catch (err) {
        err = err as BusinessError;
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUtil3_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL3_011
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListEqual002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let list: List<number> = new List<number>();
        list.add(2);
        list.add(4);
        list.add(5);
        let obj: List<number> = new List<number>();
        obj.add(1);
        obj.add(2);
        obj.add(3);
        let result = list.equal(obj);
        expect(result).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUtil3_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UTIL3_012
     * @tc.desc   Test the util
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtil3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let list: List<int> = new List<int>();
      expect(list.length).assertEqual(0);
      list.add(2);
      list.add(4);
      list.add(5);
      expect(list.length).assertEqual(3);
      expect(list[0]).assertEqual(2);
      expect(list[2]).assertEqual(5);
    });
  });
}