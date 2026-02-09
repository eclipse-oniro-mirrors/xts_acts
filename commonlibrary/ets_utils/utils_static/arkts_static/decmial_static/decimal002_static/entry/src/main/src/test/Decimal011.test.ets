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


function test_floor_001 (expected: string , n: number) {
  expect(expected).assertEqual(Decimal.floor(n).valueOf());
}
function test_floor_002 (expected: string , n: string) {
  expect(expected).assertEqual(Decimal.floor(n).valueOf());
}

export default function DecimalTest011() {
  describe("DecimalTest011", () => {
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
     * @tc.name   Decimal_floor_Func_001
     * @tc.number DECIMAL_TEST11_001
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_001",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_001('0', 0);
      test_floor_001('-0', -0.0);
      test_floor_002('0', '0.000');
      test_floor_001('Infinity', Infinity);
      test_floor_001('-Infinity', -Infinity);
      test_floor_001('NaN', NaN);
      test_floor_001('0', 0.1);
      test_floor_002('0', '0.49999999999999994');
      test_floor_001('0', 0.5);
      test_floor_001('0', 0.7);
      test_floor_001('-1', -0.1);
      test_floor_002('-1', '-0.49999999999999994');
    });
    /**
     * @tc.name   Decimal_floor_Func_002
     * @tc.number DECIMAL_TEST11_002
     * @tc.desc   Test ln
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_002",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_001('-1', -0.5);
      test_floor_001('-1', -0.7);
      test_floor_001('1', 1);
      test_floor_001('1', 1.1);
      test_floor_001('1', 1.5);
      test_floor_001('1', 1.7);
      test_floor_001('-1', -1);
      test_floor_001('-2', -1.1);
      test_floor_001('-2', -1.5);
      test_floor_001('-2', -1.7);
      test_floor_002('1', '1.0000000000000000000000001');
      test_floor_001('0', 0.999999999999);
      test_floor_002('9', '9.999999999999');
      test_floor_001('123456', 123456.789);
      test_floor_002('-2', '-1.0000000000000000000000001');
    });


    /**
     * @tc.name   Decimal_floor_Func_003
     * @tc.number DECIMAL_TEST11_003
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_003",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_001('-1', -0.999999999999);
      test_floor_002('-10', '-9.999999999999');
      test_floor_001('-123457', -123456.789);
      test_floor_002('-2075365', '-2075364.364286541923');
      test_floor_002('60593539780450631', '60593539780450631');
      test_floor_002('65937898671515', '65937898671515');
      test_floor_002('-39719494751819198566799', '-39719494751819198566798.578');
      test_floor_002('92627382695288166556', '92627382695288166556.8683774524284866028260448205069');
      test_floor_002('-881574', '-881574');
      test_floor_002('-3633239210', '-3633239209.654526163275621746013315304191073405508491056');
      test_floor_002('-23970335459820625362', '-23970335459820625362');
      test_floor_002('131869457416154038', '131869457416154038');
      test_floor_002('-2685', '-2685');
    });

    /**
     * @tc.name   Decimal_floor_Func_004
     * @tc.number DECIMAL_TEST11_004
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_004",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_002('-4542227861', '-4542227860.9511298545226');
      test_floor_002('-834103872107533086', '-834103872107533086');
      test_floor_002('-1501493189970436', '-1501493189970435.74866616700317');
      test_floor_002('70591', '70591.2244675522123484658978887');
      test_floor_002('4446128540401735117', '4446128540401735117.435836700611264749985822486641350492901');
      test_floor_002('-597273', '-597273');
      test_floor_002('729117', '729117.5');
      test_floor_002('-729118', '-729117.001');
    });

    /**
     * @tc.name   Decimal_floor_Func_005
     * @tc.number DECIMAL_TEST11_005
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_005",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_002('4803729546823170064608098091', '4803729546823170064608098091');
      test_floor_002('-6581532150677269472830', '-6581532150677269472829.38194951340848938896000325718062365494');
      test_floor_002('2949426983040959', '2949426983040959.8911208825380208568451907');
      test_floor_002('25166', '25166.125888418871654557352055849116604612621573251770362');
      test_floor_002('4560569286495', '4560569286495.98300685103599898554605198');
      test_floor_002('13', '13.763105480576616251068323541559825687');
      test_floor_002('9050999219306', '9050999219306.7846946346757664893036971777');
      test_floor_002('39900924', '39900924.00000005');
      test_floor_002('115911043168452445', '115911043168452445');
      test_floor_002('20962819101135667464733349383', '20962819101135667464733349383.8959025798517496777183');
      test_floor_002('4125789711001606948191', '4125789711001606948191.4707575965791242737346836');
      test_floor_002('-6935502', '-6935501.294727166142750626019282');
      test_floor_002('-2', '-1.518418076611593764852321765899');
      test_floor_002('-35416', '-35416');
      test_floor_002('6912783515683955988122411164548', '6912783515683955988122411164548.393');
      test_floor_002('657', '657.0353902852');
    });

    /**
     * @tc.name   Decimal_floor_Func_006
     * @tc.number DECIMAL_TEST11_006
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_006",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_002('0', '0.00000000000000000000000017921822306362413915');
      test_floor_002('1483059355427939255846407887', '1483059355427939255846407887.011361095342689876');
      test_floor_002('7.722e+999999999999999', '7.722e+999999999999999');
      test_floor_002('7722', '7722');
      test_floor_002('0', '0.00000005');
      test_floor_002('8551283060956479352', '8551283060956479352.5707396');
      test_floor_002('0', '0.000000000000000000000000019904267');
      test_floor_002('321978830777554620127500539', '321978830777554620127500539.339278568133088682532238002577');
      test_floor_002('2073', '2073.532654804291079327244387978249477171032485250998396');
      test_floor_002('677676305591', '677676305591.2');
      test_floor_002('39181479479778357', '39181479479778357');
      test_floor_002('0', '0.00000000000000000087964700066672916651');
      test_floor_002('115083055948552475', '115083055948552475');
      test_floor_002('9105942082143427451223', '9105942082143427451223');
      test_floor_002('0', '0.00000000000000000000004');
      test_floor_002('0', '0.000250427721966583680168028884692015623739');
      test_floor_002('0', '0.000000000001585613219016120158734661293405081934');
    });

    /**
     * @tc.name   Decimal_floor_Func_007
     * @tc.number DECIMAL_TEST11_007
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_007",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      test_floor_002('0', '0.00009');
      test_floor_002('0', '0.000000090358252973411013592234');
      test_floor_002('276312604693909858427', '276312604693909858427.21965306055697011390137926559');
      test_floor_002('0', '0.0000252');
      test_floor_002('1', '1.9999999999');
      Decimal.set ({ toExpNeg: -100, toExpPos: 100 });
      //test_floor_001('-1', -1e-308);
      //test_floor_001('-1e+308', -1e308);
    });

    /**
     * @tc.name   Decimal_floor_Func_008
     * @tc.number DECIMAL_TEST11_008
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_008",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      Decimal.set ({ toExpNeg: -100, toExpPos: 100 });
      test_floor_002('2.1e+308', '2.1e308');
      test_floor_002('-1', '-1e-999');
      test_floor_002('0', '1e-999');
      test_floor_002('0', '1e-9000000000000000');
      test_floor_002('-1', '-1e-9000000000000000');
      test_floor_002('-0', '-9.9e-9000000000000001');
      test_floor_002('9.999999e+9000000000000000', '9.999999e+9000000000000000');
      test_floor_002('-9.999999e+9000000000000000', '-9.999999e+9000000000000000');
      test_floor_002('Infinity', '1E9000000000000001');
      test_floor_002('-Infinity', '-1e+9000000000000001');
      test_floor_002('5.5879983320336874473209567979e+287894365', '5.5879983320336874473209567979e+287894365');
      test_floor_002('-5.5879983320336874473209567979e+287894365', '-5.5879983320336874473209567979e+287894365');
    });

    /**
     * @tc.name   Decimal_floor_Func_009
     * @tc.number DECIMAL_TEST11_009
     * @tc.desc   Test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_floor_Func_009",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      Decimal.set ({
        precision: 20,
        rounding: 4,
        toExpNeg: -1e3,
        toExpPos: 1e3,
        minE: -9e15,
        maxE: 9e15
      });
      try {
        test_floor_002('e', 'e');
        expect(true).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        expect(err.name).assertEqual(`BusinessError`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
      }
    });
  });
}