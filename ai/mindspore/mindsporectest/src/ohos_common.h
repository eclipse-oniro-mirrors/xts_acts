/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#ifndef GE_COMMON_H
#define GE_COMMON_H

#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <math.h>

using std::string;
using std::cout;
using std::endl;
using std::map;
using std::ios;
using std::fstream;
using std::to_string;
using std::ifstream;
using std::stringstream;
using std::max;
using std::min;
using std::vector;
// using namespace mindspore::tensor;

bool compFp32WithTData(float *actualOutputData,
                       const std::string &expectedDataFile, float rtol,
                       float atol, bool isquant);
bool allclose_int8(int8_t *a, int8_t *b, uint64_t count, float rtol, float atol,
                   bool isquant);
bool compUint8WithTData(uint8_t *actualOutputData,
                        const std::string &expectedDataFile, float rtol,
                        float atol, bool isquant);
//// add for mslite test of int64:
void getDimInfo(FILE *fp, std::vector<int64_t>* dim_info);
char *ReadFile(const char *file, size_t* size);
void PackNCHWToNHWCFp32(const char *src, char *dst, int batch, int plane, int channel);

uint64_t getTimeInUs();
std::map<std::string,float> CalculateIntVector(std::vector<float> vec);


#endif  // GE_COMMON_H