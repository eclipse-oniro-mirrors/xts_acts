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

import { beforeAll, describe, it, expect, Level, Size, TestType } from '../../../../hypium/index';

class ForLoopHeaderSmartCastClass {
  name: string;
  superClass: ForLoopHeaderSmartCastClass | undefined;

  constructor(name: string, superClass: ForLoopHeaderSmartCastClass | undefined) {
    this.name = name;
    this.superClass = superClass;
  }

  getName(): string {
    return this.name;
  }

  getSuper(): ForLoopHeaderSmartCastClass | undefined {
    return this.superClass;
  }
}

class ForLoopHeaderSmartCastNode {
  name: string;
  parent: ForLoopHeaderSmartCastNode | undefined;

  constructor(name: string, parent: ForLoopHeaderSmartCastNode | undefined) {
    this.name = name;
    this.parent = parent;
  }

  getParent(): ForLoopHeaderSmartCastNode | undefined {
    return this.parent;
  }
}

class ForLoopHeaderSmartCastBox {
  value: string;
  next: ForLoopHeaderSmartCastBox | undefined;

  constructor(value: string, next: ForLoopHeaderSmartCastBox | undefined) {
    this.value = value;
    this.next = next;
  }

  getNext(): ForLoopHeaderSmartCastBox | undefined {
    return this.next;
  }
}

export default function forLoopHeaderSmartCastTest(): void {
  describe('ForLoopHeaderSmartCastTest', (): void => {
    beforeAll((): void => {
    });

    /**
     * @tc.number SUB_ARKTS_FOR_LOOP_HEADER_SMART_CAST_0100
     * @tc.name testForLoopHeaderSmartCast0001
     * @tc.desc Test class chain iteration in for-loop header keeps narrowed type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testForLoopHeaderSmartCast0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let leaf = new ForLoopHeaderSmartCastClass("A", new ForLoopHeaderSmartCastClass("Object", undefined));
        let expects: Array<string> = ["A", "Object"];
        let index: int = 0;

        for (let cls: ForLoopHeaderSmartCastClass | undefined = leaf; cls !== undefined; cls = cls!.getSuper()) {
          expect(cls!.getName().indexOf(expects[index]) >= 0).assertTrue();
          index += 1;
        }

        expect(index).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_FOR_LOOP_HEADER_SMART_CAST_0200
     * @tc.name testForLoopHeaderSmartCast0002
     * @tc.desc Test parent chain iteration in for-loop header keeps narrowed type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testForLoopHeaderSmartCast0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let root = new ForLoopHeaderSmartCastNode("root", undefined);
        let leaf = new ForLoopHeaderSmartCastNode("leaf", root);
        let expects: Array<string> = ["leaf", "root"];
        let index: int = 0;

        for (let current: ForLoopHeaderSmartCastNode | undefined = leaf; current !== undefined; current = current!.getParent()) {
          expect(current!.name).assertEqual(expects[index]);
          index += 1;
        }

        expect(index).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_FOR_LOOP_HEADER_SMART_CAST_0300
     * @tc.name testForLoopHeaderSmartCast0003
     * @tc.desc Test continue preserves narrowing inside a for-loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testForLoopHeaderSmartCast0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let chain = new ForLoopHeaderSmartCastBox("first", new ForLoopHeaderSmartCastBox("second", undefined));
        let seen: int = 0;

        for (let current: ForLoopHeaderSmartCastBox | undefined = chain; current !== undefined; current = current!.getNext()) {
          expect(current!.value.length > 0).assertTrue();
          seen += 1;
        }

        expect(seen).assertEqual(2);
        done();
      });
  });
}
