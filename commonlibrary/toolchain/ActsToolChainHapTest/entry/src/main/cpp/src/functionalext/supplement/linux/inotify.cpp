/**
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

#include <cerrno>
#include <cstdlib>
#include <sys/inotify.h>
#include "functionalext.h"

#define TEST_BUFFER_SIZE 128
#define TEST_DATA_COUNT 10

struct InotifyTestData {
    int fd;
    int wd;
    uint32_t mask;
};

static int InotifyInitTest(void)
{
    errno = 0;
    return inotify_init();
}

static int InotifyAddWatchTest(int fd, uint32_t mask)
{
    errno = 0;
    return inotify_add_watch(fd, "/data/storage/el2/base/cache/", mask);
}

static int InotifyRmWatchTest(int fd, int wd)
{
    errno = 0;
    return inotify_rm_watch(fd, wd);
}

static void RunInotifyTest(const char* msg)
{
    int fd = InotifyInitTest();
    EXPECT_NE(msg, fd, ERREXPECT);
    if (fd == -1) {
        return;
    }

    int i;
    int j;
    struct InotifyTestData data[TEST_DATA_COUNT] = {
        { .fd = fd, .wd = -1, .mask = IN_ACCESS },        { .fd = fd, .wd = -1, .mask = IN_MODIFY },
        { .fd = fd, .wd = -1, .mask = IN_ATTRIB },        { .fd = fd, .wd = -1, .mask = IN_CLOSE_WRITE },
        { .fd = fd, .wd = -1, .mask = IN_CLOSE_NOWRITE }, { .fd = fd, .wd = -1, .mask = IN_OPEN },
        { .fd = fd, .wd = -1, .mask = IN_MOVED_FROM },    { .fd = fd, .wd = -1, .mask = IN_MOVED_TO },
        { .fd = fd, .wd = -1, .mask = IN_CREATE },        { .fd = fd, .wd = -1, .mask = IN_DELETE }
    };

    for (i = 0; i < TEST_DATA_COUNT; i++) {
        data[i].wd = InotifyAddWatchTest(fd, data[i].mask);
        EXPECT_NE(msg, data[i].wd, ERREXPECT);
    }

    for (i = 0; i < TEST_DATA_COUNT; i++) {
        for (j = i; j >= 0; j--) {
            if (data[j].wd != data[i].wd) {
                int ret = InotifyRmWatchTest(fd, data[i].wd);
                EXPECT_EQ(msg, ret, CMPFLAG);
                break;
            }
        }
    }
    close(fd);
}

/**
 * @tc.name      : InotifyInit0100
 * @tc.desc      : initialize an inotify instance
 * @tc.level     : Level 0
 */
void InotifyInit0100(void)
{
    int fd = InotifyInitTest();
    EXPECT_NE("InotifyInit0100", fd, ERREXPECT);
    EXPECT_EQ("InotifyInit0100", errno, CMPFLAG);
    close(fd);
}

/**
 * @tc.name      : InotifyAddWatch0100
 * @tc.desc      : add some watches to an initialized inotify instance
 * @tc.level     : Level 0
 */
void InotifyAddWatch0100(void)
{
    RunInotifyTest("InotifyAddWatch0100");
}

/**
 * @tc.name      : InotifyAddWatch0200
 * @tc.desc      : Using the wrong fd, add some monitoring events to the inotify instance
 * @tc.level     : Level 2
 */
void InotifyAddWatch0200(void)
{
    int i;
    struct InotifyTestData data[TEST_DATA_COUNT] = {
        { .fd = -1, .wd = -1, .mask = IN_ACCESS },        { .fd = -1, .wd = -1, .mask = IN_MODIFY },
        { .fd = -1, .wd = -1, .mask = IN_ATTRIB },        { .fd = -1, .wd = -1, .mask = IN_CLOSE_WRITE },
        { .fd = -1, .wd = -1, .mask = IN_CLOSE_NOWRITE }, { .fd = -1, .wd = -1, .mask = IN_OPEN },
        { .fd = -1, .wd = -1, .mask = IN_MOVED_FROM },    { .fd = -1, .wd = -1, .mask = IN_MOVED_TO },
        { .fd = -1, .wd = -1, .mask = IN_CREATE },        { .fd = -1, .wd = -1, .mask = IN_DELETE }
    };

    for (i = 0; i < TEST_DATA_COUNT; i++) {
        data[i].wd = InotifyAddWatchTest(data[i].fd, data[i].mask);
        EXPECT_EQ("InotifyAddWatch0100", data[i].wd, ERREXPECT);
    }
}

/**
 * @tc.name      : InotifyRmWatch0100
 * @tc.desc      : Remove some monitoring events from the inotify instance
 * @tc.level     : Level 0
 */
void InotifyRmWatch0100(void)
{
    RunInotifyTest("InotifyRmWatch0100");
}

/**
 * @tc.name      : InotifyRmWatch0200
 * @tc.desc      : Provide exception parameter to remove monitoring event from inotify instance
 * @tc.level     : Level 2
 */
void InotifyRmWatch0200(void)
{
    int fd = InotifyInitTest();
    if (fd == -1) {
        return;
    }

    int ret = inotify_rm_watch(fd, -1);
    EXPECT_EQ("InotifyRmWatch0200", ret, ERREXPECT);
    close(fd);

    ret = inotify_rm_watch(-1, -1);
    EXPECT_EQ("InotifyRmWatch0200", ret, ERREXPECT);
}

static int InotifyTestImpl(void)
{
    InotifyInit0100();

    InotifyAddWatch0100();
    InotifyAddWatch0200();

    InotifyRmWatch0100();
    InotifyRmWatch0200();
    return T_STATUS;
}

int InotifyTest(void)
{
    return InotifyTestImpl();
}
