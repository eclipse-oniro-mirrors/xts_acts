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
export function testBitVectorConstructor0001(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(-1);
  return bitVectorList.length;
}

@Concurrent
export function testBitVectorConstructor0002(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  return bitVectorList.length;
}

@Concurrent
export function testBitVectorConstructor0003(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(10);
  return bitVectorList.length;
}

@Concurrent
export function testBitVectorConstructor0004(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(100000);
  return bitVectorList.length;
}

@Concurrent
export function testBitVectorPush0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = bitVectorList.push(0);
  return rst && bitVectorList[0] === 0;
}

@Concurrent
export function testBitVectorPush0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = bitVectorList.push(1);
  return rst && bitVectorList[0] === 1;
}

@Concurrent
export function testBitVectorPush0003(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = bitVectorList.push(-1);
  return rst && bitVectorList[0] === 1;
}

@Concurrent
export function testBitVectorPush0004(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = bitVectorList.push(65535);
  return rst && bitVectorList[0] === 1;
}

@Concurrent
export function testBitVectorPush0005(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = bitVectorList.push(-65535);
  return rst && bitVectorList[0] === 1;
}

@Concurrent
export function testBitVectorPush0006(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = bitVectorList.push(2.5);
  return rst && bitVectorList[0] === 1;
}

@Concurrent
export function testBitVectorPush0007(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = false;
  for (let i = 0; i < 10; i++) {
    rst = bitVectorList.push(1);
  }
  return rst && bitVectorList.length === 10;
}

@Concurrent
export function testBitVectorPush0008(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let rst = false;
  for (let i = 0; i < 100000; i++) {
    rst = bitVectorList.push(0);
    rst = bitVectorList.push(1);
  }
  return rst && bitVectorList.length === 200000;
}

@Concurrent
export function testBitVectorPop0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(1);
  }
  for (let i = 0; i < 10; i++) {
    if (bitVectorList.pop() !== 1) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorPop0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(100000);
  let rst = 0;
  for (let i = 0; i < 100000; i++) {
    rst = bitVectorList.pop();
  }
  return rst === 0;
}

@Concurrent
export function testBitVectorPop0003(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(1);
  bitVectorList.push(1);
  bitVectorList.push(0);
  return bitVectorList.pop() === 0 && bitVectorList.pop() === 1 && bitVectorList.pop() === 1;
}

@Concurrent
export function testBitVectorPop0004(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(1);
  bitVectorList.push(1);
  bitVectorList.push(0);
  let result =
    bitVectorList.length === 3 && bitVectorList.pop() === 0 && bitVectorList.pop() === 1 && bitVectorList.pop() === 1;
  return result && bitVectorList.length === 0;
}

@Concurrent
export function testBitVectorPop0005(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  return bitVectorList.length === 0 && bitVectorList.pop() === undefined && bitVectorList.length === 0;
}

@Concurrent
export function testBitVectorHas0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  return bitVectorList.has(0, 0, 10);
}

@Concurrent
export function testBitVectorHas0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  return bitVectorList.has(0, 0, 5);
}

@Concurrent
export function testBitVectorHas0003(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  return bitVectorList.has(1, 0, 4) === false;
}

@Concurrent
export function testBitVectorHas0004(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  return bitVectorList.has(1, 0, 10) === true;
}

