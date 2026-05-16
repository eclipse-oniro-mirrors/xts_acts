'use static'
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

enum Enum_withoutType

:
double
{
  // 十进制
  A = 1.23,
  B = -1.23,
  C = 0.5,
  D = .5,
  E = 5.,
  F = 1234,

  // 指数写法
  G = 1e3,
  H = 1.23e4,
  I = 1e-3,

  //十六进制写法
  J = 0xff,
  K = 0x1A3,
  L = 0XAB,

  //二进制写法
  M = 0b1010,
  N = 0b1111,

  // 八进制写法
  O = 0o755,
  P = 0o17,

  //带下划线数字
  R = 1_000_000,
  S = 3.141_592_653,
  T = 1E1_0,
  U = 0b1010_1100,
  V = 0xAB_CD,

  //边界值
  L1 = -1.7976931348623157e308,
  L2 = 1.7976931348623157e308,
  L3 = -1.8E308
}

enum Enum_withType

:
double
{
  // 十进制
  A = 1.23,
  B = -1.23,
  C = 0.5,
  D = .5,
  E = 5.,
  F = 1234,

  //指数写法
  G = 1e3,
  H = 1.23e4,
  I = 1e-3,

  //十六进制写法
  J = 0xff,
  K = 0x1A3,
  L = 0XAB,

  //二进制写法
  M = 0b1010,
  N = 0b1111,

  //八进制写法
  O = 0o755,
  P = 0o17,

  //带下划线数字
  R = 1_000_000,
  S = 3.141_592_653,
  T = 1E1_0,
  U = 0b1010_1100,
  V = 0xAB_CD,

  //边界值
  L1 = -1.7976931348623157e308,
  L2 = 1.7976931348623157e308,
  L3 = -1.8E308
}

enum Double_Enum

:
double
{
  A = 3.1415926,
  B = -0.5,
  C = 1e3,
  D = A + C,
  E = -0.5
}

