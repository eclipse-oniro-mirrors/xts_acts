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



/**
 * OpenSLES Player Function Test
 * @param caseNumber - Test case number (0-1)
 *   0: SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
 *   1: SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
 * @returns 0 on success, -1 on failure
 */
export const openslesPlayerFunctionTest: (caseNumber: number) => number;

/**
 * OpenSLES Engine Invalid Test
 * @param caseNumber - Test case number (0-3)
 *   0: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
 *   1: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
 *   2: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
 *   3: SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
 * @returns 0 on success, -1 on failure
 */
export const openslesEngineInvalidTest: (caseNumber: number) => number;