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
import taskpool from '@ohos.taskpool'
import { allocateAndBypassFunction, BypassFunctionType } from './BypassFunction';
import { check, compareBuffers } from './utils';
import { StringContainer, NestedSendableContainer, NullableNestedSendableContainer,
  NumberContainer, NullAndStringContainer, UndefinedAndStringContainer, GenericSendable,
  OuterInitializerContainer
} from './Containers'
import { Nested } from './Nested'
import { CombinedType } from './SendablesTestImport'

// TESTS IMPLEMENTATION //

export function testSendableSimpleDate(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleDateImpl)
  return check("testSendableSimpleDate", p);
}

@Concurrent
async function testSendableSimpleDateImpl(): Promise<string> {
  let input: Date = new Date();
  let job: BypassFunctionType<Date> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input + ", but was " + res);
}

export function testSendableSimpleString(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleStringImpl)
  return check("testSendableSimpleString", p);
}

@Concurrent
async function testSendableSimpleStringImpl(): Promise<string> {
  let input: String = "Hello World";
  let job: BypassFunctionType<String> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res == input) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input + ", but was " + res);
}

export function testSendableSimpleNumber(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleNumberImpl)
  return check("testSendableSimpleNumber", p);
}

@Concurrent
async function testSendableSimpleNumberImpl(): Promise<string> {
  let input: Number = 12345678;
  let job: BypassFunctionType<Number> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res == input) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input + ", but was " + res);
}

export function testSendableSimpleBoolean(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleBooleanImpl)
  return check("testSendableSimpleBoolean", p);
}

@Concurrent
async function testSendableSimpleBooleanImpl(): Promise<string> {
  let input: Boolean = true;
  let job: BypassFunctionType<Boolean> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res == input) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input + ", but was " + res);
}

export function testSendableSimpleSharedArrayBuffer(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleSharedArrayBufferImpl)
  return check("testSendableSimpleSharedArrayBuffer", p);
}

@Concurrent
async function testSendableSimpleSharedArrayBufferImpl(): Promise<string> {
  let input: SharedArrayBuffer = new SharedArrayBuffer(5);
  let srcView = new DataView(input);
  for(let i = 0; i < 5; i++) srcView.setInt8(i, i);

  let job: BypassFunctionType<SharedArrayBuffer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (compareBuffers(input, res as SharedArrayBuffer)) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableSimpleSharedArrayBufferAndUndefined(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleSharedArrayBufferAndUndefinedImpl)
  return check("testSendableSimpleSharedArrayBufferAndUndefined", p);
}

@Concurrent
async function testSendableSimpleSharedArrayBufferAndUndefinedImpl(): Promise<string> {
  let input: SharedArrayBuffer = new SharedArrayBuffer(5);
  let job: BypassFunctionType<SharedArrayBuffer|undefined> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (compareBuffers(input, res as SharedArrayBuffer)) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableSimpleSharedArrayBufferAndNull(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleSharedArrayBufferAndNullImpl)
  return check("testSendableSimpleSharedArrayBufferAndNull", p);
}

@Concurrent
async function testSendableSimpleSharedArrayBufferAndNullImpl(): Promise<string> {
  let input: SharedArrayBuffer = new SharedArrayBuffer(5);
  let job: BypassFunctionType<SharedArrayBuffer|null> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (compareBuffers(input, res as SharedArrayBuffer)) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableSimpleCombined0(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombined0Impl)
  return check("testSendableSimpleCombined0", p);
}

@Concurrent
async function testSendableSimpleCombined0Impl(): Promise<string> {
  let input: SharedArrayBuffer = new SharedArrayBuffer(5);
  let job: BypassFunctionType<SharedArrayBuffer|null|undefined> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (compareBuffers(input, res as SharedArrayBuffer)) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableSimpleCombined1(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombined1Impl)
  return check("testSendableSimpleCombined1", p);
}

@Concurrent
async function testSendableSimpleCombined1Impl(): Promise<string> {
  let input: SharedArrayBuffer = new SharedArrayBuffer(5);
  let job: BypassFunctionType<SharedArrayBuffer|String> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (compareBuffers(input, res as SharedArrayBuffer)) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableSimpleCombined2(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombined2Impl)
  return check("testSendableSimpleCombined2", p);
}

@Concurrent
async function testSendableSimpleCombined2Impl(): Promise<string> {
  let input: String = "Hello World"
  let job: BypassFunctionType<SharedArrayBuffer|String> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res == input) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input + ", but was " + res);
}

export function testSendableSimpleCombinedAsType1(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombinedAsType1Impl)
  return check("testSendableSimpleCombinedAsType1", p);
}

@Concurrent
async function testSendableSimpleCombinedAsType1Impl(): Promise<string> {
  let input: CombinedType = "Hello World"
  let job: BypassFunctionType<CombinedType> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res == input) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input + ", but was " + res);
}

export function testSendableSimpleCombinedAsType2(): Promise<string> {
  let p = taskpool.execute(testSendableSimpleCombinedAsType2Impl)
  return check("testSendableSimpleCombinedAsType2", p);
}

@Concurrent
async function testSendableSimpleCombinedAsType2Impl(): Promise<string> {
  let input: CombinedType = new SharedArrayBuffer(5);
  let job: BypassFunctionType<CombinedType> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input))as Promise<Object>;
  let res = await (p)
  if (compareBuffers(input, res as SharedArrayBuffer)) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

