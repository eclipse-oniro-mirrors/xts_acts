/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
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

export const misAlign: () => number;
export const bounds: (a: number) => number;
export const integerDivBy0: (a: number) => number;
export const enumSan: (a: number) => number;
export const floatCastOverflow: () => number;
export const signedIntegerOverflow: (a: number) => number;
export const vptrCheck: () => number;
export const nonnullAttribute: (a: number) => number;
export const nullSanitize: (a: number) => number;
export const pointerOverflow: (a: number) => number;
export const returnNonnullAttribute: (a: number) => number;
export const shiftBase: (a: number) => number;
export const shiftBaseNegative: (a: number) => number;
export const shiftExponent: (a: number) => number;
export const shiftExponentNegative: (a: number) => number;
export const shiftExponentBound: (a: number) => number;
export const undefinedBool: () => number;
export const vlaBound: (a: number) => number;
export const unreachable: (a: number) => number;
export const noReturn: (a: number) => number;