/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

#include <cstdlib>
#include <cstring>
#include <pthread.h>
#include <sys/wait.h>
#include <unistd.h>

#include "functionalext.h"

namespace {
constexpr size_t K_COPY_LEN_TWO = 2U;
constexpr size_t K_COPY_LEN_TWELVE = 12U;
constexpr size_t K_COPY_LEN_ZERO = 0U;
#ifdef MUSL_EXTERNAL_FUNCTION
constexpr size_t kLargeNExceedsSrc = 20U;
constexpr size_t kShortPrefixLen = 5U;
constexpr size_t kSpecialLineCopyLen = 12U;
constexpr size_t kEmptyStrndupN = 5U;
constexpr size_t kUltraLongLen = 10000U;
constexpr size_t kNullptrStrndupN = 10U;
constexpr size_t kUnsafeSrcBufElems = 10U;
constexpr size_t kUnsafeBufCopyLen = 8U;
constexpr size_t kExtraBeyondStrlen = 50U;
constexpr int kConcurrentThreads = 5;
constexpr int kThreadLoopIterations = 1000;
constexpr int kStrndupNModulus = 5;
#endif
} // namespace

/**
 * @tc.name      : Strndup0100
 * @tc.desc      : test the strndup function to copy the string according to the input parameter
 * @tc.level     : Level 0
 */
void Strndup0100(void)
{
    char* str = "helloworld";
    char* result = strndup(str, K_COPY_LEN_TWO);
    if (strcmp(result, "he")) {
        t_error("%s strndup get result is '%s' are not 'he'\n", __func__, result);
    }
    free(result);
}

/**
 * @tc.name      : Strndup0200
 * @tc.desc      : test the return value of strndup when the number of copies of the input exceeds the passed string
 * @tc.level     : Level 1
 */
void Strndup0200(void)
{
    char* str = "helloworld";
    char* result = strndup(str, K_COPY_LEN_TWELVE);
    if (strcmp(result, "helloworld")) {
        t_error("%s strndup get result is '%s' are not 'he'\n", __func__, result);
    }
    free(result);
}

/**
 * @tc.name      : Strndup0300
 * @tc.desc      : The return value of strndup when the number of test copies is 0
 * @tc.level     : Level 1
 */
void Strndup0300(void)
{
    char* str = "helloworld";
    char* result = strndup(str, K_COPY_LEN_ZERO);
    if (strcmp(result, "") != 0) {
        t_error("%s strndup get result is '%s' are not ''\n", __func__, result);
    }
    free(result);
}

#ifdef MUSL_EXTERNAL_FUNCTION
/**
 * @tc.name      : Strndup0100
 * @tc.desc      : The return value of __strndup when the number of test copies is different with the size of string
 * @tc.level     : Level 1
 */
void StrndupMusl0100(void)
{
    const char* src = "Hello, World!";
    // n is larger than the length of src
    char* result = __strndup(src, kLargeNExceedsSrc);
    EXPECT_PTRNE("Strndup0100", result, nullptr);
    EXPECT_STREQ("Strndup0100", result, "Hello, World!");
    EXPECT_LT("Strndup0100", strlen(result), kLargeNExceedsSrc);
    free(result);
    // n is less than the length of src
    result = __strndup(src, kShortPrefixLen);
    EXPECT_PTRNE("Strndup0100", result, nullptr);
    EXPECT_STREQ("Strndup0100", result, "Hello");
    EXPECT_LT("Strndup0100", strlen(result), strlen(src));
    free(result);
    // n is equal to the length of src
    result = __strndup(src, strlen(src));
    EXPECT_PTRNE("Strndup0100", result, nullptr);
    EXPECT_STREQ("Strndup0100", result, src);
    EXPECT_EQ("Strndup0100", strlen(result), strlen(src));
    free(result);
    // n is 0
    const char* src1 = "Hello";
    result = __strndup(src, K_COPY_LEN_ZERO);
    EXPECT_PTRNE("Strndup0100", result, nullptr);
    EXPECT_STREQ("Strndup0100", result, "");
    EXPECT_EQ("Strndup0100", strlen(result), 0);
    free(result);
}

/**
 * @tc.name      : Strndup0200
 * @tc.desc      : The return value of __strndup in different scenario as the following:
 *                 1. large n value (boundary test)
 *                 2. string containing special characters
 *                 3. empty string
 *                 4. Ultra long source string
 * @tc.level     : Level 1
 */
void StrndupMusl0200(void)
{
    // large n value (boundary test)
    const char* str = "Short";
    char* result = __strndup(str, SIZE_MAX);
    EXPECT_PTRNE("Strndup0200", result, nullptr);
    EXPECT_STREQ("Strndup0200", result, "Short");
    EXPECT_LT("Strndup0200", strlen(result), SIZE_MAX);
    free(result);
    // string containing special characters
    const char* src = "Line1\nLine2\tTab";
    result = __strndup(src, kSpecialLineCopyLen);
    EXPECT_PTRNE("Strndup0200", result, nullptr);
    EXPECT_STREQ("Strndup0200", result, "Line1\nLine2\t");
    EXPECT_EQ("Strndup0200", result[kSpecialLineCopyLen], '\0');
    free(result);
    // empty string
    const char* src1 = "";
    result = __strndup(src1, kEmptyStrndupN);
    EXPECT_PTRNE("Strndup0200", result, nullptr);
    EXPECT_STREQ("Strndup0200", result, "");
    EXPECT_EQ("Strndup0200", strlen(result), 0);
    free(result);
    // Ultra long source string
    size_t ultra_len = kUltraLongLen;
    char* ultra_str = (char*)malloc(ultra_len + 1);
    EXPECT_PTRNE("Strndup0200", ultra_str, nullptr);
    for (size_t i = 0; i < ultra_len; i++) {
        ultra_str[i] = 'A';
    }
    ultra_str[ultra_len] = '\0';
    result = __strndup(ultra_str, ultra_len);
    EXPECT_PTRNE("Strndup0200", result, nullptr);
    EXPECT_STREQ("Strndup0200", result, ultra_str);
    free(ultra_str);
    free(result);
}

