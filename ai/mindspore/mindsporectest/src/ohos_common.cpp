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

#include "ohos_common.h"
#include <numeric>
#include <inttypes.h>

/*
 * getDimInfo: get dim info from data file(int64_t)
 * param:
 * fp: the testing datafile object
 *
 * return :
 * dim_info: array to store the info of the dim in datafile, like
 * [4,3,3,6,3,162(3*3*6*3)],4 is dim size,3,3,6,3 is the dim shape data_size:
 * the size of the testing data including the data file
 * */
void getDimInfo(FILE *fp, std::vector<int64_t>* dim_info) {
  const int MAX_HEAD_SIZE = 50;
  uint32_t *dim_buffer = reinterpret_cast<uint32_t *>(malloc(MAX_HEAD_SIZE * sizeof(uint32_t)));
  size_t ret = fread(dim_buffer, sizeof(uint32_t), MAX_HEAD_SIZE, fp);
  if (ret == 0) {
    free(dim_buffer);
    return;
  }
  dim_info->push_back(*dim_buffer);  // get dim size

  // get data shape to compute the datasize
  uint64_t data_size = 1;
  uint32_t i = 1;
  for (; i <= dim_info->at(0); i++) {
    dim_info->push_back(*(dim_buffer + i));
    data_size *= *(dim_buffer + i);
  }
  dim_info->push_back(data_size);

  free(dim_buffer);
}

/*
 * readTestDataFile: read test date from hisi .t datafile（int64_t）
 * param:
 * infile: the path of hisi .t datafile
 * return:
 * dim_info: array to store the info of the dim in datafile, like [4,3,3,6,3],4
 * is dim size,3,3,6,3 is the dim shape
 * */
void *readTestDataFile(std::string infile, std::vector<int64_t>* dim_info1) {
  printf("\n [common.cpp] Loading data from: %s\n", infile.c_str());

  FILE *fp;
  fp = fopen(infile.c_str(), "r");
  if (fp == nullptr) {
    printf("ERROR: cant't open file %s\n", infile.c_str());
    return nullptr;
  } else {
    std::vector<int64_t> dim_info;
    std::vector<int64_t>* ptr_dim_info = &dim_info;
    getDimInfo(fp, ptr_dim_info);
    uint64_t data_size = ptr_dim_info->at(ptr_dim_info->size() - 1);
    fclose(fp);

    fp = fopen(infile.c_str(), "r");
    if (fp == nullptr) {
      printf("ERROR: cant't open file %s\n", infile.c_str());
      return nullptr;
    }
    uint32_t *memory = reinterpret_cast<uint32_t *>(malloc((dim_info[0] + 1) * sizeof(uint32_t)));

    size_t ret = fread(memory, sizeof(uint32_t), (dim_info[0] + 1), fp);
    if (ret == 0) {
      free(memory);
      fclose(fp);
      return nullptr;
    }
    uint32_t *data = reinterpret_cast<uint32_t *>(malloc((data_size) * sizeof(uint32_t)));
    size_t ret2 = fread(data, sizeof(uint32_t), data_size, fp);
    if (ret2 == 0) {
      free(data);
      fclose(fp);
      return nullptr;
    }
    free(memory);
    fclose(fp);

    for (int i = 0; i < dim_info[0]; i++) {
      dim_info1->push_back(dim_info[i + 1]);
    }

    printf("\n [common.cpp] Read test data file Over, get dimInfo as: (");
    int count = dim_info1->size();
    for (int i = 0; i < count; i++) {
      printf("%" PRId64, dim_info1->at(i));
    }
    printf(")\n");
    return data;
  }
}

/*
 * allclose
 * param:
 *  a:compared file a
 *  b:compared file b
 *  count: the count size which will compare
 *  rtol:
 *  atol:
 * return:
 *  true or false
 * */
