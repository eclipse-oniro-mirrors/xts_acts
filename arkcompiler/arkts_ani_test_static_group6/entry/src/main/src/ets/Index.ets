/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class TestClass {
  public constructor () {}
  public sum(a: int, b: int): int {
    return a + b;
  }

  public newClass (): TestClass{
    return new TestClass();
  }

  static multiply(a: number, b: number): number {
    return a * b;
  }

}

export class Foo {
  native test_GetVersion(): int;
  native test_AttachDetach(): int;
  native test_AttachDetach_WithInterop(): int;
  native test_Attach_InvalidResult(): int;
  native test_Attach_InvalidVersion(): int;
  native test_Attach_InvalidOption(): int;
  native test_Attach_RepeatAttach(): int;
  native test_Attach_RepeatDetach(): int;
  native test_Detach_WithoutAttach(): int;
  native test_ConcurrentAttach(): int;
  native test_ConcurrentMainThreadWorker(): int;
  native test_CreateObjectInWorker(): int;
  native testBoxBooleanNative(): boolean;
  native testUnboxBooleanNative(): boolean;
  native testBoxByteNative(): boolean;
  native testUnboxByteNative(): boolean;
  native testBoxCharNative(): boolean;
  native testUnboxCharNative(): boolean;
  native testBoxDoubleNative(): boolean;
  native testUnboxDoubleNative(): boolean;
  native testBoxFloatNative(): boolean;
  native testUnboxFloatNative(): boolean;
  native testBoxIntNative(): boolean;
  native testUnboxIntNative(): boolean;
  native testBoxLongNative(): boolean;
  native testUnboxLongNative(): boolean;
  native testBoxShortNative(): boolean;
  native testUnboxShortNative(): boolean;
  
  constructor() {
  }

  public static new_Foo(): Foo {
    return new Foo();
  }
  static or(a0: boolean, a1: boolean): boolean {
    return a0 || a1;
  }
  static sum(a0: int, a1: int): int {
    return a0 + a1;
  }

  stringValue: string = 'test';
}