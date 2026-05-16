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

#include <cctype>
#include <cstdlib>
#include <dirent.h>
#include <netinet/in.h>
#include <sched.h>
#include <unistd.h>
#include "functionalext.h"

/*
 * @tc.name      : SchedCpucountTc0100
 * @tc.desc      : Each parameter value is valid, and the number of CPUs included in the collection can be obtained.
 * @tc.level     : Level 0
 */
void SchedCpucountTc0100(void)
{
    int numCpus = sysconf(_SC_NPROCESSORS_CONF);
    cpu_set_t* cpusetp = CPU_ALLOC(numCpus);
    EXPECT_PTRNE("SchedCpucountTc0100", cpusetp, nullptr);

    size_t size = CPU_ALLOC_SIZE(numCpus);
    CPU_ZERO_S(size, cpusetp);
    for (int cpu = 0; cpu < numCpus; cpu++) {
        CPU_SET_S(cpu, size, cpusetp);
    }
    int ret = __sched_cpucount(size, cpusetp);
    EXPECT_EQ("SchedCpucountTc0100", ret, numCpus);
    CPU_FREE(cpusetp);
}

/*
 * @tc.name      : SchedCpucountTc0200
 * @tc.desc      : The size parameter is invalid (0), the set parameter is valid, and the number of CPUs
 *                 contained in the set cannot be obtained.
 * @tc.level     : Level 2
 */
void SchedCpucountTc0200(void)
{
    int numCpus = sysconf(_SC_NPROCESSORS_CONF);
    cpu_set_t* cpusetp = CPU_ALLOC(numCpus);
    EXPECT_PTRNE("SchedCpucountTc0200", cpusetp, nullptr);

    size_t size = CPU_ALLOC_SIZE(numCpus);
    CPU_ZERO_S(size, cpusetp);
    for (int cpu = 0; cpu < numCpus; cpu++) {
        CPU_SET_S(cpu, size, cpusetp);
    }
    int ret = __sched_cpucount(0, cpusetp);
    EXPECT_EQ("SchedCpucountTc0200", ret, 0);
    CPU_FREE(cpusetp);
}

/*
 * @tc.name      : SchedCpucountTc0300
 * @tc.desc      : The size parameter is valid, the set parameter is invalid (null), and the number of CPUs
 *                 contained in the set cannot be obtained.
 * @tc.level     : Level 2
 */
void SchedCpucountTc0300(void)
{
    int numCpus = sysconf(_SC_NPROCESSORS_CONF);
    cpu_set_t* cpusetp = CPU_ALLOC(numCpus);
    EXPECT_PTRNE("SchedCpucountTc0300", cpusetp, nullptr);

    size_t size = CPU_ALLOC_SIZE(numCpus);
    CPU_ZERO_S(size, cpusetp);
    int ret = __sched_cpucount(size, cpusetp);
    EXPECT_EQ("SchedCpucountTc0300", ret, 0);
    CPU_FREE(cpusetp);
}

static int SchedCpucountTestWithArgs(int argc, char* argv[])
{
    SchedCpucountTc0100();
    SchedCpucountTc0200();
    SchedCpucountTc0300();
    return T_STATUS;
}

int SchedCpucountTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SchedCpucountTestWithArgs(1, libcArgvStub);
}
