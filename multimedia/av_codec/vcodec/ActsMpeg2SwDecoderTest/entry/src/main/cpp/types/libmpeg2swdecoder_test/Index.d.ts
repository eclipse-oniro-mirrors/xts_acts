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

// VideoDecodeSyncSwMpeg2FuncTest: SYNC FUNC 分类（0010/0020/0040），返回 Promise
export const VideoDecodeSyncSwMpeg2FuncTest: (caseName: number) => Promise<number>;

// VideoDecodeBlankFrameTest: BLANK FRAME 分类（0010），返回 Promise
export const VideoDecodeBlankFrameTest: (caseName: number) => Promise<number>;

// VideoDecodeBlankAddTest: BLANK ADD 分类（0010），返回 Promise
export const VideoDecodeBlankAddTest: (caseName: number) => Promise<number>;
