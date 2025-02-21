/* Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <cerrno>
#include <ctime>
#include <cstdio>
#include <vector>
#include <csignal>
#include <unistd.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/resource.h>

#include "gtest/gtest.h"
#include "runtest.h"

using namespace std;
using namespace testing::ext;
using namespace testing;
namespace OHOS {
class Toolchaintest : public ::testing::TestWithParam<string> {};

static string g_filepath = "/data/local/tmp/libc-test";
static vector<std::string> temp = Runtest::GetFileNames(g_filepath);

volatile int g_tStatus = 0;

static void Handler(int sig)
{
}

static int Start(const char *argvs)
{
    int pid, spaceSize = 100 * 1024;
    // Create a child process
    // Set the process stack space
    pid = fork();
    if (pid == 0) {
        Runtest::TSetrlim(RLIMIT_STACK, spaceSize);
        // Overloading the subprocess space
        int exe = execl(argvs, "strptime", nullptr);
        printf("exe:%d %s exec failed: %s\n", exe, argvs, strerror(errno));
        exit(1);
    }
    return pid;
}

static int RunTests(const char *argvs)
{
    int timeoutsec = 5, timeout = 0;
    int status, pid;
    sigset_t set;
    void (*retfunc)(int);
    // signal set
    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    retfunc = signal(SIGCHLD, Handler);
    if (retfunc == SIG_ERR) {
        printf("signal triggering failed:%s\n", strerror(errno));
    }
    pid = Start(argvs);
    // The function system call failed
    if (pid == -1) {
        printf("%s fork failed: %s\n", argvs, strerror(errno));
        printf("FAIL %s [internal]\n", argvs);
        return -1;
    }
    struct timespec tp;
    // Maximum blocking time
    tp.tv_sec = timeoutsec;
    tp.tv_nsec = 0;
    if (sigtimedwait(&set, nullptr, &tp) == -1) {
        // Call it again
        if (errno == EAGAIN) {
            timeout = 1;
        } else {
            printf("%s sigtimedwait failed: %s\n", argvs, strerror(errno));
        }
        if (kill(pid, SIGKILL) == -1) {
            printf("%s kill failed: %s\n", argvs, strerror(errno));
        }
    }
    // Waiting for the process to stop
    if (waitpid(pid, &status, 0) != pid) {
        printf("%s waitpid failed: %s\n", argvs, strerror(errno));
        printf("FAIL %s [internal]\n", argvs);
        return -1;
    }
    // Process state
    if (WIFEXITED(status)) { // The right exit
        if (WEXITSTATUS(status) == 0) { // operate successfully
            return g_tStatus;
        }
        printf("FAIL %s [status %d]\n", argvs, WEXITSTATUS(status));
    } else if (timeout) {
        printf("FAIL %s [timed out]\n", argvs);
    } else if (WIFSIGNALED(status)) {
        printf("FAIL %s [signal %s]\n", argvs, strsignal(WTERMSIG(status)));
    } else {
        printf("FAIL %s [unknown]\n", argvs);
    }
    return 1;
}


/**
 * @tc.name      : Toolchaintest.LibcTest
 * @tc.desc      : start test
 * @tc.level     : Level 3
 */
HWTEST_P(Toolchaintest, LibcTest, Function | MediumTest | Level3)
{
    int ret;
    string testName = GetParam();
    ret = RunTests(testName.c_str());
    if (ret == 0) {
        EXPECT_EQ(0, ret) << "test  " << testName  << "  succeed" << endl;
    } else {
        EXPECT_EQ(1, ret) << "test  " << testName  << "  failed" << endl;
        EXPECT_EQ(-1, ret) << "test  " << testName  << "  failed" << endl;
    }
}
INSTANTIATE_TEST_SUITE_P(libcTest, Toolchaintest, testing::ValuesIn(temp.begin(), temp.end()));
} // namespace OHOS