bool allclose(float *a, float *b, uint64_t count, float rtol = 1e-05,
              float atol = 1e-08, bool isquant = false) {
  uint32_t i = 0;

  // add fail loop print
  uint32_t fail_count = 0;
  float tol = 0;
  float tol1 = 0;
  float tol2 = 0;
  bool nan_occur_in_accuray = false;

  float sum = 0.0f;
  static float sum_all;
  static float maximum = 0;
  static float minimum = 0;
  static uint64_t c = 0;

  if (a == nullptr || b == nullptr) {
    return false;
  }

  for (; i < count; ++i) {
    sum = sum + fabs(a[i] - b[i]) / (atol + rtol * fabs(b[i]));
    sum_all = sum_all + fabs(a[i] - b[i]) / (atol + rtol * fabs(b[i]));
    maximum = max(maximum, fabs(a[i] - b[i]) / (atol + rtol * fabs(b[i])));
    minimum = min(minimum, fabs(a[i] - b[i]) / (atol + rtol * fabs(b[i])));
    if (isnan(a[i]) || isinf(a[i])) {
      fail_count = fail_count + 1;
      nan_occur_in_accuray = true;
      if (fail_count < 100) {
        printf("     i = %2u:   %+f  |  %+f\n", i, a[i], b[i]);
      }
    } else if (fabs(a[i] - b[i]) > (atol + rtol * fabs(b[i]))) {
      tol = tol + fabs(a[i] - b[i]) / (fabs(b[i]) + 1);
      tol1 = tol1 + fabs(a[i] - b[i]);
      tol2 = tol2 + fabs(a[i] - b[i]) / fabs(b[i]);
      fail_count = fail_count + 1;
      if (fail_count < 100) {
        printf("     i = %2u:   %+f  |  %+f\n", i, a[i], b[i]);
      }
    }

    if (i == count - 1) {
      printf("     ......\n");
      printf("\n *** Total fail_count: %u\n", fail_count);
      if (fail_count != 0) {
        printf("\n     fabs(a[i] - b[i])/(fabs(b[i])+1) : %f\n",
              tol / fail_count);
        printf("\n     fabs(a[i] - b[i]) : %f\n", tol1 / fail_count);
        printf("\n     fabs(a[i] - b[i])/fabs(b[i]) : %f\n", tol2 / fail_count);
      }
      c = c + count;
      printf("\n     avg : %f\n", sum / count);
      printf("\n     min : %f\n", minimum);
      printf("\n     max :  %f\n", maximum);
      printf("\n     avg_all :  %f\n", sum_all / c);
      printf("\n");
      fstream file;
      file.open("cout.csv", ios::app);

      file << ","
           << "1,"
           << "0," << maximum;
      if (fail_count == 0) {
        file << "," << sum_all / c;
      } else {
        file << "," << tol / fail_count;
      }
      file.close();
    }
  }
  if (nan_occur_in_accuray) {
    printf("\n[common.cpp] eval output include some NAN/INF\n");
    return false;
  }

  if (fail_count > 0) {
    printf("\n *** These data compare failed: atol = %f, rtol = %f\n", atol,
           rtol);
    printf("\n");
    if (isquant) {
      if (tol / fail_count < 0.04) {
        return true;
      }
    }
    return false;
  }
  return true;
}

bool allclose_int8(uint8_t *a, uint8_t *b, uint64_t count, float rtol = 1e-05,
                   float atol = 1e-08, bool isquant = false) {
  uint32_t i = 0;
  // add fail loop print
  uint32_t fail_count = 0;
  float tol = 0;
  float tol1 = 0;
  float tol2 = 0;
  bool nan_occur_in_accuray = false;

  float sum = 0.0f;
  static float sum_all;
  static float maximum = 0;
  static float minimum = 0;
  static uint64_t c = 0;
  // add fail loop print

  if (a == nullptr || b == nullptr) {
    return false;
  }

  for (; i < count; ++i) {
    sum = sum + fabs(a[i] - b[i]) / (atol + rtol * fabs(b[i]));
    sum_all = sum_all + fabs(a[i] - b[i]) / (atol + rtol * fabs(b[i]));
    maximum = max(static_cast<double>(maximum),
                  static_cast<double>(fabs(a[i] - b[i])) / (atol + rtol * fabs(b[i])));
    minimum = min(static_cast<double>(minimum),
                  static_cast<double>(fabs(a[i] - b[i])) / (atol + rtol * fabs(b[i])));
    if (isnan(a[i]) || isinf(a[i])) {
      fail_count = fail_count + 1;
      nan_occur_in_accuray = true;
      if (fail_count < 100) {
        printf("     i = %2u:   %+f  |  %+f\n", i, static_cast<float>(a[i]), static_cast<float>(b[i]));
      }
    } else if (fabs(a[i] - b[i]) > 0) {
      tol = tol + fabs(a[i] - b[i]) / (fabs(b[i]) + 1);
      tol1 = tol1 + fabs(a[i] - b[i]);
      tol2 = tol2 + fabs(a[i] - b[i]) / fabs(b[i]);
      fail_count = fail_count + 1;
      printf("%2d", static_cast<int>(fabs(a[i] - b[i])));
      printf("     i = %2u:   %2d  |  %2d\n", i, a[i], b[i]);
    }
    if (i == count - 1) {
      printf("     ……\n");
      printf("\n *** Total fail_count: %u\n", fail_count);
      if (fail_count != 0) {
        printf("\n     fabs(a[i] - b[i])/(fabs(b[i])+1) : %f\n",
              tol / fail_count);
        printf("\n     fabs(a[i] - b[i]) : %f\n", tol1 / fail_count);
        printf("\n     fabs(a[i] - b[i])/fabs(b[i]) : %f\n", tol2 / fail_count);
      }

      c = c + count;
      printf("\n     avg : %f\n", sum / count);
      printf("\n     min : %f\n", minimum);

      printf("\n     max :  %f\n", maximum);
      printf("\n     avg_all :  %f\n", sum_all / c);
      printf("\n");
      fstream file;
      file.open("cout.csv", ios::app);

      file << ","
           << "1,"
           << "0," << maximum;
      if (fail_count == 0) {
        file << "," << sum_all / c;
      } else {
        file << "," << tol / fail_count;
      }
      file.close();
    }
  }
  if (nan_occur_in_accuray) {
    printf("\n[common.cpp] eval output include some NAN/INF\n");
    return false;
  }
  if (fail_count > 0) {
    printf("\n *** These data compare failed: atol = %f, rtol = %f\n", atol,
           rtol);
    printf("\n");
    if (isquant) {
      if (tol / fail_count < 0.04) {
        return true;
      }
    }
    return false;
  }
  return true;
}