export function DoubleEnumConstructorTest001(): void {
  let caseName = "DoubleEnumConstructorTest001";
  if (Enum_withoutType.A !== 1.23) {
    console.info(`${caseName} Task execution failed： expected 1.23, but got ${Enum_withoutType.A}`);
    throw new Error('Enum_withoutType.A should be 1.23');
  }
  if (Enum_withoutType.B !== -1.23) {
    console.info(`${caseName} Task execution failed： expected -1.23, but got ${Enum_withoutType.B}`);
    throw new Error('Enum_withoutType.B should be -1.23');
  }
  if (Enum_withoutType.C !== 0.5) {
    console.info(`${caseName} Task execution failed： expected 0.5, but got ${Enum_withoutType.C}`);
    throw new Error('Enum_withoutType.C should be 0.5');
  }
  if (Enum_withoutType.D !== 0.5) {
    console.info(`${caseName} Task execution failed： expected 0.5, but got ${Enum_withoutType.D}`);
    throw new Error('Enum_withoutType.D should be 0.5');
  }
  if (Enum_withoutType.E !== 5.0) {
    console.info(`${caseName} Task execution failed： expected 5.0, but got ${Enum_withoutType.E}`);
    throw new Error('Enum_withoutType.E should be 5.0');
  }
  if (Enum_withoutType.F !== 1234) {
    console.info(`${caseName} Task execution failed： expected 1234, but got ${Enum_withoutType.F}`);
    throw new Error('Enum_withoutType.F should be 1234');
  }
  if (Enum_withoutType.G !== 1000) {
    console.info(`${caseName} Task execution failed： expected 1000, but got ${Enum_withoutType.G}`);
    throw new Error('Enum_withoutType.G should be 1000');
  }
  if (Enum_withoutType.H !== 12300) {
    console.info(`${caseName} Task execution failed： expected 12300, but got ${Enum_withoutType.H}`);
    throw new Error('Enum_withoutType.H should be 12300');
  }
  if (Enum_withoutType.I !== 0.001) {
    console.info(`${caseName} Task execution failed： expected 0.001, but got ${Enum_withoutType.I}`);
    throw new Error('Enum_withoutType.I should be 0.001');
  }
  if (Enum_withoutType.J !== 255) {
    console.info(`${caseName} Task execution failed： expected 255, but got ${Enum_withoutType.J}`);
    throw new Error('Enum_withoutType.J should be 255');
  }
  if (Enum_withoutType.K !== 419) {
    console.info(`${caseName} Task execution failed： expected 419, but got ${Enum_withoutType.K}`);
    throw new Error('Enum_withoutType.K should be 419');
  }
  if (Enum_withoutType.L !== 171) {
    console.info(`${caseName} Task execution failed： expected 171, but got ${Enum_withoutType.L}`);
    throw new Error('Enum_withoutType.L should be 171');
  }
  if (Enum_withoutType.M !== 10) {
    console.info(`${caseName} Task execution failed： expected 10, but got ${Enum_withoutType.M}`);
    throw new Error('Enum_withoutType.M should be 10');
  }
  if (Enum_withoutType.N !== 15) {
    console.info(`${caseName} Task execution failed： expected 15, but got ${Enum_withoutType.N}`);
    throw new Error('Enum_withoutType.N should be 15');
  }
  if (Enum_withoutType.O !== 493) {
    console.info(`${caseName} Task execution failed： expected 493, but got ${Enum_withoutType.O}`);
    throw new Error('Enum_withoutType.O should be 493');
  }
  if (Enum_withoutType.P !== 15) {
    console.info(`${caseName} Task execution failed： expected 15, but got ${Enum_withoutType.P}`);
    throw new Error('Enum_withoutType.P should be 15');
  }
  if (Enum_withoutType.R !== 1000000) {
    console.info(`${caseName} Task execution failed： expected 1000000, but got ${Enum_withoutType.R}`);
    throw new Error('Enum_withoutType.R should be 1000000');
  }
  if (Enum_withoutType.S !== 3.141592653) {
    console.info(`${caseName} Task execution failed： expected 3.141592653, but got ${Enum_withoutType.S}`);
    throw new Error('Enum_withoutType.S should be 3.141592653');
  }
  if (Enum_withoutType.T !== 10000000000) {
    console.info(`${caseName} Task execution failed： expected 10000000000, but got ${Enum_withoutType.T}`);
    throw new Error('Enum_withoutType.T should be 10000000000');
  }
  if (Enum_withoutType.U !== 172) {
    console.info(`${caseName} Task execution failed： expected 172, but got ${Enum_withoutType.U}`);
    throw new Error('Enum_withoutType.U should be 172');
  }
  if (Enum_withoutType.V !== 43981) {
    console.info(`${caseName} Task execution failed： expected 43981, but got ${Enum_withoutType.V}`);
    throw new Error('Enum_withoutType.V should be 43981');
  }
  if (Enum_withoutType.L1 !== -1.7976931348623157e308) {
    console.info(`${caseName} Task execution failed： expected -1.7976931348623157e308, but got ${Enum_withoutType.L1}`);
    throw new Error('Enum_withoutType.L1 should be -1.7976931348623157e308');
  }
  if (Enum_withoutType.L2 !== 1.7976931348623157e308) {
    console.info(`${caseName} Task execution failed： expected 1.7976931348623157e308, but got ${Enum_withoutType.L2}`);
    throw new Error('Enum_withoutType.L2 should be 1.7976931348623157e308');
  }
  if (Enum_withoutType.L3 !== -Infinity) {
    console.info(`${caseName} Task execution failed： expected -Infinity, but got ${Enum_withoutType.L3}`);
    throw new Error('Enum_withoutType.L3 should be -Infinity');
  }
}

