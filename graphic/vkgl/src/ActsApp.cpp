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
#include <iostream>
#include "tcuPlatform.hpp"
#include "tcuTestContext.hpp"
#include "tcuTestSessionExecutor.hpp"
#include "tcuTestHierarchyUtil.hpp"
#include "tcuCommandLine.hpp"
#include "tcuTestLog.hpp"
#include "qpInfo.h"
#include "qpDebugOut.h"
#include "deMath.h"
#include "ActsApp.h"
namespace tcu {
using std::string;

/*
 * \brief Construct test application
 *
 * If a fatal error occurs during initialization constructor will call
 * die() with debug information.
 *
 * \param platform Reference to platform implementation.
 */
ActsApp::ActsApp (Platform& platform, Archive& archive, TestLog& log, const CommandLine& cmdLine)
    : m_platform(platform),
    m_watchDog(DE_NULL),
    m_crashHandler(DE_NULL),
    m_crashed(false),
    m_testCtx(DE_NULL),
    m_testRoot(DE_NULL),
    m_sessionExecutor(DE_NULL)
{
    print("dEQP Core %s (0x%08x) starting..\n", qpGetReleaseName(), qpGetReleaseId());
    print("  target implementation = '%s'\n", qpGetTargetName());

    if (!deSetRoundingMode(DE_ROUNDINGMODE_TO_NEAREST_EVEN)) {
        qpPrintf("WARNING: Failed to set floating-point rounding mode!\n");
    }
    try {
        const RunMode    runMode    = cmdLine.getRunMode();

        // Create test context
        m_testCtx = new TestContext(m_platform, archive, log, cmdLine, m_watchDog);

        // Create root from registry
        m_testRoot = new TestPackageRoot(*m_testCtx, TestPackageRegistry::getSingleton());

        // \note No executor is created if runmode is not EXECUTE
        if (runMode == RUNMODE_EXECUTE) {
            m_sessionExecutor = new TestSessionExecutor(*m_testRoot, *m_testCtx);
        } else {
            DE_ASSERT(false);
        }
    } catch (const std::exception& e) {
        cleanup();
        die("Failed to initialize dEQP: %s", e.what());
    }
}

ActsApp::~ActsApp (void)
{
    cleanup();
}

void ActsApp::cleanup (void)
{
    delete m_sessionExecutor;
    delete m_testRoot;
    delete m_testCtx;

    m_sessionExecutor = DE_NULL;
    m_testRoot = DE_NULL;
    m_testCtx = DE_NULL;

    if (m_crashHandler) {
        qpCrashHandler_destroy(m_crashHandler);
    }

    if (m_watchDog) {
        qpWatchDog_destroy(m_watchDog);
    }
}

/*
 * \brief Step forward test execution
 * \return true if application should call iterate() again and false
 *         if test execution session is complete.
 */
bool ActsApp::iterate (void)
{
    if (!m_sessionExecutor) {
        DE_ASSERT(m_testCtx->getCommandLine().getRunMode() != RUNMODE_EXECUTE);
        return false;
    }

    // Poll platform events
    const bool platformOk = m_platform.processEvents();

    // Iterate a step.
    bool testExecOk = false;
    if (platformOk) {
        try {
            testExecOk = m_sessionExecutor->iterate();
        } catch (const std::exception& e) {
            die("%s", e.what());
        }
    }

    return platformOk && testExecOk;
}

const TestRunStatus& ActsApp::getResult (void) const
{
    return m_sessionExecutor->getStatus();
}
} // tcu
