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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { Decimal } from '@kit.ArkTS';
type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;
function test_abs_001 (expected: string, value: string) {
    expect(expected).assertEqual(Decimal.abs(value).valueOf());
    expect(expected).assertEqual(new Decimal(value).abs().valueOf());
}
function test_abs_002 (expected: string, value: number) {
    expect(expected).assertEqual(Decimal.abs(value).valueOf());
    expect(expected).assertEqual(new Decimal(value).abs().valueOf());
}
function test_abs_003 (expected: string, value: Decimal) {
    expect(expected).assertEqual(Decimal.abs(value).valueOf());
    expect(expected).assertEqual(new Decimal(value).abs().valueOf());
}
function test_acos_004 (n: string, pr: number, rm: Rounding, expected: string) {
    Decimal.set ({ precision: pr, rounding: rm });
    expect(expected).assertEqual(Decimal.acos(n).valueOf());
    expect(expected).assertEqual(new Decimal(n).acos().valueOf());
}
function test_acosh_005 (n: string, pr: number, rm: Rounding, expected: string) {
    Decimal.set ({ precision: pr, rounding: rm });
    expect(expected).assertEqual(Decimal.acosh(n).valueOf());
    expect(expected).assertEqual(new Decimal(n).acosh().valueOf());
}
function test_asin_006 (n: string, pr: number, rm: Rounding, expected: string) {
    Decimal.set ({ precision: pr, rounding: rm });
    expect(expected).assertEqual(Decimal.asin(n).valueOf());
    expect(expected).assertEqual(new Decimal(n).asin().valueOf());
}
function test_asinh_007 (n: string, pr: number, rm: Rounding, expected: string) {
    Decimal.set ({ precision: pr, rounding: rm });
    expect(expected).assertEqual(Decimal.asinh(n).valueOf());
    expect(expected).assertEqual(new Decimal(n).asinh().valueOf());
}
export default function DecimalTest024() {
  describe("DecimalTest024", () => {
    beforeAll(() => {
        console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(() => {
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
     * @tc.number    : DECIMAL_TEST_001
     * @tc.name      : Decimal_abs_Func_001
     * @tc.desc      : Test abs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_abs_Func_001", 0, () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15
        });
        test_abs_002('0', 0);
        test_abs_001('0', '0');
        test_abs_002('0', -0);
        test_abs_001('0', '-0');
        test_abs_002('1', 1);
        test_abs_002('1', -1);
        test_abs_001('1', '-1');
        test_abs_001('0.5', '0.5');
        test_abs_001('0.5', '-0.5');
        test_abs_002('0.1', 0.1);
        test_abs_002('0.1', -0.1);
        test_abs_002('1.1', 1.1);
        test_abs_002('1.1', -1.1);
        test_abs_001('1.5', '1.5');
        test_abs_001('1.5', '-1.5');
        test_abs_001('0.00001', '-1e-5');
        test_abs_001('9000000000', '-9e9');
        test_abs_001('123456.7891011', '123456.7891011');
        test_abs_002('123456.7891011', -123456.7891011);
        test_abs_001('99', '99');
        test_abs_002('99', -99);
        test_abs_002('999.999', 999.999);
        test_abs_001('999.999', '-999.999');
        test_abs_003('1', new Decimal(-1));
        test_abs_003('1', new Decimal('-1'));
        test_abs_003('0.001', new Decimal(0.001));
        test_abs_003('0.001', new Decimal('-0.001'));
        test_abs_002('Infinity', Infinity);
        test_abs_002('Infinity', -Infinity);
        test_abs_001('Infinity', 'Infinity');
        test_abs_001('Infinity', '-Infinity');
        test_abs_002('NaN', NaN);
        test_abs_002('NaN', -NaN);
        test_abs_001('NaN', 'NaN');
        test_abs_001('NaN', '-NaN');
        test_abs_001('11.121', '11.121');
        test_abs_001('0.023842', '-0.023842');
        test_abs_001('1.19', '-1.19');
        test_abs_001('9.622e-11', '-0.00000000009622');
        test_abs_001('5.09e-10', '-0.000000000509');
        test_abs_001('3838.2', '3838.2');
        test_abs_001('127', '127.0');
        test_abs_001('4.23073', '4.23073');
        test_abs_001('2.5469', '-2.5469');
        test_abs_001('29949', '-29949');
        test_abs_001('277.1', '-277.10');
        test_abs_001('4.97898e-15', '-0.00000000000000497898');
        test_abs_001('53.456', '53.456');
        test_abs_001('100564', '-100564');
        test_abs_001('12431.9', '-12431.9');
        test_abs_001('97633.7', '-97633.7');
        test_abs_001('220', '220');
        test_abs_001('18.72', '18.720');
        test_abs_001('2817', '-2817');
        test_abs_001('44535', '-44535');
    });
    /**
     * @tc.number    : DECIMAL_TEST_002
     * @tc.name      : Decimal_abs_Func_002
     * @tc.desc      : Test abs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_abs_Func_002", 0, () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15
        });
        Decimal.set ({ toExpNeg: 0, toExpPos:0 })
        test_abs_001('5.2452468128e+1', '-5.2452468128e+1');
        test_abs_001('1.41525905257189365008396e+16', '1.41525905257189365008396e+16');
        test_abs_001('2.743068083928e+11', '2.743068083928e+11');
        test_abs_001('1.52993064722314247378724599e+26', '-1.52993064722314247378724599e+26');
        test_abs_001('3.7205576746e+10', '3.7205576746e+10');
        test_abs_001('2.663e-10', '-2.663e-10');
        test_abs_001('1.26574209965030360615518e+17', '-1.26574209965030360615518e+17');
        test_abs_001('1.052e+3', '1.052e+3');
        test_abs_001('4.452945872502e+6', '-4.452945872502e+6');
        test_abs_001('2.95732460816619226e+13', '2.95732460816619226e+13');
        test_abs_001('1.1923100194288654481424e+18', '-1.1923100194288654481424e+18');
        test_abs_001('8.99315449050893705e+6', '8.99315449050893705e+6');
        test_abs_001('5.200726538434486963e+8', '5.200726538434486963e+8');
        test_abs_001('1.182618278949368566264898065e+18', '1.182618278949368566264898065e+18');
        test_abs_001('3.815873266712e-20', '-3.815873266712e-20');
        test_abs_001('1.316675370382742615e+6', '-1.316675370382742615e+6');
        test_abs_001('2.1032502e+6', '-2.1032502e+6');
        test_abs_001('1.8e+1', '1.8e+1');
        test_abs_001('1.033525906631680944018544811261e-13', '1.033525906631680944018544811261e-13');
        test_abs_001('1.102361746443461856816e+14', '-1.102361746443461856816e+14');
        test_abs_001('8.595358491143959e+1', '8.595358491143959e+1');
        test_abs_001('1.226806049797304683867e-18', '1.226806049797304683867e-18');
        test_abs_001('5e+0', '-5e+0');
        test_abs_001('1.091168788407093537887970016e+15', '-1.091168788407093537887970016e+15');
        test_abs_001('3.87166413612272027e+12', '3.87166413612272027e+12');
        test_abs_001('1.411514e+5', '1.411514e+5');
        test_abs_001('1.0053454672509859631996e+22', '1.0053454672509859631996e+22');
        test_abs_001('6.9265714e+0', '6.9265714e+0');
        test_abs_001('1.04627709e+4', '1.04627709e+4');
        test_abs_001('2.285650225267766689304972e+5', '2.285650225267766689304972e+5');
        test_abs_001('4.5790517211306242e+7', '4.5790517211306242e+7');
        test_abs_001('3.0033340092338313923473428e+16', '-3.0033340092338313923473428e+16');
        test_abs_001('2.83879929283797623e+1', '-2.83879929283797623e+1');
        test_abs_001('4.5266377717178121183759377414e-5', '4.5266377717178121183759377414e-5');
        test_abs_001('5.3781e+4', '-5.3781e+4');
        test_abs_001('6.722035208213298413522819127e-18', '-6.722035208213298413522819127e-18');
        test_abs_001('3.02865707828281230987116e+23', '-3.02865707828281230987116e+23');
        test_abs_001('1e-9000000000000000', '1e-9000000000000000');
        test_abs_001('1e-9000000000000000', '-1e-9000000000000000');
        test_abs_001('0e+0', '-9.9e-9000000000000001');
        test_abs_001('9.999999e+9000000000000000', '9.999999e+9000000000000000');
        test_abs_001('9.999999e+9000000000000000', '-9.999999e+9000000000000000');
        test_abs_001('Infinity', '1E9000000000000001');
        test_abs_001('Infinity', '-1e+9000000000000001');
        test_abs_001('5.5879983320336874473209567979e+287894365', '-5.5879983320336874473209567979e+287894365');
    });
    /**
     * @tc.number    : DECIMAL_TEST_003
     * @tc.name      : Decimal_abs_Func_003
     * @tc.desc      : Test abs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_abs_Func_003", 0, () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15
        });
        try {
            test_abs_001('e', 'e');
            expect(true).assertEqual(false);
        } catch (err) {
            expect(err.name).assertEqual(`BusinessError`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
        }
    });
    /**
     * @tc.number    : DECIMAL_TEST_004
     * @tc.name      : Decimal_acos_Func_004
     * @tc.desc      : Test acos
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_acos_Func_004", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        test_acos_004('NaN', 40, 4, 'NaN');
        test_acos_004('Infinity', 40, 4, 'NaN');
        test_acos_004('-Infinity', 40, 4, 'NaN');
        test_acos_004('1.0000000000000001', 40, 4, 'NaN');
        test_acos_004('2', 40, 4, 'NaN');
        test_acos_004('-1.0000000000000001', 40, 4, 'NaN');
        test_acos_004('-2', 40, 4, 'NaN');
        test_acos_004('1', 40, 4, '0');
        test_acos_004('-1', 40, 4, '3.141592653589793238462643383279502884197');
        test_acos_004('0', 20, 4, '1.5707963267948966192');
        test_acos_004('-0', 20, 4, '1.5707963267948966192');
        test_acos_004('-0.6403', 7, 1, '2.265685');
        test_acos_004('-0.53', 2, 2, '2.2');
        test_acos_004('0.4396178420823739355530719404', 10, 0, '1.115623176');
        test_acos_004('0.496420101927875989152448746035981', 1, 5, '1');
        test_acos_004('0.1', 2, 0, '1.5');
        test_acos_004('-0.20878679', 6, 2, '1.78114');
        test_acos_004('-0.541191262571486130575708261722416873899', 6, 5, '2.14265');
        test_acos_004('0.5', 7, 1, '1.047197');
        test_acos_004('-0.409325859', 10, 2, '1.992511392');
        test_acos_004('0.551', 5, 6, '0.98723');
        test_acos_004('0.5', 7, 2, '1.047198');
        test_acos_004('-0.43419432724217379874620877899386037437997149166291587557428756984642427', 3, 1, '2.01');
        test_acos_004('0.553', 9, 3, '0.984835716');
        test_acos_004('0.7809790373261734623688348400648923431479560079817', 6, 1, '0.674564');
        test_acos_004('0.75824031', 9, 0, '0.710186479');
        test_acos_004('-0.8', 8, 2, '2.4980916');
        test_acos_004('0.0799', 3, 5, '1.49');
        test_acos_004('-0.38393812134692277325859', 4, 1, '1.964');
        test_acos_004('-0.3907773773285398604336', 1, 1, '1');
        test_acos_004('-0.69992716948032572772435', 9, 4, '2.34609185');
        test_acos_004('-0.66158215731029676878636733180177567', 8, 0, '2.2937231');
        test_acos_004('0.9147368246772431874', 37, 1, '0.415940230269184272745464503534348965');
        test_acos_004('-0.4553', 27, 1, '2.04350546255828224507689468');
        test_acos_004('-0.028011903303708804768053896701975443', 56, 1, '1.5988118947274791447123927148057628240666865110752680848');
        test_acos_004('0.4065777430651635458256706', 14, 6, '1.1520912372989');
        test_acos_004('-0.78468834561401325', 40, 6, '2.472989536549809027410129361828086088366');
        test_acos_004('-0.04164046779', 31, 2, '1.61244883758340629332195244831');
        test_acos_004('-0.117424541', 82, 1, '1.688492407881140013543521665402011226342602786603530341844248637463449252725522796');
        test_acos_004('-0.1870116529272128766435079579825546176806042554995693356583', 108, 6, '1.75891557205606890020875163685374748628399727002149491921316335140511350243361347958082966501905347526802867');
        test_acos_004('0.0769104749433424068', 66, 1, '1.49380982556189042854757067055954756775240858876530364274625200666');
        test_acos_004('-0.027096519359', 92, 3, '1.5978961630571391095050365835267438779450813578907877311954803581546591891147373364143685647');
        test_acos_004('-0.8', 33, 6, '2.49809154479650885165983415456218');
        test_acos_004('0.67487482885692802659376964747029780872121304015294984476148189310252027478897761772', 54, 3, '0.830001261924669662461861851080065080704764574011647298');
        test_acos_004('-0.0804595260228093312276197203', 26, 1, '1.6513429189757672993077865');
        test_acos_004('0.50408248676517825230780010554261667827445182236535818843176765834864294167168', 73, 4, '1.042477051429539838709819977914186923616698698550378124843462531977088459');
        test_acos_004('0.92980935280344761170800142822446189257', 42, 0, '0.376901826310506133287494991222901254976804');
        test_acos_004('0.41923186648524998285699814886092351368793359300547574', 42, 3, '1.13819724675000902666504291062053681280681');
        test_acos_004('-0.19508761025300975791021816036', 27, 1, '1.76714310275532020878366926');
        test_acos_004('0.0623252416', 19, 0, '1.508430664767542249');
    });
    /**
     * @tc.number    : DECIMAL_TEST_005
     * @tc.name      : Decimal_acos_Func_005
     * @tc.desc      : Test acos
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_acos_Func_005", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        try {
            test_acos_004('e', 40, 4, 'NaN');
            expect(true).assertEqual(false);
        } catch (err) {
            expect(err.name).assertEqual(`BusinessError`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
        }
    });
    /**
     * @tc.number    : DECIMAL_TEST_006
     * @tc.name      : Decimal_acosh_Func_006
     * @tc.desc      : Test acosh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_acosh_Func_006", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        test_acosh_005('NaN', 40, 4, 'NaN');
        test_acosh_005('0.9999999999999999999999999', 40, 4, 'NaN');
        test_acosh_005('0', 40, 4, 'NaN');
        test_acosh_005('-1', 40, 4, 'NaN');
        test_acosh_005('-Infinity', 40, 4, 'NaN');
        test_acosh_005('1', 40, 4, '0');
        test_acosh_005('Infinity', 40, 4, 'Infinity');
        test_acosh_005('3.3', 2, 4, '1.9');
        test_acosh_005('4608888.8834', 7, 1, '16.03664');
        test_acosh_005('145005612624726799', 7, 1, '40.20869');
        test_acosh_005('644444444487588842435356055860541441083823652904922222222222222', 2, 6, '150');
        test_acosh_005('9.28', 1, 5, '3');
        test_acosh_005('76', 10, 0, '5.023837236');
        test_acosh_005('28099999969999999491999992999999999999.9999999999999939697', 4, 1, '86.92');
        test_acosh_005('585287364', 7, 6, '20.88076');
        test_acosh_005('7', 3, 1, '2.63');
        test_acosh_005('43999099999999099999999999999999999997999999999999999999999990993999999.999099999999999699999', 10, 1, '163.3556877');
        test_acosh_005('557921.15371560132973597030139633138927112983', 9, 2, '13.9251202');
        test_acosh_005('222222270476', 7, 1, '26.82009');
        test_acosh_005('9925', 4, 2, '9.896');
        test_acosh_005('51156203358371111111111111111111.88888888888888185816094145162589', 5, 0, '73.706');
        test_acosh_005('920.33', 5, 5, '7.5179');
        test_acosh_005('398.29', 4, 0, '6.681');
        test_acosh_005('300000000000000000000000', 8, 4, '54.751217');
        test_acosh_005('2077', 8, 2, '8.331827');
        test_acosh_005('466660000000000000000000.666663813047981223086678888888888888', 5, 2, '55.194');
        test_acosh_005('1481.596575', 2, 0, '8');
        test_acosh_005('51843625827420648103724841829104208766358144', 6, 4, '101.35');
        test_acosh_005('66.49', 6, 6, '4.89014');
        test_acosh_005('30564048384', 13, 1, '24.83623744632');
        test_acosh_005('7', 48, 1, '2.63391579384963341725009269461593688805396394293');
        test_acosh_005('97574340', 32, 2, '19.08927228754035088993028581182');
        test_acosh_005('59258006', 62, 4, '18.590558631774124907454170672852196556349238888846297909065851');
        test_acosh_005('2', 29, 1, '1.3169578969248167086250463473');
        test_acosh_005('47824727144130804625931275592321416135112742535362856133451607743134653532851722527764075063.55842730879104516021234131120280682177076228198214593563443436114750010543987134572764385', 33, 3, '211.793348360036258224908114351528');
        test_acosh_005('28888888888888888888005555555555', 63, 4, '73.1341570240606241766246193827749684596026580789070620470111545');
        test_acosh_005('53333333332333333333333333333333333333333.3333333333238', 44, 1, '94.470527333874694216410397776492923242508444');
        test_acosh_005('372499047371205457405389940445944981761906694426814657494361227129962080514219995743180551139499492754067', 40, 4, '241.4770611463762121239476457202278064235');
        test_acosh_005('2800646674524111760613114531', 29, 6, '63.892795037101476241199480935');
        test_acosh_005('582502684111672632668804', 18, 4, '55.4147679267811784');
        test_acosh_005('59.9999999999194977', 38, 3, '4.7874222911013468319935340554530121378');
        test_acosh_005('3623643157643492007800000000000000000', 54, 0, '84.8736904452442702624435580686958522860590865192215031');
        test_acosh_005('23885562764027262', 28, 1, '38.40519778343449888592577782');
        test_acosh_005('676263', 32, 1, '14.117484513177343902058185404775');
        test_acosh_005('47551685235102870485407214.46883446439928999925', 58, 1, '59.81700664210749659679029308727990790424880703317942061059');
        test_acosh_005('2082819111111111111111.66668634223026707142169092', 34, 6, '49.78115645138172332225379630123395');
        test_acosh_005('7531.926725308', 22, 5, '9.620053337431944749948');
        test_acosh_005('3100000000000000000000000000000000070000080000000000000000000300000000000000000000000000000000080', 6, 6, '222.873');
        test_acosh_005('49844937529139.9399', 55, 0, '32.23308523365993666498473649670539223213853202660291314');
        test_acosh_005('36666666666999999999999.91929310391451604503565774644', 28, 5, '52.64930221056830211957060803');
    });
    /**
     * @tc.number    : DECIMAL_TEST_007
     * @tc.name      : Decimal_acosh_Func_007
     * @tc.desc      : Test acosh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_acosh_Func_007", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        try {
            test_acosh_005('e11', 6, 6, '4.89014');
            expect(true).assertEqual(false);
        } catch (err) {
            expect(err.name).assertEqual(`BusinessError`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e11`);
        }
    });
    /**
     * @tc.number    : DECIMAL_TEST_008
     * @tc.name      : Decimal_asin_Func_008
     * @tc.desc      : Test asin
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_asin_Func_008", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        test_asin_006('NaN', 40, 4, 'NaN');
        test_asin_006('1.0000000000000001', 40, 4, 'NaN');
        test_asin_006('2', 40, 4, 'NaN');
        test_asin_006('Infinity', 40, 4, 'NaN');
        test_asin_006('-1.00000000000000000001', 40, 4, 'NaN');
        test_asin_006('-Infinity', 40, 4, 'NaN');
        test_asin_006('0', 40, 4, '0');
        test_asin_006('-0', 40, 4, '-0');
        test_asin_006('0.365496185994558260858326718937', 10, 5, '0.3741658147');
        test_asin_006('-0.35641389188', 3, 0, '-0.365');
        test_asin_006('0.68955841424562468594284036990178287693727890663761450264565153347585586987783918662506831', 7, 6, '0.7608791');
        test_asin_006('-0.8185571137226394757008542835605396', 1, 1, '-0.9');
        test_asin_006('0.3909767220307331413111', 5, 3, '0.40169');
        test_asin_006('0.4973777625990946249943842344354278064648780030532232700989739966171872596183742540844', 7, 0, '0.5205736');
        test_asin_006('-0.3220586075', 7, 1, '-0.3279031');
        test_asin_006('-0.4712856183846410563097510893908', 6, 5, '-0.490748');
        test_asin_006('0.05838677605449046055272817746189607969418472098217185904914', 2, 6, '0.058');
        test_asin_006('0.8', 9, 5, '0.927295218');
        test_asin_006('-0.35', 4, 5, '-0.3576');
        test_asin_006('0.5', 10, 1, '0.5235987755');
        test_asin_006('0.12', 3, 1, '0.12');
        test_asin_006('-0.5434', 8, 3, '-0.57448199');
        test_asin_006('0.0073911', 6, 1, '0.00739116');
        test_asin_006('0.6413', 9, 5, '0.696191343');
        test_asin_006('0.6695', 7, 5, '0.7335355');
        test_asin_006('-0.73867', 9, 0, '-0.831095123');
        test_asin_006('-0.734541962948526931', 1, 1, '-0.8');
        test_asin_006('0.8124222852789144395978469359524044494', 9, 5, '0.94829454');
        test_asin_006('0.01', 6, 1, '0.0100001');
        test_asin_006('-0.788421', 4, 1, '-0.9082');
        test_asin_006('-0.3', 2, 2, '-0.3');
        test_asin_006('0.6608633389456637408497420998651914114139088612446', 2, 4, '0.72');
        test_asin_006('0.3931549079701655746240375417718660050381124496506720523996527133505517587998', 23, 1, '0.40406030213304057779811');
        test_asin_006('-0.587605525487010465245800314956501132921', 13, 3, '-0.6280963940928');
        test_asin_006('-0.5', 52, 3, '-0.5235987755982988730771072305465838140328615665625177');
        test_asin_006('0.7772699', 16, 4, '0.8903148827665578');
        test_asin_006('-0.449412073227066332425902525593181', 57, 6, '-0.466107096571843683526424227582248251927561787620454186534');
        test_asin_006('-0.88842', 56, 4, '-1.0938915908813483958517153077667620622507918440274546335');
        test_asin_006('-0.5088737561', 24, 3, '-0.533875977309913500769379');
        test_asin_006('-0.0765762285855571311226935212468317451162677', 61, 0, '-0.07665126622547200709328366279959297473262965998499827526363485');
        test_asin_006('0.002058774932399380728', 73, 3, '0.002058776386773685135920502914113033566749664057124819063683489089253866675');
        test_asin_006('0.6191705648197127900333', 20, 3, '0.6676860026273445248');
        test_asin_006('0.0451', 71, 3, '0.045115302986200826677187000097752946920986469377743210302486079583770366');
        test_asin_006('0.156883637', 65, 6, '0.15753442001936249496738123179710495311489551498086102245485050903');
        test_asin_006('0.163388332624365770456915424679194860444773341061114349237610212142206187981629282902', 67, 0, '0.1641241692993679299065215302292638564718643006858786702204768697199');
        test_asin_006('-0.1958', 17, 5, '-0.19707317438982823');
        test_asin_006('0.873332', 19, 5, '1.062001065132184521');
        test_asin_006('-0.8517325896144402', 29, 0, '-1.0192830764340094095462711303');
        test_asin_006('-0.5110799', 65, 2, '-0.53644070128325494453237503822033662227949443391067147724566337039');
        test_asin_006('-0.579334355419195148', 31, 3, '-0.617911801796609232511609252874');
    });
    /**
     * @tc.number    : DECIMAL_TEST_009
     * @tc.name      : Decimal_asin_Func_009
     * @tc.desc      : Test asin
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_asin_Func_009", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        try {
            test_asin_006('e', 19, 5, '1.062001065132184521');
            expect(true).assertEqual(false);
        } catch (err) {
            expect(err.name).assertEqual(`BusinessError`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
        }
    });
    /**
     * @tc.number    : DECIMAL_TEST_010
     * @tc.name      : Decimal_asinh_Func_010
     * @tc.desc      : Test asinh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_asinh_Func_010", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        test_asinh_007('NaN', 40, 4, 'NaN');
        test_asinh_007('Infinity', 40, 4, 'Infinity');
        test_asinh_007('-Infinity', 40, 4, '-Infinity');
        test_asinh_007('0', 40, 4, '0');
        test_asinh_007('-0', 40, 4, '-0');
        test_asinh_007('3.1444197343', 4, 3, '1.863');
        test_asinh_007('-7546164.80347805747707434691023987685', 5, 2, '-16.529');
        test_asinh_007('-0.15139', 9, 1, '-0.150817601');
        test_asinh_007('7649', 8, 2, '9.6354774');
        test_asinh_007('9522664768544403839474412593333.0574738', 8, 6, '72.024375');
        test_asinh_007('7979240.25859873', 3, 3, '16.5');
        test_asinh_007('268', 5, 2, '6.2842');
        test_asinh_007('-0.036', 2, 5, '-0.036');
        test_asinh_007('0.4807', 9, 3, '0.4638831');
        test_asinh_007('0.229', 10, 4, '0.2270443104');
        test_asinh_007('2.00400000074005', 7, 0, '1.445423');
        test_asinh_007('200000000000000.00004161', 6, 5, '33.6225');
        test_asinh_007('-58888888888888791888.6', 3, 0, '-46.3');
        test_asinh_007('-6031221', 3, 4, '-16.3');
        test_asinh_007('-640.3942', 7, 5, '-7.155232');
        test_asinh_007('14', 10, 4, '3.333477587');
        test_asinh_007('4', 2, 0, '2.1');
        test_asinh_007('0.03', 7, 0, '0.02999551');
        test_asinh_007('90', 1, 4, '5');
        test_asinh_007('5312357191358436060512320673773898993193725886736164185043184432297', 9, 5, '154.333799');
        test_asinh_007('7199699999999999999999999999999999999999999939998.999999990999999', 5, 3, '113.19');
        test_asinh_007('-882.444444444144444444494444440464444444494940444444244444', 5, 4, '-7.4758');
        test_asinh_007('-8', 13, 5, '-2.776472280724');
        test_asinh_007('-86000000000000000000.000000000000000000000005', 70, 0, '-46.59402615070627535463115294058075590852999710911467932978308270954662');
        test_asinh_007('-376.89', 48, 4, '-6.62510230823208343124289061224985909335679702244');
        test_asinh_007('96266757965567956426092817863148449', 5, 0, '81.246');
        test_asinh_007('7519.1832', 46, 1, '9.618359979005094092372581180036903865361423221');
        test_asinh_007('3111111111111111111111111113111111111111.111111111111161138', 73, 2, '91.62894574016671152726822536730571926386870493068213127138241128153116515');
        test_asinh_007('-8428702594578936542477442030434333806', 37, 5, '-85.71785338514359573130458501589518584');
        test_asinh_007('-729028279311299860.939180266635717461', 48, 6, '-41.8236360986491235923183022666827171650501445231');
        test_asinh_007('636378004660459076120.99604591124', 11, 4, '48.595471588');
        test_asinh_007('461967326081151345517140931535', 45, 1, '68.9984388572118740675493758006785202194685299');
        test_asinh_007('0.92', 17, 6, '0.82365909043241051');
        test_asinh_007('-230982323268609169145946104396150217.76896733458979187647947774685888534', 35, 0, '-82.120796434310525765547736423296875');
        test_asinh_007('-672211211111111111101111111111.1111111111111111111111111111131117111', 35, 5, '-69.373517284788400913185878628465723');
        test_asinh_007('0.00000060482048460767108485365525600300117458763457062849', 77, 2, '0.00000060482048460763421017663533424068534983602813406207303024723328078399099182286');
        test_asinh_007('-0.03384059130054301010037', 28, 4, '-0.03383413566704186353496859594');
        test_asinh_007('71984879069309', 42, 1, '32.6006243805224822843383423875877387660665');
        test_asinh_007('0.0900770980497960620934208869160426353386017063437926198857463084798514071501', 39, 0, '0.089955728166487127683719480764589414987');
        test_asinh_007('2844969', 19, 5, '15.55420990973386475');
        test_asinh_007('-356', 50, 1, '-6.5680798840106081722529702658569854797470604302438');
        test_asinh_007('-49.3', 14, 4, '-4.5911741056591');
        test_asinh_007('0.03933187411044072735132236169900601818974716', 8, 3, '0.03932174');
        test_asinh_007('-34170.3', 62, 0, '-11.132259305476110273648480940373325075775200555781318183293398');
        test_asinh_007('77.47574325137050802631', 52, 1, '5.043153724397571705290385521814303549847001281430545');
    });
    /**
     * @tc.number    : DECIMAL_TEST_011
     * @tc.name      : Decimal_asinh_Func_011
     * @tc.desc      : Test asinh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_asinh_Func_011", 0, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        try {
            test_asinh_007('e11', 14, 4, '-4.5911741056591');
            expect(true).assertEqual(false);
        } catch (err) {
            expect(err.name).assertEqual(`BusinessError`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e11`);
        }
    });
  });
}