export function DoubleEnumConstructorTest002(): void {
  let caseName = "DoubleEnumConstructorTest002";
  if (Enum_withType.A !== 1.23) {
    console.info(`${caseName} Task execution failed： expected 1.23, but got ${Enum_withType.A}`);
    throw new Error('Enum_withType.A should be 1.23');
  }
  if (Enum_withType.B !== -1.23) {
    console.info(`${caseName} Task execution failed： expected -1.23, but got ${Enum_withType.B}`);
    throw new Error('Enum_withType.B should be -1.23');
  }
  if (Enum_withType.C !== 0.5) {
    console.info(`${caseName} Task execution failed： expected 0.5, but got ${Enum_withType.C}`);
    throw new Error('Enum_withType.C should be 0.5');
  }
  if (Enum_withType.D !== 0.5) {
    console.info(`${caseName} Task execution failed： expected 0.5, but got ${Enum_withType.D}`);
    throw new Error('Enum_withType.D should be 0.5');
  }
  if (Enum_withType.E !== 5.0) {
    console.info(`${caseName} Task execution failed： expected 5.0, but got ${Enum_withType.E}`);
    throw new Error('Enum_withType.E should be 5.0');
  }
  if (Enum_withType.F !== 1234) {
    console.info(`${caseName} Task execution failed： expected 1234, but got ${Enum_withType.F}`);
    throw new Error('Enum_withType.F should be 1234');
  }
  if (Enum_withType.G !== 1000) {
    console.info(`${caseName} Task execution failed： expected 1000, but got ${Enum_withType.G}`);
    throw new Error('Enum_withType.G should be 1000');
  }
  if (Enum_withType.H !== 12300) {
    console.info(`${caseName} Task execution failed： expected 12300, but got ${Enum_withType.H}`);
    throw new Error('Enum_withType.H should be 12300');
  }
  if (Enum_withType.I !== 0.001) {
    console.info(`${caseName} Task execution failed： expected 0.001, but got ${Enum_withType.I}`);
    throw new Error('Enum_withType.I should be 0.001');
  }
  if (Enum_withType.J !== 255) {
    console.info(`${caseName} Task execution failed： expected 255, but got ${Enum_withType.J}`);
    throw new Error('Enum_withType.J should be 255');
  }
  if (Enum_withType.K !== 419) {
    console.info(`${caseName} Task execution failed： expected 419, but got ${Enum_withType.K}`);
    throw new Error('Enum_withType.K should be 419');
  }
  if (Enum_withType.L !== 171) {
    console.info(`${caseName} Task execution failed： expected 171, but got ${Enum_withType.L}`);
    throw new Error('Enum_withType.L should be 171');
  }
  if (Enum_withType.M !== 10) {
    console.info(`${caseName} Task execution failed： expected 10, but got ${Enum_withType.M}`);
    throw new Error('Enum_withType.M should be 10');
  }
  if (Enum_withType.N !== 15) {
    console.info(`${caseName} Task execution failed： expected 15, but got ${Enum_withType.N}`);
    throw new Error('Enum_withType.N should be 15');
  }
  if (Enum_withType.O !== 493) {
    console.info(`${caseName} Task execution failed： expected 493, but got ${Enum_withType.O}`);
    throw new Error('Enum_withType.O should be 493');
  }
  if (Enum_withType.P !== 15) {
    console.info(`${caseName} Task execution failed： expected 15, but got ${Enum_withType.P}`);
    throw new Error('Enum_withType.P should be 15');
  }
  if (Enum_withType.R !== 1000000) {
    console.info(`${caseName} Task execution failed： expected 1000000, but got ${Enum_withType.R}`);
    throw new Error('Enum_withType.R should be 1000000');
  }
  if (Enum_withType.S !== 3.141592653) {
    console.info(`${caseName} Task execution failed： expected 3.141592653, but got ${Enum_withType.S}`);
    throw new Error('Enum_withType.S should be 3.141592653');
  }
  if (Enum_withType.T !== 10000000000) {
    console.info(`${caseName} Task execution failed： expected 10000000000, but got ${Enum_withType.T}`);
    throw new Error('Enum_withType.T should be 10000000000');
  }
  if (Enum_withType.U !== 172) {
    console.info(`${caseName} Task execution failed： expected 172, but got ${Enum_withType.U}`);
    throw new Error('Enum_withType.U should be 172');
  }
  if (Enum_withType.V !== 43981) {
    console.info(`${caseName} Task execution failed： expected 43981, but got ${Enum_withType.V}`);
    throw new Error('Enum_withType.V should be 43981');
  }
  if (Enum_withType.L1 !== -1.7976931348623157e308) {
    console.info(`${caseName} Task execution failed： expected -1.7976931348623157e308, but got ${Enum_withType.L1}`);
    throw new Error('Enum_withType.L1 should be -1.7976931348623157e308');
  }
  if (Enum_withType.L2 !== 1.7976931348623157e308) {
    console.info(`${caseName} Task execution failed： expected 1.7976931348623157e308, but got ${Enum_withType.L2}`);
    throw new Error('Enum_withType.L2 should be 1.7976931348623157e308');
  }
  if (Enum_withType.L3 !== -Infinity) {
    console.info(`${caseName} Task execution failed： expected -Infinity, but got ${Enum_withType.L3}`);
    throw new Error('Enum_withType.L3 should be -Infinity');
  }
}

export function DoubleEnumValuesTest001(): void {
  let caseName = "DoubleEnumValuesTest001";
  let arr1 = [3.1415926, -0.5, 1000, 1003.1415926, -0.5];
  let arr2 = Double_Enum.values();
  for (let i = 0; i < arr1.length; i++) {
    if (arr2[i] !== arr1[i]) {
      console.info(`${caseName} Task execution failed： expected ${arr1[i]}, but got ${arr2[i]}`);
      throw new Error(`arr2[${i}] should be ${arr1[i]}`);
    }
  }
}

