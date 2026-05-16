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

#ifndef ACTS_ZLIB_TEST_H
#define ACTS_ZLIB_TEST_H

#include "zlib.h"

int ActsZlibTestCompress(void);
int ActsZlibTestGzio(void);
int ActsZlibTestDeflate(void);
int ActsZlibTestInflate(void);
int ActsZlibTestLargeDeflate(void);
int ActsZlibTestLargeInflate(void);
int ActsZlibTestFlush(void);
int ActsZlibTestSync(void);
int ActsZlibTestDictDeflate(void);
int ActsZlibTestDictInflate(void);
int ActsZlibTestCompress2(void);
int ActsZlibTestAdler(void);
int ActsZlibTestDeflateState(void);
int ActsZlibTestDeflateBound(void);
int ActsZlibTestCRC(void);
int ActsZlibTestGetCrcTable(void);
int ActsZlibTestGzBuffer(void);
int ActsZlibTestGzFlush(void);
int ActsZlibTestGzFread(void);
int ActsZlibTestGzWrite(void);
int ActsZlibTestGzGetc(void);
int ActsZlibTestGzUnGetc(void);
int ActsZlibTestGzGetcx(void);
int ActsZlibTestGzGets(void);
int ActsZlibTestGzOffset64(void);
int ActsZlibTestGzOpen(void);
int ActsZlibTestGzPrintf(void);
int ActsZlibTestGzPutc(void);
int ActsZlibTestGzPuts(void);
int ActsZlibTestGzRead(void);
int ActsZlibTestGzRewind(void);
int ActsZlibTestGzseek(void);
int ActsZlibTestGzSetParams(void);
int ActsZlibTestGzTell(void);
int ActsZlibTestGzVprintf(void);
int ActsZlibTestGzwrite(void);
int ActsZlibTestGzInflateBack(void);
int ActsZlibTestInflateCodesUsed(void);
int ActsZlibTestInflateCopyEnd(void);
int ActsZlibTestInflateGetDictionary(void);
int ActsZlibTestInflateGetHeader(void);
int ActsZlibTestInflateInitx(void);
int ActsZlibTestInflatePrime(void);
int ActsZlibTestInflateReset(void);
int ActsZlibTestInflateSetDictionary(void);
int ActsZlibTestInflateSyncPoint(void);
int ActsZlibTestInflateUndermine(void);
int ActsZlibTestInflateValidate(void);
int ActsZlibTestzlibCompileFlags(void);
int ActsZlibTestzError(void);
int ActsZlibTestzlibVersion(void);
int ActsZlibTestGzdopen(void);

#endif