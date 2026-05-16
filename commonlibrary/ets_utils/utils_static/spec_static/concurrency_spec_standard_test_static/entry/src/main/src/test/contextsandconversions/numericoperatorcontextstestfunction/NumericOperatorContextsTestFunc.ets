'use static'
/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

enum IntEnum {One = 1, Two, Three}

enum IntEnum2 {One, Two, Three}

export function testNumericOperatorContexts0010() {
  const TAG = 'testNumericOperatorContexts0010';
  let v1: double = 1e-23;
  let v2: double = 1e-23;
  if (v1 - v2 !== 0.0) {
    console.info(`${TAG} Task execution failed: v1 - v2: ${v1 - v2}`);
    throw new Error('v1 - v2 check failed, expected 0.0');
  }
}

export function testNumericOperatorContexts0011() {
  const TAG = 'testNumericOperatorContexts0011';
  let v1: byte = 1;
  let v2: short = 1;
  if (v1 * v2 !== 1) {
    console.info(`${TAG} Task execution failed: v1 * v2: ${v1 * v2}`);
    throw new Error('v1 * v2 check failed, expected 1');
  }
}

export function testNumericOperatorContexts0012() {
  const TAG = 'testNumericOperatorContexts0012';
  let v1: short = 100;
  let v2: double = 100.0;
  if (v1 + v2 !== 200.0) {
    console.info(`${TAG} Task execution failed: v1 + v2: ${v1 + v2}`);
    throw new Error('v1 + v2 check failed, expected 200.0');
  }
}

export function testNumericOperatorContexts0013() {
  const TAG = 'testNumericOperatorContexts0013';
  let v1: double = 100.0;
  let v2: long = 2;
  if (v1 / v2 !== 50.0) {
    console.info(`${TAG} Task execution failed: v1 / v2: ${v1 / v2}`);
    throw new Error('v1 / v2 check failed, expected 50.0');
  }
}

export function testNumericOperatorContexts0014() {
  const TAG = 'testNumericOperatorContexts0014';
  let v1: IntEnum = IntEnum.One;
  let v2: IntEnum = IntEnum.Two;
  if (v1 + v2 !== 3) {
    console.info(`${TAG} Task execution failed: v1 + v2: ${v1 + v2}`);
    throw new Error('v1 + v2 check failed, expected 3');
  }
}

export function testNumericOperatorContexts0015() {
  const TAG = 'testNumericOperatorContexts0015';
  let v1: IntEnum = IntEnum.One;
  let v2: IntEnum = IntEnum.Three;
  if (v1 * v2 !== 3) {
    console.info(`${TAG} Task execution failed: v1 * v2: ${v1 * v2}`);
    throw new Error('v1 * v2 check failed, expected 3');
  }
}

export function testNumericOperatorContexts0016() {
  const TAG = 'testNumericOperatorContexts0016';
  let v1: IntEnum = IntEnum.Two;
  let v2: IntEnum = IntEnum.One;
  if (v1 / v2 !== 2) {
    console.info(`${TAG} Task execution failed: v1 / v2: ${v1 / v2}`);
    throw new Error('v1 / v2 check failed, expected 2');
  }
}

export function testNumericOperatorContexts0017() {
  const TAG = 'testNumericOperatorContexts0017';
  let v1: IntEnum2 = IntEnum2.Two;
  let v2: IntEnum2 = IntEnum2.One;
  if (v1 > v2 !== true) {
    console.info(`${TAG} Task execution failed: v1 > v2: ${v1 > v2}`);
    throw new Error('v1 > v2 check failed, expected true');
  }
}

