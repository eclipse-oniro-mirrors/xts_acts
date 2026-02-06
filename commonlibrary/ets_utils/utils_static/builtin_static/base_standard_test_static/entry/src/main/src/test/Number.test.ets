/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';

function expo(x: Number, f: Number): string {
  return x.toExponential(f);
}

function expo1(x: Number): string {
  return x.toExponential();
}

function eArabic(x: Number): string {
  return x.toLocaleString('ar-EG');
}

function eArabic1(x: string): string {
  return x.toLocaleString();
}

export default function numberTest() {
  describe("numberTest", (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0100
     * @tc.name testNumberExpo0001
     * @tc.desc Test the function of the Interface toExponential().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0001";
      try {
        const result: string = expo(123456, 2);
        expect(result).assertEqual("1.23e+5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0200
     * @tc.name testNumberExpo0002
     * @tc.desc Test the function of the Interface toExponential().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0002";
      try {
        const result: string = expo(123543, 2);
        expect(result).assertEqual("1.24e+5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0300
     * @tc.name testNumberExpo0003
     * @tc.desc Test the function of the Interface toExponential().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0003";
      try {
        const result: string = expo(123456, 2.5);
        expect(result).assertEqual("1.23e+5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0400
     * @tc.name testNumberExpo0004
     * @tc.desc Test the function of the Interface toExponential().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0004";
      try {
        const result: string = expo(123456, -1);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof ArgumentOutOfRangeError) {
          expect(err.name).assertEqual('ArgumentOutOfRangeError');
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0500
     * @tc.name testNumberExpo0005
     * @tc.desc Test the function of the Interface toExponential().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0005";
      try {
        const result: string = expo(123456, 101);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof ArgumentOutOfRangeError) {
          expect(err.name).assertEqual('ArgumentOutOfRangeError');
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0600
     * @tc.name testNumberExpo0006
     * @tc.desc Test the function of the Interface toExponential().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0006";
      try {
        const result: string = expo(123456, 0);
        expect(result).assertEqual("1e+5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0700
     * @tc.name testNumberExpo0007
     * @tc.desc Test the function of the toExponential function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0007";
      try {
        const result: string = expo(123456, 100);
        expect(result)
          .assertEqual("1.2345600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_0800
     * @tc.name testNumberExpo0008
     * @tc.desc Test the function of the toExponential function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0008";
      try {
        const result: string = expo1(123456);
        expect(result).assertEqual("1.23456e+5");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_1000
     * @tc.name testNumberExpo0010
     * @tc.desc Test the function of the toExponential function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0010";
      try {
        const result: string = expo1(0);
        expect(result).assertEqual("0e+0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_1100
     * @tc.name testNumberExpo0011
     * @tc.desc Test the function of the toExponential function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberExpo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberExpo0011";
      try {
        const result: string = expo1(100);
        expect(result).assertEqual("1e+2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_2800
     * @tc.name testNUMBER0001
     * @tc.desc Test the function of the ToFixed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testNUMBER0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNUMBER0001";
      try {
        expect(2.34.toFixed(1)).assertEqual('2.3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_2900
     * @tc.name testNUMBER0002
     * @tc.desc Test the function of the ToFixed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testNUMBER0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNUMBER0002";
      const num = -2.34;
      try {
        expect(num.toFixed(1)).assertEqual('-2.3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3000
     * @tc.name testNUMBER0003
     * @tc.desc Test the function of the ToFixed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testNUMBER0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNUMBER0003";
      try {
        expect((-2.34).toFixed(1)).assertEqual('-2.3');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3100
     * @tc.name testNumberArabic0001
     * @tc.desc Test the function of the eArabic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberArabic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberArabic0001'
      try {
        const str: String = "١٢٣٬٤٥٦٫٧٨٩"
        const num: Number = 123456.789
        expect(eArabic(num)).assertEqual(str)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3200
     * @tc.name testNumberArabic0002
     * @tc.desc Test the function of the Interface set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberArabic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberArabic0002';
      try {
        const str: string = "123456.789"
        expect(eArabic1(str)).assertEqual("123456.789")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3300
     * @tc.name testNumberArabic0003
     * @tc.desc Test the function of the Interface set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberArabic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberArabic0003';
      try {
        expect(eArabic(NaN)).assertEqual("ليس رقم")
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3400
     * @tc.name testNumberArabic0004
     * @tc.desc Test the function of the Interface set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberArabic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberArabic0004'
      try {
        const str: String = "٠"
        expect(eArabic(0)).assertEqual(str)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3500
     * @tc.name testNumberToLocaleString0001
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testNumberToLocaleString0001';
        try {
            const number1 = 123456.789;
            expect(number1.toLocaleString()).assertEqual('123,456.789');
        } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(false).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3600
     * @tc.name testNumberToLocaleString0002
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToLocaleString0002';
      try {
        const str = '123456.789';
        expect(str.toLocaleString()).assertEqual('123456.789');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3700
     * @tc.name testNumberToLocaleString0004
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToLocaleString0004';
      try {
        const str = '-123456.789';
        expect(str.toLocaleString()).assertEqual('-123456.789');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3800
     * @tc.name testNumberToLocaleString0005
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testNumberToLocaleString0005';
        try {
            const number1 = -123.789;
            expect(number1.toLocaleString()).assertEqual('-123.789');
        } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(false).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_3900
     * @tc.name testNumberToLocaleString0006
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testNumberToLocaleString0006';
        try {
            const number1 = 123.456;
            const result = number1.toLocaleString('de-DE');
            expect(result).assertEqual('123,456');
        } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(false).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_4000
     * @tc.name testNumberToLocaleString0008
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "testNumberToLocaleString0008";
        try {
            const number1 = 123456.789;
            const result = number1.toLocaleString("en-IN");
            expect(result).assertEqual("1,23,456.789");
        } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(false).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_4100
     * @tc.name testNumberToLocaleString0009
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "testNumberToLocaleString0009";
        try {
            const number1 = 123456.789;
            const result = number1.toLocaleString("zh-Hans-CN-u-nu-hanidec");
            expect(result).assertEqual("一二三,四五六.七八九");
        } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(false).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_4200
     * @tc.name testNumberToLocaleString0010
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToLocaleString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "testNumberToLocaleString0010";
        try {
            const number1 = 123456.789;
            const result = number1.toLocaleString(["ban", "id"]);
            expect(result).assertEqual("123.456,789");
        } catch (err) {
            console.error(`${TAG} failed, error: ${err.message}`);
            expect(false).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_4600
     * @tc.name testNumbertoPrecision0001
     * @tc.desc Test the function of the Interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumbertoPrecision0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumbertoPrecision0001';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(4);
        };
        expect(precise(123.456)).assertEqual('123.5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_4700
     * @tc.name testNumbertoPrecision0002
     * @tc.desc Test the function of the Interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumbertoPrecision0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumbertoPrecision0002';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(4);
        };
        expect(precise(0.004)).assertEqual('0.004000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_4800
     * @tc.name testNumbertoPrecision0003
     * @tc.desc Test the function of the Interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumbertoPrecision0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumbertoPrecision0003';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(4);
        };
        expect(precise(1.230e5)).assertEqual('1.230e+5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_4900
     * @tc.name testNumbertoPrecision0004
     * @tc.desc Test the function of the Interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumbertoPrecision0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumbertoPrecision0004';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision();
        };
        expect(precise(123.456)).assertEqual('123.456');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5000
     * @tc.name testNumbertoPrecision0005
     * @tc.desc Test the function of the Interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumbertoPrecision0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumbertoPrecision0005';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision();
        };
        expect(precise(0.004)).assertEqual('0.004');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5100
     * @tc.name testNumbertoPrecision0006
     * @tc.desc Test the function of the Interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumbertoPrecision0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumbertoPrecision0006';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision();
        };
        expect(precise(1.23e5)).assertEqual('123000');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5200
     * @tc.name testNumberToPrecision0007
     * @tc.desc Test the function of the interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToPrecision0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToPrecision0007';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(0);
        };
        console.log(precise(123.456));
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof ArgumentOutOfRangeError) {
          expect(err.name).assertEqual('ArgumentOutOfRangeError');
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5300
     * @tc.name testNumberToPrecision0008
     * @tc.desc Test the function of the interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToPrecision0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToPrecision0008';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(1);
        };
        expect(precise(123.456)).assertEqual("1e+2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5400
     * @tc.name testNumberToPrecision0009
     * @tc.desc Test the function of the interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToPrecision0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToPrecision0009';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(100);
        };
        expect(precise(123.456))
          .assertEqual("123.4560000000000030695446184836328029632568359375000000000000000000000000000000000000000000000000000");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5500
     * @tc.name testNumberToPrecision0010
     * @tc.desc Test the function of the interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToPrecision0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToPrecision0010';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(101);
        };
        console.log(precise(123.456));
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof ArgumentOutOfRangeError) {
          expect(err.name).assertEqual('ArgumentOutOfRangeError');
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5600
     * @tc.name testNumberToPrecision0011
     * @tc.desc Test the function of the interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToPrecision0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToPrecision0011';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(2.5);
        };
        expect(precise(123.456)).assertEqual("1.2e+2");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5700
     * @tc.name testNumberToPrecision0012
     * @tc.desc Test the function of the interface toPrecision().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToPrecision0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToPrecision0012';
      try {
        const precise = (x: Number): string => {
          return x.toPrecision(2);
        };
        expect(precise(1234.456)).assertEqual("1.2e+3");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5800
     * @tc.name testNumberToString0001
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNumberToString0001';
      try {
        const hexColour = (c: Number, radix: Number): string | Number => {
          if (c < 256) {
            return Math.abs(c).toString(radix);
          }
          return 0;
        };
        expect(hexColour(233, 16)).assertEqual('e9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_5900
     * @tc.name testNumberToString0002
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0002";
      try {
        const hexColour = (c: Number, radix: Number): string | Number => {
          if (c < 256) {
            return Math.abs(c).toString(radix);
          }
          return 0;
        }
        const result: string | Number = hexColour(11, 16);
        expect(result).assertEqual('b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6000
     * @tc.name testNumberToString0003
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0003";
      try {
        const hexColour = (c: Number, radix: Number): string | Number => {
          if (c < 256) {
            return Math.abs(c).toString(radix);
          }
          return 0;
        };
        hexColour(233, 1);
        expect(false).assertFail();
      } catch (err) {
        expect(err.message).assertEqual("radix must be 2 to 36");
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6100
     * @tc.name testNumberToString0004
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0004";
      try {
        const hexColour = (c: Number, radix: Number): string | Number => {
          if (c < 256) {
            return Math.abs(c).toString(radix);
          }
          return 0;
        }
        const result: string | Number = hexColour(233, 2);
        expect(result).assertEqual("11101001");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6200
     * @tc.name testNumberToString0005
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0005";
      try {
        const hexColour = (c: Number, radix: Number): string | Number => {
          if (c < 256) {
            return Math.abs(c).toString(radix);
          }
          return 0;
        }
        const result: string | Number = hexColour(233, 36);
        expect(result).assertEqual("6h");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6300
     * @tc.name testNumberToString0006
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0006";
      try {
        const hexColour = (c: Number, radix: Number): string | Number => {
          if (c < 256) {
            return Math.abs(c).toString(radix);
          }
          return 0;
        };
        hexColour(233, 37);
        expect(false).assertFail();
      } catch (err) {
        expect(err.message).assertEqual("radix must be 2 to 36");
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6400
     * @tc.name testNumberToString0007
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0007";
      try {
        const num = 1e21 * Math.pow(10, 0.5);
        const result = num.toString();
        expect(result).assertEqual('3.1622776601683794e+21');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6500
     * @tc.name testNumberToString0008
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0008";
      try {
        const num = 1e21 * 3.16227766;
        const result = num.toString(8);
        expect(result).assertEqual("526665530624701540000000");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6600
     * @tc.name testNumberToString0010
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0010";
      try {
        const x = 6;
        const result = x.toString(2);
        expect(result).assertEqual("110");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6700
     * @tc.name testNumberToString0011
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0011";
      try {
        const result = (254).toString(16);
        expect(result).assertEqual("fe");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6800
     * @tc.name testNumberToString0012
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0012";
      try {
        const result = (-10).toString(2);
        expect(result).assertEqual("-1010");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_6900
     * @tc.name testNumberToString0013
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0013";
      try {
        const result = (-0xff).toString(2);
        expect(result).assertEqual("-11111111");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NUMBER_7000
     * @tc.name testNumberToString0014
     * @tc.desc Test the function of the interface toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNumberToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNumberToString0014";
      try {
        const hex = "CAFEBABE";
        const result = parseInt(hex, 16).toString(2);
        expect(result).assertEqual("11001010111111101011101010111110");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

  })
}