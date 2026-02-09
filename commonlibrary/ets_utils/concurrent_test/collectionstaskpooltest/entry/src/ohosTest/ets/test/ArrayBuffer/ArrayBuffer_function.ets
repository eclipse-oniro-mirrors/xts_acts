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
export function testCollectionsArrayBuffer0001(): string {
  try {
    new collections.ArrayBuffer(-1);
    return "no_error";
  } catch (err) {
    console.info("testCollectionsArrayBuffer0001 error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsArrayBuffer0002(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(0);
  return arrayBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0003(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(1);
  return arrayBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0004(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
  let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0);
  return slicedBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0005(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
  let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(-1);
  return slicedBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0006(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
  let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2);
  return slicedBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0007(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
  let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(10);
  return slicedBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0008(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
  let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2, 4);
  return slicedBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0009(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
  let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2, 2);
  return slicedBuffer.byteLength;
}

@Concurrent
export function testCollectionsArrayBuffer0010(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
  let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2, 0);
  return slicedBuffer.byteLength;
}