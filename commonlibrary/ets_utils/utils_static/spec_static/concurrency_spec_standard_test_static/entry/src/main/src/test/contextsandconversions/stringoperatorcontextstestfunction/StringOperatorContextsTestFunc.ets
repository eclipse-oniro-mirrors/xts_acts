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


type Foo = () => int;

enum Color { Red, Green, Blue };

class A {
}

class B {
  public override toString(): string {
    return "B";
  }
}
interface I {}

interface J extends I {}

class A1 implements I {
  public override toString(): string {
    return super.toString() + " :> A";
  }
}

class B1 extends A1 implements J {
  public override toString(): string {
    return super.toString() + " :> B";
  }
}
function foo(): int {
  return 42;
};
interface I2 {}

interface J2 extends I2 {}

class A2 implements I2 {
  public override toString(): string {
    return super.toString() + " :> A";
  }
}

class B2 extends A2 implements J {
  public override toString(): string {
    return super.toString() + " :> B";
  }
}

export function testStringOperatorContexts0001(){
  const TAG = 'testStringOperatorContexts0001';
  let p1: byte = 42 as byte;

        let res = p1 + "";
        let expected = "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0002(){
  const TAG = 'testStringOperatorContexts0002';
  let p1: Byte = new Byte(42 as byte);
        let res = p1 + "";
        let expected = "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0003(){
  const TAG = 'testStringOperatorContexts0003';
  let p1: FixedArray<boolean> = [true, false];
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0004(){
  const TAG = 'testStringOperatorContexts0004';
  let p1: [boolean, number] = [true, 42];
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0005(){
  const TAG = 'testStringOperatorContexts0005';
  let p1: Color = Color.Red;
        let res = p1 + "";
        let expected = "0";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0006(){
  const TAG = 'testStringOperatorContexts0006';
  let p1: Color = Color.Red;
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0007(){
  const TAG = 'testStringOperatorContexts0007';
  let p1: Foo = foo;
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0008(){
  const TAG = 'testStringOperatorContexts0008';
  let p1: A = new A();
        let res = p1 + "";
        let expected = "[object Object]";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0009(){
  const TAG = 'testStringOperatorContexts0009';
  let p1: (p: number) => number = (x: number): number => {
          return 2.0 * x;
        };
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0010(){
  const TAG = 'testStringOperatorContexts0010';
  let p1: Integral = new Byte(42 as byte);
        let res = p1 + "";
        let expected = "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0011(){
  const TAG = 'testStringOperatorContexts0011';
  let p1: float = 3.14f;
        let res = p1 + "";
        let expected = new Float(3.14).toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0012(){
  const TAG = 'testStringOperatorContexts0012';
  let p1: float = 3.14f;
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0013(){
  const TAG = 'testStringOperatorContexts0013';
  let p1: float = 3.14f;
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0014(){
  const TAG = 'testStringOperatorContexts0014';
  let p1: Object | null = null;
        let res = p1 + "";
        let expected = "null";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0015(){
  const TAG = 'testStringOperatorContexts0015';
  let p1: Object = new Object();
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0016(){
  const TAG = 'testStringOperatorContexts0016';
  let p1: boolean[] = [true, false];
        let res = p1 + "";
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0017(){
  const TAG = 'testStringOperatorContexts0017';
  let p1: byte = 42 as byte;
        let p2: short = 42;
        let p3: int = 42;
        let p4: long = 42;
        let p5: char = c'\u0020';
        let p6: boolean = true;
        let p7: boolean = false;
        let p8: bigint = 42n;
        let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7 + p8;
        let expected = 42 + 42 + 42 + 42 + " " + "true" + "false" + "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0018(){
  const TAG = 'testStringOperatorContexts0018';
  let p1: Byte = new Byte(42 as byte);
        let p2: Short = new Short(42);
        let p3: Int = new Int(42);
        let p4: Long = new Long(42);
        let p5: Boolean = new Boolean(true);
        let p6: Boolean = new Boolean(false);
        let p7: bigint = new BigInt(42);
        let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7;
        let expected = 42 + 42 + 42 + 42 + "true" + "false" + "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0019(){
  const TAG = 'testStringOperatorContexts0019';
  let p1: FixedArray<char> = [c'A', c'\uFAFA'];
        let p2: FixedArray<int> = [1431655765];
        let res = p1 + "" + p2;
        let expected = p1 + p2.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0020(){
  const TAG = 'testStringOperatorContexts0020';
  let p1: [byte, number] = [1 as byte, 2];
        let p2: [double, double, number] = [1.0, 2.0, 3.0];
        let res = p1 + "" + p2;
        let expected = p1 + p2.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0021(){
  const TAG = 'testStringOperatorContexts0021';
  let p1: Color = Color.Red;
        let p2: Color = Color.Blue;
        let p3: Color = Color.Green;
        let res = p1 + p2 + "" + p3;
        let expected = 0 + 2 + "1";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0022(){
  const TAG = 'testStringOperatorContexts0022';
  let p1: Color = Color.Red;
        let p2: Color = Color.Blue;
        let p3: Color = Color.Green;
        let res = p1 + p2 + "" + p3;
        let expected = p1 + p2 + p3.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0023(){
  const TAG = 'testStringOperatorContexts0023';
  let p1: A = new A();
        let p2: B = new B();
        let res = p1 + "" + p2;
        let expected = "[object Object]" + "B";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0024(){
  const TAG = 'testStringOperatorContexts0024';
  let p1: Integral = new Byte(42 as byte);
        let p2: Integral = new Short(42);
        let p3: Integral = new Int(42);
        let p4: Integral = new Long(42);
        let res = p1 + p2 + "" + p3 + p4;
        let expected = 42 + 42 + "42" + "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0025(){
  const TAG = 'testStringOperatorContexts0025';
  let p1: float = 3.14f;
        let p2: double = 3.14;
        let p3: float = 0.0f / 0.0f;
        let p4: double = 0.0 / 0.0;
        let p5: float = 1.0f / 0.0f;
        let p6: double = 1.0 / 0.0;
        let p7: float = -1.0f / 0.0f;
        let p8: double = -1.0 / 0.0;
        let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7 + p8;
        let expected = new Float(3.14f
        )
        +new Double(3.14) + NaN + NaN + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0026(){
  const TAG = 'testStringOperatorContexts0026';
  let p1: Float = new Float(3.14f
        )
        ;
        let p2: Double = new Double(3.14);
        let p3: Float = new Float(0.0f / 0.0f
        )
        ;
        let p4: Double = new Double(0.0 / 0.0);
        let p5: Float = new Float(1.0f / 0.0f
        )
        ;
        let p6: Double = new Double(1.0 / 0.0);
        let p7: Float = new Float(-1.0f / 0.0f
        )
        ;
        let p8: Double = new Double(-1.0 / 0.0);
        let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7 + p8;
        let expected = p1 + p2 + NaN + NaN + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0027(){
  const TAG = 'testStringOperatorContexts0027';
  let p1: Floating = new Float(3.14f
        )
        ;
        let p2: Floating = new Double(3.14);
        let res = p1 + "" + p2;
        let expected = p1 + p2.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0028(){
  const TAG = 'testStringOperatorContexts0028';
  let p1: Char | undefined = undefined;
        let p2: Error | null = null;
        let res = p1 + "" + p2;
        let expected = "undefined" + "null";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0029(){
  const TAG = 'testStringOperatorContexts0029';
  let p1: Object = new Object();
        let p2: Boolean = new Boolean();
        let res = p1 + "" + p2;
        let expected = p1.toString() + p2.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0030(){
  const TAG = 'testStringOperatorContexts0030';
  let p1: char[] = [c'A', c'\uFAFA'];
        let p2: float[] = [0.1f, 0.2f, 0.3f];
        let res = p1 + "" + p2;
        let expected = p1 + p2.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0031(){
  const TAG = 'testStringOperatorContexts0031';
  let p1: byte = 42 as byte;
        let p2: short = 42;
        let p3: int = 42;
        let p4: long = 42;
        let p5: char = c'\u0020';
        let p6: boolean = true;
        let p7: boolean = false;
        let p8: bigint = 42n;
        let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
        let expected = "42" + "42" + "42" + "42" + " " + "true" + "false" + "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0032(){
  const TAG = 'testStringOperatorContexts0032';
  let p1: Byte = new Byte(42 as byte);
        let p2: Short = new Short(42);
        let p3: Int = new Int(42);
        let p4: Long = new Long(42);
        let p5: Boolean = new Boolean(true);
        let p6: Boolean = new Boolean(false);
        let p7: bigint = new BigInt(42);
        let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7;
        let expected = "42" + "42" + "42" + "42" + "true" + "false" + "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0033(){
  const TAG = 'testStringOperatorContexts0033';
  let p1: FixedArray<boolean> = [true, false];
        let p2: FixedArray<byte> = [1, 2];
        let p3: FixedArray<char> = [c'A', c'\uFAFA'];
        let p4: FixedArray<short> = [5, 6];
        let p5: FixedArray<int> = [1431655765];
        let p6: FixedArray<long> = [6148914691236517];
        let p7: FixedArray<float> = [0.1f, 0.2f, 0.3f];
        let p8: FixedArray<double> = [1.0, 2.0, 3.0];
        let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
        let expected =
          p1.toString() + p2.toString() + p3.toString() + p4.toString() + p5.toString() + p6.toString() + p7.toString() +
          p8.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0034(){
  const TAG = 'testStringOperatorContexts0034';
  let p1: [boolean, number] = [true, 42];
        let p2: [byte, number] = [1 as byte, 2];
        let p3: [number, char, char] = [42, c'A', c'\uFAFA'];
        let p4: [short, number] = [5, 6];
        let p5: [int, string] = [1431655765, 'abc'];
        let p6: [long, int] = [6148914691236517, 1431655765];
        let p7: [float, float, float] = [0.1f, 0.2f, 0.3f];
        let p8: [double, double, number] = [1.0, 2.0, 3.0];
        let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
        let expected =
          p1.toString() + p2.toString() + p3.toString() + p4.toString() + p5.toString() + p6.toString() + p7.toString() +
          p8.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0035(){
  const TAG = 'testStringOperatorContexts0035';
  let p1: Color = Color.Red;
        let p2: Color = Color.Blue;
        let p3: Color = Color.Green;
        let res = "" + p1 + p2 + p3;
        let expected = "0" + "2" + "1";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0036(){
  const TAG = 'testStringOperatorContexts0036';
  let p1: Color = Color.Red;
        let p2: Color = Color.Blue;
        let p3: Color = Color.Green;
        let res = "" + p1 + p2 + p3;
        let expected = p1.toString() + p2.toString() + p3.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0037(){
  const TAG = 'testStringOperatorContexts0037';
  let p1: Foo = foo;
        let res = "" + p1;
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0038(){
  const TAG = 'testStringOperatorContexts0038';
  let p1: A = new A();
        let p2: B = new B();
        let res = "" + p1 + p2;
        let expected = "[object Object]" + "B";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0039(){
  const TAG = 'testStringOperatorContexts0039';
  let p1: (p: number) => number = (x: number): number => {
          return 2.0 * x;
        };
        let res = "" + p1;
        let expected = p1.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0040(){
  const TAG = 'testStringOperatorContexts0040';
  let p1: Integral = new Byte(42 as byte);
        let p2: Integral = new Short(42);
        let p3: Integral = new Int(42);
        let p4: Integral = new Long(42);
        let res = "" + p1 + p2 + p3 + p4;
        let expected = "42" + "42" + "42" + "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0041(){
  const TAG = 'testStringOperatorContexts0041';
  let p1: float = 3.14f;
        let p2: double = 3.14;
        let p3: float = 0.0f / 0.0f;
        let p4: double = 0.0 / 0.0;
        let p5: float = 1.0f / 0.0f;
        let p6: double = 1.0 / 0.0;
        let p7: float = -1.0f / 0.0f;
        let p8: double = -1.0 / 0.0;
        let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
        let expected = new Float(3.14f
        )
        .
        toString() + new Double(3.14).toString() + "NaN" + "NaN" + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0042(){
  const TAG = 'testStringOperatorContexts0042';
  let p1: Float = new Float(3.14f
        )
        ;
        let p2: Double = new Double(3.14);
        let p3: Float = new Float(0.0f / 0.0f
        )
        ;
        let p4: Double = new Double(0.0 / 0.0);
        let p5: Float = new Float(1.0f / 0.0f
        )
        ;
        let p6: Double = new Double(1.0 / 0.0);
        let p7: Float = new Float(-1.0f / 0.0f
        )
        ;
        let p8: Double = new Double(-1.0 / 0.0);
        let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
        let expected =
          p1.toString() + p2.toString() + "NaN" + "NaN" + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0043(){
  const TAG = 'testStringOperatorContexts0043';
  let p1: Floating = new Float(3.14f
        )
        ;
        let p2: Floating = new Double(3.14);
        let res = "" + p1 + p2;
        let expected = p1.toString() + p2.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0044(){
  const TAG = 'testStringOperatorContexts0044';
  let p1: Object | null = null;
        let p2: Char | undefined = undefined;
        let p3: Boolean | null = null;
        let p4: StringBuilder | undefined = undefined;
        let p5: Error | null = null;
        let res = "" + p1 + p2 + p3 + p4 + p5;
        let expected = "null" + "undefined" + "null" + "undefined" + "null";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0045(){
  const TAG = 'testStringOperatorContexts0045';
  let p1: Object = new Object();
        let p2: Char = new Char();
        let p3: Boolean = new Boolean();
        let p4: StringBuilder = new StringBuilder();
        let res = "" + p1 + p2 + p3 + p4;
        let expected = p1.toString() + p2.toString() + p3.toString() + p4.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0046(){
  const TAG = 'testStringOperatorContexts0046';
  let p1: boolean[] = [true, false];
        let p2: byte[] = [1, 2];
        let p3: char[] = [c'A', c'\uFAFA'];
        let p4: short[] = [5, 6];
        let p5: int[] = [1431655765];
        let p6: long[] = [6148914691236517];
        let p7: float[] = [0.1f, 0.2f, 0.3f];
        let p8: double[] = [1.0, 2.0, 3.0];
        let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
        let expected =
          p1.toString() + p2.toString() + p3.toString() + p4.toString() + p5.toString() + p6.toString() + p7.toString() +
          p8.toString();
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}

export function testStringOperatorContexts0047(){
  const TAG = 'testStringOperatorContexts0047';
  let src: string | null = null;
        let dst: string = src + "";
  if(dst !== "null"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected null');
      }
}

export function testStringOperatorContexts0048(){
  const TAG = 'testStringOperatorContexts0048';
  let src: Error | null = null;
        let dst: string = src + "";
  if(dst !== "null"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected null');
      }
}

export function testStringOperatorContexts0049(){
  const TAG = 'testStringOperatorContexts0049';
  let src: string | null = null;
        let dst: string = "" + src;
  if(dst !== "null"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected null');
      }
}

export function testStringOperatorContexts0050(){
  const TAG = 'testStringOperatorContexts0050';
  let src: Error | null = null;
        let dst: string = "" + src;
  if(dst !== "null"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected null');
      }
}

export function testStringOperatorContexts0051(){
  const TAG = 'testStringOperatorContexts0051';
  let src_1: byte = -123;
        let dst_1: string = "" + src_1;
        let exp_1: string = (new Byte(src_1)).toString();

        let src_2: short = -123;
        let dst_2: string = "" + src_2;
        let exp_2: string = (new Short(src_2)).toString();

        let src_3: char = c'X';
        let dst_3: string = "" + src_3;
        let exp_3: string = (new Char(src_3)).toString();

        let src_4: int = -123;
        let dst_4: string = "" + src_4;
        let exp_4: string = (new Int(src_4)).toString();

        let src_5: long = -123;
        let dst_5: string = "" + src_5;
        let exp_5: string = (new Long(src_5)).toString();

        let src_6: float = -123.0f;
        let dst_6: string = "" + src_6;
        let exp_6: string = (new Float(src_6)).toString();

        let src_7: double = -123.0;
        let dst_7: string = "" + src_7;
        let exp_7: string = (new Double(src_7)).toString();
  if(dst_1 !== exp_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected exp_1');
      }

  if(dst_2 !== exp_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected exp_2');
      }

  if(dst_3 !== exp_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected exp_3');
      }

  if(dst_4 !== exp_4){
        console.info(`${TAG} Task execution failed: dst_4: ${dst_4}`);
        throw new Error('dst_4 check failed, expected exp_4');
      }

  if(dst_5 !== exp_5){
        console.info(`${TAG} Task execution failed: dst_5: ${dst_5}`);
        throw new Error('dst_5 check failed, expected exp_5');
      }

  if(dst_6 !== exp_6){
        console.info(`${TAG} Task execution failed: dst_6: ${dst_6}`);
        throw new Error('dst_6 check failed, expected exp_6');
      }

  if(dst_7 !== exp_7){
        console.info(`${TAG} Task execution failed: dst_7: ${dst_7}`);
        throw new Error('dst_7 check failed, expected exp_7');
      }
}

export function testStringOperatorContexts0052(){
  const TAG = 'testStringOperatorContexts0052';
  let src_1: byte = -123;
        let dst_1: string = src_1 + "";
        let exp_1: string = (new Byte(src_1)).toString();

        let src_2: short = -123;
        let dst_2: string = src_2 + "";
        let exp_2: string = (new Short(src_2)).toString();

        let src_3: char = c'X';
        let dst_3: string = src_3 + "";
        let exp_3: string = (new Char(src_3)).toString();

        let src_4: int = -123;
        let dst_4: string = src_4 + "";
        let exp_4: string = (new Int(src_4)).toString();

        let src_5: long = -123;
        let dst_5: string = src_5 + "";
        let exp_5: string = (new Long(src_5)).toString();

        let src_6: float = -123.0f;
        let dst_6: string = src_6 + "";
        let exp_6: string = (new Float(src_6)).toString();

        let src_7: double = -123.0;
        let dst_7: string = src_7 + "";
        let exp_7: string = (new Double(src_7)).toString();
  if(dst_1 !== exp_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected exp_1');
      }

  if(dst_2 !== exp_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected exp_2');
      }

  if(dst_3 !== exp_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected exp_3');
      }

  if(dst_4 !== exp_4){
        console.info(`${TAG} Task execution failed: dst_4: ${dst_4}`);
        throw new Error('dst_4 check failed, expected exp_4');
      }

  if(dst_5 !== exp_5){
        console.info(`${TAG} Task execution failed: dst_5: ${dst_5}`);
        throw new Error('dst_5 check failed, expected exp_5');
      }

  if(dst_6 !== exp_6){
        console.info(`${TAG} Task execution failed: dst_6: ${dst_6}`);
        throw new Error('dst_6 check failed, expected exp_6');
      }

  if(dst_7 !== exp_7){
        console.info(`${TAG} Task execution failed: dst_7: ${dst_7}`);
        throw new Error('dst_7 check failed, expected exp_7');
      }
}

export function testStringOperatorContexts0053(){
  const TAG = 'testStringOperatorContexts0053';
  let src_1: Object = new Object();
        let dst_1: string = "" + src_1;
        let exp_1: string = src_1.toString();

        let src_2: string = new string();
        let dst_2: string = "" + src_2;
        let exp_2: string = src_2.toString();

        let src_3: Error = new Error();
        let dst_3: string = "" + src_3;
        let exp_3: string = src_3.toString();

        let src_4: A1 = new A1();
        let dst_4: string = "" + src_4;
        let exp_4: string = src_4.toString();

        let src_5: B1 = new B1();
        let dst_5: string = "" + src_5;
        let exp_5: string = src_5.toString();
  if(dst_1 !== exp_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected exp_1');
      }

  if(dst_2 !== exp_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected exp_2');
      }

  if(dst_3 !== exp_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected exp_3');
      }

  if(dst_4 !== exp_4){
        console.info(`${TAG} Task execution failed: dst_4: ${dst_4}`);
        throw new Error('dst_4 check failed, expected exp_4');
      }

  if(dst_5 !== exp_5){
        console.info(`${TAG} Task execution failed: dst_5: ${dst_5}`);
        throw new Error('dst_5 check failed, expected exp_5');
      }
}

export function testStringOperatorContexts0054(){
  const TAG = 'testStringOperatorContexts0054';
  let src_1: Object = new Object();
        let dst_1: string = src_1 + "";
        let exp_1: string = src_1.toString();

        let src_2: string = new string();
        let dst_2: string = src_2 + "";
        let exp_2: string = src_2.toString();

        let src_3: Error = new Error();
        let dst_3: string = src_3 + "";
        let exp_3: string = src_3.toString();

        let src_4: A2 = new A2();
        let dst_4: string = src_4 + "";
        let exp_4: string = src_4.toString();

        let src_5: B2 = new B2();
        let dst_5: string = src_5 + "";
        let exp_5: string = src_5.toString();
  if(dst_1 !== exp_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected exp_1');
      }

  if(dst_2 !== exp_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected exp_2');
      }

  if(dst_3 !== exp_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected exp_3');
      }

  if(dst_4 !== exp_4){
        console.info(`${TAG} Task execution failed: dst_4: ${dst_4}`);
        throw new Error('dst_4 check failed, expected exp_4');
      }

  if(dst_5 !== exp_5){
        console.info(`${TAG} Task execution failed: dst_5: ${dst_5}`);
        throw new Error('dst_5 check failed, expected exp_5');
      }
}

export function testStringOperatorContexts0055(){
  const TAG = 'testStringOperatorContexts0055';
  let src: string | undefined = undefined;
        let dst: string = src + "";
  if(dst !== "undefined"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected undefined');
      }
}

export function testStringOperatorContexts0056(){
  const TAG = 'testStringOperatorContexts0056';
  let src: Error | undefined = undefined;
        let dst: string = src + "";
  if(dst !== "undefined"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected undefined');
      }
}

export function testStringOperatorContexts0057(){
  const TAG = 'testStringOperatorContexts0057';
  let src: string | undefined = undefined;
        let dst: string = "" + src;
  if(dst !== "undefined"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected undefined');
      }
}

export function testStringOperatorContexts0058(){
  const TAG = 'testStringOperatorContexts0058';
  let src: Error | undefined = undefined;
        let dst: string = "" + src;
  if(dst !== "undefined"){
        console.info(`${TAG} Task execution failed: dst: ${dst}`);
        throw new Error('dst check failed, expected undefined');
      }
}

export function testStringOperatorContexts0059(){
  const TAG = 'testStringOperatorContexts0059';
  let p1: Integral = new Byte(42 as byte);
  let p2: Integral = new Short((42).toShort());
  let p3: Integral = new Int((42).toInt());
  let p4: Integral = new Long((42).toLong());
  let res = p1 + p2 + "" + p3 + p4;
  let expected = 42 + 42 + "42" + "42";
  if(res !== expected){
        console.info(`${TAG} Task execution failed: res: ${res}`);
        throw new Error('res check failed, expected expected');
      }
}
