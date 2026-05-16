/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export const Api_Test_Prepare: (caseName: number) => number;

export const Func2_Test_Prepare: (caseName: number) => number;

export const Func_Test_Prepare: (caseName: number) => number;

export const State_Test_Prepare: (caseName: number) => number;

export const Hwh265_Hdr2sdr_Test: (caseName: number) => Promise<number>;

export const Api_Test: (caseName: number) => Promise<number>;

export const Func2_Test: (caseName: number) => Promise<number>;

export const Func_Test: (caseName: number) => Promise<number>;

export const State_Test: (caseName: number) => Promise<number>;
