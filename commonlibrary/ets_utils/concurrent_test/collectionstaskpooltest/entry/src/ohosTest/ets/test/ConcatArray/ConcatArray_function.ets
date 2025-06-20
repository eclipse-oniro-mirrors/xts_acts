/*
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
import { collections } from "@kit.ArkTS";

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
export function testCollectionsConcatArray0001(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  return concatArray[1] === 2;
}

@Concurrent
export function testCollectionsConcatArray0002(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  return concatArray[-1] === undefined;
}

@Concurrent
export function testCollectionsConcatArray0003(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  return concatArray[5] === undefined;
}

@Concurrent
export function testCollectionsConcatArray0004(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join() === "a,b,c";
}

@Concurrent
export function testCollectionsConcatArray0005(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join("") === "abc";
}

@Concurrent
export function testCollectionsConcatArray0006(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join(undefined) === "a,b,c";
}

@Concurrent
export function testCollectionsConcatArray0007(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join("ww") === "awwbwwc";
}

@Concurrent
export function testCollectionsConcatArray0008(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join("分隔符") === "a分隔符b分隔符c";
}

@Concurrent
export function testCollectionsConcatArray0009(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join(", ") === "a, b, c";
}

@Concurrent
export function testCollectionsConcatArray0010(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join("|") === "a|b|c";
}

@Concurrent
export function testCollectionsConcatArray0011(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join(",。\￥·") === "a,。￥·b,。￥·c";
}

@Concurrent
export function testCollectionsConcatArray0012(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join("😊") === "a😊b😊c";
}

@Concurrent
export function testCollectionsConcatArray0013(): boolean {
  let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
  return concatArray.join("녕하こんйте") === "a녕하こんйтеb녕하こんйтеc";
}

@Concurrent
export function testCollectionsConcatArray0014(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice().toString() === new collections.Array<number>(1, 2, 3, 4, 5).toString();
}

@Concurrent
export function testCollectionsConcatArray0015(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(0).toString() === new collections.Array<number>(1, 2, 3, 4, 5).toString();
}

@Concurrent
export function testCollectionsConcatArray0016(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(-1).toString() === new collections.Array<number>(5).toString();
}

@Concurrent
export function testCollectionsConcatArray0017(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(2).toString() === new collections.Array<number>(3, 4, 5).toString();
}

@Concurrent
export function testCollectionsConcatArray0018(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(10).toString() === '';
}

@Concurrent
export function testCollectionsConcatArray0019(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(undefined, -1).toString() === new collections.Array<number>(1, 2, 3, 4).toString();
}

@Concurrent
export function testCollectionsConcatArray0020(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(undefined, 0).toString() === '';
}

@Concurrent
export function testCollectionsConcatArray0021(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(undefined, 2).toString() === new collections.Array<number>(1, 2).toString();
}

@Concurrent
export function testCollectionsConcatArray0022(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(undefined, 10).toString() === new collections.Array<number>(1, 2, 3, 4, 5).toString();
}

@Concurrent
export function testCollectionsConcatArray0023(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(2, 4).toString() === new collections.Array<number>(3, 4).toString();
}

@Concurrent
export function testCollectionsConcatArray0024(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(2, 2).toString() === '';
}

@Concurrent
export function testCollectionsConcatArray0025(): boolean {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
  return concatArray.slice(2, 0).toString() === '';
}