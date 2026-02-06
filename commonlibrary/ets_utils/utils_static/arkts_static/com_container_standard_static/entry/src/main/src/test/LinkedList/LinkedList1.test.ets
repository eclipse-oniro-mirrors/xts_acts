/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
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
import LinkedList from '@ohos.util.LinkedList';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from '../Util.test';

class Temp {
  age: number;
  name: string;

  constructor(age: number = 0, name: string = "") {
    this.age = age;
    this.name = name;
  }
}

export default function LinkedListTest1() {
  describe('linkedListTest1', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_ADD_0100
     * @tc.name      : testLinkedListAdd0001
     * @tc.desc      : Testing LinkedList add different dataType data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListAdd0001';
    //   try {
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.add("zhang san");
    //     linkList.add(1);
    //     // linkList.add({
    //     //   age: 10, name: "zhang"
    //     // });
    //     linkList.add(new C1(10, "zhang"));
    //     linkList.add(undefined);
    //     linkList.add(null);
    //     linkList.add(true);
    //     linkList.add([0, 1, 2, undefined]);
    //     let jsonResult = JSON.stringify(linkList);
    //     console.log(`${TAG} jsonResult: ${jsonResult}`);
    //     expect(jsonResult)
    //       .assertEqual(`{"0":"zhang san","1":1,"2":{"age":10,"name":"zhang"},"4":null,"5":true,"6":[0,1,2,null]}`);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_ADD_0200
     * @tc.name      : testLinkedListAdd0002
     * @tc.desc      : Testing LinkedList add special string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListAdd0002';
      try {
        let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        linkList.add(param);
        let jsonResult = JSON.stringify(linkList);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(linkList.get(0)).assertEqual(param);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_ADD_FIRST_0100
     * @tc.name      : testLinkedListAddFirst0001
     * @tc.desc      : Testing LinkedList addFirst different dataType data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListAddFirst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListAddFirst0001';
    //   try {
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.addFirst("zhang san");
    //     linkList.addFirst(1);
    //     linkList.addFirst({
    //       age: 10, name: "zhang"
    //     });
    //     linkList.addFirst(undefined);
    //     linkList.addFirst(null);
    //     linkList.addFirst(true);
    //     linkList.addFirst([0, 1, 2, undefined]);
    //     let jsonResult = JSON.stringify(linkList);
    //     console.log(`${TAG} jsonResult: ${jsonResult}`);
    //     expect(jsonResult)
    //       .assertEqual(`{"0":[0,1,2,null],"1":true,"2":null,"4":{"age":10,"name":"zhang"},"5":1,"6":"zhang san"}`);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_ADD_FIRST_0200
     * @tc.name      : testLinkedListAddFirst0002
     * @tc.desc      : Testing LinkedList addFirst special string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListAddFirst0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListAddFirst0002';
      try {
        let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        linkList.addFirst(param);
        let jsonResult = JSON.stringify(linkList);
        console.log(`${TAG} jsonResult: ${jsonResult}`);
        expect(linkList.get(0)).assertEqual(param);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_INSERT_0100
     * @tc.name      : testLinkedListInsert0001
     * @tc.desc      : Testing LinkedList insert->addFirst->getIndexOf->removeByIndex->has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListInsert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListInsert0001';
      try {
        let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        linkList.insert(0, 1);
        linkList.insert(1, 2);
        linkList.addFirst(param);
        let index = linkList.getIndexOf(param);
        expect(String(index)).assertEqual('0');
        let removeResult = linkList.removeByIndex(index);
        console.log(`${TAG} removeResult: ${removeResult}`);
        expect(String(linkList.has(param))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_INSERT_0200
     * @tc.name      : testLinkedListInsert0002
     * @tc.desc      : Testing LinkedList insert->add->getLastIndexOf->removeByIndex->has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListInsert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListInsert0002';
      try {
        let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        linkList.insert(0, 1);
        linkList.insert(1, 2);
        linkList.add(param);
        let index = linkList.getLastIndexOf(param);
        expect(String(index)).assertEqual(String(linkList.length - 1));
        let removeResult = linkList.removeByIndex(index);
        console.log(`${TAG} removeResult: ${removeResult}`);
        expect(String(linkList.has(param))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_HAS_0100
     * @tc.name      : testLinkedListHas0001
     * @tc.desc      : Testing LinkedList has different dataType data check has result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListHas0001';
      try {
        let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        linkList.add("zhang san");
        linkList.add(1);
        // let temp: Temp = {
        //   age: 10, name: "zhang"
        // };
        let temp: Temp = new Temp(10, "zhang");
        linkList.add(temp);
        linkList.add(undefined);
        linkList.add(null);
        linkList.add(true);
        let arr = [0, 1, 2, undefined];
        linkList.add(arr);
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        linkList.add(param);

        expect(String(linkList.has("zhang san"))).assertEqual('true');
        expect(String(linkList.has(1))).assertEqual('true');
        expect(String(linkList.has(temp))).assertEqual('true');
        expect(String(linkList.has(undefined))).assertEqual('true');
        expect(String(linkList.has(null))).assertEqual('true');
        expect(String(linkList.has(true))).assertEqual('true');
        expect(String(linkList.has(arr))).assertEqual('true');
        expect(String(linkList.has(param))).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GET_0100
     * @tc.name      : testLinkedListGet0001
     * @tc.desc      : Testing LinkedList has different dataType data check get result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGet0001';
      try {
        let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
        Object>();
        linkList.add("zhang san");
        linkList.add(1);
        // let temp: Temp = {
        //   age: 10, name: "zhang"
        // };
        let temp: Temp = new Temp(10, "zhang");
        linkList.add(temp);
        linkList.add(undefined);
        linkList.add(null);
        linkList.add(true);
        let arr = [0, 1, 2, undefined];
        linkList.add(arr);
        let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
        linkList.add(param);
        linkList.forEach((value, index) => {
          expect(String(linkList.get(index))).assertEqual(String(value));
        })
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETINDEXOF_0100
     * @tc.name      : testLinkedListGetIndexOf0001
     * @tc.desc      : Testing LinkedList getIndexOf add same data check index
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetIndexOf0001';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(1);
        linkList.add(2);
        let index1 = linkList.getIndexOf(2);
        linkList.add(2);
        let index2 = linkList.getIndexOf(2);
        linkList.add(2);
        let index3 = linkList.getIndexOf(2);
        expect(String(index1 === index2 && index2 === index3)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETINDEXOF_0200
     * @tc.name      : testLinkedListGetIndexOf0002
     * @tc.desc      : Testing LinkedList getIndexOf add->getIndexOf->removeByIndex same data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetIndexOf0002';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(2);
        linkList.add(3);
        linkList.add(3);
        let index101 = linkList.removeByIndex(linkList.getIndexOf(2));
        let index102 = linkList.removeByIndex(linkList.getIndexOf(2));
        expect(String(index101 == index102)).assertEqual('true');
        let index103 = linkList.removeByIndex(linkList.getIndexOf(3));
        let index104 = linkList.removeByIndex(linkList.getIndexOf(3));
        expect(String(index103 == index104)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETINDEXOF_0300
     * @tc.name      : testLinkedListGetIndexOf0003
     * @tc.desc      : Testing LinkedList getIndexOf add->removeFirst->add->getIndexOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetIndexOf0003';
      try {
        let linkList: LinkedList<Number> = new LinkedList<Number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        linkList.add(5);
        let index: Number = linkList.removeFirst() as Number;
        linkList.add(index);
        expect(String(linkList.getIndexOf(index))).assertEqual(String(linkList.length - 1));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETINDEXOF_0400
     * @tc.name      : testLinkedListGetIndexOf0004
     * @tc.desc      : Testing LinkedList getIndexOf add->removeLast->add->getIndexOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetIndexOf0004';
      try {
        let linkList: LinkedList<Number> = new LinkedList<Number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        linkList.add(5);
        let index: Number = linkList.removeLast() as Number;
        linkList.add(index);
        expect(String(linkList.getIndexOf(index))).assertEqual(String(linkList.length - 1));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETLASTINDEXOF_0100
     * @tc.name      : testLinkedListGetLastIndexOf0001
     * @tc.desc      : Testing LinkedList getIndexOf add same data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetLastIndexOf0001';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(1);
        linkList.add(2);
        let index1 = linkList.getLastIndexOf(2);
        linkList.add(2);
        let index2 = linkList.getLastIndexOf(2);
        linkList.add(2);
        let index3 = linkList.getLastIndexOf(2);
        expect(String(index1 !== index2 && index2 !== index3)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETLASTINDEXOF_0200
     * @tc.name      : testLinkedListGetLastIndexOf0002
     * @tc.desc      : Testing LinkedList getIndexOf add->getLastIndexOf->removeByIndex same data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetLastIndexOf0002';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(2);
        linkList.add(3);
        linkList.add(3);
        let index101 = linkList.removeByIndex(linkList.getLastIndexOf(2));
        let index102 = linkList.removeByIndex(linkList.getLastIndexOf(2));
        expect(String(index101 == index102)).assertEqual('true');
        let index103 = linkList.removeByIndex(linkList.getLastIndexOf(3));
        let index104 = linkList.removeByIndex(linkList.getLastIndexOf(3));
        expect(String(index103 == index104)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETLASTINDEXOF_0300
     * @tc.name      : testLinkedListGetLastIndexOf0003
     * @tc.desc      : Testing LinkedList getIndexOf add->removeFirst->add->getLastIndexOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetLastIndexOf0003';
      try {
        let linkList: LinkedList<Number> = new LinkedList<Number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        linkList.add(5);
        let index: Number = linkList.removeFirst() as Number;
        linkList.add(index);
        expect(String(linkList.getLastIndexOf(index))).assertEqual(String(linkList.length - 1));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETLASTINDEXOF_0400
     * @tc.name      : testLinkedListGetLastIndexOf0004
     * @tc.desc      : Testing LinkedList getIndexOf add->removeLast->add->getLastIndexOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetLastIndexOf0004';
      try {
        let linkList: LinkedList<Number> = new LinkedList<Number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        linkList.add(5);
        let index: Number = linkList.removeLast() as Number;
        linkList.add(index);
        expect(String(linkList.getLastIndexOf(index))).assertEqual(String(linkList.length - 1));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_GETLASTINDEXOF_0500
     * @tc.name      : testLinkedListGetLastIndexOf0005
     * @tc.desc      : Testing LinkedList getIndexOf add->get->removeFirstFound
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListGetLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListGetLastIndexOf0005';
      try {
        let linkList: LinkedList<Number> = new LinkedList<Number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        linkList.add(5);
        let old: Number = linkList.get(0) as Number;
        linkList.removeFirstFound(old);
        expect(String(old != linkList.get(0))).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_REMOVELASTFOUND_0100
     * @tc.name      : testLinkedListRemoveLastFound0001
     * @tc.desc      : Testing LinkedList removeLastFound add->getLastIndexOf->removeLastFound check is deleted success
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListRemoveLastFound0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListRemoveLastFound0001';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        let index1 = linkList.getLastIndexOf(2);
        linkList.add(2);
        let index2 = linkList.getLastIndexOf(2);
        linkList.add(2);
        let index3 = linkList.getLastIndexOf(2);
        linkList.add(3);
        expect(String(index1 !== index2 && index2 !== index3)).assertEqual('true');
        linkList.removeLastFound(2);
        expect(String(linkList.getLastIndexOf(2))).assertEqual(String(index2));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_CLONE_0100
     * @tc.name      : testLinkedListClone0001
     * @tc.desc      : Testing LinkedList clone linkList to newLinkList and check linkList.value == newLinkList.value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListClone0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListClone0001';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let newLinkList = linkList.clone();
        linkList.forEach((value, index) => {
          expect(String(value == newLinkList.get(index))).assertEqual('true');
        })
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_CLONE_0200
     * @tc.name      : testLinkedListClone0002
     * @tc.desc      : Testing LinkedList clone linkList to newLinkList and insert newLinkList check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListClone0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListClone0002';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let length = linkList.length
        let newLinkList = linkList.clone();
        let newLength = newLinkList.length;
        newLinkList.insert(0, 1);
        expect(String(length == linkList.length)).assertEqual('true');
        expect(String(newLength != newLinkList.length)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_CLONE_0300
     * @tc.name      : testLinkedListClone0003
     * @tc.desc      : Testing LinkedList clone linkList to newLinkList and removeFirstFound newLinkList check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListClone0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListClone0003';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let length = linkList.length;
        let newLinkList = linkList.clone();
        let newLength = newLinkList.length;
        newLinkList.removeFirstFound(3);
        expect(String(length == linkList.length)).assertEqual('true');
        expect(String(newLength != newLinkList.length)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_CLONE_0400
     * @tc.name      : testLinkedListClone0004
     * @tc.desc      : Testing LinkedList clone linkList to newLinkList and addFirst newLinkList check length
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListClone0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListClone0004';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let length = linkList.length;
        let newLinkList = linkList.clone();
        let newLength = newLinkList.length;
        newLinkList.addFirst(3);
        expect(String(length == linkList.length)).assertEqual('true');
        expect(String(newLength != newLinkList.length)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_CLONE_0500
     * @tc.name      : testLinkedListClone0005
     * @tc.desc      : Testing LinkedList clone linkList to newLinkList and forEach
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListClone0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListClone0005';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let newLinkList = linkList.clone();
        newLinkList.forEach((value, index) => {
          expect(String(value == linkList.get(index))).assertEqual('true');
        })
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_CLEAR_0600
     * @tc.name      : testLinkedListClear0006
     * @tc.desc      : Testing LinkedList clear newLinkList and add
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListClear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListClear0006';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let newLinkList = linkList.clone();
        newLinkList.clear();
        newLinkList.add(1);
        expect(String(newLinkList.length)).assertEqual('1');
        expect(String(linkList.length)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_CLEAR_0700
     * @tc.name      : testLinkedListClear0007
     * @tc.desc      : Testing LinkedList clear linkList and add
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListClear0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListClear0007';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let newLinkList = linkList.clone();
        linkList.clear();
        linkList.add(1);
        expect(String(linkList.length)).assertEqual('1');
        expect(String(newLinkList.length)).assertEqual('3');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SET_0100
     * @tc.name      : testLinkedListSet0001
     * @tc.desc      : Testing LinkedList set linkList and update data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListSet0001';
    //   try {
    //
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.add("zhang san");
    //     linkList.add(1);
    //     let param: Temp = {
    //       age: 10, name: "zhang"
    //     };
    //     linkList.add(param);
    //     linkList.add(undefined);
    //     linkList.add(null);
    //     linkList.add(true);
    //     linkList.add([0, 1, 2, undefined]);
    //
    //     linkList.forEach((value, index: number) => {
    //       expect(String(linkList.set(Math.floor(index ?? 0), "li si") != undefined)).assertEqual('true');
    //     })
    //     console.log(`${JSON.stringify(linkList)}`);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SET_0200
     * @tc.name      : testLinkedListSet0002
     * @tc.desc      : Testing LinkedList set getIndexOf->set->removeByIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListSet0002';
    //   try {
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.add("zhang san");
    //     linkList.add(1);
    //     let param: Temp = {
    //       age: 10, name: "zhang"
    //     };
    //     linkList.add(param);
    //     linkList.add(undefined);
    //     linkList.add(null);
    //     linkList.add(true);
    //     linkList.add([0, 1, 2, undefined]);
    //
    //     let index = linkList.getIndexOf(param);
    //     let setParam = linkList.set(Math.floor(index), "li si");
    //     let removeParam = linkList.removeByIndex(Math.floor(index));
    //     expect(String(setParam == removeParam)).assertEqual('true');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SET_0300
     * @tc.name      : testLinkedListSet0003
     * @tc.desc      : Testing LinkedList set get->set->has
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListSet0003';
    //   try {
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.add("zhang san");
    //     linkList.add(1);
    //     let param: Temp = {
    //       age: 10, name: "zhang"
    //     };
    //     linkList.add(param);
    //     linkList.add(undefined);
    //     linkList.add(null);
    //     linkList.add(true);
    //     linkList.add([0, 1, 2, undefined]);
    //
    //     let index = linkList.getIndexOf(param);
    //     let setParam = linkList.set(Math.floor(index), "li si");
    //     expect(String(linkList.has(setParam))).assertEqual('true');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SET_0400
     * @tc.name      : testLinkedListSet0004
     * @tc.desc      : Testing LinkedList set set->convertToArray->instanceof
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListSet0004';
    //   try {
    //     class Temp1 {
    //       age: number = 0
    //       name: string = ""
    //
    //       constructor(age: number, name: string) {
    //         this.age = age;
    //         this.name = name;
    //       }
    //     }
    //
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.add("zhang san");
    //     linkList.add(1);
    //     let param: Temp1 = new Temp1(10, "zhang");
    //     linkList.add(param);
    //     linkList.add(undefined);
    //     linkList.add(null);
    //     linkList.add(true);
    //     linkList.add([0, 1, 2, undefined]);
    //
    //     linkList.forEach((value, index) => {
    //       linkList.set(Math.floor(index ?? 0), new Temp1(index, "zhang " + index));
    //     })
    //     let array = linkList.convertToArray();
    //     array.forEach((value) => {
    //       expect(String(value instanceof Temp1)).assertEqual('true');
    //     })
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SET_0500
     * @tc.name      : testLinkedListSet0005
     * @tc.desc      : Testing LinkedList set set->getFirst
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListSet0005';
    //   try {
    //     class Temp {
    //       age: number = 0;
    //       name: string = "";
    //
    //       constructor(age: number, name: string) {
    //         this.age = age;
    //         this.name = name;
    //       }
    //     }
    //
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.add("zhang san");
    //     linkList.add(1);
    //     let param: Temp = new Temp(10, "zhang");
    //     linkList.add(param);
    //     linkList.add(undefined);
    //     linkList.add(null);
    //     linkList.add(true);
    //     linkList.add([0, 1, 2, undefined]);
    //
    //     let setParam = linkList.set(0, "li si");
    //     let firstParam = linkList.getFirst();
    //     expect(String(setParam == firstParam)).assertEqual('true');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SET_0600
     * @tc.name      : testLinkedListSet0006
     * @tc.desc      : Testing LinkedList set set->getLast
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // it('testLinkedListSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = 'testLinkedListSet0006';
    //   try {
    //     class Temp1 {
    //       age: number = 0
    //       name: string = ""
    //
    //       constructor(age: number, name: string) {
    //         this.age = age;
    //         this.name = name;
    //       }
    //     }
    //
    //     let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object> = new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    //     Object>();
    //     linkList.add("zhang san");
    //     linkList.add(1);
    //     let param: Temp1 = new Temp1(10, "zhang");
    //     linkList.add(param);
    //     linkList.add(undefined);
    //     linkList.add(null);
    //     linkList.add(true);
    //     linkList.add([0, 1, 2, undefined]);
    //
    //     let setParam = linkList.set(linkList.length - 1, "li si");
    //     let lastParam = linkList.getLast();
    //     expect(String(setParam == lastParam)).assertEqual('true');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SYMBOL_ITERATOR_0100
     * @tc.name      : testLinkedListSymbolIterator0001
     * @tc.desc      : Testing LinkedList Symbol.iterator for of
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListSymbolIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListSymbolIterator0001';
      try {
        let linkList: LinkedList<Number> = new LinkedList<Number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let iter: IterableIterator<Number> = linkList.$_iterator();
        for (let tmp of iter) {
          expect(String(linkList.has(tmp))).assertEqual('true');
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_SYMBOL_ITERATOR_0200
     * @tc.name      : testLinkedListSymbolIterator0002
     * @tc.desc      : Testing LinkedList Symbol.iterator next
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListSymbolIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListSymbolIterator0002';
      try {
        let linkList: LinkedList<Number> = new LinkedList<Number>();
        linkList.add(1);
        linkList.add(2);
        linkList.add(3);
        linkList.add(4);
        let iter: IterableIterator<Number> = linkList.$_iterator();
        let tmp = iter.next();
        while (!tmp.done) {
          if (tmp.value) {
            expect(String(linkList.has(tmp.value as Number))).assertEqual('true');
          }
          tmp = iter.next();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_FOREACH_0100
     * @tc.name      : testLinkedListForEach0001
     * @tc.desc      : Testing LinkedList forEach
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListForEach0001';
      try {
        let linkedList: LinkedList<Number> = new LinkedList<Number>();
        linkedList.add(2);
        linkedList.add(4);
        linkedList.add(5);
        linkedList.add(4);
        linkedList.forEach((value: Number, index?: Number) => {
          console.log("value:" + value, "index:" + index);
          expect(String(linkedList.get(index as Number) as Number)).assertEqual(String(value));
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_FOREACH_0200
     * @tc.name      : testLinkedListForEach0002
     * @tc.desc      : Testing LinkedList forEach
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListForEach0002';
      try {
        let linkedList: LinkedList<Number> = new LinkedList<Number>();
        let linkedListNew: LinkedList<Number> = new LinkedList<Number>();
        linkedList.add(2);
        linkedList.add(4);
        linkedList.add(5);
        linkedList.add(4);
        linkedListNew.add(0);
        linkedList.forEach((value: Number, index?: Number) => {
          console.log("value:" + value, "index:" + index);
          expect(String(linkedList.get(index as Number) as Number)).assertEqual(String(value))
        });
        // expect(linkedListNew.convertToArray().toString()).assertEqual("0");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_FOREACH_0300
     * @tc.name      : testLinkedListForEach0003
     * @tc.desc      : Testing LinkedList forEach
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListForEach0003';
      try {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(2);
        linkedList.add(4);
        linkedList.add(5);
        linkedList.add(4);
        let index = 0;
        linkedList.forEach((value: number) => {
          expect(String(linkedList.get(index))).assertEqual(String(value));
          index ++;
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_FOREACH_0400
     * @tc.name      : testLinkedListForEach0004
     * @tc.desc      : Testing LinkedList forEach
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListForEach0004';
      try {
        let linkedList: LinkedList<number> = new LinkedList<number>();
        linkedList.add(2);
        linkedList.add(4);
        linkedList.add(5);
        linkedList.add(4);
        linkedList.forEach((value: number, index: number, linkedList: LinkedList<number>) => {
          expect(String(linkedList.get(index))).assertEqual(String(value));
        });
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_LINKED_LIST_REMOVELASTFOUND_0200
     * @tc.name      : testLinkedListRemoveLastFound0002
     * @tc.desc      : Testing LinkedList removeLastFound add->getLastIndexOf->removeLastFound check is deleted success
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testLinkedListRemoveLastFound0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testLinkedListRemoveLastFound0002';
      try {
        let linkList: LinkedList<number> = new LinkedList<number>();
        linkList.removeLastFound(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.code).assertEqual(10200017)
      }
    });

  });
}