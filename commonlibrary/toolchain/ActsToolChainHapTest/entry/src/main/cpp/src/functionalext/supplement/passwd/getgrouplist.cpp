/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <grp.h>
#include <malloc.h>
#include <pwd.h>
#include "test.h"

namespace {
constexpr int K_MAX_NGROUPS = 65536;
} // namespace

static int g_serverNgroups;
static gid_t* g_serverGroups;

/*
 * @tc.name      : Getgrouplist0100
 * @tc.desc      : Get list of groups to which a user belongs
 * @tc.level     : Level 0
 */
void Getgrouplist0100()
{
    int result;
    struct group* gr;
    const char* serverUser = "root";

    struct passwd* pw = getpwnam(serverUser);
    if (!pw) {
        t_error("%s getpwnam failed\n", __func__);
    }

    gid_t serverGid = pw->pw_gid;
    pw = nullptr;

    result = getgrouplist(serverUser, serverGid, nullptr, &g_serverNgroups);
    if (result == 0) {
        t_error("%s getgrouplist should be failed\n", __func__);
    }

    if (g_serverNgroups <= 0 || g_serverNgroups > K_MAX_NGROUPS) {
        t_error("%s invalid group count %d\n", __func__, g_serverNgroups);
        return;
    }
    const size_t groupBytes = static_cast<size_t>(g_serverNgroups) * sizeof(gid_t);
    g_serverGroups = static_cast<gid_t*>(malloc(groupBytes));
    if (g_serverGroups == nullptr) {
        t_error("%s malloc failed\n", __func__);
    }
    result = getgrouplist(serverUser, serverGid, g_serverGroups, &g_serverNgroups);
    if (result == -1) {
        t_error("%s getgrouplist failed\n", __func__);
    }

    for (int i = 0; i < g_serverNgroups; i++) {
        printf("%d", g_serverGroups[i]);
        gr = getgrgid(g_serverGroups[i]);
        if (gr != nullptr) {
            printf(" (%s)", gr->gr_name);
        }
        printf("\n");
    }
    if (g_serverGroups != nullptr) {
        std::fill_n(reinterpret_cast<unsigned char*>(g_serverGroups), groupBytes, static_cast<unsigned char>(0));
        free(g_serverGroups);
        g_serverGroups = nullptr;
    }
}

static int GetgrouplistTestImpl(int argc, char* argv[])
{
    Getgrouplist0100();
    return T_STATUS;
}

int GetgrouplistTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetgrouplistTestImpl(1, libcArgvStub);
}
