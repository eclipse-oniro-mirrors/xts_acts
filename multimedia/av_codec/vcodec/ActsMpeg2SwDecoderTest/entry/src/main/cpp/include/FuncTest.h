/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ACTS_MPEG2_SW_DECODER_FUNC_TEST_H
#define ACTS_MPEG2_SW_DECODER_FUNC_TEST_H

constexpr const char* MPEG2_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/main@high_level_1920_1080_60.m2v";

int VideoDecodeSyncSwMpeg2Func0010();
int VideoDecodeSyncSwMpeg2Func0020();
int VideoDecodeSyncSwMpeg2Func0040();
int VideoDecodeBlankFrame0010();
int VideoDecodeBlankAdd0010();

#endif // ACTS_MPEG2_SW_DECODER_FUNC_TEST_H
