'use static'
import { LinkedList } from '@kit.ArkTS';

class Temp {
  public age: number = 0
  public name: string = ''

  constructor() {
  }

  constructor(age: number, name: string) {
    this.age = age
    this.name = name
  }
}

// 01: add

export function testLinkedListAdd001() {
  const caseName = 'testLinkedListAdd0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    Object> =
      new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null | Object>();
    linkList.add('zhang san');
    linkList.add(1);
    linkList.add(new Temp(10, 'zhang'));
    linkList.add(undefined);
    linkList.add(null);
    linkList.add(true);
    linkList.add([0, 1, 2, undefined]);
    let jsonResult = JSON.stringify(linkList);
    if (jsonResult !== `{"0":"zhang san","1":1,"2":{"age":10,"name":"zhang"},"4":null,"5":true,"6":[0,1,2,null]}`) {
      throw new Error(`jsonResult mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 02: addFirst

export function testLinkedListAddFirst002() {
  const caseName = 'testLinkedListAddFirst0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    Object> =
      new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null | Object>();
    linkList.addFirst('zhang san');
    linkList.addFirst(1);
    linkList.addFirst(new Temp(10, 'zhang'));
    linkList.addFirst(undefined);
    linkList.addFirst(null);
    linkList.addFirst(true);
    linkList.addFirst([0, 1, 2, undefined]);
    let jsonResult = JSON.stringify(linkList);
    if (jsonResult !== `{"0":[0,1,2,null],"1":true,"2":null,"4":{"age":10,"name":"zhang"},"5":1,"6":"zhang san"}`) {
      throw new Error(`jsonResult mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 03: insert

export function testLinkedListInsert003() {
  const caseName = 'testLinkedListInsert0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    Object> =
      new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null | Object>();
    let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
    linkList.insert(0, 1);
    linkList.insert(1, 2);
    linkList.addFirst(param);
    let index = linkList.getIndexOf(param);
    if (index !== 0) {
      throw new Error(`index mismatch`);
    }
    let removeResult = linkList.removeByIndex(index.toInt());
    if (linkList.has(param) !== false) {
      throw new Error(`has mismatch after remove`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 04: has

export function testLinkedListHas004() {
  const caseName = 'testLinkedListHas0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    Object> =
      new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null | Object>();
    let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
    linkList.insert(0, 1);
    linkList.insert(1, 2);
    linkList.add(param);
    let index = linkList.getLastIndexOf(param);
    let removeResult = linkList.removeByIndex(index.toInt());
    if (linkList.has(param) !== false) {
      throw new Error(`catch error.`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 05: get

export function testLinkedListGet005() {
  const caseName = 'testLinkedListGet0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    Object> =
      new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null | Object>();
    let param = "!\"#$%'()+,-./:;<=>?@[\\]^_`{|}~";
    linkList.add(param);
    let jsonResult = JSON.stringify(linkList);
    if (linkList.get(0) !== param) {
      throw new Error(`catch error.`);
    }
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 06: getIndexOf

export function testLinkedListGetIndexOf006() {
  const caseName = 'testLinkedListGetIndexOf0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number> = new LinkedList<number>();
    linkList.add(1);
    linkList.add(2);
    let index1 = linkList.getIndexOf(2);
    linkList.add(2);
    let index2 = linkList.getIndexOf(2);
    linkList.add(2);
    let index3 = linkList.getIndexOf(2);
    if (!(index1 === index2 && index2 === index3)) {
      throw new Error(`getIndexOf same value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 07: getLastIndexOf

export function testLinkedListGetLastIndexOf007() {
  const caseName = 'testLinkedListGetLastIndexOf0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number> = new LinkedList<number>();
    linkList.add(1);
    linkList.add(2);
    let index1 = linkList.getLastIndexOf(2);
    linkList.add(2);
    let index2 = linkList.getLastIndexOf(2);
    linkList.add(2);
    let index3 = linkList.getLastIndexOf(2);
    if (!(index1 !== index2 && index2 !== index3)) {
      throw new Error(`getLastIndexOf same value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 08: removeFirstFound

export function testLinkedListRemoveFirstFound008() {
  const caseName = 'testLinkedListGetLastIndexOf0005';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number> = new LinkedList<number>();
    linkList.add(1);
    linkList.add(2);
    linkList.add(3);
    linkList.add(4);
    linkList.add(5);
    let old = linkList.get(0);
    linkList.removeFirstFound(old);
    if (old === linkList.get(0)) {
      throw new Error(`removeFirstFound failed`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 09: removeLastFound

export function testLinkedListRemoveLastFound009() {
  const caseName = 'testLinkedListRemoveLastFound0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number> = new LinkedList<number>();
    linkList.add(2);
    let index1 = linkList.getLastIndexOf(2);
    linkList.add(2);
    let index2 = linkList.getLastIndexOf(2);
    linkList.add(2);
    let index3 = linkList.getLastIndexOf(2);
    linkList.add(3);
    if (!(index1 !== index2 && index2 !== index3)) {
      throw new Error(`index mismatch before remove`);
    }
    linkList.removeLastFound(2);
    if (linkList.getLastIndexOf(2) !== index2) {
      throw new Error(`removeLastFound failed`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 10: clone

export function testLinkedListClone010() {
  const caseName = 'testLinkedListClone0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number> = new LinkedList<number>();
    linkList.add(2);
    linkList.add(3);
    linkList.add(4);
    let newLinkList = linkList.clone();
    newLinkList.forEach((value, index: int) => {
      if (value !== linkList.get(index)) {
        throw new Error(`clone value mismatch at index ${index}`);
      }
    });
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 11: clear

export function testLinkedListClear011() {
  const caseName = 'testLinkedListClear0006';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number> = new LinkedList<number>();
    linkList.add(2);
    linkList.add(3);
    linkList.add(4);
    let newLinkList = linkList.clone();
    newLinkList.clear();
    newLinkList.add(1);
    if (newLinkList.length !== 1) {
      throw new Error(`newLinkList length mismatch`);
    }
    if (linkList.length !== 3) {
      throw new Error(`original linkList length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 12: set

export function testLinkedListSet012() {
  const caseName = 'testLinkedListSet0001';
  try {
    console.log(`${caseName} test start`);
    let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    Object> =
      new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null | Object>();
    linkList.add('zhang san');
    linkList.add(1);
    let param: Temp = {
      age: 10, name: 'zhang'
    };
    linkList.add(param);
    linkList.add(undefined);
    linkList.add(null);
    linkList.add(true);
    linkList.add([0, 1, 2, undefined]);

    linkList.forEach((value, index: int, linkList) => {
      if (linkList.set(Math.floor(index ?? 0) as int, 'li si') === undefined) {
        throw new Error(`set failed at index ${index}`);
      }
    });
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

// 13: Symbol.iterator


// 14: forEach

export function testLinkedListForEach014() {
  const caseName = 'testLinkedListForEach0001';
  try {
    console.log(`${caseName} test start`);
    let linkedList: LinkedList<number> = new LinkedList<number>();
    linkedList.add(2);
    linkedList.add(4);
    linkedList.add(5);
    linkedList.add(4);
    linkedList.forEach((value: number, index: int, linkedList: LinkedList<number>) => {
      if (linkedList.get(index).toString() !== value.toString()) {
        throw new Error(`forEach mismatch at index ${index}`);
      }
    });
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}

class Temp1 {
  public age: number = 0;
  public name: string = '';

  constructor(age: number, name: string) {
    this.age = age;
    this.name = name;
  }
}

// 15: convertToArray

export function testLinkedListConvertToArray015() {
  const caseName = 'testLinkedListSet0004';
  try {
    console.log(`${caseName} test start`);

    let linkList: LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null |
    Object> =
      new LinkedList<number | string | Array<number | string | boolean> | boolean | undefined | null | Object>();
    linkList.add('zhang san');
    linkList.add(1);
    let param: Temp1 = new Temp1(10, 'zhang');
    linkList.add(param);
    linkList.add(undefined);
    linkList.add(null);
    linkList.add(true);
    linkList.add([0, 1, 2, undefined]);

    linkList.forEach((value, index: int) => {
      linkList.set(Math.floor(index ?? 0) as int, new Temp1(index, 'zhang ' + index));
    });
    let array = linkList.convertToArray();
    array.forEach((value) => {
      if (!(value instanceof Temp1)) {
        throw new Error(`convertToArray value not instance of Temp1`);
      }
    });
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`failed: ${err.message}`);
    throw new Error(`catch error.`);
  }
}