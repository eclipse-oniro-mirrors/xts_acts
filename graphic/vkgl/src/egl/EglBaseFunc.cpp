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

#include <cstdio>
#include <iostream>

#include "tcuDefs.hpp"
#include "tcuCommandLine.hpp"
#include "tcuPlatform.hpp"
#include "tcuApp.hpp"
#include "tcuResource.hpp"
#include "tcuTestLog.hpp"
#include "tcuTestSessionExecutor.hpp"
#include "deUniquePtr.hpp"
#include "tcuOhosPlatform.hpp"

#include "external/openglcts/modules/common/glcConfigPackage.hpp"
#include "external/openglcts/modules/common/glcSingleConfigTestPackage.hpp"
#include "external/openglcts/modules/common/glcTestPackage.hpp"
#include "external/openglcts/modules/gles2/es2cTestPackage.hpp"
#include "external/openglcts/modules/gles32/es32cTestPackage.hpp"
#include "external/openglcts/modules/gles31/es31cTestPackage.hpp"
#include "external/openglcts/modules/gles3/es3cTestPackage.hpp"
#include "external/openglcts/modules/glesext/esextcTestPackage.hpp"

#include "modules/egl/teglTestPackage.hpp"
#include "modules/gles2/tes2TestPackage.hpp"
#include "modules/gles3/tes3TestPackage.hpp"
#include "modules/gles31/tes31TestPackage.hpp"

#include "ohos_context_i.h"
#include "logdefine.h"
#include "EglBaseFunc.h"

static tcu::TestPackage* createTestPackage(tcu::TestContext& testCtx)
{
    return new deqp::egl::TestPackage(testCtx);
}

void RegistPackage(void)
{
    tcu::TestPackageRegistry *registry = tcu::TestPackageRegistry::getSingleton();
    registry->registerPackage("dEQP-EGL", createTestPackage);
}

// extern tcu::TestLog tcutestlog;
FuncRunResult RunTestKHRGLES(int argc, const char** argv)
{
    FuncRunResult runResult;
    bool isExist = true;
    try {
        tcu::CommandLine cmdLine(argc, argv);
        tcu::DirArchive archive(cmdLine.getArchiveDir());
        
        de::UniquePtr<tcu::Platform> platform(createOhosPlatform());
        de::UniquePtr<tcu::App> app(new tcu::App(*platform, archive, OHOS::Logdefine::tcutestlog, cmdLine));

        for (;isExist;) {
            if (!app->iterate()) {
                isExist = false;
            };
        };
        runResult.isComplete = app->getResult().isComplete;
        runResult.numPassed = app->getResult().numPassed;
        runResult.numExecuted = app->getResult().numExecuted;
        runResult.numFailed = app->getResult().numFailed;
        runResult.numNotSupported = app->getResult().numNotSupported;
        runResult.numWarnings = app->getResult().numWarnings;
        runResult.numWaived = app->getResult().numWaived;
    } catch (const std::exception &e) {
        tcu::die("%s", e.what());
    };
    return runResult;
}