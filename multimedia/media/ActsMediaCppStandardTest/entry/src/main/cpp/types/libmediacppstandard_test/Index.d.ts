/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

// AudioDecEncFuncTest: Audio Dec/Enc Function Tests (0100-0700, index 0-6)
export const AudioDecEncFuncTest: (caseName: number) => Promise<number>;
// CodecFormatFuncTest: Codec Format (native media API) Tests (0100-0300, index 0-2)
export const CodecFormatFuncTest: (caseName: number) => Promise<number>;
// VideoDecEncFuncTest: Video Dec/Enc Function Tests (0100-0700, index 0-6)
export const VideoDecEncFuncTest: (caseName: number) => Promise<number>;