@Concurrent
export function testBitVectorHas0005(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  try {
    bitVectorList.has(1, -1, 10);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorHas0006(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  try {
    bitVectorList.has(1, 0, 11);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorHas0007(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  try {
    bitVectorList.has(1, 5, 4);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorHas0008(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(0);
  }
  for (let i = 0; i < 5; i++) {
    bitVectorList.push(1);
  }
  try {
    bitVectorList.has(1, 5, 5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorSetBitsByRange0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  return bitVectorList.has(0, 0, 10);
}

@Concurrent
export function testBitVectorSetBitsByRange0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  return bitVectorList.has(0, 0, 5);
}

@Concurrent
export function testBitVectorSetBitsByRange0003(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  return !bitVectorList.has(1, 0, 4);
}

@Concurrent
export function testBitVectorSetBitsByRange0004(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  return bitVectorList.has(1, 0, 10);
}

@Concurrent
export function testBitVectorSetBitsByRange0005(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  try {
    bitVectorList.has(1, -1, 10);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorSetBitsByRange0006(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  try {
    bitVectorList.has(1, 0, 11);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorSetBitsByRange0007(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  try {
    bitVectorList.has(1, 5, 4);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorSetBitsByRange0008(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    bitVectorList.push(0);
  }
  bitVectorList.setBitsByRange(1, 5, 10);
  try {
    bitVectorList.has(1, 5, 5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorSetBitsByRange0009(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(0);
  bitVectorList.push(0);
  bitVectorList.push(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(1);
  bitVectorList.push(1);
  bitVectorList.push(1);
  bitVectorList.push(1);
  bitVectorList.setBitsByRange(1, 1, 3);
  return (
    bitVectorList[0] === 0 &&
      bitVectorList[1] === 1 &&
      bitVectorList[2] === 1 &&
      bitVectorList[3] === 0 &&
      bitVectorList[4] === 0 &&
      bitVectorList[5] === 1 &&
      bitVectorList[6] === 1 &&
      bitVectorList[7] === 1 &&
      bitVectorList[8] === 1 &&
      bitVectorList[9] === 1
  );
}

@Concurrent
export function testBitVectorSetAllBits0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    if (i < 5) {
      bitVectorList.push(0);
    } else {
      bitVectorList.push(1);
    }
  }
  bitVectorList.setAllBits(0);
  for (let i = 0; i < 10; i++) {
    if (bitVectorList[i] !== 0) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorSetAllBits0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    if (i < 5) {
      bitVectorList.push(0);
    } else {
      bitVectorList.push(1);
    }
  }
  bitVectorList.setAllBits(1);
  for (let i = 0; i < 10; i++) {
    if (bitVectorList[i] !== 1) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorSetAllBits0003(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    if (i < 5) {
      bitVectorList.push(0);
    } else {
      bitVectorList.push(1);
    }
  }
  bitVectorList.setAllBits(-1);
  for (let i = 0; i < 10; i++) {
    if (bitVectorList[i] !== 1) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorSetAllBits0004(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    if (i < 5) {
      bitVectorList.push(0);
    } else {
      bitVectorList.push(1);
    }
  }
  bitVectorList.setAllBits(65535);
  for (let i = 0; i < 10; i++) {
    if (bitVectorList[i] !== 1) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorSetAllBits0005(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    if (i < 5) {
      bitVectorList.push(0);
    } else {
      bitVectorList.push(1);
    }
  }
  bitVectorList.setAllBits(2.5);
  for (let i = 0; i < 10; i++) {
    if (bitVectorList[i] !== 1) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorGetBitsByRange0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  let bitVectorList2 = bitVectorList.getBitsByRange(0, 6);
  for (let i = 0; i < 6; i++) {
    let expected = i < 5 ? "0" : "1";
    if (bitVectorList2[i].toString() !== expected) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorGetBitsByRange0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  let bitVectorList2 = bitVectorList.getBitsByRange(4, 10);
  for (let i = 0; i < 6; i++) {
    let expected = i < 1 ? "0" : "1";
    if (bitVectorList2[i].toString() !== expected) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorGetBitsByRange0003(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitsByRange(4, 11);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetBitsByRange0004(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitsByRange(-1, 10);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetBitsByRange0005(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitsByRange(5, 4);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetBitsByRange0006(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitsByRange(5, 5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorResize0001(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(0);
  try {
    bitVectorList.resize(-1);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorResize0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(0);
  bitVectorList.resize(5);
  return (
    bitVectorList.length === 5 &&
      bitVectorList[0].toString() === "0" &&
      bitVectorList[1].toString() === "1" &&
      bitVectorList[2].toString() === "0" &&
      bitVectorList[3].toString() === "0" &&
      bitVectorList[4].toString() === "0"
  );
}

@Concurrent
export function testBitVectorResize0003(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(0);
  bitVectorList.resize(1);
  return bitVectorList.length === 1 && bitVectorList[0].toString() === "0";
}

@Concurrent
export function testBitVectorGetBitCountByRange0001(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getBitCountByRange(1, 0, 6);
}

@Concurrent
export function testBitVectorGetBitCountByRange0002(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getBitCountByRange(1, 4, 10);
}

@Concurrent
export function testBitVectorGetBitCountByRange0003(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitCountByRange(1, 4, 11);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetBitCountByRange0004(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitCountByRange(1, -1, 10);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetBitCountByRange0005(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitCountByRange(1, 5, 4);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetBitCountByRange0006(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getBitCountByRange(1, 5, 5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetIndexOf0001(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getIndexOf(0, 0, 10);
}

@Concurrent
export function testBitVectorGetIndexOf0002(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getIndexOf(0, 0, 5);
}

@Concurrent
export function testBitVectorGetIndexOf0003(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getIndexOf(1, 0, 5);
}

@Concurrent
export function testBitVectorGetIndexOf0004(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getIndexOf(1, 0, 10);
}

@Concurrent
export function testBitVectorGetIndexOf0005(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getIndexOf(1, -1, 10);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetIndexOf0006(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getIndexOf(1, 0, 11);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetIndexOf0007(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getIndexOf(1, 5, 4);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetIndexOf0008(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getIndexOf(1, 5, 5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetLastIndexOf0001(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getLastIndexOf(0, 0, 10);
}

@Concurrent
export function testBitVectorGetLastIndexOf0002(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getLastIndexOf(0, 0, 5);
}

@Concurrent
export function testBitVectorGetLastIndexOf0003(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getLastIndexOf(1, 0, 5);
}

@Concurrent
export function testBitVectorGetLastIndexOf0004(): number {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  return bitVectorList.getLastIndexOf(1, 0, 10);
}

@Concurrent
export function testBitVectorGetLastIndexOf0005(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getLastIndexOf(1, -1, 10);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetLastIndexOf0006(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getLastIndexOf(1, 0, 11);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetLastIndexOf0007(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getLastIndexOf(1, 5, 4);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorGetLastIndexOf0008(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.getLastIndexOf(1, 5, 5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorFlipBitByIndex0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(0);
  bitVectorList.flipBitByIndex(0);
  return (
    bitVectorList[0].toString() === "1" &&
      bitVectorList[1].toString() === "1" &&
      bitVectorList[2].toString() === "0"
  );
}

@Concurrent
export function testBitVectorFlipBitByIndex0002(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(0);
  try {
    bitVectorList.flipBitByIndex(5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorFlipBitByIndex0003(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(0);
  try {
    bitVectorList.flipBitByIndex(-1);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorFlipBitsByRange0001(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  bitVectorList.flipBitsByRange(0, 6);
  let arrayList = new collections.Array<string>("1", "1", "1", "1", "1", "0", "1", "1", "1", "1");
  for (let i = 0; i < 10; i++) {
    if (bitVectorList[i].toString() !== arrayList[i]) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorFlipBitsByRange0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  bitVectorList.flipBitsByRange(4, 10);
  let arrayList = new collections.Array<string>("0", "0", "0", "0", "1", "0", "0", "0", "0", "0");
  for (let i = 0; i < 10; i++) {
    if (bitVectorList[i].toString() !== arrayList[i]) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testBitVectorFlipBitsByRange0003(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.flipBitsByRange(4, 11);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorFlipBitsByRange0004(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.flipBitsByRange(-1, 10);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorFlipBitsByRange0005(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.flipBitsByRange(5, 4);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorFlipBitsByRange0006(): string {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < 10; i++) {
    i < 5 ? bitVectorList.push(0) : bitVectorList.push(1);
  }
  try {
    bitVectorList.flipBitsByRange(5, 5);
    return "no_error";
  } catch (err) {
    console.info("error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testBitVectorValues0001(): boolean | undefined {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  let iter: IterableIterator<number> = bitVectorList.values();
  let rst = iter.next().done;
  return rst;
}

@Concurrent
export function testBitVectorValues0002(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(1);
  let arrayList = new Array<number>(0, 1, 1);
  let i = 0;
  for (let iter of bitVectorList.values()) {
    if (iter !== arrayList[i]) {
      return false;
    }
    i++;
  }
  return true;
}

@Concurrent
export function testBitVectorValues0003(): boolean {
  let bitVectorList: collections.BitVector = new collections.BitVector(0);
  bitVectorList.push(0);
  bitVectorList.push(1);
  bitVectorList.push(1);
  let iter = bitVectorList.values();
  return (
    iter.next().value === 0 &&
      iter.next().value === 1 &&
      iter.next().value === 1
  );
}