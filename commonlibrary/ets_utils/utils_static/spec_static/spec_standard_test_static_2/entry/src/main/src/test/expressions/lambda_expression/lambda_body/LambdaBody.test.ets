/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let global1: number = 0

let global2: number = 0

function capturingFunction() {
    let local1: number = 0
    return (local2: number) => {
        global1 = local1
        global2 = local2
        local1 = local2
    }
}

const lambda: () => int = (): int => { return 1 }

const storage = [lambda, lambda, lambda, lambda, lambda]

let lambda1: () => () => () => number = () => () => () => 1

class IntPair {
    p1: int
    p2: int
    constructor(p1: int, p2: int) {
        this.p1 = p1
        this.p2 = p2
    }
}

function box(lambda: () => int): int {
    return lambda()
}

function bar(p: IntPair): int {
    let f = () => { return p.p1++ }
    let get0 = f
    f = () => { return ++p.p2 }
    let get1 = f
    let get2 = get1
    f = () => { return ++p.p1 }
    get2 = f
    return box(get0) + box(get1) + box(get2)
}

class A_10 {
    count: number = 0
    test(op: () => void) {
        op()
    }
    increment() {
        this.test(() => { this.count++ })
    }
}

class A_11 {
    private _count: number = 0
    test(op: () => void) {
        op()
    }
    get count(): number {
        return this._count;
    }
    set count(p: number) {
        this._count = p;
    }
}

function f_13() {
    let y: int = 1
    let x = () => { return y + 1 }
    return x()
}

function f_14() {
    let y: int = 1
    let x = () => { y++ }
    x()
    return y
}

function f_15(y: int) {
    let x = () => { return y + 1 }
    return x()
}

function f_16(y: int) {
    let x = () => { y++ }
    x()
    return y
}

const helloWorld_17: string = 'Hello, World!'

const helloWorld_18: () => string = () => 'Hello, World!'

export default function LambdaBody(): void {
  describe("LambdaBody", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0100
     * @tc.name      testLambdaBody0001
     * @tc.desc      Body, single expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = () => 'Hello, World!'
        expect(f()).assertEqual('Hello, World!')
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0200
     * @tc.name      testLambdaBody0002
     * @tc.desc      Body, block
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = () => {
            let a = 'Hello'
            let b = ", "
            let c = 'World!'
            return a + b + c
        }
        expect(f()).assertEqual('Hello, World!')
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0300
     * @tc.name      testLambdaBody0003
     * @tc.desc      Body, capturing within the function scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const func1 = capturingFunction()
        const func2 = capturingFunction()
        func1(11)
        expect(global1).assertEqual(0)
        expect(global2).assertEqual(11)
        func2(22)
        expect(global1).assertEqual(0)
        expect(global2).assertEqual(22)
        func1(33)
        expect(global1).assertEqual(11)
        expect(global2).assertEqual(33)
        func2(44)
        expect(global1).assertEqual(22)
        expect(global2).assertEqual(44)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0400
     * @tc.name      testLambdaBody0004
     * @tc.desc      Body, capturing within the loop scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for(let index = 0; index < storage.length; index++) {
            storage[index] = () => {
                return index
            }
        }
        for(let index = 0; index < storage.length; index++) {
            expect(storage[index]()).assertEqual(index)
        }
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0500
     * @tc.name      testLambdaBody0005
     * @tc.desc      Body, lambda chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(lambda1()()()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0600
     * @tc.name      testLambdaBody0006
     * @tc.desc      Body, lambda reassignment with capture
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let p = new IntPair(0, 0)
        expect(bar(p)).assertEqual(3)
        expect(p.p1).assertEqual(2)
        expect(p.p2).assertEqual(1)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0700
     * @tc.name      testLambdaBody0007
     * @tc.desc      Body, capture "this"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a = new A_10()
        a.increment()
        expect(a.count).assertEqual(1)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0800
     * @tc.name      testLambdaBody0008
     * @tc.desc      Body, capture local variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(f_13()).assertEqual(2)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_0900
     * @tc.name      testLambdaBody0009
     * @tc.desc      Body, capture local variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(f_14()).assertEqual(2)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_1000
     * @tc.name      testLambdaBody0010
     * @tc.desc      Body, capture formal parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(f_15(4)).assertEqual(5)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_1100
     * @tc.name      testLambdaBody0011
     * @tc.desc      Body, capture formal parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(f_16(6)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_1200
     * @tc.name      testLambdaBody0012
     * @tc.desc      Body, capture constant from global scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = () => helloWorld_17
        expect(f instanceof Function0).assertTrue()
        expect(f()).assertEqual('Hello, World!')
    })

    /**
     * @tc.number    SUB_LAMBDA_BODY_TEST_1300
     * @tc.name      testLambdaBody0013
     * @tc.desc      Body, capture constant function from global scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLambdaBody0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let f = () => helloWorld_18
        expect(f()()).assertEqual('Hello, World!')
    })

  })
}
