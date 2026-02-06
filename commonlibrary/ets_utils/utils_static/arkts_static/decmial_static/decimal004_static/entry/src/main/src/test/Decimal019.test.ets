/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import { Decimal } from '@kit.ArkTS';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

function test_negate_001 (expected: string, n: string) {
  expect(expected).assertEqual(new Decimal(n).negate().valueOf());
}
function test_negate_002 (expected: string, n: number) {
  expect(expected).assertEqual(new Decimal(n).negate().valueOf());
}

export default function DecimalTest019() {
  describe("DecimalTest019", () => {
    beforeAll(() => {
      console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(async () => {
      await Utils.msSleep(200)
      console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.");
    });
    afterEach(() => {
      console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.");
    });
    afterAll(() => {
      console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed");
    });
    console.info("start################################start");
    /**
     * @tc.name   Decimal_negate_Func_001
     * @tc.number DECIMAL_TEST19_001
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15,
      });
      test_negate_002('-4', 4);
      test_negate_002('-2147483648', 2147483648);
      test_negate_002('-0.25', 0.25);
      test_negate_002('-0.0625', 0.0625);
      test_negate_002('-1', 1);
      test_negate_002('1', -1);
      test_negate_002('-0', 0);
      test_negate_002('0', -0.0);
      test_negate_001('-0', '0');
      test_negate_001('0', '-0');
      test_negate_002('NaN', NaN);
    });    /**
     * @tc.number    : DECIMAL_TEST19_002
     * @tc.name      : Decimal_negate_Func_002
     * @tc.desc      : Test negate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    /**
     * @tc.name   Decimal_negate_Func_002
     * @tc.number Decimal_negate_Func_002
     * @tc.desc   Decimal_negate_Func_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('NaN', 'NaN');
      test_negate_002('-Infinity', Infinity);
      test_negate_002('Infinity', -Infinity);
      test_negate_001('-Infinity', 'Infinity');
      test_negate_001('Infinity', '-Infinity');
      test_negate_001('-9.99e+9000000000000000', '9.99e+9000000000000000');
      test_negate_001('9.99e+9000000000000000', '-9.99e+9000000000000000');
      test_negate_001('-Infinity', '1e+9000000000000001');
      test_negate_001('Infinity', '-1e+9000000000000001');
      test_negate_001('-1e-9000000000000000', '1e-9000000000000000');
      test_negate_001('1e-9000000000000000', '-1e-9000000000000000');
      test_negate_001('0', '-1e-9000000000000001');
      test_negate_001('-238', '238');
      test_negate_001('1.3e-11', '-0.000000000013');
    });
    /**
     * @tc.name   Decimal_negate_Func_003
     * @tc.number DECIMAL_TEST19_003
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('-33.1', '33.1');
      test_negate_001('2.61', '-2.61');
      test_negate_001('-4', '4.0');
      test_negate_001('-5.8', '5.8');
      test_negate_001('-3.52e-7', '0.000000352');
      test_negate_001('190', '-190');
      test_negate_001('4.47', '-4.47');
      test_negate_001('6.9525e-12', '-0.0000000000069525');
      test_negate_001('1.3', '-1.3');
      test_negate_001('-6.21', '6.21');
      test_negate_001('2', '-2');
      test_negate_001('-1', '1');
      test_negate_001('147.857', '-147.857');
      test_negate_001('-26.517', '26.517');
    });

    /**
     * @tc.name   Decimal_negate_Func_004
     * @tc.number DECIMAL_TEST19_004
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('-3', '3');
      test_negate_001('5', '-5');
      test_negate_001('204', '-204');
      test_negate_001('2.1e-8', '-0.000000021');
      test_negate_001('3.7015e-7', '-0.00000037015');
      test_negate_001('-50.1839', '50.1839');
      test_negate_001('44768.1', '-44768.1');
      test_negate_001('3.8e-15', '-0.0000000000000038');
      test_negate_001('-7.4379', '7.4379');
      test_negate_001('1.5', '-1.5');
      test_negate_001('6.0399', '-6.0399');
      test_negate_001('109.07', '-109.070');
    });

    /**
     * @tc.name   Decimal_negate_Func_005
     * @tc.number DECIMAL_TEST19_005
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('1582', '-1582');
      test_negate_001('-772', '772');
      test_negate_001('-6.7824e-14', '0.000000000000067824');
      test_negate_001('-1.819e-8', '0.00000001819');
      test_negate_001('-3e-15', '0.0000000000000030');
      test_negate_001('-424120', '424120');
      test_negate_001('-1814.54', '1814.54');
      test_negate_001('-4.295e-17', '0.00000000000000004295');
      test_negate_001('-5', '5');
      test_negate_001('2152', '-2152');
      test_negate_001('4.6', '-4.6');
      test_negate_001('1.9', '-1.9');
      test_negate_001('-2', '2.0');
      test_negate_001('-0.00036', '0.00036');
      test_negate_001('-0.000006962', '0.000006962');
    });

    /**
     * @tc.name   Decimal_negate_Func_006
     * @tc.number DECIMAL_TEST19_006
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('3.6', '-3.6');
      test_negate_001('-1.1495e-14', '0.000000000000011495');
      test_negate_001('-312.4', '312.4');
      test_negate_001('4.3e-10', '-0.00000000043');
      test_negate_001('5', '-5');
      test_negate_001('-1.8911e-8', '0.000000018911');
      test_negate_001('4963.53', '-4963.53');
      test_negate_001('-4.3934e-10', '0.00000000043934');
      test_negate_001('-1.3', '1.30');
      test_negate_001('-1', '1.0');
      test_negate_001('-68.32', '68.32');
      test_negate_001('0.014836', '-0.014836');
      test_negate_001('8', '-8');
      test_negate_001('2.1351', '-2.13510');
      test_negate_001('162224', '-162224');
      test_negate_001('3e-19', '-0.00000000000000000030');
      test_negate_001('0.00004985', '-0.00004985');
      test_negate_001('28.9321', '-28.9321');
    });

    /**
     * @tc.name   Decimal_negate_Func_007
     * @tc.number DECIMAL_TEST19_007
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('-2', '2');
      test_negate_001('-16688', '16688');
      test_negate_001('-1', '1');
      test_negate_001('5', '-5');
      test_negate_001('-20', '20.0');
      test_negate_001('-1.9', '1.9');
      test_negate_001('3', '-3');
      test_negate_001('185640', '-185640');
      test_negate_001('-0.0000058', '0.0000058');
      test_negate_001('9.67e-13', '-0.000000000000967');
      test_negate_001('-707.98', '707.98');
      test_negate_001('2.57917', '-2.57917');
      test_negate_001('-1.3', '1.3');
      test_negate_001('-4.2655', '4.2655');
      test_negate_001('-149.6', '149.6');
      test_negate_001('-1.32383', '1.32383');
      test_negate_001('-26.925', '26.925');
      test_negate_001('-0.00013', '0.00013');
      test_negate_001('-6868', '6868');
      test_negate_001('7', '-7');
    });

    /**
     * @tc.name   Decimal_negate_Func_008
     * @tc.number DECIMAL_TEST19_008
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('-5e-9', '0.0000000050');
      test_negate_001('3.2555e-16', '-0.00000000000000032555');
      test_negate_001('1.42768e-13', '-0.000000000000142768');
      test_negate_001('11.2962', '-11.2962');
      test_negate_001('3186.7', '-3186.7');
      test_negate_001('-6.9', '6.9');
      test_negate_001('-6.2618e-7', '0.00000062618');
      test_negate_001('8', '-8');
      test_negate_001('-8.04', '8.04');
      test_negate_001('-22', '22');
      test_negate_001('-750.6', '750.6');
      test_negate_001('12.803', '-12.803');
      test_negate_001('-20513.4', '20513.4');
      test_negate_001('114781', '-114781');
      test_negate_001('-16.9046', '16.9046');
      test_negate_001('4.6e-7', '-0.00000046');
      test_negate_001('-31399', '31399');
      test_negate_001('1.04', '-1.04');
      test_negate_001('-51.2544', '51.2544');
    });

    /**
     * @tc.name   Decimal_negate_Func_009
     * @tc.number DECIMAL_TEST19_009
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('1.023e-15', '-0.000000000000001023');
      test_negate_001('281', '-281');
      test_negate_001('-128315', '128315');
      test_negate_001('20.2', '-20.2');
      test_negate_001('9', '-9');
      test_negate_001('-10', '10');
      test_negate_001('-1.92262e-17', '0.0000000000000000192262');
      test_negate_001('-0.0023', '0.0023');
      test_negate_001('5', '-5');
      test_negate_001('7', '-7');
      test_negate_001('13.72', '-13.72');
      test_negate_001('98068', '-98068');
      test_negate_001('3.2', '-3.2');
      test_negate_001('1.1', '-1.1');
      test_negate_001('-3.97e-18', '0.000000000000000003970');
      test_negate_001('0.00334824', '-0.00334824');
      test_negate_001('-5.4892e-8', '0.000000054892');
      test_negate_001('-1', '1.0');
      test_negate_001('-2.8135e-8', '0.000000028135');
      test_negate_001('-1.816e-13', '0.0000000000001816');
    });

    /**
     * @tc.name   Decimal_negate_Func_010
     * @tc.number DECIMAL_TEST19_010
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      test_negate_001('199724', '-199724');
      test_negate_001('-19.4', '19.40');
      test_negate_001('-12.74', '12.74');
      test_negate_001('-2171.8', '2171.8');
      test_negate_001('-2.7', '2.7');
      test_negate_001('1', '-1.0');
      test_negate_001('21779', '-21779');
      test_negate_001('8.9e-12', '-0.0000000000089');
      test_negate_001('-4.51', '4.51');
      test_negate_001('2.6', '-2.6');
      test_negate_001('-0.00016', '0.000160');
      test_negate_001('6', '-6');
      test_negate_001('50.566', '-50.566');
      test_negate_001('-16.2', '16.2');
      test_negate_001('-9444', '9444');
      test_negate_001('21.4', '-21.4');
      test_negate_001('2.5', '-2.5');
      test_negate_001('489311', '-489311');
    });

    /**
     * @tc.name   Decimal_negate_Func_011
     * @tc.number DECIMAL_TEST19_011
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it("Decimal_negate_Func_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   test_negate_001('6.8', '-6.8');
    //   test_negate_001('4.29', '-4.29');
    //   test_negate_001('23982', '-23982.0');
    //   test_negate_001('-0.0111781', '0.0111781');
    //   test_negate_001('4.96e-20', '-0.0000000000000000000496');
    //   test_negate_001('-40.5481', '40.5481');
    //   test_negate_001('-32.52', '32.52');
    //   test_negate_001('-7.4', '7.4');
    //   test_negate_001('-5', '5.0');
    //   test_negate_001('-2463.4', '2463.4');
    //   test_negate_001('7.363', '-7.363');
    //   test_negate_001('2.8', '-2.8');
    //   test_negate_001('-14498', '14498');
    //   test_negate_001('201', '-201');
    // });

    /**
     * @tc.name   Decimal_negate_Func_012
     * @tc.number DECIMAL_TEST19_012
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15,
      });
      Decimal.set ({ toExpNeg: 0, toExpPos: 0});
      test_negate_001('-5.0600621890668482322956892808849303e+20', '5.0600621890668482322956892808849303e+20');
      test_negate_001('7e+0', '-7e+0');
      test_negate_001('-6.1095374220609e+13', '6.1095374220609e+13');
      test_negate_001('9.01e+2', '-9.01e+2');
      test_negate_001('-1.016984074247269470395836690098169093010136836967e+39', '1.016984074247269470395836690098169093010136836967e+39');
      test_negate_001('-1.497639134680472576e+18', '1.497639134680472576e+18');
      test_negate_001('-4.1717657571404248e+16', '4.1717657571404248e+16');
      test_negate_001('8.983272e+1', '-8.983272e+1');
      test_negate_001('-5.308416e+6', '5.308416e+6');
      test_negate_001('-2.09764e+3', '2.09764e+3');
      test_negate_001('-3.83432050166120236679168e+23', '3.83432050166120236679168e+23');
      test_negate_001('-4.096e+3', '4.096e+3');
      test_negate_001('2.679971527468745095582058350756311201706813294321409e+51', '-2.679971527468745095582058350756311201706813294321409e+51');
      test_negate_001('-5.067853299870089529116832768e+2', '5.067853299870089529116832768e+2');
      test_negate_001('-3.48822062687911109850066182676769e+32', '3.48822062687911109850066182676769e+32');
      test_negate_001('-1e+0', '1e+0');
      test_negate_001('4.2773e+0', '-4.2773e+0');
    });
    /**
     * @tc.name   Decimal_negate_Func_013
     * @tc.number DECIMAL_TEST19_013
     * @tc.desc   Test negate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_negate_Func_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15,
      });
      Decimal.set ({ toExpNeg: 0, toExpPos: 0});
      test_negate_001('5.8169306081172252508071119604378757744768e+12', '-5.8169306081172252508071119604378757744768e+12');
      test_negate_001('-1e+0', '1e+0');
      test_negate_001('1.51655708279450944384385164853883404204414169862685507e+46', '-1.51655708279450944384385164853883404204414169862685507e+46');
      test_negate_001('-8.1e+1', '8.1e+1');
      test_negate_001('-1.296e+3', '1.296e+3');
      test_negate_001('-2.9e+0', '2.9e+0');
      test_negate_001('-1.764e+3', '1.764e+3');
      test_negate_001('9.3418332730097368870513138581415704704611459349313e+49', '-9.3418332730097368870513138581415704704611459349313e+49');
    });

  });
}