/*
 * compFp32WithTData: compare the data with the data in hisi .t file
 * param:
 *  actualOutputData: the result of ge
 *  expectedDataFile: the path of hisi .t result file
 *  rtol:
 *  atol:
 * return:
 *  true of false
 * */
bool compFp32WithTData(float *actualOutputData, const std::string& expectedDataFile,
                       float rtol = 1e-05, float atol = 1e-08,
                       bool isquant = false) {
  std::vector<int64_t> dim_info;
  std::vector<int64_t>* ptr_dim_info = &dim_info;
  float *expectedOutputData =
      reinterpret_cast<float *>(readTestDataFile(expectedDataFile, ptr_dim_info));
  uint32_t i = 0;
  uint64_t data_size = 1;
  data_size = accumulate(dim_info.begin(), dim_info.end(), 1, std::multiplies<uint64_t>());

  // print caffe/tf output:
  printf("[common.cpp] expected output data:");
  for (; i < data_size && i < 10; i++) {
    printf("%4f ", expectedOutputData[i]);
  }
  printf("\n");
  if (isquant) {
    bool ret = allclose(actualOutputData, expectedOutputData, data_size, rtol, atol,
                    true);
    free(expectedOutputData);
    return ret;
  }
  bool ret =  allclose(actualOutputData, expectedOutputData, data_size, rtol, atol);
  free(expectedOutputData);
  return ret;
}

bool compUint8WithTData(uint8_t *actualOutputData, const std::string& expectedDataFile,
                        float rtol = 1e-05, float atol = 1e-08,
                        bool isquant = false) {
  std::vector<int64_t> dim_info;
  std::vector<int64_t>* ptr_dim_info = &dim_info;
  auto dataFile = readTestDataFile(expectedDataFile, ptr_dim_info);
  if(dataFile == nullptr){
    return false;
  }
  uint8_t *expectedOutputData =
      reinterpret_cast<uint8_t *>(dataFile);
  uint32_t i = 0;
  uint64_t data_size = 1;
  data_size = accumulate(dim_info.begin(), dim_info.end(), 1, std::multiplies<uint64_t>());

  // print caffe/tf output:
  printf("\n [common.cpp] expected output data:\n");
  for (; i < data_size && i < 10; i++) {
    printf("%4hhu ", static_cast<unsigned char>(expectedOutputData[i]));
  }
  printf("\n");
  if (isquant) {
    bool ret =  allclose_int8(actualOutputData, expectedOutputData, data_size, rtol,
                         atol, true);
    free(expectedOutputData);
    return ret;
  }
  bool ret =  allclose_int8(actualOutputData, expectedOutputData, data_size, rtol,
                       atol);
  free(expectedOutputData);
  return ret;
}

/*
 * ReadFile: read file of model
 * param:
 *  file: file location
 *  size: file size
 * return:
 *  buf of file
 * */
char *ReadFile(const char *file, size_t* size) {
  printf("[common.cpp] Loading data from: %s\n", file);

  std::ifstream ifs(file);
  if (!ifs.good()) {
    return nullptr;
  }

  if (!ifs.is_open()) {
    ifs.close();
    return nullptr;
  }

  ifs.seekg(0, std::ios::end);
  *size = ifs.tellg();

  char *buf = new char[*size];
  if (buf == nullptr) {
    ifs.close();
    return nullptr;
  }

  ifs.seekg(0, std::ios::beg);
  ifs.read(buf, *size);
  ifs.close();
  printf("[common.cpp]Read Binary Data Over, get tensorSize as: %" PRId64 ".\n", static_cast<int64_t>(*size));

  return buf;
}

void PackNCHWToNHWCFp32(const char *src, char *dst, int batch, int plane, int channel) {
    for (int n = 0; n < batch; n++) {
        for (int c = 0; c < channel; c++) {
            for (int hw = 0; hw < plane; hw++) {
                int nhwc_index = n * channel * plane + hw * channel + c;
                int nchw_index = n * channel * plane + c * plane + hw;
                dst[nhwc_index * 4] = src[nchw_index * 4];
                dst[nhwc_index * 4 + 1] = src[nchw_index * 4 + 1];
                dst[nhwc_index * 4 + 2] = src[nchw_index * 4 + 2];
                dst[nhwc_index * 4 + 3] = src[nchw_index * 4 + 3];
            }
        }
    }
    return;
}
