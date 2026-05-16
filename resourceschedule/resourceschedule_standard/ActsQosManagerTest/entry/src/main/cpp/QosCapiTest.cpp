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

#include "include/QosCapiTest.h"
#include <cerrno>
#include <qos/qos.h>
#include <string>
#include <thread>
#include <unistd.h>
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"

int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    size_t argc = index + 1;
    napi_value args[index + 1];

    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc <= index) {
        napi_throw_type_error(env, nullptr, "Argument missing");
        return defaultValue;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return defaultValue;
    }

    int32_t result = defaultValue;
    status = napi_get_value_int32(env, args[index], &result);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Value is not int32");
        return defaultValue;
    }

    return result;
}

#define OH_NN_SUCCESS 0
#define INVALID_QOS_VALUE 6
#define QOS_LEVEL_TEST 1024

namespace Acts {
namespace QosManager {

/**
 * Helper function: Test a single QoS level
 * @param level: QoS level to test
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevel(QoS_Level level)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all valid QoS levels
 * @return 0 on success, -1 on failure
 */
static int TestAllValidQoSLevels()
{
    if (TestSingleQoSLevel(QoS_Level::QOS_BACKGROUND) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_UTILITY) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_DEFAULT) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_USER_INITIATED) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_DEADLINE_REQUEST) != 0) {
        return -1;
    }
    if (TestSingleQoSLevel(QoS_Level::QOS_USER_INTERACTIVE) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all invalid QoS levels
 * @return 0 on success, -1 on failure
 */
static int TestInvalidQoSLevels()
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level(-1));
    if (ret != -1) {
        return -1;
    }

    ret = OH_QoS_SetThreadQoS(QoS_Level(INVALID_QOS_VALUE));
    if (ret != -1) {
        return -1;
    }

    ret = OH_QoS_SetThreadQoS(QoS_Level(QOS_LEVEL_TEST));
    if (ret != -1) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunQoSFullTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllValidQoSLevels() != 0) {
            testPassed = false;
            return;
        }
        if (TestInvalidQoSLevels() != 0) {
            testPassed = false;
            return;
        }
    });
    fullTest.join();
    if (testPassed) {
        return OH_NN_SUCCESS;
    } else {
        return -1;
    }
}

/**
 * Helper function: Run full QoS test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunQoSFullTestInMainThread()
{
    if (TestAllValidQoSLevels() != 0) {
        return -1;
    }
    if (TestInvalidQoSLevels() != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * Helper function: Test QoS capability and run test in appropriate thread
 * @param workerTestFunc: Function to run if worker thread supports QoS
 * @param mainTestFunc: Function to run if only main thread supports QoS
 * @return 0 on success, -1 on failure
 */
static int RunQoSTestWithThreadStrategy(int (*workerTestFunc)(), int (*mainTestFunc)())
{
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;
    std::thread worker([&mtx, &workerThreadResult, &workerDone, &cv]() {
        int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        std::lock_guard<std::mutex> lock(mtx);
        workerThreadResult = ret;
        workerDone = true;
        cv.notify_one();
    });
    {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [&] { return workerDone; });
    }
    worker.join();
    if (workerThreadResult == 0) {
        return workerTestFunc();
    } else if (mainThreadResult == 0) {
        return mainTestFunc();
    } else {
        return OH_NN_SUCCESS;
    }
}

/**
 * @tc.name   SetThreadQoSNdkTest
 * @tc.number SetThreadQoSNdkTest
 * @tc.desc   Verify the Set QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SetThreadQoSNdkTest()
{
    return RunQoSTestWithThreadStrategy(RunQoSFullTestInWorkerThread, RunQoSFullTestInMainThread);
}

/**
 * Helper function: Test single QoS level with reset operation
 * @param level: QoS level to test
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevelWithReset(QoS_Level level)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        return -1;
    }
    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all QoS levels with reset operation
 * @return 0 on success, -1 on failure
 */
static int TestAllQoSLevelsWithReset()
{
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_BACKGROUND) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_UTILITY) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_DEFAULT) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_USER_INITIATED) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_DEADLINE_REQUEST) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithReset(QoS_Level::QOS_USER_INTERACTIVE) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS reset test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunResetQoSFullTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllQoSLevelsWithReset() != 0) {
            testPassed = false;
            return;
        }
    });
    fullTest.join();
    if (testPassed) {
        return OH_NN_SUCCESS;
    } else {
        return -1;
    }
}

