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

#ifndef VIDEO_DECODER_FUNC_TEST_H
#define VIDEO_DECODER_FUNC_TEST_H

namespace OHOS {
namespace Media {

// Buffer Mode Function Tests
int VideoVc1DecFunction0001();
int VideoMjpegDecFunction0003();
int VideoMsvideo1DecFunction0005();

// Surface Mode Function Tests
int VideoVc1DecFunction0002();
int VideoMjpegDecFunction0004();
int VideoMsvideo1DecFunction0006();

// VP8 Function Tests
int VideoVp8DecFunction0007();
int VideoVp8DecFunction0021();

// VP9 Function Tests
int VideoVp9DecFunction0008();
int VideoVp9DecFunction0009();
int VideoVp9DecFunction0010();
int VideoVp9DecFunction0011();
int VideoVp9DecFunction0019();
int VideoVp9DecFunction0020();

// AV1 Function Tests
int VideoAv1DecFunction0012();
int VideoAv1DecFunction0013();
int VideoAv1DecFunction0015();
int VideoAv1DecFunction0016();

// CINEPAK Function Tests
int VideoCinepakDecFunction0022();
} // namespace Media
} // namespace OHOS

#endif // VIDEO_DECODER_FUNC_TEST_H
