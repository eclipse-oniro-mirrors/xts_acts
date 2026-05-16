/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { Nested, NestedWithNullable } from './Nested'
import { myValue } from './NumberInitializer';

@Sendable
export class StringContainer {
  data: string = "Hello String in container";
}

/*
  Sendable class can extend from other sendable class
 */
@Sendable
export class ExtendedFromNested extends Nested {

  constructor() {
    super()
  }
}

/*
  Sendable class can contain field of other sendable class
 */
@Sendable
export class NestedSendableContainer {
  data: Nested = new Nested();
}

@Sendable
export class NullableNestedSendableContainer {
  data: NestedWithNullable = new NestedWithNullable();
}


@Sendable
export class NumberContainer {
  data: number = 12345678;
}

@Sendable
export class ValuedNumberContainer {
  data: number;
  constructor(val: number) {
    this.data = val;
  }
}

@Sendable
export class NullAndStringContainer {
  data: string| null = "Hello nullable string";
}

@Sendable
export class UndefinedAndStringContainer {
  data: string| undefined = "Hello undefined string";
}

/*
type StringDef = string;

@Sendable
export class StringDefContainer {
  data: StringDef = "Hello World";
}

*/

/*
  Create instance of sendable generic class, passing a sendable type as generic type
 */
@Sendable
export class GenericSendable<T> {
  field: T|undefined = undefined;
}

/*
@Sendable
export class CollectionHolder {
  e: collections.Array<number> = new collections.Array<number>();
}
*/

/*
@Sendable
export class ArrayContainer {
  data: Uint32Array;

  constructor(size: number) {
    this.data = new Uint32Array(new SharedArrayBuffer(size * 4));
  }
}
*
*/

/**/
//@Sendable
export class NumberContainerArray {
  data: NumberContainer[] = new Array(20);
}
/*
*/

@Sendable
export class OuterInitializerContainer {
  value: number = myValue;
}