/**
 * Helper function: Run full QoS reset test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunResetQoSFullTestInMainThread()
{
    if (TestAllQoSLevelsWithReset() != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   ResetThreadQoSNdkTest
 * @tc.number ResetThreadQoSNdkTest
 * @tc.desc   Verify the Reset QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int ResetThreadQoSNdkTest()
{
    return RunQoSTestWithThreadStrategy(RunResetQoSFullTestInWorkerThread, RunResetQoSFullTestInMainThread);
}

/**
 * Helper function: Test single QoS level with get operation
 * @param level: QoS level to test
 * @return 0 on success, -1 on failure
 */
static int TestSingleQoSLevelWithGet(QoS_Level level)
{
    int ret = OH_QoS_SetThreadQoS(level);
    if (ret != 0) {
        return -1;
    }
    QoS_Level getLevel_;
    ret = OH_QoS_GetThreadQoS(&getLevel_);
    if (ret != 0) {
        return -1;
    }
    if (getLevel_ != level) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test Get QoS with nullptr and after reset
 * @return 0 on success, -1 on failure
 */
static int TestGetQoSWithNullAndReset()
{
    int ret = OH_QoS_GetThreadQoS(nullptr);
    if (ret != -1) {
        return -1;
    }

    // Set a QoS level before resetting to avoid EINVAL error
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret != 0) {
        return -1;
    }

    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        return -1;
    }
    QoS_Level level;
    ret = OH_QoS_GetThreadQoS(&level);
    if (ret != -1) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Test all QoS levels with get operation
 * @return 0 on success, -1 on failure
 */
static int TestAllQoSLevelsWithGet()
{
    if (TestGetQoSWithNullAndReset() != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_BACKGROUND) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_UTILITY) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_DEFAULT) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_USER_INITIATED) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_DEADLINE_REQUEST) != 0) {
        return -1;
    }
    if (TestSingleQoSLevelWithGet(QoS_Level::QOS_USER_INTERACTIVE) != 0) {
        return -1;
    }
    return 0;
}

/**
 * Helper function: Run full QoS get test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunGetQoSFullTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (TestAllQoSLevelsWithGet() != 0) {
            testPassed = false;
            return;
        }
    });
    fullTest.join();
    if (testPassed) {
        return OH_NN_SUCCESS;
    } else {
        return -1;
    }
}

/**
 * Helper function: Run full QoS get test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunGetQoSFullTestInMainThread()
{
    if (TestAllQoSLevelsWithGet() != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GetThreadQoSNdkTest
 * @tc.number GetThreadQoSNdkTest
 * @tc.desc   Verify the Get QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GetThreadQoSNdkTest()
{
    return RunQoSTestWithThreadStrategy(RunGetQoSFullTestInWorkerThread, RunGetQoSFullTestInMainThread);
}

/**
 * Helper function: Run double QoS get operations test
 * @return 0 on success, -1 on failure
 */
static int RunDoubleGetQoSTest()
{
    QoS_Level level;
    int ret = OH_QoS_GetThreadQoS(&level);
    if (ret != 0) {
        return -1;
    }
    if (level != QoS_Level::QOS_BACKGROUND) {
        return -1;
    }
    ret = OH_QoS_GetThreadQoS(&level);
    if (ret != 0) {
        return -1;
    }
    if (level != QoS_Level::QOS_BACKGROUND) {
        return -1;
    }
    return 0;
}

static int RunDoubleQoSOperationsTest()
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret != 0) {
        return -1;
    }
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    if (ret != 0) {
        return -1;
    }

    if (RunDoubleGetQoSTest() != 0) {
        return -1;
    }

    ret = OH_QoS_ResetThreadQoS();
    if (ret != 0) {
        return -1;
    }
    ret = OH_QoS_ResetThreadQoS();
    if (ret != -1) {
        return -1;
    }

    return 0;
}

/**
 * Helper function: Run double test in worker thread
 * @return 0 on success, -1 on failure
 */
