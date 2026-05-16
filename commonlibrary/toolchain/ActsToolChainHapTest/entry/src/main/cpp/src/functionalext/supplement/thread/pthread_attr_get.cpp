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

#include <cstdlib>
#include <pthread.h>
#include "functionalext.h"

#define TEST_STACK_SIZE 4096

/**
 * @tc.name      : PthreadAttrGetscope0100
 * @tc.desc      : Get thread scope
 * @tc.level     : Level 0
 */
void PthreadAttrGetscope0100(void)
{
    int scope = 0;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int rev = pthread_attr_getscope(&attr, &scope);
    EXPECT_EQ("PthreadAttrGetscope0100", rev, 0);
    EXPECT_EQ("PthreadAttrGetscope0100", scope, PTHREAD_SCOPE_SYSTEM);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetguardsize0100
 * @tc.desc      : Get the guard value of the thread property
 * @tc.level     : Level 0
 */
void PthreadAttrGetguardsize0100(void)
{
    size_t size = 0;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int rev = pthread_attr_getguardsize(&attr, &size);
    EXPECT_EQ("PthreadAttrGetguardsize0100", rev, 0);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetinheritsched0100
 * @tc.desc      : Verify that the preset properties can be obtained through get inheritsched in
 *                 a single-threaded environment
 * @tc.level     : Level 0
 */
void PthreadAttrGetinheritsched0100(void)
{
    pthread_attr_t attr;
    int result = -1;

    int ret = pthread_attr_init(&attr);
    EXPECT_EQ("PthreadAttrGetinheritsched0100", ret, CMPFLAG);
    ret = pthread_attr_setinheritsched(&attr, PTHREAD_INHERIT_SCHED);
    EXPECT_EQ("PthreadAttrGetinheritsched0100", ret, CMPFLAG);

    ret = pthread_attr_getinheritsched(&attr, &result);
    EXPECT_EQ("PthreadAttrGetinheritsched0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadAttrGetinheritsched0100", result, PTHREAD_INHERIT_SCHED);

    ret = pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
    EXPECT_EQ("PthreadAttrGetinheritsched0100", ret, CMPFLAG);

    ret = pthread_attr_getinheritsched(&attr, &result);
    EXPECT_EQ("PthreadAttrGetinheritsched0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadAttrGetinheritsched0100", result, PTHREAD_EXPLICIT_SCHED);

    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetinheritsched0200
 * @tc.desc      : Verify that the return value is EINVAL when setting an exception value in a single-threaded
 * environment
 * @tc.level     : Level 0
 */
void PthreadAttrGetinheritsched0200(void)
{
    pthread_attr_t attr;
    int inheritsched = 2;
    int result = -1;

    int ret = pthread_attr_init(&attr);
    EXPECT_EQ("PthreadAttrGetinheritsched0200", ret, CMPFLAG);
    ret = pthread_attr_setinheritsched(&attr, inheritsched);
    EXPECT_EQ("PthreadAttrGetinheritsched0200", ret, EINVAL);

    ret = pthread_attr_getinheritsched(&attr, &result);
    EXPECT_EQ("PthreadAttrGetinheritsched0200", ret, CMPFLAG);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadBarrierattrGetpshared0100
 * @tc.desc      : Correct parameter setting barrier variable property value
 * @tc.level     : Level 0
 */
void PthreadBarrierattrGetpshared0100(void)
{
    pthread_barrierattr_t attr;
    int result = -1;
    int share = 0;

    int ret = pthread_barrierattr_init(&attr);
    EXPECT_EQ("PthreadBarrierattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_barrierattr_setpshared(&attr, share);
    EXPECT_EQ("PthreadBarrierattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_barrierattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadBarrierattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadBarrierattrGetpshared0100", result, share);

    share = 1;
    ret = pthread_barrierattr_setpshared(&attr, share);

    ret = pthread_barrierattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadBarrierattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadBarrierattrGetpshared0100", result, share);

    pthread_barrierattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadCondattrGetclock0100
 * @tc.desc      : Correct parameter setting condition variable property value
 * @tc.level     : Level 0
 */
void PthreadCondattrGetclock0100(void)
{
    pthread_condattr_t attr;
    clockid_t result = -1;

    int ret = pthread_condattr_init(&attr);
    EXPECT_EQ("PthreadCondattrGetclock0100", ret, CMPFLAG);

    ret = pthread_condattr_setclock(&attr, CLOCK_MONOTONIC_RAW);
    EXPECT_EQ("PthreadCondattrGetclock0100", ret, CMPFLAG);

    ret = pthread_condattr_getclock(&attr, &result);
    EXPECT_EQ("pthread_condattr_getclock_0200", ret, CMPFLAG);
    EXPECT_EQ("PthreadCondattrGetclock0100", result, CLOCK_MONOTONIC_RAW);

    pthread_condattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadCondattrGetpshared0100
 * @tc.desc      : Correct parameter setting condition variable property value
 * @tc.level     : Level 0
 */
void PthreadCondattrGetpshared0100(void)
{
    pthread_condattr_t attr;
    int result = -1;
    int share = 0;
    int ret = pthread_condattr_init(&attr);

    EXPECT_EQ("PthreadCondattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_condattr_setpshared(&attr, share);
    EXPECT_EQ("PthreadCondattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_condattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadCondattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadCondattrGetpshared0100", result, share);

    share = 1;
    ret = pthread_condattr_setpshared(&attr, share);

    ret = pthread_condattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadCondattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadCondattrGetpshared0100", result, share);

    pthread_condattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadMutexattrGetprotocol0100
 * @tc.desc      : Correct parameter setting condition variable property value
 * @tc.level     : Level 0
 */
void PthreadMutexattrGetprotocol0100(void)
{
    pthread_mutexattr_t attr;
    int result = -1;

    int ret = pthread_mutexattr_init(&attr);
    EXPECT_EQ("PthreadMutexattrGetprotocol0100", ret, CMPFLAG);

    ret = pthread_mutexattr_setprotocol(&attr, PTHREAD_PRIO_NONE);
    EXPECT_EQ("PthreadMutexattrGetprotocol0100", ret, CMPFLAG);

    ret = pthread_mutexattr_getprotocol(&attr, &result);
    EXPECT_EQ("PthreadMutexattrGetprotocol0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadMutexattrGetprotocol0100", result, PTHREAD_PRIO_NONE);

    pthread_mutexattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadMutexattrGettype0100
 * @tc.desc      : Correct parameter setting condition variable property value
 * @tc.level     : Level 0
 */
void PthreadMutexattrGettype0100(void)
{
    pthread_mutexattr_t attr;
    int result = -1;

    int ret = pthread_mutexattr_init(&attr);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);

    ret = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);

    ret = pthread_mutexattr_gettype(&attr, &result);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadMutexattrGettype0100", result, PTHREAD_MUTEX_NORMAL);

    ret = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ERRORCHECK);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);

    ret = pthread_mutexattr_gettype(&attr, &result);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadMutexattrGettype0100", result, PTHREAD_MUTEX_ERRORCHECK);

    ret = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);

    ret = pthread_mutexattr_gettype(&attr, &result);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadMutexattrGettype0100", result, PTHREAD_MUTEX_RECURSIVE);

    ret = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);

    ret = pthread_mutexattr_gettype(&attr, &result);
    EXPECT_EQ("PthreadMutexattrGettype0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadMutexattrGettype0100", result, PTHREAD_MUTEX_DEFAULT);

    pthread_mutexattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadMutexattrGetpshared0100
 * @tc.desc      : Correct parameter setting mutex variable property value
 * @tc.level     : Level 0
 */
void PthreadMutexattrGetpshared0100(void)
{
    pthread_mutexattr_t attr;
    int result = -1;
    int share = 0;
    int ret = pthread_mutexattr_init(&attr);

    EXPECT_EQ("PthreadMutexattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_mutexattr_setpshared(&attr, share);
    EXPECT_EQ("PthreadMutexattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_mutexattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadMutexattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadMutexattrGetpshared0100", result, share);

    share = 1;
    ret = pthread_mutexattr_setpshared(&attr, share);

    ret = pthread_mutexattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadMutexattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadMutexattrGetpshared0100", result, share);

    pthread_mutexattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadRwlockattrGetpshared0100
 * @tc.desc      : Correct parameter setting rwlock variable property value
 * @tc.level     : Level 0
 */
void PthreadRwlockattrGetpshared0100(void)
{
    pthread_rwlockattr_t attr;
    int result = -1;
    int share = 0;
    int ret = pthread_rwlockattr_init(&attr);

    EXPECT_EQ("PthreadRwlockattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_rwlockattr_setpshared(&attr, share);
    EXPECT_EQ("PthreadRwlockattrGetpshared0100", ret, CMPFLAG);

    ret = pthread_rwlockattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadRwlockattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadRwlockattrGetpshared0100", result, share);

    share = 1;
    ret = pthread_rwlockattr_setpshared(&attr, share);

    ret = pthread_rwlockattr_getpshared(&attr, &result);
    EXPECT_EQ("PthreadRwlockattrGetpshared0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadRwlockattrGetpshared0100", result, share);

    pthread_rwlockattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetdetachstate0100
 * @tc.desc      : Get detached state from thread attr
 * @tc.level     : Level 0
 */
void PthreadAttrGetdetachstate0100(void)
{
    pthread_attr_t attr;
    int state = 0;
    pthread_attr_init(&attr);
    int ret = pthread_attr_getdetachstate(&attr, &state);
    EXPECT_EQ("PthreadAttrGetdetachstate0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadAttrGetdetachstate0100", state, CMPFLAG);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetschedpolicy0100
 * @tc.desc      : Get detached state from thread attr
 * @tc.level     : Level 0
 */
void PthreadAttrGetschedpolicy0100(void)
{
    pthread_attr_t attr;
    int setpolicy = 1;
    int getpolicy = 0;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setschedpolicy(&attr, setpolicy);
    EXPECT_EQ("PthreadAttrGetschedpolicy0100", ret, CMPFLAG);

    ret = pthread_attr_getschedpolicy(&attr, &getpolicy);
    EXPECT_EQ("PthreadAttrGetschedpolicy0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadAttrGetschedpolicy0100", getpolicy, setpolicy);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetschedparam0100
 * @tc.desc      : Get scheduling parameter attributes in thread attributes object
 * @tc.level     : Level 0
 */
void PthreadAttrGetschedparam0100(void)
{
    pthread_attr_t attr;
    struct sched_param setparam {};
    struct sched_param getparam {};

    setparam.sched_priority = 1;

    pthread_attr_init(&attr);
    int ret = pthread_attr_setschedparam(&attr, &setparam);
    EXPECT_EQ("PthreadAttrGetschedparam0100", ret, CMPFLAG);

    ret = pthread_attr_getschedparam(&attr, &getparam);
    EXPECT_EQ("PthreadAttrGetschedparam0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadAttrGetschedparam0100", getparam.sched_priority, 1);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetstacksize0100
 * @tc.desc      : Get stack size attribute in thread attributes object
 * @tc.level     : Level 0
 */
void PthreadAttrGetstacksize0100(void)
{
    size_t size;
    pthread_attr_t attr;
    pthread_attr_init(&attr);

    int ret = pthread_attr_setstacksize(&attr, TEST_STACK_SIZE);
    EXPECT_EQ("PthreadAttrGetstacksize0100", ret, CMPFLAG);

    ret = pthread_attr_getstacksize(&attr, &size);
    EXPECT_EQ("PthreadAttrGetstacksize0100", ret, CMPFLAG);
    EXPECT_EQ("PthreadAttrGetstacksize0100", size, TEST_STACK_SIZE);
    pthread_attr_destroy(&attr);
}

static int PthreadAttrGetTestImpl(void)
{
    PthreadAttrGetscope0100();
    PthreadAttrGetguardsize0100();
    PthreadAttrGetinheritsched0100();
    PthreadAttrGetinheritsched0200();
    PthreadBarrierattrGetpshared0100();
    PthreadCondattrGetclock0100();
    PthreadCondattrGetpshared0100();
    PthreadMutexattrGetprotocol0100();
    PthreadMutexattrGettype0100();
    PthreadMutexattrGetpshared0100();
    PthreadRwlockattrGetpshared0100();
    PthreadAttrGetdetachstate0100();
    PthreadAttrGetschedpolicy0100();
    PthreadAttrGetschedparam0100();
    PthreadAttrGetstacksize0100();
    return T_STATUS;
}

int PthreadAttrGetTest(void)
{
    return PthreadAttrGetTestImpl();
}
