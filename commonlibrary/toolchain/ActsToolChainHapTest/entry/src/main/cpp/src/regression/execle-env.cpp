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

// commit 2b2aff37aced66e4a50a38a14607a9b1dc0ee001 2013-10-03
// execle should pass env properly
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unistd.h>
#include "test.h"

/**
 * @note This test verifies that execle() properly passes environment variables.
 *       On HarmonyOS, /bin/sh is not available and exec family functions may be
 *       restricted. This test checks for platform support and skips if unavailable.
 */
int ExecleEnvTest(void)
{
    // First check if we can even access a shell
    const char* shellPaths[] = { "/bin/sh",
                                 "/system/bin/sh", // Android/HarmonyOS location
                                 "/bin/bash",
                                 nullptr };

    const char* shellPath = nullptr;
    for (int i = 0; shellPaths[i] != nullptr; i++) {
        if (access(shellPaths[i], F_OK | X_OK) == 0) {
            shellPath = shellPaths[i];
            break;
        }
    }

    if (shellPath == nullptr) {
        printf("execle_envTest: No shell found on this platform.\n");
        printf("execle_envTest: Skipping execle environment variable test.\n");
        return 0; // Skip test gracefully
    }

    printf("execle_envTest: Found shell at %s\n", shellPath);

    char* env[] = { "VAR=abc", "PATH=/usr/bin:/bin", nullptr };

    execle(shellPath, "sh", "-c", "[ \"$VAR\" = abc ] || { echo 'env is not passed'; exit 1; }", nullptr, env);

    // If execle returns, it failed
    int savedErrno = errno;
    t_error("execle failed: %s (errno=%d)\n", strerror(savedErrno), savedErrno);
    return 1;
}

int ExecleEnvTestCompat(void)
{
    return ExecleEnvTest();
}
