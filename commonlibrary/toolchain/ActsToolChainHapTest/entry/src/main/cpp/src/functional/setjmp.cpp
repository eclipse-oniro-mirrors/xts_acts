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

// WARNING: failed to inject status
#include <csetjmp>
#include <type_traits>
#include "libc_test_shim.h"
template <typename Ty> static void UseType()
{
    auto* unused = static_cast<std::add_pointer_t<Ty>>(nullptr);
    (void)unused;
}
static void F()
{
    UseType<jmp_buf>();
    {
        void (*p)(jmp_buf, int) = longjmp;
    }
#ifdef setjmp
    {
        int x = setjmp((jmp_buf){ 0 });
    }
#else
    {
        int (*p)(jmp_buf) = setjmp;
    }
#endif
#ifdef _POSIX_C_SOURCE
    UseType<sigjmp_buf>();
    {
        void (*p)(sigjmp_buf, int) = siglongjmp;
    }
#ifdef sigsetjmp
    {
        int x = sigsetjmp((sigjmp_buf){ 0 }, 0);
    }
#else
    {
        int (*p)(sigjmp_buf, int) = sigsetjmp;
    }
#endif
#endif
#if defined _XOPEN_SOURCE && defined OBSOLETE
    {
        void (*p)(jmp_buf, int) = _longjmp;
    }
#ifdef _setjmp
    {
        int x = _setjmp((jmp_buf){ 0 });
    }
#else
    {
        int (*p)(jmp_buf) = _setjmp;
    }
#endif
#endif
}

int SetjmpTest()
{
    F();
    return SUCCESS_CODE;
}
