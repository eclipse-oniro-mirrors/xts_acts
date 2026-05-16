/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#ifndef BFRAME_FUNC_TEST_H
#define BFRAME_FUNC_TEST_H

namespace OHOS {
namespace Media {

extern const char* INP_DIR_1080_30;

namespace BframeFuncTest {
void SetUpTestCase();
void TearDown();
}

int VIDEO_HW_ENCODE_B_FUNC_001();
int VIDEO_HW_ENCODE_B_FUNC_002();
int VIDEO_HW_ENCODE_B_FUNC_003();
int VIDEO_HW_ENCODE_B_FUNC_004();
int VIDEO_HW_ENCODE_B_FUNC_005();
int VIDEO_HW_ENCODE_B_FUNC_006();

} // namespace Media
} // namespace OHOS

#endif //BFRAME_FUNC_TEST_H