export function DoubleEnumGetValueOfTest001(): void {
  let caseName = "DoubleEnumGetValueOfTest001";
  let valueA = Double_Enum.getValueOf("A");
  let valueB = Double_Enum.getValueOf("B");
  let valueC = Double_Enum.getValueOf("C");
  let valueD = Double_Enum.getValueOf("D");
  let valueE = Double_Enum.getValueOf("E");
  if (valueA !== 3.1415926) {
    console.info(`${caseName} Task execution failed： expected 3.1415926, but got ${valueA}`);
    throw new Error('valueA should be 3.1415926');
  }
  if (valueB !== -0.5) {
    console.info(`${caseName} Task execution failed： expected -0.5, but got ${valueB}`);
    throw new Error('valueB should be -0.5');
  }
  if (valueC !== 1000) {
    console.info(`${caseName} Task execution failed： expected 1000, but got ${valueC}`);
    throw new Error('valueC should be 1000');
  }
  if (valueD !== 1003.1415926) {
    console.info(`${caseName} Task execution failed： expected 1003.1415926, but got ${valueD}`);
    throw new Error('valueD should be 1003.1415926');
  }
  if (valueE !== -0.5) {
    console.info(`${caseName} Task execution failed： expected -0.5, but got ${valueE}`);
    throw new Error('valueE should be -0.5');
  }
  try {
    let noexist = Double_Enum.getValueOf("Noexist");
    console.info(`${caseName} Task execution failed： expected exception to be thrown`);
    throw new Error('getValueOf should throw exception for non-existent key');
  } catch (error) {
    console.log("catch getValueOf error!" + error.message);
  }
}

export function DoubleEnumFromValueTest001(): void {
  let caseName = "DoubleEnumFromValueTest001";
  let valueA = Double_Enum.fromValue(3.1415926);
  let valueB = Double_Enum.fromValue(-0.5);
  let valueC = Double_Enum.fromValue(1000);
  let valueD = Double_Enum.fromValue(1003.1415926);
  if (valueA !== 3.1415926) {
    console.info(`${caseName} Task execution failed： expected 3.1415926, but got ${valueA}`);
    throw new Error('valueA should be 3.1415926');
  }
  if (valueB !== -0.5) {
    console.info(`${caseName} Task execution failed： expected -0.5, but got ${valueB}`);
    throw new Error('valueB should be -0.5');
  }
  if (valueC !== 1000) {
    console.info(`${caseName} Task execution failed： expected 1000, but got ${valueC}`);
    throw new Error('valueC should be 1000');
  }
  if (valueD !== 1003.1415926) {
    console.info(`${caseName} Task execution failed： expected 1003.1415926, but got ${valueD}`);
    throw new Error('valueD should be 1003.1415926');
  }
  try {
    let noexist = Double_Enum.fromValue(3333);
    console.info(`${caseName} Task execution failed： expected exception to be thrown`);
    throw new Error('fromValue should throw exception for non-existent value');
  } catch (error) {
    console.log("catch fromValue error!" + error.message);
  }
}

export function DoubleEnumValueOfTest001(): void {
  let caseName = "DoubleEnumValueOfTest001";
  let valueA = Double_Enum.A;
  let valueB = Double_Enum.B;
  let valueC = Double_Enum.C;
  let valueD = Double_Enum.D;
  let valueE = Double_Enum.E;

  if (valueA.valueOf() !== 3.1415926) {
    console.info(`${caseName} Task execution failed： expected 3.1415926, but got ${valueA.valueOf()}`);
    throw new Error('valueA.valueOf() should be 3.1415926');
  }
  if (valueB.valueOf() !== -0.5) {
    console.info(`${caseName} Task execution failed： expected -0.5, but got ${valueB.valueOf()}`);
    throw new Error('valueB.valueOf() should be -0.5');
  }
  if (valueC.valueOf() !== 1000) {
    console.info(`${caseName} Task execution failed： expected 1000, but got ${valueC.valueOf()}`);
    throw new Error('valueC.valueOf() should be 1000');
  }
  if (valueD.valueOf() !== 1003.1415926) {
    console.info(`${caseName} Task execution failed： expected 1003.1415926, but got ${valueD.valueOf()}`);
    throw new Error('valueD.valueOf() should be 1003.1415926');
  }
  if (valueE.valueOf() !== -0.5) {
    console.info(`${caseName} Task execution failed： expected -0.5, but got ${valueE.valueOf()}`);
    throw new Error('valueE.valueOf() should be -0.5');
  }
}

