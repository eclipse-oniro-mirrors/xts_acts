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

#include "runtest.h"

static void GetTestNames(std::string path, std::vector<std::string>& tempName)
{
    DIR *pDir;
    struct dirent* ptr;
    std::string  p;
    if (!(pDir = opendir(path.c_str()))) {
        std::cout << "Folder doesn't Exist!" << std::endl;
        return;
    }
    while ((ptr = readdir(pDir)) != nullptr) {
        if (ptr->d_type == DT_DIR) {
            if (strcmp(ptr->d_name, ".") != 0 && strcmp(ptr->d_name, "..") != 0) {
                GetTestNames(path + "/" + ptr->d_name, tempName);
            }
        } else {
            if (strcmp(ptr->d_name, ".") != 0 && strcmp(ptr->d_name, "..") != 0) {
                tempName.push_back(path + "/" + ptr->d_name);
            }
        }
    }
    closedir(pDir);
}