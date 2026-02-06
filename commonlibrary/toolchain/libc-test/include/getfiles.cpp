/* Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <vector>
#include <cstring>
#include <dirent.h>
#include "gettestfiles.cpp"

#include "runtest.h"
namespace OHOS {
using namespace std;

static vector<std::string> g_filenames;
std::vector<std::string> Runtest::GetFileNames(std::string path)
{
    vector<string> tempName;
    GetTestNames(path, tempName);
    for (size_t i = 0; i < tempName.size(); i++) {
        if ((tempName[i].find("stat", path.length() - 1) != -1) ||
            (tempName[i].find("sem_close-unmap", path.length() - 1) != -1) ||
            (tempName[i].find("runtest", path.length() - 1) != -1)) {
            continue;
        }
        g_filenames.push_back(tempName[i]);
    }
    return g_filenames;
}
} // namespace OHOS