export function DoubleEnumGetNameTest001(): void {
  let caseName = "DoubleEnumGetNameTest001";
  let valueA = Double_Enum.A;
  let valueB = Double_Enum.B;
  let valueC = Double_Enum.C;
  let valueD = Double_Enum.D;

  if (valueA.getName() !== "A") {
    console.info(`${caseName} Task execution failed： expected A, but got ${valueA.getName()}`);
    throw new Error('valueA.getName() should be A');
  }
  if (valueB.getName() !== "B") {
    console.info(`${caseName} Task execution failed： expected B, but got ${valueB.getName()}`);
    throw new Error('valueB.getName() should be B');
  }
  if (valueC.getName() !== "C") {
    console.info(`${caseName} Task execution failed： expected C, but got ${valueC.getName()}`);
    throw new Error('valueC.getName() should be C');
  }
  if (valueD.getName() !== "D") {
    console.info(`${caseName} Task execution failed： expected D, but got ${valueD.getName()}`);
    throw new Error('valueD.getName() should be D');
  }
  if (Double_Enum.fromValue(-0.5).getName() !== "E") {
    console.info(`${caseName} Task execution failed： expected E, but got ${Double_Enum.fromValue(-0.5).getName()}`);
    throw new Error('Double_Enum.fromValue(-0.5).getName() should be E');
  }
}

export function DoubleEnumToStringTest001(): void {
  let caseName = "DoubleEnumToStringTest001";
  let valueA = Double_Enum.A;
  let valueB = Double_Enum.B;
  let valueC = Double_Enum.C;
  let valueD = Double_Enum.D;
  let valueE = Double_Enum.E;

  if (valueA.toString() !== "3.1415926") {
    console.info(`${caseName} Task execution failed： expected 3.1415926, but got ${valueA.toString()}`);
    throw new Error('valueA.toString() should be 3.1415926');
  }
  if (valueB.toString() !== "-0.5") {
    console.info(`${caseName} Task execution failed： expected -0.5, but got ${valueB.toString()}`);
    throw new Error('valueB.toString() should be -0.5');
  }
  if (valueC.toString() !== "1000") {
    console.info(`${caseName} Task execution failed： expected 1000, but got ${valueC.toString()}`);
    throw new Error('valueC.toString() should be 1000');
  }
  if (valueD.toString() !== "1003.1415926") {
    console.info(`${caseName} Task execution failed： expected 1003.1415926, but got ${valueD.toString()}`);
    throw new Error('valueD.toString() should be 1003.1415926');
  }
  if (valueE.toString() !== "-0.5") {
    console.info(`${caseName} Task execution failed： expected -0.5, but got ${valueE.toString()}`);
    throw new Error('valueE.toString() should be -0.5');
  }
}

export function DoubleEnumIndexTest001(): void {
  let caseName = "DoubleEnumIndexTest001";
  let valueA = Double_Enum.A;
  let valueB = Double_Enum.B;
  let valueC = Double_Enum.C;
  let valueD = Double_Enum.D;
  let valueE = Double_Enum.E;

  if (Double_Enum[valueA] !== "A") {
    console.info(`${caseName} Task execution failed： expected A, but got ${Double_Enum[valueA]}`);
    throw new Error('Double_Enum[valueA] should be A');
  }
  if (Double_Enum[valueB] !== "B") {
    console.info(`${caseName} Task execution failed： expected B, but got ${Double_Enum[valueB]}`);
    throw new Error('Double_Enum[valueB] should be B');
  }
  if (Double_Enum[valueC] !== "C") {
    console.info(`${caseName} Task execution failed： expected C, but got ${Double_Enum[valueC]}`);
    throw new Error('Double_Enum[valueC] should be C');
  }
  if (Double_Enum[valueD] !== "D") {
    console.info(`${caseName} Task execution failed： expected D, but got ${Double_Enum[valueD]}`);
    throw new Error('Double_Enum[valueD] should be D');
  }
  if (Double_Enum[valueE] !== "E") {
    console.info(`${caseName} Task execution failed： expected E, but got ${Double_Enum[valueE]}`);
    throw new Error('Double_Enum[valueE] should be E');
  }
}