static int RunDoubleTestInWorkerThread()
{
    bool testPassed = true;
    std::thread fullTest([&testPassed]() {
        if (RunDoubleQoSOperationsTest() != 0) {
            testPassed = false;
        }
    });
    fullTest.join();
    return testPassed ? OH_NN_SUCCESS : -1;
}

/**
 * Helper function: Run double test in main thread
 * @return 0 on success, -1 on failure
 */
static int RunDoubleTestInMainThread()
{
    if (RunDoubleQoSOperationsTest() != 0) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   ThreadQoSNdkTest
 * @tc.number ThreadQoSNdkTest
 * @tc.desc   Double Test ThreadQoSNDKTest function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int ThreadQoSNdkTest()
{
    int mainThreadResult = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    std::mutex mtx;
    std::condition_variable cv;
    int workerThreadResult = -999;
    bool workerDone = false;
    std::thread worker([&mtx, &workerThreadResult, &workerDone, &cv]() {
        int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
        std::lock_guard<std::mutex> lock(mtx);
        workerThreadResult = ret;
        workerDone = true;
        cv.notify_one();
    });

    {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [&] { return workerDone; });
    }
    worker.join();

    int ret;
    if (workerThreadResult == 0) {
        ret = RunDoubleTestInWorkerThread();
    } else if (mainThreadResult == 0) {
        ret = RunDoubleTestInMainThread();
    } else {
        ret = OH_NN_SUCCESS;
    }
    return ret;
}

static void MockCallback(void* context, const char* response)
{
    // Mock callback for Gewu tests
}

static int GewuSubmitRequestInvalidSessionTest(OH_QoS_GewuOnResponse cb, void* fakeContext)
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    OH_QoS_GewuSubmitRequestResult requestResult2 =
        OH_QoS_GewuSubmitRequest(sessionResult.session, "", cb, fakeContext);
    if (requestResult2.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        return -1;
    }
    OH_QoS_GewuSubmitRequestResult requestResult3 = OH_QoS_GewuSubmitRequest(0, nullptr, cb, fakeContext);
    if (requestResult3.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_FAULT) {
        return -1;
    }
    if (requestResult3.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOMEM) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuCreateSessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0100
 * @tc.desc   Verify the GewuCreateSession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuCreateSessionTest()
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_INVAL) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuSubmitRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0200
 * @tc.desc   Verify the GewuSubmitRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuSubmitRequestTest()
{
    const char* attributes =
        "{\"model\": \"/data/storage/el2/base/haps/entry_test/files/Qwen2.5-0.5B-CPU-Q4\","
        "\"eval_settings\": {\"backend\": \"cpu\", \"max_ctx\": \"8192\"}}";
    const char* request =
        "{\"type\":\"ChatComplete\",\"messages\":[{\"role\":\"developer\",\"content\":\"Your are a helpful "
        "assistant.\"},{\"role\":\"user\",\"content\":\"hi\"}],\"stream\":true}";
    void* fakeContext = reinterpret_cast<void*>(0x1234);
    OH_QoS_GewuOnResponse cb = MockCallback;
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_INVAL) {
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        return -1;
    }
    OH_QoS_GewuSubmitRequestResult requestResult =
        OH_QoS_GewuSubmitRequest(sessionResult.session, request, cb, fakeContext);
    if (requestResult.error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        return -1;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        return -1;
    }
    if (GewuSubmitRequestInvalidSessionTest(cb, fakeContext) != OH_NN_SUCCESS) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuAbortRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0300
 * @tc.desc   Verify the GewuAbortRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuAbortRequestTest()
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        return OH_NN_SUCCESS;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(sessionResult.session, 0);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        return -1;
    }
    if (error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   GewuDestroySessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0400
 * @tc.desc   Verify the GewuDestroySession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int GewuDestroySessionTest()
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        return OH_NN_SUCCESS;
    }
    OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
    if (error != OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

/*
 * @tc.number:SUB_RESOURCESCHEDULE_QOS_0500
 * @tc.name: GewuErrorCodeTest
 * @tc.desc: Verify the Gewu error code
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 1
 */
int GewuErrorCodeTest()
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS) {
        return OH_NN_SUCCESS;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOPERM) {
        return -1;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOMEM) {
        return -1;
    }
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_EXIST) {
        return -1;
    }
    return OH_NN_SUCCESS;
}

} // namespace QosManager
} // namespace Acts
