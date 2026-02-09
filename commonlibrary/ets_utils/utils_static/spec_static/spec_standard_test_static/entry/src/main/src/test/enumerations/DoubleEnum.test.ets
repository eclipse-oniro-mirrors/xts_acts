/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
'use static'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Enum_withoutType :double {
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
enum Enum_withType : double {
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

enum Double_Enum : double {
  A = 3.1415926,
  B = -0.5,
  C = 1e3,
  D = A + C,
  E = -0.5
}
export default function DoubleEnumTest() {
  describe('DoubleEnumTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0100
     * @tc.name DoubleEnumConstructorTest001
     * @tc.desc test DoubleEnum Constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(Enum_withoutType.A).assertEqual(1.23);
      expect(Enum_withoutType.B).assertEqual(-1.23);
      expect(Enum_withoutType.C).assertEqual(0.5);
      expect(Enum_withoutType.D).assertEqual(0.5);
      expect(Enum_withoutType.E).assertEqual(5.0);
      expect(Enum_withoutType.F).assertEqual(1234);

      expect(Enum_withoutType.G).assertEqual(1000);
      expect(Enum_withoutType.H).assertEqual(12300);
      expect(Enum_withoutType.I).assertEqual(0.001);

      expect(Enum_withoutType.J).assertEqual(255);
      expect(Enum_withoutType.K).assertEqual(419);
      expect(Enum_withoutType.L).assertEqual(171);

      expect(Enum_withoutType.M).assertEqual(10);
      expect(Enum_withoutType.N).assertEqual(15);

      expect(Enum_withoutType.O).assertEqual(493);
      expect(Enum_withoutType.P).assertEqual(15);

      expect(Enum_withoutType.R).assertEqual(1000000);
      expect(Enum_withoutType.S).assertEqual(3.141592653);
      expect(Enum_withoutType.T).assertEqual(10000000000);
      expect(Enum_withoutType.U).assertEqual(172);
      expect(Enum_withoutType.V).assertEqual(43981);

      expect(Enum_withoutType.L1).assertEqual(-1.7976931348623157e308);
      expect(Enum_withoutType.L2).assertEqual(1.7976931348623157e308);
      expect(Enum_withoutType.L3).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0200
     * @tc.name DoubleEnumConstructorTest002
     * @tc.desc test DoubleEnum Constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumConstructorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(Enum_withType.A).assertEqual(1.23);
      expect(Enum_withType.B).assertEqual(-1.23);
      expect(Enum_withType.C).assertEqual(0.5);
      expect(Enum_withType.D).assertEqual(0.5);
      expect(Enum_withType.E).assertEqual(5.0);
      expect(Enum_withType.F).assertEqual(1234);

      expect(Enum_withType.G).assertEqual(1000);
      expect(Enum_withType.H).assertEqual(12300);
      expect(Enum_withType.I).assertEqual(0.001);

      expect(Enum_withType.J).assertEqual(255);
      expect(Enum_withType.K).assertEqual(419);
      expect(Enum_withType.L).assertEqual(171);

      expect(Enum_withType.M).assertEqual(10);
      expect(Enum_withType.N).assertEqual(15);

      expect(Enum_withType.O).assertEqual(493);
      expect(Enum_withType.P).assertEqual(15);

      expect(Enum_withType.R).assertEqual(1000000);
      expect(Enum_withType.S).assertEqual(3.141592653);
      expect(Enum_withType.T).assertEqual(10000000000);
      expect(Enum_withType.U).assertEqual(172);
      expect(Enum_withType.V).assertEqual(43981);

      expect(Enum_withType.L1).assertEqual(-1.7976931348623157e308);
      expect(Enum_withType.L2).assertEqual(1.7976931348623157e308);
      expect(Enum_withType.L3).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0300
     * @tc.name DoubleEnumValuesTest001
     * @tc.desc test DoubleEnum values method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumValuesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr1 = [3.1415926, -0.5, 1000, 1003.1415926, -0.5];
      let arr2 = Double_Enum.values();
      for(let i = 0; i < arr1.length; i++) {
        expect(arr2[i]).assertEqual(arr1[i]);
      }
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0400
     * @tc.name DoubleEnumGetValueOfTest001
     * @tc.desc test DoubleEnum getValueOf method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumGetValueOfTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let valueA = Double_Enum.getValueOf("A");
      let valueB = Double_Enum.getValueOf("B");
      let valueC = Double_Enum.getValueOf("C");
      let valueD = Double_Enum.getValueOf("D");
      let valueE = Double_Enum.getValueOf("E");
      expect(valueA).assertEqual(3.1415926);
      expect(valueB).assertEqual(-0.5);
      expect(valueC).assertEqual(1000);
      expect(valueD).assertEqual(1003.1415926);
      expect(valueE).assertEqual(-0.5);
      try {
        let noexist = Double_Enum.getValueOf("Noexist");
        expect().assertFail();
      } catch (error : Error) {
        console.log("catch getValueOf error!" + error.message);
      }
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0500
     * @tc.name DoubleEnumFromValueTest001
     * @tc.desc test DoubleEnum fromValue method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumFromValueTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let valueA = Double_Enum.fromValue(3.1415926);
      let valueB = Double_Enum.fromValue(-0.5);
      let valueC = Double_Enum.fromValue(1000);
      let valueD = Double_Enum.fromValue(1003.1415926);
      expect(valueA).assertEqual(3.1415926);
      expect(valueB).assertEqual(-0.5);
      expect(valueC).assertEqual(1000);
      expect(valueD).assertEqual(1003.1415926);
      try {
        let noexist = Double_Enum.fromValue(3333);
        expect().assertFail();
      } catch (error : Error) {
        console.log("catch fromValue error!" + error.message);
      }
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0600
     * @tc.name DoubleEnumValueOfTest001
     * @tc.desc test DoubleEnum valueOf method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumValueOfTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let valueA = Double_Enum.A;
      let valueB = Double_Enum.B;
      let valueC = Double_Enum.C;
      let valueD = Double_Enum.D;
      let valueE = Double_Enum.E;

      expect(valueA.valueOf()).assertEqual(3.1415926);
      expect(valueB.valueOf()).assertEqual(-0.5);
      expect(valueC.valueOf()).assertEqual(1000);
      expect(valueD.valueOf()).assertEqual(1003.1415926);
      expect(valueE.valueOf()).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0700
     * @tc.name DoubleEnumGetNameTest001
     * @tc.desc test DoubleEnum getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumGetNameTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let valueA = Double_Enum.A;
      let valueB = Double_Enum.B;
      let valueC = Double_Enum.C;
      let valueD = Double_Enum.D;

      expect(valueA.getName()).assertEqual("A");
      expect(valueB.getName()).assertEqual("B");
      expect(valueC.getName()).assertEqual("C");
      expect(valueD.getName()).assertEqual("D");
      expect(Double_Enum.fromValue(-0.5).getName()).assertEqual("E");
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0800
     * @tc.name DoubleEnumToStringTest001
     * @tc.desc test DoubleEnum toString method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumToStringTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let valueA = Double_Enum.A;
      let valueB = Double_Enum.B;
      let valueC = Double_Enum.C;
      let valueD = Double_Enum.D;
      let valueE = Double_Enum.E;

      expect(valueA.toString()).assertEqual("3.1415926");
      expect(valueB.toString() ).assertEqual("-0.5");
      expect(valueC.toString()).assertEqual("1000");
      expect(valueD.toString()).assertEqual("1003.1415926");
      expect(valueE.toString()).assertEqual("-0.5");
    });

    /**
     * @tc.number SUB_BasicLibrary_Basic_ArkTS_SupportDoubleEnum_0900
     * @tc.name DoubleEnumIndexTest001
     * @tc.desc test DoubleEnum index access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DoubleEnumIndexTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let valueA = Double_Enum.A;
      let valueB = Double_Enum.B;
      let valueC = Double_Enum.C;
      let valueD = Double_Enum.D;
      let valueE = Double_Enum.E;

      expect(Double_Enum[valueA]).assertEqual("A");
      expect(Double_Enum[valueB]).assertEqual("B");
      expect(Double_Enum[valueC]).assertEqual("C");
      expect(Double_Enum[valueD]).assertEqual("D");
      expect(Double_Enum[valueE]).assertEqual("E");
    });


  })
}
