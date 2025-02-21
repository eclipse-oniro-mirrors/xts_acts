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

import { describe, it, expect } from "@ohos/hypium"
import complexndk from 'libcomplexndk.so'

export default function complexNdkTest() {
  describe('ComplexNdkTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CREAL_0100
     * @tc.name       : testMuslComplexCReal001
     * @tc.desc       : test creal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCReal001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = firstParam;
      let data: number = complexndk.creal(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CREALF_0100
     * @tc.name       : testMuslComplexCRealF001
     * @tc.desc       : test crealf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCRealF001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = firstParam;
      let data: string = complexndk.crealf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CREALL_0100
     * @tc.name       : testMuslComplexCRealL001
     * @tc.desc       : test creall
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCRealL001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = firstParam;
      let data: number = complexndk.creall(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CONJ_0100
     * @tc.name       : testMuslComplexConj001
     * @tc.desc       : test conj
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexConj001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,-1.00)";
      let data: string = complexndk.conj(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CONJF_0100
     * @tc.name       : testMuslComplexConjF001
     * @tc.desc       : test conjf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexConjF001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,-1.00)";
      let data: string = complexndk.conjf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CONJL_0100
     * @tc.name       : testMuslComplexConjL001
     * @tc.desc       : test conjl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexConjL001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,-1.00)";
      let data: string = complexndk.conjl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CPOW_0100
     * @tc.name       : testMuslComplexCPow001
     * @tc.desc       : test cpow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCPow001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CPOWF_0100
     * @tc.name       : testMuslComplexCPowF001
     * @tc.desc       : test cpowf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCPowF001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CPOWL_0100
     * @tc.name       : testMuslComplexCPowL001
     * @tc.desc       : test cpowl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCPowL001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CPROJ_0100
     * @tc.name       : testMuslComplexCProj001
     * @tc.desc       : test cproj
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCProj001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cproj(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CPROJF_0100
     * @tc.name       : testMuslComplexCProjF001
     * @tc.desc       : test cprojf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCProjF001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cprojf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CPROJL_0100
     * @tc.name       : testMuslComplexCProjL001
     * @tc.desc       : test cprojl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCProjL001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(2.00,1.00)";
      let data: string = complexndk.cprojl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSIN_0100
     * @tc.name       : testMuslComplexCSin001
     * @tc.desc       : test csin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSin001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csin(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSINF_0100
     * @tc.name       : testMuslComplexCSinF001
     * @tc.desc       : test csinf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSinF001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csinf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSINL_0100
     * @tc.name       : testMuslComplexCSinL001
     * @tc.desc       : test csinl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSinL001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csinl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSINH_0100
     * @tc.name       : testMuslComplexCSinH001
     * @tc.desc       : test csinh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSinH001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.96,3.17)";
      let data: string = complexndk.csinh(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSINHF_0100
     * @tc.name       : testMuslComplexCSinHf001
     * @tc.desc       : test csinhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSinHf001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.40,-0.49)";
      let data: string = complexndk.csinf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSINHL_0100
     * @tc.name       : testMuslComplexCSinHl001
     * @tc.desc       : test csinhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSinHl001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.96,3.17)";
      let data: string = complexndk.csinhl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSQRT_0100
     * @tc.name       : testMuslComplexCSqrt001
     * @tc.desc       : test csqrt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSqrt001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.46,0.34)";
      let data: string = complexndk.csqrt(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSQRTF_0100
     * @tc.name       : testMuslComplexCSqrtF001
     * @tc.desc       : test csqrtf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSqrtF001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.46,0.34)";
      let data: string = complexndk.csqrtf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CSQRTL_0100
     * @tc.name       : testMuslComplexCSqrtL001
     * @tc.desc       : test csqrtl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCSqrtL001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.46,0.34)";
      let data: string = complexndk.csqrtl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CTAN_0100
     * @tc.name       : testMuslComplexCTan001
     * @tc.desc       : test ctan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCTan001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctan(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CTANF_0100
     * @tc.name       : testMuslComplexCTanF001
     * @tc.desc       : test ctanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCTanF001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctanf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CTANL_0100
     * @tc.name       : testMuslComplexCTanL001
     * @tc.desc       : test ctanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCTanL001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctanl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CTANH_0100
     * @tc.name       : testMuslComplexCTanH001
     * @tc.desc       : test ctanh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCTanH001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.01,0.03)";
      let data: string = complexndk.ctanh(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CTANHF_0100
     * @tc.name       : testMuslComplexCTanHf001
     * @tc.desc       : test ctanhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCTanHf001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(-0.24,1.17)";
      let data: string = complexndk.ctanf(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CTANHL_0100
     * @tc.name       : testMuslComplexCTanHl001
     * @tc.desc       : test ctanhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslComplexCTanHl001', 0, async (done: Function) => {
      let firstParam = 2;
      let secondParam = 1;
      let expectValue = "(1.01,0.03)";
      let data: string = complexndk.ctanhl(firstParam, secondParam);
      expect(data).assertEqual(expectValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0100
     * @tc.name       : testMuslComplexCabs001
     * @tc.desc       : test cabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabs001', 0, async (done: Function) => {
      let param_real = 3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0200
     * @tc.name       : testMuslComplexCabs002
     * @tc.desc       : test cabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabs002', 0, async (done: Function) => {
      let param_real = 3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0300
     * @tc.name       : testMuslComplexCabs003
     * @tc.desc       : test cabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabs003', 0, async (done: Function) => {
      let param_real = -3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABS_0400
     * @tc.name       : testMuslComplexCabs004
     * @tc.desc       : test cabs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabs004', 0, async (done: Function) => {
      let param_real = -3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabs(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0100
     * @tc.name       : testMuslComplexCabsf001
     * @tc.desc       : test cabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsf001', 0, async (done: Function) => {
      let param_real = 3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0200
     * @tc.name       : testMuslComplexCabsf002
     * @tc.desc       : test cabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsf002', 0, async (done: Function) => {
      let param_real = 3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0300
     * @tc.name       : testMuslComplexCabsf003
     * @tc.desc       : test cabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsf003', 0, async (done: Function) => {
      let param_real = -3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSF_0400
     * @tc.name       : testMuslComplexCabsf004
     * @tc.desc       : test cabsf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsf004', 0, async (done: Function) => {
      let param_real = -3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0100
     * @tc.name       : testMuslComplexCabsl001
     * @tc.desc       : test cabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsl001', 0, async (done: Function) => {
      let param_real = 3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0200
     * @tc.name       : testMuslComplexCabsl002
     * @tc.desc       : test cabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsl002', 0, async (done: Function) => {
      let param_real = 3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0300
     * @tc.name       : testMuslComplexCabsl003
     * @tc.desc       : test cabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsl003', 0, async (done: Function) => {
      let param_real = -3;
      let param_image = 4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CABSL_0400
     * @tc.name       : testMuslComplexCabsl004
     * @tc.desc       : test cabsl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     * @
     */
    it('testMuslComplexCabsl004', 0, async (done: Function) => {
      let param_real = -3;
      let param_image = -4;
      let resultValue = 5;
      let result: number = complexndk.cabsl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOS_0100
     * @tc.name       : testMuslComplexCacos001
     * @tc.desc       : test cacos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacos001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.00,-1.98)";
      let result: string = complexndk.cacos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOS_0200
     * @tc.name       : testMuslComplexCacos002
     * @tc.desc       : test cacos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacos002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.57,0.00)";
      let result: string = complexndk.cacos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSF_0100
     * @tc.name       : testMuslComplexCacosf001
     * @tc.desc       : test cacosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacosf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.00,-1.98)";
      let result: string = complexndk.cacosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSF_0200
     * @tc.name       : testMuslComplexCacosf002
     * @tc.desc       : test cacosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacosf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.57,0.00)";
      let result: string = complexndk.cacosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSL_0100
     * @tc.name       : testMuslComplexCacosl001
     * @tc.desc       : test cacosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacosl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.00,-1.98)";
      let result: string = complexndk.cacosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSL_0200
     * @tc.name       : testMuslComplexCacosl002
     * @tc.desc       : test cacosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacosl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.57,0.00)";
      let result: string = complexndk.cacosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSH_0100
     * @tc.name       : testMuslComplexCacosh001
     * @tc.desc       : test cacosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacosh001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.98,1.00)";
      let result: string = complexndk.cacosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSH_0200
     * @tc.name       : testMuslComplexCacosh002
     * @tc.desc       : test cacosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacosh002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,1.57)";
      let result: string = complexndk.cacosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHF_0100
     * @tc.name       : testMuslComplexCacoshf001
     * @tc.desc       : test cacoshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacoshf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.98,1.00)";
      let result: string = complexndk.cacoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHF_0200
     * @tc.name       : testMuslComplexCacoshf002
     * @tc.desc       : test cacoshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacoshf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,1.57)";
      let result: string = complexndk.cacoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHL_0100
     * @tc.name       : testMuslComplexCacoshl001
     * @tc.desc       : test cacoshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacoshl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.98,1.00)";
      let result: string = complexndk.cacoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CACOSHL_0200
     * @tc.name       : testMuslComplexCacoshl002
     * @tc.desc       : test cacoshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCacoshl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,1.57)";
      let result: string = complexndk.cacoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CARG_0100
     * @tc.name       : testMuslComplexCarg001
     * @tc.desc       : test carg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCarg001', 0, async (done: Function) => {
      let param_real = 1;
      let param_image = 2;
      let resultValue = 1;
      let result: number = complexndk.carg(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CARG_0200
     * @tc.name       : testMuslComplexCarg002
     * @tc.desc       : test carg
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCarg002', 0, async (done: Function) => {
      let param_real = -2;
      let param_image = -2;
      let resultValue = 1;
      let result: number = complexndk.carg(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CARGL_0100
     * @tc.name       : testMuslComplexCargl001
     * @tc.desc       : test cargl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCargl001', 0, async (done: Function) => {
      let param_real = 1;
      let param_image = 2;
      let resultValue = 1;
      let result: number = complexndk.cargl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CARGL_0200
     * @tc.name       : testMuslComplexCargl002
     * @tc.desc       : test cargl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCargl002', 0, async (done: Function) => {
      let param_real = -2;
      let param_image = -2;
      let resultValue = 1;
      let result: number = complexndk.cargl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CARGF_0100
     * @tc.name       : testMuslComplexCargf001
     * @tc.desc       : test cargf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCargf001', 0, async (done: Function) => {
      let param_real = 1;
      let param_image = 2;
      let resultValue = 1;
      let result: number = complexndk.cargf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CARGF_0200
     * @tc.name       : testMuslComplexCargf002
     * @tc.desc       : test cargf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCargf002', 0, async (done: Function) => {
      let param_real = -2;
      let param_image = -2;
      let resultValue = 1;
      let result: number = complexndk.cargf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASIN_0100
     * @tc.name       : testMuslComplexCasin001
     * @tc.desc       : test casin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasin001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.57,1.98)";
      let result: string = complexndk.casin(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASIN_0200
     * @tc.name       : testMuslComplexCasin002
     * @tc.desc       : test casin
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasin002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,-0.00)";
      let result: string = complexndk.casin(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINF_0100
     * @tc.name       : testMuslComplexCasinf001
     * @tc.desc       : test casinf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.57,1.98)";
      let result: string = complexndk.casinf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINF_0200
     * @tc.name       : testMuslComplexCasinf002
     * @tc.desc       : test casinf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,-0.00)";
      let result: string = complexndk.casinf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINL_0100
     * @tc.name       : testMuslComplexCasinl001
     * @tc.desc       : test casinl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.57,1.98)";
      let result: string = complexndk.casinl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINL_0200
     * @tc.name       : testMuslComplexCasinl002
     * @tc.desc       : test casinl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,-0.00)";
      let result: string = complexndk.casinl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINH_0100
     * @tc.name       : testMuslComplexCasinh001
     * @tc.desc       : test casinh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinh001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.97,0.96)";
      let result: string = complexndk.casinh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINH_0200
     * @tc.name       : testMuslComplexCasinh002
     * @tc.desc       : test casinh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinh002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,-0.00)";
      let result: string = complexndk.casinh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINHF_0100
     * @tc.name       : testMuslComplexCasinhf001
     * @tc.desc       : test casinhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinhf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.97,0.96)";
      let result: string = complexndk.casinhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINHF_0200
     * @tc.name       : testMuslComplexCasinhf002
     * @tc.desc       : test casinhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinhf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,-0.00)";
      let result: string = complexndk.casinhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINHL_0100
     * @tc.name       : testMuslComplexCasinhl001
     * @tc.desc       : test casinhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinhl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.97,0.96)";
      let result: string = complexndk.casinhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CASINHL_0200
     * @tc.name       : testMuslComplexCasinhl002
     * @tc.desc       : test casinhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCasinhl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(-0.00,-0.00)";
      let result: string = complexndk.casinhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATAN_0100
     * @tc.name       : testMuslComplexCatan001
     * @tc.desc       : test catan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatan001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.41,0.23)";
      let result: string = complexndk.catan(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATAN_0200
     * @tc.name       : testMuslComplexCatan002
     * @tc.desc       : test catan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatan002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catan(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANF_0100
     * @tc.name       : testMuslComplexCatanf001
     * @tc.desc       : test catanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.41,0.23)";
      let result: string = complexndk.catanf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANF_0200
     * @tc.name       : testMuslComplexCatanf002
     * @tc.desc       : test catanf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANL_0100
     * @tc.name       : testMuslComplexCatanl001
     * @tc.desc       : test catanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.41,0.23)";
      let result: string = complexndk.catanl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANL_0200
     * @tc.name       : testMuslComplexCatanl002
     * @tc.desc       : test catanl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANH_0100
     * @tc.name       : testMuslComplexCatanh001
     * @tc.desc       : test catanh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanh001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.15,1.34)";
      let result: string = complexndk.catanh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANH_0200
     * @tc.name       : testMuslComplexCatanh002
     * @tc.desc       : test catanh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanh002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANHF_0100
     * @tc.name       : testMuslComplexCatanhf001
     * @tc.desc       : test catanhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanhf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.15,1.34)";
      let result: string = complexndk.catanhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANHF_0200
     * @tc.name       : testMuslComplexCatanhf002
     * @tc.desc       : test catanhf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanhf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanhf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANHL_0100
     * @tc.name       : testMuslComplexCatanhl001
     * @tc.desc       : test catanhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanhl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(0.15,1.34)";
      let result: string = complexndk.catanhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CATANHL_0200
     * @tc.name       : testMuslComplexCatanhl002
     * @tc.desc       : test catanhl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCatanhl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(0.00,0.00)";
      let result: string = complexndk.catanhl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOS_0100
     * @tc.name       : testMuslComplexCcos001
     * @tc.desc       : test ccos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcos001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-4.19,-9.11)";
      let result: string = complexndk.ccos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOS_0200
     * @tc.name       : testMuslComplexCcos002
     * @tc.desc       : test ccos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcos002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,-0.00)";
      let result: string = complexndk.ccos(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSF_0100
     * @tc.name       : testMuslComplexCcosf001
     * @tc.desc       : test ccosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcosf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-4.19,-9.11)";
      let result: string = complexndk.ccosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSF_0200
     * @tc.name       : testMuslComplexCcosf002
     * @tc.desc       : test ccosf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcosf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,-0.00)";
      let result: string = complexndk.ccosf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSL_0100
     * @tc.name       : testMuslComplexCcosl001
     * @tc.desc       : test ccosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcosl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-4.19,-9.11)";
      let result: string = complexndk.ccosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSL_0200
     * @tc.name       : testMuslComplexCcosl002
     * @tc.desc       : test ccosl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcosl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,-0.00)";
      let result: string = complexndk.ccosl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSH_0100
     * @tc.name       : testMuslComplexCcosh001
     * @tc.desc       : test ccosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcosh001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-3.72,0.51)";
      let result: string = complexndk.ccosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSH_0200
     * @tc.name       : testMuslComplexCcosh002
     * @tc.desc       : test ccosh
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcosh002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.ccosh(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHF_0100
     * @tc.name       : testMuslComplexCcoshf001
     * @tc.desc       : test ccoshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcoshf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-3.72,0.51)";
      let result: string = complexndk.ccoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHF_0200
     * @tc.name       : testMuslComplexCcoshf002
     * @tc.desc       : test ccoshf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcoshf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.ccoshf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHL_0100
     * @tc.name       : testMuslComplexCcoshl001
     * @tc.desc       : test ccoshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcoshl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-3.72,0.51)";
      let result: string = complexndk.ccoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CCOSHL_0200
     * @tc.name       : testMuslComplexCcoshl002
     * @tc.desc       : test ccoshl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCcoshl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.ccoshl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CEXP_0100
     * @tc.name       : testMuslComplexCexp001
     * @tc.desc       : test cexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCexp001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-7.32,1.04)";
      let result: string = complexndk.cexp(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CEXP_0200
     * @tc.name       : testMuslComplexCexp002
     * @tc.desc       : test cexp
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCexp002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.cexp(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CEXPF_0100
     * @tc.name       : testMuslComplexCexpf001
     * @tc.desc       : test cexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCexpf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-7.32,1.04)";
      let result: string = complexndk.cexpf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CEXPF_0200
     * @tc.name       : testMuslComplexCexpf002
     * @tc.desc       : test cexpf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCexpf002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.cexpf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CEXPL_0100
     * @tc.name       : testMuslComplexCexpl001
     * @tc.desc       : test cexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCexpl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(-7.32,1.04)";
      let result: string = complexndk.cexpl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CEXPL_0200
     * @tc.name       : testMuslComplexCexpl002
     * @tc.desc       : test cexpl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCexpl002', 0, async (done: Function) => {
      let param_real = 0;
      let param_image = 0;
      let resultValue = "(1.00,0.00)";
      let result: string = complexndk.cexpl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CLOG_0100
     * @tc.name       : testMuslComplexClog001
     * @tc.desc       : test clog
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexClog001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.28,0.98)";
      let result: string = complexndk.clog(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CLOGL_0100
     * @tc.name       : testMuslComplexClogl001
     * @tc.desc       : test clogl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexClogl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.28,0.98)";
      let result: string = complexndk.clogl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CLOGF_0100
     * @tc.name       : testMuslComplexClogf001
     * @tc.desc       : test clogf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexClogf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = "(1.28,0.98)";
      let result: string = complexndk.clogf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CIMAG_0100
     * @tc.name       : testMuslComplexCimag001
     * @tc.desc       : test cimag
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCimag001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = 3;
      let result: string = complexndk.cimag(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CIMAGL_0100
     * @tc.name       : testMuslComplexCimagl001
     * @tc.desc       : test cimagl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCimagl001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = 3;
      let result: string = complexndk.cimagl(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_COMPLEX_CIMAGF_0100
     * @tc.name       : testMuslComplexCimagf001
     * @tc.desc       : test cimagf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslComplexCimagf001', 0, async (done: Function) => {
      let param_real = 2;
      let param_image = 3;
      let resultValue = 3;
      let result: string = complexndk.cimagf(param_real, param_image);
      expect(result).assertEqual(resultValue);
      done()
    });
  })
}
