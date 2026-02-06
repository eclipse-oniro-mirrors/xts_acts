/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

class ArrayLike {
  public length: number;
  public zero: string;
  public one: string;

  constructor(length: number, zero: string, one: string) {
    this.length = length;
    this.zero = zero;
    this.one = one;
  }

  public toArray(): string[] {
    return [this.zero, this.one];
  }
}

function customSlice(arrayLike: ArrayLike): string[] {
  const result: string[] = [];
  for (let i = 0; i < arrayLike.length; i++) {
    switch (i) {
      case 0:
        result.push(arrayLike.zero);
        break;
      case 1:
        result.push(arrayLike.one);
        break;
    }
  }
  return result;
}

class ArrayLike48 {
  public length: number;
  public zero: number;
  public one: number;
  public two: number;

  constructor(zero: number, one: number, two: number) {
    this.zero = zero;
    this.one = one;
    this.two = two;
    this.length = 3;
  }

  public toObject(): ArrayLikeObject {
    return new ArrayLikeObject(this.zero, this.one, this.two, this.length);
  }
}

class ArrayLikeObject {
  public zero: number;
  public one: number;
  public two: number;
  public length: number;

  constructor(zero: number, one: number, two: number, length: number) {
    this.zero = zero;
    this.one = one;
    this.two = two;
    this.length = length;
  }

  public toArray(): number[] {
    return [this.zero, this.one, this.two];
  }
}

interface Node {
  tagName: string;
}

class NodeList {
  public length: number;
  public zero: Node;
  public one: Node;

  constructor(zero: Node, one: Node) {
    this.length = 2;
    this.zero = zero;
    this.one = one;
  }

  public item(index: number): Node | undefined {
    switch (index) {
      case 0:
        return this.zero;
      case 1:
        return this.one;
      default:
        return undefined;
    }
  }

  public toArray(): Node[] {
    const result: Node[] = [];
    for (let i = 0; i < this.length; i++) {
      const item = this.item(i);
      if (item) {
        result.push(item);
      }
    }
    return result;
  }
}

class ArrayLike50 {
  public length: number;
  public zero: number;
  public one: number;

  constructor(zero: number, one: number) {
    this.zero = zero;
    this.one = one;
    this.length = 2;
  }

  public toArray(): number[] {
    return [this.zero, this.one];
  }
}

export default function IndexedCollections06Test() {
  describe('IndexedCollections06Test', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.number    SUB_ANI_ARRAY_SLICE_0047
     * @tc.name      test_Array_Slice_Call_0047
     * @tc.desc      test customSlice to convert array-like object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_Array_Slice_Call_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_Slice_Call_0047 start');

        const likeArr47 = new ArrayLike(2, 'x', 'y');
        const arr47 = customSlice(likeArr47);

        expect(Array.isArray(arr47)).assertTrue();
        expect(arr47.join(",")).assertEqual("x,y");

        done();
        console.log('test_Array_Slice_Call_0047 end');
      });

    /**
     * @tc.number    SUB_ANI_ARRAY_METHOD_0048
     * @tc.name      test_Array_Method_0048
     * @tc.desc      test Array.from conversion and array method usability
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Method_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_Method_0048 start');
        const likeArr48 = new ArrayLike48(3, 1, 2);
        const arr48 = Array.from(likeArr48.toObject().toArray());

        arr48.sort((a, b) => a - b);

        expect(Array.isArray(arr48)).assertTrue();
        expect(arr48.join(",")).assertEqual("1,2,3");

        done();
        console.log('test_Array_Method_0048 end');
      });

    /**
     * @tc.number    SUB_ANI_ARRAY_NODELIST_0049
     * @tc.name      test_Array_NodeList_0049
     * @tc.desc      test Array.from to convert NodeList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_NodeList_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_NodeList_0049 start');

        const nodeList49 = new NodeList({ tagName: 'DIV' }, { tagName: 'SPAN' });

        const arr49 = Array.from(nodeList49.toArray());
        const tagNames = arr49.map(n => n.tagName);

        expect(Array.isArray(arr49)).assertTrue();
        expect(tagNames.join(",")).assertEqual("DIV,SPAN");

        done();
        console.log('test_Array_NodeList_0049 end');
      });

    /**
     * @tc.number    SUB_ANI_ARRAY_DIFFERENCE_0050
     * @tc.name      test_Array_Difference_0050
     * @tc.desc      test the difference between array-like object and real array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_Array_Difference_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Array_Difference_0050 start');

        const likeArr50 = new ArrayLike50(1, 2);
        const realArr50: number[] = [1, 2];
        const hasMethodLikeArr = Object.keys(likeArr50).includes('map');
        const hasMethodRealArr = !!realArr50.map;

        expect(hasMethodLikeArr).assertFalse();
        expect(hasMethodRealArr).assertTrue();

        done();
        console.log('test_Array_Difference_0050 start');
      });
  });
}