/**
 * @tc.name      : Strndup0300
 * @tc.desc      : test __strndup when the source pointer is nullptr
 * @tc.level     : Level 1
 */
void StrndupMusl0300(void)
{
    const char* data = nullptr;
    pid_t pid = fork();
    if (pid < 0) {
        t_error("fork failed\n");
    } else if (pid == 0) {
        char* result = __strndup(data, kNullptrStrndupN);
        if (result != nullptr) {
            t_error("__strndup with nullptr pointer should return nullptr or cause SIGSEGV\n");
            free(result);
        }
    } else {
        int status;
        waitpid(pid, &status, WUNTRACED);
        EXPECT_TRUE("Strndup0300", WIFSIGNALED(status));
        EXPECT_EQ("Strndup0300", WTERMSIG(status), SIGSEGV);
    }
}

/**
 * @tc.name      : Strndup0400
 * @tc.desc      : Buffer overflow security test
 * @tc.level     : Level 1
 */
void Strndup0400(void)
{
    char* dst = nullptr;
    char unsafe_src[kUnsafeSrcBufElems] = { 'h', 'e', 'l', 'l', 'o', 'w', 'o', 'r', 'l', 'd' };
    size_t copy_len = kUnsafeBufCopyLen;
    dst = __strndup((const char*)unsafe_src, copy_len);
    EXPECT_PTRNE("Strndup0400", dst, nullptr);
    EXPECT_EQ("Strndup0400", strncmp(dst, unsafe_src, copy_len), 0);
    EXPECT_EQ("Strndup0400", dst[copy_len], '\0');
    free(dst);
}

/**
 * @tc.name      : Strndup0500
 * @tc.desc      : Memory management test: Multiple allocations and releases to verify no memory leaks
 * @tc.level     : Level 1
 */
void Strndup0500(void)
{
    char* dst1 = nullptr;
    char* dst2 = nullptr;
    char* dst3 = nullptr;
    const char* src1 = "Memory management test 1";
    const char* src2 = "Memory management test 2";
    const char* src3 = "Memory management test 3";

    dst1 = __strndup(src1, strlen(src1));
    EXPECT_PTRNE("Strndup0500", dst1, nullptr);
    dst2 = __strndup(src2, strlen(src2) + kExtraBeyondStrlen); // n larger than source string length
    EXPECT_PTRNE("Strndup0500", dst2, nullptr);
    dst3 = __strndup(src3, K_COPY_LEN_ZERO); // n is 0
    EXPECT_PTRNE("Strndup0500", dst3, nullptr);
    free(dst1);
    free(dst2);
    free(dst3);
}

struct thread_data {
    int thread_id;
    int success_count;
};

void* ThreadFunc(void* arg)
{
    struct thread_data* data = (struct thread_data*)arg;

    for (int i = 0; i < kThreadLoopIterations; i++) {
        char* test_str = "HelloWorld";
        size_t n = (i % kStrndupNModulus) + 1; // Vary n between 1-5

        char* result = strndup(test_str, n);
        if (result == nullptr) {
            continue;
        }

        // Verify the result
        if (strncmp(result, test_str, n) == 0 && result[n] == '\0') {
            data->success_count++;
        }

        free(result);
    }
    return nullptr;
}

/**
 * @tc.name      : Strndup0600
 * @tc.desc      : Multi-thread concurrent call stability test for __strndup function
 * @tc.level     : Level 1
 */
void Strndup0600(void)
{
    pthread_t threads[kConcurrentThreads];
    struct thread_data thread_data[kConcurrentThreads];
    int ret;

    for (int i = 0; i < kConcurrentThreads; i++) {
        thread_data[i].thread_id = i;
        thread_data[i].success_count = 0;
    }

    for (int i = 0; i < kConcurrentThreads; i++) {
        ret = pthread_create(&threads[i], nullptr, ThreadFunc, &thread_data[i]);
        EXPECT_EQ("Strndup0600", ret, 0);
    }

    for (int i = 0; i < kConcurrentThreads; i++) {
        EXPECT_EQ("Strndup0600", pthread_join(threads[i], nullptr), 0);
    }

    // Verify all threads completed successfully
    int total_success = 0;
    for (int i = 0; i < kConcurrentThreads; i++) {
        total_success += thread_data[i].success_count;
    }

    int expected_success = kConcurrentThreads * kThreadLoopIterations;
    EXPECT_EQ("Strndup0600", total_success, expected_success);
}
#endif

static int StrndupTestImpl(int argc, char* argv[])
{
    Strndup0100();
    Strndup0200();
    Strndup0300();
#ifdef MUSL_EXTERNAL_FUNCTION
    StrndupMusl0100();
    StrndupMusl0200();
    StrndupMusl0300();
    Strndup0400();
    Strndup0500();
    Strndup0600();
#endif
    return T_STATUS;
}

int StrndupTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return StrndupTestImpl(1, libcArgvStub);
}