export function testNumericOperatorContexts0018() {
  const TAG = 'testNumericOperatorContexts0018';
  let x: bigint = 1n;
  let y: long = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0019() {
  const TAG = 'testNumericOperatorContexts0019';
  let x: bigint = 1n;
  let y: long = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0020() {
  const TAG = 'testNumericOperatorContexts0020';
  let x: bigint = 1n;
  let y: long = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0021() {
  const TAG = 'testNumericOperatorContexts0021';
  let x: bigint = 1n;
  let y: long = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0022() {
  const TAG = 'testNumericOperatorContexts0022';
  let x: bigint = 1n;
  let y: long = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0023() {
  const TAG = 'testNumericOperatorContexts0023';
  let x: bigint = 1n;
  let y: long = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0024() {
  const TAG = 'testNumericOperatorContexts0024';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0025() {
  const TAG = 'testNumericOperatorContexts0025';
  let x: bigint = 1n;
  let y: long = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0026() {
  const TAG = 'testNumericOperatorContexts0026';
  let x: bigint = 1n;
  let y: long = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0027() {
  const TAG = 'testNumericOperatorContexts0027';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0028() {
  const TAG = 'testNumericOperatorContexts0028';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0029() {
  const TAG = 'testNumericOperatorContexts0029';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0030() {
  const TAG = 'testNumericOperatorContexts0030';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0031() {
  const TAG = 'testNumericOperatorContexts0031';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0032() {
  const TAG = 'testNumericOperatorContexts0032';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0033() {
  const TAG = 'testNumericOperatorContexts0033';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0034() {
  const TAG = 'testNumericOperatorContexts0034';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0035() {
  const TAG = 'testNumericOperatorContexts0035';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0036() {
  const TAG = 'testNumericOperatorContexts0036';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0037() {
  const TAG = 'testNumericOperatorContexts0037';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0038() {
  const TAG = 'testNumericOperatorContexts0038';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0039() {
  const TAG = 'testNumericOperatorContexts0039';
  let x: bigint = 1n;
  let y: short = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0040() {
  const TAG = 'testNumericOperatorContexts0040';
  let x: bigint = 1n;
  let y: short = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0041() {
  const TAG = 'testNumericOperatorContexts0041';
  let x: byte = 1;
  let y: byte = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0042() {
  const TAG = 'testNumericOperatorContexts0042';
  let x: byte = 1;
  let y: byte = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0043() {
  const TAG = 'testNumericOperatorContexts0043';
  let x: byte = 1;
  let y: short = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0044() {
  const TAG = 'testNumericOperatorContexts0044';
  let x: byte = 1;
  let y: short = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0045() {
  const TAG = 'testNumericOperatorContexts0045';
  let x: byte = 1;
  let y: short = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0046() {
  const TAG = 'testNumericOperatorContexts0046';
  let x: byte = 1;
  let y: short = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0047() {
  const TAG = 'testNumericOperatorContexts0047';
  let x: byte = 1;
  let y: short = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0048() {
  const TAG = 'testNumericOperatorContexts0048';
  let x: byte = 1;
  let y: short = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0049() {
  const TAG = 'testNumericOperatorContexts0049';
  let x: byte = 1;
  let y: int = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0050() {
  const TAG = 'testNumericOperatorContexts0050';
  let x: byte = 1;
  let y: int = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0051() {
  const TAG = 'testNumericOperatorContexts0051';
  let x: byte = 1;
  let y: int = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0052() {
  const TAG = 'testNumericOperatorContexts0052';
  let x: byte = 1;
  let y: int = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0053() {
  const TAG = 'testNumericOperatorContexts0053';
  let x: byte = 1;
  let y: byte = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0054() {
  const TAG = 'testNumericOperatorContexts0054';
  let x: byte = 1;
  let y: int = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0055() {
  const TAG = 'testNumericOperatorContexts0055';
  let x: byte = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0056() {
  const TAG = 'testNumericOperatorContexts0056';
  let x: byte = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0057() {
  const TAG = 'testNumericOperatorContexts0057';
  let x: byte = 1;
  let y: int = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0058() {
  const TAG = 'testNumericOperatorContexts0058';
  let x: byte = 1;
  let y: long = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0059() {
  const TAG = 'testNumericOperatorContexts0059';
  let x: byte = 1;
  let y: long = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0060() {
  const TAG = 'testNumericOperatorContexts0060';
  let x: byte = 1;
  let y: long = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0061() {
  const TAG = 'testNumericOperatorContexts0061';
  let x: byte = 1;
  let y: long = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0062() {
  const TAG = 'testNumericOperatorContexts0062';
  let x: byte = 1;
  let y: long = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0063() {
  const TAG = 'testNumericOperatorContexts0063';
  let x: byte = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0064() {
  const TAG = 'testNumericOperatorContexts0064';
  let x: byte = 1;
  let y: byte = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0065() {
  const TAG = 'testNumericOperatorContexts0065';
  let x: byte = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0066() {
  const TAG = 'testNumericOperatorContexts0066';
  let x: byte = 1;
  let y: long = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0067() {
  const TAG = 'testNumericOperatorContexts0067';
  let x: byte = 1;
  let y: float = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0068() {
  const TAG = 'testNumericOperatorContexts0068';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0069() {
  const TAG = 'testNumericOperatorContexts0069';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0070() {
  const TAG = 'testNumericOperatorContexts0070';
  let x: bigint = 1n;
  let y: short = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0071() {
  const TAG = 'testNumericOperatorContexts0071';
  let x: bigint = 1n;
  let y: short = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0072() {
  const TAG = 'testNumericOperatorContexts0072';
  let x: bigint = 1n;
  let y: short = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0073() {
  const TAG = 'testNumericOperatorContexts0073';
  let x: bigint = 1n;
  let y: short = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0074() {
  const TAG = 'testNumericOperatorContexts0074';
  let x: bigint = 1n;
  let y: short = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0075() {
  const TAG = 'testNumericOperatorContexts0075';
  let x: bigint = 1n;
  let y: short = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0076() {
  const TAG = 'testNumericOperatorContexts0076';
  let x: bigint = 1n;
  let y: int = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0077() {
  const TAG = 'testNumericOperatorContexts0077';
  let x: bigint = 1n;
  let y: int = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0078() {
  const TAG = 'testNumericOperatorContexts0078';
  let x: bigint = 1n;
  let y: int = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0079() {
  const TAG = 'testNumericOperatorContexts0079';
  let x: bigint = 1n;
  let y: int = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0080() {
  const TAG = 'testNumericOperatorContexts0080';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0081() {
  const TAG = 'testNumericOperatorContexts0081';
  let x: bigint = 1n;
  let y: int = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0082() {
  const TAG = 'testNumericOperatorContexts0082';
  let x: bigint = 1n;
  let y: int = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0083() {
  const TAG = 'testNumericOperatorContexts0083';
  let x: bigint = 1n;
  let y: int = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0084() {
  const TAG = 'testNumericOperatorContexts0084';
  let x: bigint = 1n;
  let y: int = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0085() {
  const TAG = 'testNumericOperatorContexts0085';
  let x: byte = 1;
  let y: float = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0086() {
  const TAG = 'testNumericOperatorContexts0086';
  let x: byte = 1;
  let y: float = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0087() {
  const TAG = 'testNumericOperatorContexts0087';
  let x: byte = 1;
  let y: float = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0088() {
  const TAG = 'testNumericOperatorContexts0088';
  let x: byte = 1;
  let y: float = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0089() {
  const TAG = 'testNumericOperatorContexts0089';
  let x: byte = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0090() {
  const TAG = 'testNumericOperatorContexts0090';
  let x: byte = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0091() {
  const TAG = 'testNumericOperatorContexts0091';
  let x: byte = 1;
  let y: float = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0092() {
  const TAG = 'testNumericOperatorContexts0092';
  let x: byte = 1;
  let y: double = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0093() {
  const TAG = 'testNumericOperatorContexts0093';
  let x: byte = 1;
  let y: double = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0094() {
  const TAG = 'testNumericOperatorContexts0094';
  let x: byte = 1;
  let y: double = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0095() {
  const TAG = 'testNumericOperatorContexts0095';
  let x: byte = 1;
  let y: double = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0096() {
  const TAG = 'testNumericOperatorContexts0096';
  let x: byte = 1;
  let y: double = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0097() {
  const TAG = 'testNumericOperatorContexts0097';
  let x: byte = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0098() {
  const TAG = 'testNumericOperatorContexts0098';
  let x: byte = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0099() {
  const TAG = 'testNumericOperatorContexts0099';
  let x: byte = 1;
  let y: double = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0100() {
  const TAG = 'testNumericOperatorContexts0100';
  let x: byte = 1;
  let y: byte = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0101() {
  const TAG = 'testNumericOperatorContexts0101';
  let x: byte = 1;
  let y: byte = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0102() {
  const TAG = 'testNumericOperatorContexts0102';
  let x: byte = 1;
  let y: byte = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0103() {
  const TAG = 'testNumericOperatorContexts0103';
  let x: byte = 1;
  let y: short = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0104() {
  const TAG = 'testNumericOperatorContexts0104';
  let x: byte = 1;
  let y: short = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0105() {
  const TAG = 'testNumericOperatorContexts0105';
  let x: double = 1;
  let y: double = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0106() {
  const TAG = 'testNumericOperatorContexts0106';
  let x: double = 1;
  let y: double = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0107() {
  const TAG = 'testNumericOperatorContexts0107';
  let x: double = 1;
  let y: double = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0108() {
  const TAG = 'testNumericOperatorContexts0108';
  let x: double = 1;
  let y: double = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0109() {
  const TAG = 'testNumericOperatorContexts0109';
  let x: double = 1;
  let y: double = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0110() {
  const TAG = 'testNumericOperatorContexts0110';
  let x: double = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0111() {
  const TAG = 'testNumericOperatorContexts0111';
  let x: double = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0112() {
  const TAG = 'testNumericOperatorContexts0112';
  let x: double = 1;
  let y: double = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0113() {
  const TAG = 'testNumericOperatorContexts0113';
  let x: long = 1;
  let y: float = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0114() {
  const TAG = 'testNumericOperatorContexts0114';
  let x: long = 1;
  let y: float = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0115() {
  const TAG = 'testNumericOperatorContexts0115';
  let x: long = 1;
  let y: double = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0116() {
  const TAG = 'testNumericOperatorContexts0116';
  let x: long = 1;
  let y: double = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0117() {
  const TAG = 'testNumericOperatorContexts0117';
  let x: long = 1;
  let y: double = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0118() {
  const TAG = 'testNumericOperatorContexts0118';
  let x: long = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0119() {
  const TAG = 'testNumericOperatorContexts0119';
  let x: long = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0120() {
  const TAG = 'testNumericOperatorContexts0120';
  let x: long = 1;
  let y: double = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0121() {
  const TAG = 'testNumericOperatorContexts0121';
  let x: long = 1;
  let y: float = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0122() {
  const TAG = 'testNumericOperatorContexts0122';
  let x: long = 1;
  let y: float = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0123() {
  const TAG = 'testNumericOperatorContexts0123';
  let x: long = 1;
  let y: float = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0124() {
  const TAG = 'testNumericOperatorContexts0124';
  let x: long = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0125() {
  const TAG = 'testNumericOperatorContexts0125';
  let x: long = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0126() {
  const TAG = 'testNumericOperatorContexts0126';
  let x: long = 1;
  let y: float = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0127() {
  const TAG = 'testNumericOperatorContexts0127';
  let x: long = 1;
  let y: double = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0128() {
  const TAG = 'testNumericOperatorContexts0128';
  let x: long = 1;
  let y: double = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0129() {
  const TAG = 'testNumericOperatorContexts0129';
  let x: int = 1;
  let y: int = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0130() {
  const TAG = 'testNumericOperatorContexts0130';
  let x: int = 1;
  let y: int = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0131() {
  const TAG = 'testNumericOperatorContexts0131';
  let x: int = 1;
  let y: long = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0132() {
  const TAG = 'testNumericOperatorContexts0132';
  let x: int = 1;
  let y: long = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0133() {
  const TAG = 'testNumericOperatorContexts0133';
  let x: int = 1;
  let y: long = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0134() {
  const TAG = 'testNumericOperatorContexts0134';
  let x: int = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0135() {
  const TAG = 'testNumericOperatorContexts0135';
  let x: int = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0136() {
  const TAG = 'testNumericOperatorContexts0136';
  let x: int = 1;
  let y: long = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0137() {
  const TAG = 'testNumericOperatorContexts0137';
  let x: int = 1;
  let y: float = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0138() {
  const TAG = 'testNumericOperatorContexts0138';
  let x: int = 1;
  let y: float = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0139() {
  const TAG = 'testNumericOperatorContexts0139';
  let x: int = 1;
  let y: float = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0140() {
  const TAG = 'testNumericOperatorContexts0140';
  let x: int = 1;
  let y: float = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0141() {
  const TAG = 'testNumericOperatorContexts0141';
  let x: int = 1;
  let y: int = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0142() {
  const TAG = 'testNumericOperatorContexts0142';
  let x: int = 1;
  let y: float = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0143() {
  const TAG = 'testNumericOperatorContexts0143';
  let x: int = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0144() {
  const TAG = 'testNumericOperatorContexts0144';
  let x: int = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0145() {
  const TAG = 'testNumericOperatorContexts0145';
  let x: int = 1;
  let y: float = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0146() {
  const TAG = 'testNumericOperatorContexts0146';
  let x: int = 1;
  let y: double = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0147() {
  const TAG = 'testNumericOperatorContexts0147';
  let x: int = 1;
  let y: double = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0148() {
  const TAG = 'testNumericOperatorContexts0148';
  let x: int = 1;
  let y: double = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0149() {
  const TAG = 'testNumericOperatorContexts0149';
  let x: int = 1;
  let y: double = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0150() {
  const TAG = 'testNumericOperatorContexts0150';
  let x: int = 1;
  let y: double = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0151() {
  const TAG = 'testNumericOperatorContexts0151';
  let x: int = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0152() {
  const TAG = 'testNumericOperatorContexts0152';
  let x: int = 1;
  let y: int = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0153() {
  const TAG = 'testNumericOperatorContexts0153';
  let x: int = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0154() {
  const TAG = 'testNumericOperatorContexts0154';
  let x: int = 1;
  let y: double = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0155() {
  const TAG = 'testNumericOperatorContexts0155';
  let x: int = 1;
  let y: int = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0156() {
  const TAG = 'testNumericOperatorContexts0156';
  let x: int = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0157() {
  const TAG = 'testNumericOperatorContexts0157';
  let x: int = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0158() {
  const TAG = 'testNumericOperatorContexts0158';
  let x: int = 1;
  let y: int = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0159() {
  const TAG = 'testNumericOperatorContexts0159';
  let x: int = 1;
  let y: long = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0160() {
  const TAG = 'testNumericOperatorContexts0160';
  let x: int = 1;
  let y: long = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0161() {
  const TAG = 'testNumericOperatorContexts0161';
  let x: long = 1;
  let y: long = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0162() {
  const TAG = 'testNumericOperatorContexts0162';
  let x: long = 1;
  let y: long = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0163() {
  const TAG = 'testNumericOperatorContexts0163';
  let x: long = 1;
  let y: float = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0164() {
  const TAG = 'testNumericOperatorContexts0164';
  let x: long = 1;
  let y: float = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0165() {
  const TAG = 'testNumericOperatorContexts0165';
  let x: long = 1;
  let y: float = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0166() {
  const TAG = 'testNumericOperatorContexts0166';
  let x: long = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0167() {
  const TAG = 'testNumericOperatorContexts0167';
  let x: long = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0168() {
  const TAG = 'testNumericOperatorContexts0168';
  let x: long = 1;
  let y: float = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0169() {
  const TAG = 'testNumericOperatorContexts0169';
  let x: long = 1;
  let y: double = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0170() {
  const TAG = 'testNumericOperatorContexts0170';
  let x: long = 1;
  let y: double = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0171() {
  const TAG = 'testNumericOperatorContexts0171';
  let x: long = 1;
  let y: double = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0172() {
  const TAG = 'testNumericOperatorContexts0172';
  let x: long = 1;
  let y: double = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0173() {
  const TAG = 'testNumericOperatorContexts0173';
  let x: long = 1;
  let y: long = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0174() {
  const TAG = 'testNumericOperatorContexts0174';
  let x: long = 1;
  let y: double = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0175() {
  const TAG = 'testNumericOperatorContexts0175';
  let x: long = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0176() {
  const TAG = 'testNumericOperatorContexts0176';
  let x: long = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0177() {
  const TAG = 'testNumericOperatorContexts0177';
  let x: long = 1;
  let y: double = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0178() {
  const TAG = 'testNumericOperatorContexts0178';
  let x: long = 1;
  let y: long = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0179() {
  const TAG = 'testNumericOperatorContexts0179';
  let x: long = 1;
  let y: long = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0180() {
  const TAG = 'testNumericOperatorContexts0180';
  let x: long = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0181() {
  const TAG = 'testNumericOperatorContexts0181';
  let x: long = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0182() {
  const TAG = 'testNumericOperatorContexts0182';
  let x: long = 1;
  let y: long = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0183() {
  const TAG = 'testNumericOperatorContexts0183';
  let x: long = 1;
  let y: float = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0184() {
  const TAG = 'testNumericOperatorContexts0184';
  let x: long = 1;
  let y: float = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0185() {
  const TAG = 'testNumericOperatorContexts0185';
  let x: long = 1;
  let y: float = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0186() {
  const TAG = 'testNumericOperatorContexts0186';
  let x: long = 1;
  let y: float = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0187() {
  const TAG = 'testNumericOperatorContexts0187';
  let x: long = 1;
  let y: float = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0188() {
  const TAG = 'testNumericOperatorContexts0188';
  let x: long = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0189() {
  const TAG = 'testNumericOperatorContexts0189';
  let x: long = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0190() {
  const TAG = 'testNumericOperatorContexts0190';
  let x: long = 1;
  let y: float = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0191() {
  const TAG = 'testNumericOperatorContexts0191';
  let x: short = 1;
  let y: short = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0192() {
  const TAG = 'testNumericOperatorContexts0192';
  let x: short = 1;
  let y: short = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0193() {
  const TAG = 'testNumericOperatorContexts0193';
  let x: short = 1;
  let y: int = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0194() {
  const TAG = 'testNumericOperatorContexts0194';
  let x: short = 1;
  let y: int = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0195() {
  const TAG = 'testNumericOperatorContexts0195';
  let x: short = 1;
  let y: int = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0196() {
  const TAG = 'testNumericOperatorContexts0196';
  let x: short = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0197() {
  const TAG = 'testNumericOperatorContexts0197';
  let x: short = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0198() {
  const TAG = 'testNumericOperatorContexts0198';
  let x: short = 1;
  let y: int = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0199() {
  const TAG = 'testNumericOperatorContexts0199';
  let x: short = 1;
  let y: long = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0200() {
  const TAG = 'testNumericOperatorContexts0200';
  let x: short = 1;
  let y: long = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0201() {
  const TAG = 'testNumericOperatorContexts0201';
  let x: short = 1;
  let y: long = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0202() {
  const TAG = 'testNumericOperatorContexts0202';
  let x: short = 1;
  let y: long = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0203() {
  const TAG = 'testNumericOperatorContexts0203';
  let x: short = 1;
  let y: short = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0204() {
  const TAG = 'testNumericOperatorContexts0204';
  let x: short = 1;
  let y: long = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0205() {
  const TAG = 'testNumericOperatorContexts0205';
  let x: short = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0206() {
  const TAG = 'testNumericOperatorContexts0206';
  let x: short = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0207() {
  const TAG = 'testNumericOperatorContexts0207';
  let x: short = 1;
  let y: long = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0208() {
  const TAG = 'testNumericOperatorContexts0208';
  let x: short = 1;
  let y: float = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0209() {
  const TAG = 'testNumericOperatorContexts0209';
  let x: short = 1;
  let y: float = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0210() {
  const TAG = 'testNumericOperatorContexts0210';
  let x: short = 1;
  let y: float = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0211() {
  const TAG = 'testNumericOperatorContexts0211';
  let x: short = 1;
  let y: float = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0212() {
  const TAG = 'testNumericOperatorContexts0212';
  let x: short = 1;
  let y: float = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0213() {
  const TAG = 'testNumericOperatorContexts0213';
  let x: short = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0214() {
  const TAG = 'testNumericOperatorContexts0214';
  let x: short = 1;
  let y: short = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0215() {
  const TAG = 'testNumericOperatorContexts0215';
  let x: short = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0216() {
  const TAG = 'testNumericOperatorContexts0216';
  let x: short = 1;
  let y: float = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0217() {
  const TAG = 'testNumericOperatorContexts0217';
  let x: short = 1;
  let y: double = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0218() {
  const TAG = 'testNumericOperatorContexts0218';
  let x: short = 1;
  let y: double = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0219() {
  const TAG = 'testNumericOperatorContexts0219';
  let x: short = 1;
  let y: double = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0220() {
  const TAG = 'testNumericOperatorContexts0220';
  let x: short = 1;
  let y: double = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0221() {
  const TAG = 'testNumericOperatorContexts0221';
  let x: short = 1;
  let y: double = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0222() {
  const TAG = 'testNumericOperatorContexts0222';
  let x: short = 1;
  let y: double = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0223() {
  const TAG = 'testNumericOperatorContexts0223';
  let x: short = 1;
  let y: double = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0224() {
  const TAG = 'testNumericOperatorContexts0224';
  let x: short = 1;
  let y: short = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0225() {
  const TAG = 'testNumericOperatorContexts0225';
  let x: short = 1;
  let y: short = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0226() {
  const TAG = 'testNumericOperatorContexts0226';
  let x: short = 1;
  let y: short = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0227() {
  const TAG = 'testNumericOperatorContexts0227';
  let x: short = 1;
  let y: int = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0228() {
  const TAG = 'testNumericOperatorContexts0228';
  let x: short = 1;
  let y: int = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}
