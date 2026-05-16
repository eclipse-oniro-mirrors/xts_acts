/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class ObjectLiteralThisCounter {
  value: number = 5;

  makeReader(): () => number {
    return (): number => this.value;
  }
}

interface ObjectLiteralCounterLike {
  count: number;
  inc(): number;
}

function consumeObjectLiteralCounter(c: ObjectLiteralCounterLike): number {
  return c.inc();
}

interface ObjectLiteralHolder {
  value: number;
  getValue(): number;
}

interface ObjectLiteralPair<T1, T2> {
  left: T1;
  right: T2;
  getLeft(): T1;
  getRight(): T2;
}

function makeObjectLiteralPair(): ObjectLiteralPair<number, string> {
  return {
    left: 7,
    right: "ok",
    getLeft(): number {
      return this.left;
    },
    getRight(): string {
      return this.right;
    },
  };
}

interface ObjectLiteralValuePair<T1, T2> {
  value1: T1;
  value2: T2;
  getValue1(): T1;
  getValue2(): T2;
}

interface ObjectLiteralNumberBox {
  value: number;
  getValue(): number;
}

export default function objectLiteralThisCaptureTest(): void {
  describe('ObjectLiteralThisCaptureTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    /**
     * @tc.number SUB_ARKTS_OBJECT_LITERAL_THIS_CAPTURE_0100
     * @tc.name ObjectLiteralThisCaptureTest0001
     * @tc.desc Test ordinary lambda capture of class instance this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ObjectLiteralThisCaptureTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let c = new ObjectLiteralThisCounter();
      let reader = c.makeReader();
      expect(reader()).assertEqual(5);
    });

    /**
     * @tc.number SUB_ARKTS_OBJECT_LITERAL_THIS_CAPTURE_0200
     * @tc.name ObjectLiteralThisCaptureTest0002
     * @tc.desc Test typed object literal passed from lambda keeps method this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ObjectLiteralThisCaptureTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buildAndUse = (): void => {
        let value = consumeObjectLiteralCounter({
          count: 1,
          inc(): number {
            this.count += 1;
            return this.count;
          },
        });
        expect(value).assertEqual(2);
      }

      buildAndUse();
    });

    /**
     * @tc.number SUB_ARKTS_OBJECT_LITERAL_THIS_CAPTURE_0300
     * @tc.name ObjectLiteralThisCaptureTest0003
     * @tc.desc Test nested lambda inside object method captures object method this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ObjectLiteralThisCaptureTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let createHolder = (): ObjectLiteralHolder => {
        return {
          value: 123,
          getValue(): number {
            let holder: ObjectLiteralHolder = this;
            let result: number = 0;
            let read = (): void => {
              result = holder.value;
            };
            read();
            return result;
          },
        };
      }

      let h = createHolder();
      expect(h.getValue()).assertEqual(123);
    });

    /**
     * @tc.number SUB_ARKTS_OBJECT_LITERAL_THIS_CAPTURE_0400
     * @tc.name ObjectLiteralThisCaptureTest0004
     * @tc.desc Test generic interface object literal method this binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ObjectLiteralThisCaptureTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pair = ((): ObjectLiteralPair<number, string> => makeObjectLiteralPair())();
      expect(pair.getLeft()).assertEqual(7);
      expect(pair.getRight()).assertEqual("ok");
    });

    /**
     * @tc.number SUB_ARKTS_OBJECT_LITERAL_THIS_CAPTURE_0500
     * @tc.name ObjectLiteralThisCaptureTest0005
     * @tc.desc Test method this in typed object literal inside lambda
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ObjectLiteralThisCaptureTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func1 = (): void => {
        const numberStringPair: ObjectLiteralValuePair<number, string> = {
          value1: 42,
          value2: "Hello",
          getValue1(): number {
            return this.value1;
          },
          getValue2(): string {
            return this.value2;
          },
        };
        expect(numberStringPair.getValue1()).assertEqual(42);
        expect(numberStringPair.getValue2()).assertEqual("Hello");
      }

      func1();
    });

    /**
     * @tc.number SUB_ARKTS_OBJECT_LITERAL_THIS_CAPTURE_0600
     * @tc.name ObjectLiteralThisCaptureTest0006
     * @tc.desc Test returned typed object literal method this binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ObjectLiteralThisCaptureTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let build = (): ObjectLiteralNumberBox => {
        return {
          value: 99,
          getValue(): number {
            return this.value;
          },
        };
      }

      let box = build();
      expect(box.getValue()).assertEqual(99);
    });
  })
}
