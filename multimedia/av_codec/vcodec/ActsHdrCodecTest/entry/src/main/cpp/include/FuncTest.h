/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#ifndef ACTSHDRCODECTEST_FUNC_TEST_H
#define ACTSHDRCODECTEST_FUNC_TEST_H

constexpr const char* HDR_PQ_VIVID_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/pq_vivid.h265";
constexpr const char* HDR_HLG_VIVID_4K_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/hlg_vivid_4k.h265";
constexpr const char* HDR_HLG_VIVID_1080P_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/hlg_vivid_1080p.h265";

namespace Acts {
namespace HdrCodec {
int HdrFunc0010();
int HdrFunc0020();
int HdrFunc0030();
int HdrFunc0040();
int HdrFunc0050();
int HdrFunc0060();
int HdrFunc0070();
int HdrFunc0080();
} // namespace HdrCodec
} // namespace Acts

#endif // ACTSHDRCODECTEST_FUNC_TEST_H
