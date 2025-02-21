/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "jsvmtest.h"

#ifdef OHOS_JSVMTEST_XTS
bool TestRunner::globalInited = true;
#else
bool TestRunner::globalInited = false;
#endif

JSVM_Env jsvm_env = nullptr;

// return number of passed cases
int RunAllTests()
{
    int passed = 0;
    auto &testVec = TestRunner::GetTestVec();
    for (size_t i = 0; i < testVec.size(); ++i) {
        testVec[i]->Run(i);
        ++passed;
    }
    return passed;
}

// return number of passed cases
int RunTestsWithPrefix(const char *prefix)
{
    int passed = 0;
    auto &testVec = TestRunner::GetTestVec();
    for (size_t i = 0; i < testVec.size(); ++i) {
        const std::string name = testVec[i]->GetName();
        if (name.find(prefix) != 0) {
            continue;
        }
        testVec[i]->Run(i);
        ++passed;
    }
    return passed;
}

// return number of passed cases
int RunTest(const char *name)
{
    auto &testMap = TestRunner::GetTestMap();
    auto it = testMap.find(name);
    if (it == testMap.end()) {
        std::cout << "There is no test named " << name << std::endl;
        return 0;
    }
    return 1;
}

#if !defined(OHOS_JSVM_HAP) && !defined(OHOS_JSVMTEST_XTS)
int main(int argc, char **argv)
{
    constexpr int kMinArgc = 2;
    if (argc >= kMinArgc) {
        std::string name = argv[1];
        if (name.find("/") != std::string::npos) {
            RunTest(name.c_str());
        } else {
            RunTestsWithPrefix(name.c_str());
        }
        return 0;
    }
    RunAllTests();
}
#endif  // OHOS_JSVM_HAP
