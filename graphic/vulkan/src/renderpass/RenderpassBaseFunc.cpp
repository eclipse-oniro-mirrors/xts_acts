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

#include "external/vulkancts/modules/vulkan/vktTestPackage.hpp"

#include "logdefine.h"
#include "RenderpassBaseFunc.h"


static tcu::TestPackage* createTestPackage (tcu::TestContext& testCtx)
{
	return new vkt::TestPackage(testCtx);
}

static tcu::TestPackage* createExperimentalTestPackage (tcu::TestContext& testCtx)
{
	return new vkt::ExperimentalTestPackage(testCtx);
}

// tcu::TestPackageDescriptor g_vktPackageDescriptor("dEQP-VK", createTestPackage);
// tcu::TestPackageDescriptor g_vktExperimentalPackageDescriptor("dEQP-VK-experimental", createExperimentalTestPackage);

void RegistPackage(void)
{
    tcu::TestPackageRegistry *registry = tcu::TestPackageRegistry::getSingleton();
    registry->registerPackage("dEQP-VK", createTestPackage);
    registry->registerPackage("dEQP-VK-experimental", createExperimentalTestPackage);
}


// extern tcu::TestLog tcutestlog;
FuncRunResult RunTestKHRGLES(int argc, const char** argv)
{
    FuncRunResult runResult;
    try {
        tcu::CommandLine cmdLine(argc, argv);
        std::cout << "testmain end argc"<< argc << ";" << argv[0] << ";" << argv[1] << ";" << argv[2] << std::endl;
        tcu::DirArchive archive(cmdLine.getArchiveDir());
        
        de::UniquePtr<tcu::Platform> platform(createOhosPlatform());
        de::UniquePtr<tcu::App> app(new tcu::App(*platform, archive, OHOS::Logdefine::tcutestlog, cmdLine));

        for (;;) {
            if (!app->iterate()) {
                break;
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