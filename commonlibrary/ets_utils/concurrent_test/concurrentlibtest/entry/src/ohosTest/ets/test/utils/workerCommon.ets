/**
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
import { lang } from "@kit.ArkTS";

export class TestClass {
  a = 1;
  static b = 1;

  getA() {
    return this.a
  }

  static getB() {
    return TestClass.b
  }
}

@Sendable
export class TestSendableClass {
  a: number = 1;
  static b: number = 1;

  getA() {
    return this.a
  }

  static getB() {
    return TestSendableClass.b
  }
}

@Sendable
export function testSendableFunction() {
  return 1;
}

@Sendable
export function testSendableFunction2() {
  return 2;
}

@Sendable
export class ImplISendableClass implements lang.ISendable {
  count: number = 0;
}

export type TestCallObjType = string | null | undefined;

export class TestCallObject {
  instanceName: TestCallObjType;
  methodName: string;
  timeout: number;
  str?: string;

  constructor(instanceName: TestCallObjType, methodName: string, timeout: number, str?: string) {
    this.instanceName = instanceName;
    this.methodName = methodName;
    this.timeout = timeout;
    this.str = str;
  }
}

export class TestObj {
  public func1(): string {
    return "func1";
  }

  public func2(str?: string): string {
    return "func2";
  }

  public getMessageWithInput(str: string): string {
    return str;
  }
}

@Sendable
export class TestSendableObj {
  public func1(): string {
    return "func1";
  }

  public func2(str?: string): string {
    return "func2";
  }

  public getMessageWithInput(str: string): string {
    return str;
  }
}

export type testUnionType = string | number | boolean

@Sendable
export function funTest1(): number {
  return 1;
}

@Sendable
export function funTest2(): number {
  return 2;
}
