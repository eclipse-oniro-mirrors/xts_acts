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
// HuksAgreeDhTest
export const HuksAgreeDhTest: (caseName: number) => number;

// HuksAgreeEcdhTest
export const HuksAgreeEcdhTest: (caseName: number) => number;

// HuksAgreeX25519Test
export const HuksAgreeX25519Test: (caseName: number) => number;

// HuksAttestTest（异步版本，返回 Promise）
export const HuksAttestTest: (caseName: number) => Promise<number>;

// HuksCipherAesTest
export const HuksCipherAesTest: (caseName: number) => number;

// HuksCipherRsaTest
export const HuksCipherRsaTest: (caseName: number) => number;

// HuksCipherRsaTestAsync（异步版本，返回 Promise）
export const HuksCipherRsaTestAsync: (caseName: number) => Promise<number>;

// HuksCipherSm4Test
export const HuksCipherSm4Test: (caseName: number) => number;

// HuksDeriveHkdfTest
export const HuksDeriveHkdfTest: (caseName: number) => number;

// HuksDerivePbkdfTest
export const HuksDerivePbkdfTest: (caseName: number) => number;

// HuksHmacTest
export const HuksHmacTest: (caseName: number) => number;

// HuksMiscTest
export const HuksMiscTest: (caseName: number) => number;

// HuksNullptrTest
export const HuksNullptrTest: (caseName: number) => number;

// HuksSignVerifyDsaTest
export const HuksSignVerifyDsaTest: (caseName: number) => number;

// HuksSignVerifyEccTest
export const HuksSignVerifyEccTest: (caseName: number) => number;

// HuksSignVerifyEd25519Test
export const HuksSignVerifyEd25519Test: (caseName: number) => number;

// HuksSignVerifyRsaTest（异步版本，返回 Promise）
export const HuksSignVerifyRsaTest: (caseName: number) => Promise<number>;

// HuksSignVerifySm2Test
export const HuksSignVerifySm2Test: (caseName: number) => number;

// HuksWrappedTest（异步版本，返回 Promise）
export const HuksWrappedTest: (caseName: number) => Promise<number>;