/*
@Sendable
class SharedArrayBufferContainer { // Not compilable now
  data: SharedArrayBuffer = new SharedArrayBuffer(5);
}

export function testSendableSharedArrayBufferInContainer(): Promise<string> {
  let p = taskpool.execute(testSendableSharedArrayBufferInContainerImpl)
  return check("testSendableSharedArrayBufferInContainer", p);
}

@Concurrent
async function testSendableSharedArrayBufferInContainerImpl(): Promise<string> {
  let input: SharedArrayBufferContainer = new SharedArrayBufferContainer();
  let job: BypassFunctionType<SharedArrayBufferContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
   if (promised == input) {
    return "Test passed";
  }
  throw new Error("Test failed Expected " + input + ", but was " + promised);
}

*/

export function testSendableContainerWithString(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithStringImpl)
  return check("testSendableContainerWithString", p);
}

@Concurrent
async function testSendableContainerWithStringImpl(): Promise<string> {
  let input: StringContainer = new StringContainer();
  let job: BypassFunctionType<StringContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableContainerWithNumber(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNumberImpl)
  return check("testSendableContainerWithNumber", p);
}

@Concurrent
async function testSendableContainerWithNumberImpl(): Promise<string> {
  let input: NumberContainer = new NumberContainer();
  let job: BypassFunctionType<NumberContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableContainerWithNested(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNestedImpl)
  return check("testSendableContainerWithNested", p);
}

@Concurrent
async function testSendableContainerWithNestedImpl(): Promise<string> {
  let input: NestedSendableContainer = new NestedSendableContainer();
  let job: BypassFunctionType<NestedSendableContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableContainerWithNullableNested(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNullableNestedImpl)
  return check("testSendableContainerWithNullableNested", p);
}

@Concurrent
async function testSendableContainerWithNullableNestedImpl(): Promise<string> {
  let input: NullableNestedSendableContainer = new NullableNestedSendableContainer();
  let job: BypassFunctionType<NullableNestedSendableContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

/*
export function testSendableContainerWithStringType(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithStringTypeImpl)
  return check("testSendableContainerWithStringType", p);
}

@Concurrent
async function testSendableContainerWithStringTypeImpl(): Promise<string> {
  let input: StringDefContainer = new StringDefContainer();
  let job: BypassFunctionType<sc.StringDefContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)).then((promised) =>  {
    if (promised == input) {
      return "Test passed";
    }
    throw new Error("Test failed Expected " + input + ", but was " + promised);
  });
  await p;
  return p;
}
*/

export function testSendableContainerWithNullableString(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithNullableStringImpl)
  return check("testSendableContainerWithNullableString", p);
}

@Concurrent
async function testSendableContainerWithNullableStringImpl(): Promise<string> {
  let input: NullAndStringContainer = new NullAndStringContainer();
  let job: BypassFunctionType<NullAndStringContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableContainerWithUndefinedString(): Promise<string> {
  let p = taskpool.execute(testSendableContainerWithUndefinedStringImpl)
  return check("testSendableContainerWithUndefinedString", p);
}

@Concurrent
async function testSendableContainerWithUndefinedStringImpl(): Promise<string> {
  let input: UndefinedAndStringContainer = new UndefinedAndStringContainer();
  let job: BypassFunctionType<UndefinedAndStringContainer> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

export function testSendableWithGenericSendableField(): Promise<string> {
  let p = taskpool.execute(testSendableWithGenericSendableFieldImpl)
  return check("testSendableWithGenericSendableField", p);
}

@Concurrent
async function testSendableWithGenericSendableFieldImpl(): Promise<string> {
  let input: GenericSendable<Nested> = new GenericSendable<Nested>();
  let job: BypassFunctionType<GenericSendable<Nested>> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}

/*
export function testSendableWithSendableCollectionHolder(): Promise<string> {
  let p = taskpool.execute(testSendableWithSendableCollectionHolderImpl)
  return check("testSendableWithSendableCollectionHolder", p);
}

@Concurrent
async function testSendableWithSendableCollectionHolderImpl(): Promise<string> {
  let input: CollectionHolder = new CollectionHolder();
  let job: BypassFunctionType<CollectionHolder> = allocateAndBypassFunction;

  let p = taskpool.execute(new taskpool.Task(job, input)) as  as Promise<Object>;
  let res = await (p)
  if(res == input) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input + ", but was " + promised);
}

*/

export function testSendableImportedInitializer(): Promise<string> {
  let p = taskpool.execute(testSendableImportedInitializerImpl)
  return check("testSendableImportedInitializer", p);
}

@Concurrent
async function testSendableImportedInitializerImpl(): Promise<string> {
  let input: OuterInitializerContainer = new OuterInitializerContainer();
  let job: BypassFunctionType<OuterInitializerContainer> = allocateAndBypassFunction;
  let p = taskpool.execute(new taskpool.Task(job, input)) as Promise<Object>;
  let res = await (p)
  if (res.toString() == input.toString()) {
    return "TEST PASSED"
  }
  throw new Error("Test failed Expected " + input.toString() + ", but was " + res.toString());
}