/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain firstParam copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import complexndk from 'libcomplexndk.so'

export default function complexNdkTest() {
  describe('ComplexNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslComplexCReal001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CREAL_0100
     * @tc.desc   test creal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCReal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = firstParam;
      let data: number = complexndk.creal(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCRealF001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CREALF_0100
     * @tc.desc   test crealf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCRealF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = firstParam;
      let data: string = complexndk.crealf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCRealL001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CREALL_0100
     * @tc.desc   test creall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCRealL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = firstParam;
      let data: number = complexndk.creall(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexConj001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CONJ_0100
     * @tc.desc   test conj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexConj001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,-1.00)";
      let data: string = complexndk.conj(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexConjF001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CONJF_0100
     * @tc.desc   test conjf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexConjF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,-1.00)";
      let data: string = complexndk.conjf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexConjL001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CONJL_0100
     * @tc.desc   test conjl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexConjL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,-1.00)";
      let data: string = complexndk.conjl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCPow001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CPOW_0100
     * @tc.desc   test cpow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCPow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let thirdParam = 1;
      let fourthParam = 0;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cpow(firstParam, secondParam, thirdParam, fourthParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCPowF001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CPOWF_0100
     * @tc.desc   test cpowf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCPowF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let thirdParam = 1;
      let fourthParam = 0;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cpowf(firstParam, secondParam, thirdParam, fourthParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCPowL001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CPOWL_0100
     * @tc.desc   test cpowl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCPowL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let thirdParam = 1;
      let fourthParam = 0;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cpowl(firstParam, secondParam, thirdParam, fourthParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCProj001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CPROJ_0100
     * @tc.desc   test cproj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCProj001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cproj(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCProjF001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CPROJF_0100
     * @tc.desc   test cprojf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCProjF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cprojf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCProjL001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CPROJL_0100
     * @tc.desc   test cprojl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCProjL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cprojl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSin001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSIN_0100
     * @tc.desc   test csin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csin(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSinF001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSINF_0100
     * @tc.desc   test csinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSinF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csinf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSinL001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSINL_0100
     * @tc.desc   test csinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSinL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csinl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSinH001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSINH_0100
     * @tc.desc   test csinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSinH001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.96,3.17)";
      let data: string = complexndk.csinh(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSinHf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSINHF_0100
     * @tc.desc   test csinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSinHf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csinf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSinHl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSINHL_0100
     * @tc.desc   test csinhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSinHl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.96,3.17)";
      let data: string = complexndk.csinhl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSqrt001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSQRT_0100
     * @tc.desc   test csqrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.46,0.34)";
      let data: string = complexndk.csqrt(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSqrtF001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSQRTF_0100
     * @tc.desc   test csqrtf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSqrtF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.46,0.34)";
      let data: string = complexndk.csqrtf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCSqrtL001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CSQRTL_0100
     * @tc.desc   test csqrtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCSqrtL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.46,0.34)";
      let data: string = complexndk.csqrtl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCTan001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CTAN_0100
     * @tc.desc   test ctan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCTan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctan(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCTanF001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CTANF_0100
     * @tc.desc   test ctanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCTanF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctanf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCTanL001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CTANL_0100
     * @tc.desc   test ctanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCTanL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctanl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCTanH001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CTANH_0100
     * @tc.desc   test ctanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCTanH001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.01,0.03)";
      let data: string = complexndk.ctanh(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCTanHf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CTANHF_0100
     * @tc.desc   test ctanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCTanHf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctanf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCTanHl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CTANHL_0100
     * @tc.desc   test ctanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCTanHl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.01,0.03)";
      let data: string = complexndk.ctanhl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabs001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0100
     * @tc.desc   test cabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabs002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0200
     * @tc.desc   test cabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabs003
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0300
     * @tc.desc   test cabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabs003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabs004
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0400
     * @tc.desc   test cabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabs004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0100
     * @tc.desc   test cabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0200
     * @tc.desc   test cabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsf003
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0300
     * @tc.desc   test cabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsf004
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0400
     * @tc.desc   test cabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0100
     * @tc.desc   test cabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0200
     * @tc.desc   test cabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsl003
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0300
     * @tc.desc   test cabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCabsl004
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0400
     * @tc.desc   test cabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCabsl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacos001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOS_0100
     * @tc.desc   test cacos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.00,-1.98)";
      let result: string = complexndk.cacos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacos002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOS_0200
     * @tc.desc   test cacos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.57,0.00)";
      let result: string = complexndk.cacos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacosf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSF_0100
     * @tc.desc   test cacosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacosf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.00,-1.98)";
      let result: string = complexndk.cacosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacosf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSF_0200
     * @tc.desc   test cacosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacosf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.57,0.00)";
      let result: string = complexndk.cacosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacosl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSL_0100
     * @tc.desc   test cacosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacosl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.00,-1.98)";
      let result: string = complexndk.cacosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacosl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSL_0200
     * @tc.desc   test cacosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacosl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.57,0.00)";
      let result: string = complexndk.cacosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.name   testMuslComplexCacosh001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSH_0100
     * @tc.desc   test cacosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.98,1.00)";
      let result: string = complexndk.cacosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacosh002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSH_0200
     * @tc.desc   test cacosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,1.57)";
      let result: string = complexndk.cacosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacoshf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHF_0100
     * @tc.desc   test cacoshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacoshf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.98,1.00)";
      let result: string = complexndk.cacoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacoshf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHF_0200
     * @tc.desc   test cacoshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacoshf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,1.57)";
      let result: string = complexndk.cacoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacoshl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHL_0100
     * @tc.desc   test cacoshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacoshl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.98,1.00)";
      let result: string = complexndk.cacoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCacoshl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHL_0200
     * @tc.desc   test cacoshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCacoshl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,1.57)";
      let result: string = complexndk.cacoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCarg001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CARG_0100
     * @tc.desc   test carg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCarg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 1;
      let param_image = 2;
      let resultValue = 1;
      let result: number = complexndk.carg(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCarg002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CARG_0200
     * @tc.desc   test carg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCarg002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -2;
      let param_image = -2;
      let resultValue = 1;
      let result: number = complexndk.carg(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCargl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CARGL_0100
     * @tc.desc   test cargl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCargl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 1;
      let param_image = 2;
      let resultValue = 1;
      let result: number = complexndk.cargl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCargl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CARGL_0200
     * @tc.desc   test cargl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCargl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -2;
      let param_image = -2;
      let resultValue = 1;
      let result: number = complexndk.cargl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCargf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CARGF_0100
     * @tc.desc   test cargf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCargf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 1;
      let param_image = 2;
      let resultValue = 1;
      let result: number = complexndk.cargf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCargf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CARGF_0200
     * @tc.desc   test cargf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCargf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = -2;
      let param_image = -2;
      let resultValue = 1;
      let result: number = complexndk.cargf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasin001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASIN_0100
     * @tc.desc   test casin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.57,1.98)";
      let result: string = complexndk.casin(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasin002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASIN_0200
     * @tc.desc   test casin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,-0.00)";
      let result: string = complexndk.casin(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINF_0100
     * @tc.desc   test casinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.57,1.98)";
      let result: string = complexndk.casinf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINF_0200
     * @tc.desc   test casinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,-0.00)";
      let result: string = complexndk.casinf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINL_0100
     * @tc.desc   test casinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.57,1.98)";
      let result: string = complexndk.casinl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINL_0200
     * @tc.desc   test casinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,-0.00)";
      let result: string = complexndk.casinl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.name   testMuslComplexCasinh001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINH_0100
     * @tc.desc   test casinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.97,0.96)";
      let result: string = complexndk.casinh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinh002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINH_0200
     * @tc.desc   test casinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,-0.00)";
      let result: string = complexndk.casinh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinhf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINHF_0100
     * @tc.desc   test casinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinhf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.97,0.96)";
      let result: string = complexndk.casinhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinhf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINHF_0200
     * @tc.desc   test casinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinhf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,-0.00)";
      let result: string = complexndk.casinhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinhl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINHL_0100
     * @tc.desc   test casinhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinhl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.97,0.96)";
      let result: string = complexndk.casinhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCasinhl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CASINHL_0200
     * @tc.desc   test casinhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCasinhl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,-0.00)";
      let result: string = complexndk.casinhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatan001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATAN_0100
     * @tc.desc   test catan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.41,0.23)";
      let result: string = complexndk.catan(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatan002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATAN_0200
     * @tc.desc   test catan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catan(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANF_0100
     * @tc.desc   test catanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.41,0.23)";
      let result: string = complexndk.catanf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANF_0200
     * @tc.desc   test catanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANL_0100
     * @tc.desc   test catanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.41,0.23)";
      let result: string = complexndk.catanl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANL_0200
     * @tc.desc   test catanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.name   testMuslComplexCatanh001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANH_0100
     * @tc.desc   test catanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.15,1.34)";
      let result: string = complexndk.catanh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanh002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANH_0200
     * @tc.desc   test catanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanhf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANHF_0100
     * @tc.desc   test catanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanhf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.15,1.34)";
      let result: string = complexndk.catanhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanhf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANHF_0200
     * @tc.desc   test catanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanhf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanhl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANHL_0100
     * @tc.desc   test catanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanhl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.15,1.34)";
      let result: string = complexndk.catanhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCatanhl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CATANHL_0200
     * @tc.desc   test catanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCatanhl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcos001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOS_0100
     * @tc.desc   test ccos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-4.19,-9.11)";
      let result: string = complexndk.ccos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcos002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOS_0200
     * @tc.desc   test ccos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,-0.00)";
      let result: string = complexndk.ccos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcosf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSF_0100
     * @tc.desc   test ccosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcosf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-4.19,-9.11)";
      let result: string = complexndk.ccosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcosf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSF_0200
     * @tc.desc   test ccosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcosf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,-0.00)";
      let result: string = complexndk.ccosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcosl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSL_0100
     * @tc.desc   test ccosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcosl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-4.19,-9.11)";
      let result: string = complexndk.ccosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcosl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSL_0200
     * @tc.desc   test ccosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcosl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,-0.00)";
      let result: string = complexndk.ccosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.name   testMuslComplexCcosh001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSH_0100
     * @tc.desc   test ccosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-3.72,0.51)";
      let result: string = complexndk.ccosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcosh002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSH_0200
     * @tc.desc   test ccosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.ccosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcoshf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHF_0100
     * @tc.desc   test ccoshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcoshf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-3.72,0.51)";
      let result: string = complexndk.ccoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcoshf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHF_0200
     * @tc.desc   test ccoshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcoshf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.ccoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcoshl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHL_0100
     * @tc.desc   test ccoshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcoshl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-3.72,0.51)";
      let result: string = complexndk.ccoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCcoshl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHL_0200
     * @tc.desc   test ccoshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCcoshl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.ccoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCexp001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CEXP_0100
     * @tc.desc   test cexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCexp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-7.32,1.04)";
      let result: string = complexndk.cexp(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCexp002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CEXP_0200
     * @tc.desc   test cexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCexp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.cexp(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCexpf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CEXPF_0100
     * @tc.desc   test cexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCexpf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-7.32,1.04)";
      let result: string = complexndk.cexpf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCexpf002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CEXPF_0200
     * @tc.desc   test cexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCexpf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.cexpf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCexpl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CEXPL_0100
     * @tc.desc   test cexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCexpl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-7.32,1.04)";
      let result: string = complexndk.cexpl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCexpl002
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CEXPL_0200
     * @tc.desc   test cexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCexpl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.cexpl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexClog001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CLOG_0100
     * @tc.desc   test clog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexClog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.28,0.98)";
      let result: string = complexndk.clog(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexClogl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CLOGL_0100
     * @tc.desc   test clogl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexClogl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.28,0.98)";
      let result: string = complexndk.clogl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexClogf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CLOGF_0100
     * @tc.desc   test clogf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexClogf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.28,0.98)";
      let result: string = complexndk.clogf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCimag001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CIMAG_0100
     * @tc.desc   test cimag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCimag001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = 3;
      let result: string = complexndk.cimag(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCimagl001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CIMAGL_0100
     * @tc.desc   test cimagl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCimagl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = 3;
      let result: string = complexndk.cimagl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.name   testMuslComplexCimagf001
     * @tc.number SUB_THIRDPARTY_MUSL_COMPLEX_CIMAGF_0100
     * @tc.desc   test cimagf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslComplexCimagf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = 3;
      let result: string = complexndk.cimagf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });
  })
}
