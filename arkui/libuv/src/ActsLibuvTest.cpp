/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <gtest/gtest.h>
#include <stdlib.h>
#include "ActsLibuvTest.h"
extern "C"{
#include "runner.h"
}
#include "uv.h"

typedef void (*init_plugin_function)();

namespace OHOS {
    using namespace std;
    using namespace testing::ext;
    static const char TESTFILE[] = "foo.gz";

    static uv_once_t once_only = UV_ONCE_INIT;

    int i = 0;

    void Increment()
    {
        i++;
    }
    // Preset action of the test suite, which is executed before the first test case
    void ActsLibuvTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsLibuvTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsLibuvTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsLibuvTest::TearDown()
    {
    }

/**
 * @tc.name   TestLibuvTestUVVersion
 * @tc.number ActsZlibTest_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestUVVersion, Function | MediumTest | Level2)
{
    int version = uv_version();
    ASSERT_EQ(version, UV_VERSION_HEX);
    fprintf(stderr, "uv_version error: %d\n", version);

    auto versionString = uv_version_string();
    fprintf(stderr, "uv_version_string error: %s\n", versionString);

    int replaceAllocator = uv_replace_allocator(nullptr, nullptr, nullptr, nullptr);
    ASSERT_EQ(replaceAllocator, UV_EINVAL);
    fprintf(stderr, "uv_replace_allocator error: %d\n", replaceAllocator);

    uv_loop_t* loop = uv_loop_new();
    ASSERT_TRUE(loop != nullptr);
}

/**
 * @tc.name   TestLibuvTestLoop
 * @tc.number ActsZlibTest_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestLoop, Function | MediumTest | Level2)
{
    uv_loop_t* newLoop;
    newLoop = uv_loop_new();
    ASSERT_TRUE(newLoop != NULL);
    uv_loop_delete(newLoop);
    ASSERT_TRUE(true);
}


/**
 * @tc.name   TestLibuvTestErrName
 * @tc.number TestLibuvTestErrName
 * @tc.desc   TestLibuvTestErrName
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestErrName, Function | MediumTest | Level2)
{
    int err = 0;
    char buf[40];
    size_t buflen = 40;
    char* newBuf = uv_err_name_r(err, buf, buflen);
    fprintf(stderr, "uv_err_name_r error: %s\n", newBuf);
    ASSERT_STREQ(newBuf, "Unknown system error 0");
}

/**
 * @tc.name   TestLibuvTestReqGetData
 * @tc.number ActsZlibTest_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestReqGetData, Function | MediumTest | Level2)
{
    float f = 5.5f;
    float* pf = &f;
    uv_req_t* req = (uv_req_t *)malloc(sizeof(uv_req_t));
    uv_req_t* setReq = (uv_req_t *)malloc(sizeof(uv_req_t));
    req->data = pf;
    req->type = UV_UNKNOWN_REQ;
    fprintf(stderr, "uv_req_get_data: %f\n", *(float*)uv_req_get_data(req));
    fprintf(stderr, "uv_req_get_type: %d\n", uv_req_get_type(req));
    ASSERT_EQ(uv_req_get_data(req), pf);
    ASSERT_EQ(uv_req_get_type(req), UV_UNKNOWN_REQ);

    uv_req_set_data(setReq, pf);
    ASSERT_EQ(uv_req_get_data(setReq), pf);
}

/**
 * @tc.name   TestLibuvTestPrintHandles
 * @tc.number ActsZlibTest_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestPrintHandles, Function | MediumTest | Level2)
{
    uv_loop_t* loop = nullptr;
    FILE *fp = fopen(TESTFILE, "w");
    uv_print_all_handles(loop, fp);
    uv_print_active_handles(loop, fp);
    ASSERT_TRUE(true);
}

/**
 * @tc.name   TestLibuvTestUpdSendQueue
 * @tc.number ActsZlibTest_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestUpdSendQueue, Function | MediumTest | Level2)
{
    size_t size, sizeC;
    uv_udp_t* handle = (uv_udp_t *)malloc(sizeof(uv_udp_t));
    handle->send_queue_size = 5;
    handle->send_queue_count = 5;
    size = uv_udp_get_send_queue_size(handle);
    ASSERT_TRUE(size == 5);

    sizeC = uv_udp_get_send_queue_count(handle);
    ASSERT_TRUE(sizeC == 5);
}

/**
 * @tc.name   TestLibuvTestFsLchown
 * @tc.number ActsZlibTest_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestFsLchown, Function | MediumTest | Level2)
{
    int retC;
    uv_loop_t loop;
    uv_fs_t req;
    const char *path = "/date/";
    uv_uid_t uid = 10000;
    uv_gid_t gid = 2020;
    retC = uv_fs_lchown(&loop, &req, path, uid, gid, nullptr);
    fprintf(stderr, "uv_err_name_r error: %d\n", retC);
}

/**
 * @tc.name   TestLibuvTestDisableStdioInheritance
 * @tc.number ActsZlibTest_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestDisableStdioInheritance, Function | MediumTest | Level2)
{
    uv_disable_stdio_inheritance();
    ASSERT_TRUE(true);
}

/**
 * @tc.name   TestLibuvTestDlsym
 * @tc.number ActsZlibTest_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestDlsym, Function | MediumTest | Level2) {
    int argc = 3;
    const char *tmp[] = {"aaaa", "bbbb", "cccc"};
    const char **argv = tmp;
    uv_lib_t *lib = (uv_lib_t *)malloc(sizeof(uv_lib_t));
    while (--argc) {
        uv_dlopen(argv[argc], lib);
        ASSERT_TRUE(true);

        init_plugin_function init_plugin;
        uv_dlsym(lib, "initialize", (void **)&init_plugin);
        ASSERT_TRUE(true);
    }
}

/**
 * @tc.name   TestLibuvTestUvOnce
 * @tc.number ActsZlibTest_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsLibuvTest, TestLibuvTestUvOnce, Function | MediumTest | Level2)
{
    uv_once(&once_only, Increment);
    ASSERT_TRUE(true);
}
}
